using DataLayer.Entities;
using DataLayer.Interfaces;
using DataLayer.Interfaces.CustomerInterface;
using DataLayer.Interfaces.OrderInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.OrderService
{
    public class OrderService: IOrderService
    {
        private readonly IOrderRepository _orderRepository;

        public OrderService(IOrderRepository orderRepository)
        {
            _orderRepository = orderRepository;
        }

        public async Task<int> saveOrder(Order model)
        {
            return await _orderRepository.saveOrder(model);
        }

        public async Task<IResultApi> getListOrderAysnc(int page)
        {
            return await _orderRepository.getListOrderAysnc(page);
        }

        public async Task<IOrderJoinProductOrders> getDetailOrder(int orderId)
        {
            return await _orderRepository.getDetailOrder(orderId);
        }

        public async Task<int> findByIdAndUpdatePrices(int id, int sumPrices)
        {
            return await _orderRepository.findByIdAndUpdatePrices(id,sumPrices);
        }

        public async Task<IResultApi> addProductOrder(ProductOrders model)
        {
            return await _orderRepository.addProductOrder(model);
        }

        public async Task<int> statisticalForMonth(DateTime startDate, DateTime endDate)
        {
            return await _orderRepository.statisticalForMonth(startDate, endDate);
        }
    }
}
