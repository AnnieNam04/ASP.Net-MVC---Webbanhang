using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Entities
{
    public class Product
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int Id { get; set; }

        public required string ProductName { get; set; }
        public required string Image { get; set; }
        public required int Prices { get; set; }
        public required int Count { get; set; }
        public int CategoryId { get; set; }
        public Category Category { get; set; }

        public int SaleId { get; set; }
        public Sale Sale { get; set; }

        public DateTime EndDate { get; set; }

        public DateTime CreatedDate { get; set; }
        public DateTime ModifiedDate { get; set; }

        public Product()
        {
            this.CreatedDate = DateTime.UtcNow;
            this.ModifiedDate = DateTime.UtcNow;
        }

    }
}
