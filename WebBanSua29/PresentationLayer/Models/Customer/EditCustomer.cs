using System.ComponentModel.DataAnnotations;
using DataLayer.Entities;

namespace PresentationLayer.Models
{
    public class EditCustomer
    {
        public int Id { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập họ tên")]
        public string Name { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        [RegularExpression(@"^(\+?[0-9]{2,}[- ]?[0-9]{8,})$", ErrorMessage = "Số điện thoại không hợp lệ")]
        public string PhoneNumber { get; set; }

        //[Required(ErrorMessage = "Vui lòng nhập địa chỉ")]
        public string Address { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập email")]
        [EmailAddress(ErrorMessage = "Trường này phải là email")]
        public string Email { get; set; }

        public int Role { get; set; }

        public EditCustomer convertToModel(Customer model)
        {
            EditCustomer data = new EditCustomer();
            data.Id = model.Id;
            data.Name = model.Name;
            data.PhoneNumber = model.PhoneNumber;
            data.Address = model.Address;
            data.Email = model.Email;
            data.Role = model.Role;

            return data;
        }
    }
}
