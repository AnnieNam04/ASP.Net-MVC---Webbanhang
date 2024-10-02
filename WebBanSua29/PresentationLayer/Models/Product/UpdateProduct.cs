using System.ComponentModel.DataAnnotations;

namespace PresentationLayer.Models.Product
{
    public class UpdateProduct
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập tên sản phẩm")]
        public string ProductName { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập giá sản phẩm")]
        public int Prices { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số lượng")]
        public int Count { get; set; }

        [Required(ErrorMessage = "Vui lòng chọn loại sản phẩm")]
        public int CategoryId { get; set; }

        [Required(ErrorMessage = "Vui lòng chọn giảm giá")]
        public int SaleId { get; set; } = 0;

        [Required(ErrorMessage = "Vui lòng chọn ngày hết hạn")]
        public DateTime EndDate { get; set; }


        public string Image { get; set; }

        public IFormFile imgFile { set; get; }

        public UpdateProduct convertToUpdateProduct(DataLayer.Entities.Product model)
        {
            UpdateProduct data = new UpdateProduct();
            data.Id = model.Id;
            data.ProductName = model.ProductName;
            data.Prices = model.Prices;
            data.Count = model.Count;
            data.CategoryId = model.CategoryId;
            data.Image = model.Image;
            data.EndDate = model.EndDate;

            return data;
        }
    }
}
