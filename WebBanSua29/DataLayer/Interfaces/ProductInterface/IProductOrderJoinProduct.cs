using DataLayer.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.ProductInterface
{
    public class IProductOrderJoinProduct(ProductOrders productOrders, Product product)
    {
        public ProductOrders productOrders { get; set; } = productOrders;
        public Product product { get; set; } = product;
    }
}
