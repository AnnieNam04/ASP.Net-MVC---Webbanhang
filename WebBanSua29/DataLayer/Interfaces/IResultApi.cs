using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces
{
    public class IResultApi
    {
        public int statusCode { get; set; }
        public string message { get; set; }

        public object resultData { get; set; }    
    }
}
