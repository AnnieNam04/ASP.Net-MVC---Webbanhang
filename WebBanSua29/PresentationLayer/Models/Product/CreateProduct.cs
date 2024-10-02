using DataLayer.Entities;
using System.ComponentModel.DataAnnotations;

namespace PresentationLayer.Models.Product
{
    public class CreateProduct
    {
        [Required(ErrorMessage = "Vui lòng nhập tên sản phẩm")]
        public string ProductName { get; set; } = "";

        [Required(ErrorMessage = "Vui lòng nhập giá sản phẩm")]
        public int Prices { get; set; } = 0;

        [Required(ErrorMessage = "Vui lòng nhập số lượng")]
        public int Count { get; set; } = 0;

        [Required(ErrorMessage = "Vui lòng chọn loại sản phẩm")]
        public int CategoryId { get; set; } = 0;

        [Required(ErrorMessage = "Vui lòng chọn giảm giá")]
        public int SaleId { get; set; } = 0;

        [Required(ErrorMessage = "Vui lòng chọn ngày hết hạn")]
        public DateTime EndDate { get; set; }

        public IFormFile imgFile { set; get; }
    }
}
