using DataLayer.Data;
using DataLayer.Entities;
using DataLayer.Interfaces.ProductInterface;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.OrderInterface
{
    public class OrderRepository : IOrderRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public OrderRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IResultApi> getListOrderAysnc(int page)
        {
            int pageSize = 10;
            IResultApi res = new IResultApi();
            if (page == null || page == 0)
            {
                page = 1;
            }
            var source = (
               from order in _dbContext.Orders
               select order);
            int count = source.Count();
            int pageCount = System.Convert.ToInt32(System.Math.Ceiling(count / System.Convert.ToDouble(pageSize)));
            Task<List<Order>> result = source.Skip((page - 1) * pageSize).Take(pageSize).ToListAsync();
            List<Order> resultList = await result;
            res.statusCode = 200;
            res.message = "";
            IResultDataOrders resultData = new IResultDataOrders()
            {
                count = count,
                pageCount = pageCount,
                resultList = resultList
            };
            res.resultData = resultData;
            return res;
        }

        public async Task<IOrderJoinProductOrders> getDetailOrder(int orderId)
        {

            Order order = await _dbContext.Orders.FirstAsync(x => x.Id == orderId);
            Task<List<ProductOrders>> productOrders = (from productOrder in _dbContext.ProductOrders
                                                       where productOrder.orderId == orderId
                                                       select productOrder).ToListAsync();
            List<ProductOrders> resultListProductOrders = await productOrders;
            List<IProductOrderJoinProduct> resultList = [];

            for (int i = 0; i < resultListProductOrders.Count; i++)
            {
                Product product = await _dbContext.Products.FirstAsync(x => x.Id == resultListProductOrders[i].productId);
                resultList.Add(new IProductOrderJoinProduct(resultListProductOrders[i], product));
            }
            IOrderJoinProductOrders data = new IOrderJoinProductOrders(order, resultList);
            return data;
        }

        public async Task<int> saveOrder(Order model)
        {
            try
            {
                _dbContext.Orders.Add(model);
                await _dbContext.SaveChangesAsync();
                return model.Id;
            }
            catch
            {
                return 0;
            }
        }

        public async Task<int> findByIdAndUpdatePrices(int id, int sumPrices)
        {
            try
            {
                Order order = await _dbContext.Orders.FindAsync(id);
                if (order != null) {
                    order.SumPrices = sumPrices;
                    _dbContext.Orders.Update(order);
                    await _dbContext.SaveChangesAsync();
                    return order.Id;
                }
                return 0;
            }
            catch
            {
                return 0;
            }
        }

        public async Task<IResultApi> addProductOrder(ProductOrders model)
        {
            IResultApi result = new IResultApi();
            try
            {
                _dbContext.ProductOrders.Add(model);
                await _dbContext.SaveChangesAsync();
                result.statusCode = 200;
                result.message = "Thêm mới giỏ hàng thành công";
                return result;
            }
            catch
            {
                result.statusCode = 400;
                result.message = "Thêm mới thất bại";
                return result;
            }
        }

        public async Task<int> statisticalForMonth(DateTime startDate, DateTime endDate)
        {
            int sumPrices = 0;
            List<Order> dataResponse = await (from order in _dbContext.Orders where order.CreatedDate >= startDate && order.CreatedDate <= endDate select order).ToListAsync();

            foreach (Order order in dataResponse) {
                sumPrices += order.SumPrices;
            }

            return sumPrices;
        }
    }
}
