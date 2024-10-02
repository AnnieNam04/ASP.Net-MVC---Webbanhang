using DataLayer.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.OrderInterface
{
    public interface IOrderRepository
    {
        Task<int> saveOrder(Order model);

        Task<IResultApi> getListOrderAysnc(int page);

        Task<IOrderJoinProductOrders> getDetailOrder(int orderId);

        Task<int> findByIdAndUpdatePrices(int id, int sumPrices);

        Task<int> statisticalForMonth(DateTime startDate, DateTime endDate);
        Task<IResultApi> addProductOrder(ProductOrders model);
    }
}
