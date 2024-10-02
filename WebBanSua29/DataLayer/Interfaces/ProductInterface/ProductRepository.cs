using Azure;
using DataLayer.Data;
using DataLayer.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.ProductInterface
{
    public class ProductRepository : IProductRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public ProductRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IResultApi> GetProductsAsync(int page, int? minPrices, int? maxPrices, string? name, int typeEndDate)
        {
            int pageSize = 10;
            IResultApi res = new IResultApi();
            if (page == null || page == 0) { 
                page = 1;
            }
            var source = (
                from product in _dbContext.Products
                join category in _dbContext.Categories
                on product.CategoryId
                equals category.Id
                join sale in _dbContext.Sales
                on product.SaleId
                equals sale.Id
                where
                (minPrices != null ? product.Prices * (100 - sale.percentSale) / 100 >= minPrices : true) &&
                (maxPrices != null && maxPrices > 0 ? product.Prices * (100 - sale.percentSale) / 100 <= maxPrices : true) &&
                (name != null ? product.ProductName.Contains(name) : true) &&
                (typeEndDate == 1 ? product.EndDate >= DateTime.Now : true) &&
                (typeEndDate == 2 ? product.EndDate < DateTime.Now : true)
                select new IProductJoinCategory(product, category, sale));
            int count = source.Count();
            int pageCount = System.Convert.ToInt32(System.Math.Ceiling(count / System.Convert.ToDouble(pageSize)));
            Task<List<IProductJoinCategory>> result = source.Skip((page - 1) * pageSize).Take(pageSize).ToListAsync();
            List<IProductJoinCategory> resultList = await result;
            res.statusCode = 200;
            res.message = "";
            IResultDataProducts resultData = new IResultDataProducts()
            {
                count = count,
                pageCount = pageCount,
                resultList = resultList
            };
            res.resultData = resultData;
            return res;
        }

        public async Task<IResultApi> CreateProductAsync(Product model)
        {
            IResultApi result = new IResultApi();
            try
            {
                _dbContext.Products.Add(model);
                await _dbContext.SaveChangesAsync();



                result.statusCode = 200;
                result.message = "Thêm thành công";
                return result;
            }
            catch(Exception ex)
            {
                result.statusCode = 400;
                result.message = "Thêm thất bại";
                return result;
            }
        }

        public async Task<IResultApi> UpdateProductAsync(Product model)
        {
            IResultApi result = new IResultApi();
            try
            {
                _dbContext.Products.Update(model);
                await _dbContext.SaveChangesAsync();

                result.statusCode = 200;
                result.message = "Cập nhật khách hàng thành công";
                return result;
            }
            catch (Exception ex)
            {
                result.statusCode = 400;
                result.message = "Cập nhật thất bại";
                return result;
            }
        }

        public async Task<Product> findByIdAsync(int customerId)
        {
            return await _dbContext.Products.FirstAsync(x => x.Id == customerId);
        }

        public async Task<IResultApi> DeleteProduct(int customerId)
        {
            {
                IResultApi result = new IResultApi();

                result.statusCode = 400;
                result.message = "Xóa thất bại";
                try
                {
                    Product? customer = _dbContext.Products.Find(customerId);
                    if (customer == null) return result;
                    _dbContext.Products.Remove(customer);
                    await _dbContext.SaveChangesAsync();
                    result.statusCode = 200;
                    result.message = "Xóa thành công";
                    return result;
                }
                catch
                {
                    return result;
                }
            }
        }
    }
}
