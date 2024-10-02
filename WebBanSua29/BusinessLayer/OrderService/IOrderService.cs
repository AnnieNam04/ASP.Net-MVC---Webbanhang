using DataLayer.Entities;
using DataLayer.Interfaces;
using DataLayer.Interfaces.OrderInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.OrderService
{
    public interface IOrderService
    {
        Task<int> saveOrder(Order model);

        Task<IResultApi> getListOrderAysnc(int page);
        Task<IOrderJoinProductOrders> getDetailOrder(int orderId);
        Task<int> findByIdAndUpdatePrices(int id, int sumPrices);

        Task<int> statisticalForMonth(DateTime startDate, DateTime endDate);
        Task<IResultApi> addProductOrder(ProductOrders model);
    }
}
