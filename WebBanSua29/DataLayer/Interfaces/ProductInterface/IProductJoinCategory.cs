using DataLayer.Entities;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.ProductInterface
{
    public class IProductJoinCategory(Product product, Category category,Sale sale)
    {
        public int Id { get; set; } = product.Id;

        public string ProductName { get; set; } = product.ProductName;
        public string Image { get; set; } = product.Image;
        public int Prices { get; set; } = product.Prices;
        public int Count { get; set; } = product.Count;
        public int CategoryId { get; set; } = category.Id;
        
        public string CategoryName { get; set; } = category.CategoryName;
        public int SaleId { get; set; } = sale.Id;
        public int percentSale { get; set; } = sale.percentSale;

        [DisplayFormat(DataFormatString = "{0:dd/MM/yyyy}")]
        public DateTime EndDate { get; set; } = product.EndDate;
    }
}
