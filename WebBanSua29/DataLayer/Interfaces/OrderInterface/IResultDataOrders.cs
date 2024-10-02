using DataLayer.Entities;
using DataLayer.Interfaces.ProductInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.OrderInterface
{
    public class IResultDataOrders
    {
        public int count { get; set; }
        public int pageCount { get; set; }
        public List<Order> resultList { get; set; }
    }
}
