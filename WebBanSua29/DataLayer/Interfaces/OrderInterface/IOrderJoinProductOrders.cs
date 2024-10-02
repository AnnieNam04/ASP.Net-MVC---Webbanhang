using DataLayer.Entities;
using DataLayer.Interfaces.ProductInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.OrderInterface
{
    public class IOrderJoinProductOrders(Order order, List<IProductOrderJoinProduct> productOrders)
    {
        public Order Order { get; set; } = order;

        public List<IProductOrderJoinProduct> ProductOrders { get; set;} = productOrders;
    }
}
