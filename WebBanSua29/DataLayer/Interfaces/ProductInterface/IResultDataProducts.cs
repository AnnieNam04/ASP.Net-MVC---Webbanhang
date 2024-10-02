using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.ProductInterface
{
    public class IResultDataProducts
    {
        public int count { get; set; }
        public int pageCount { get; set; }
        public List<IProductJoinCategory> resultList { get; set; }
    }
}
