using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Entities
{
    public class Customer
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]        
        public int Id { get; set; }
        [Required(ErrorMessage = "Vui lòng nhập họ tên")]
        public required string Name { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập số điện thoại")]
        [RegularExpression(@"^(\+?[0-9]{2,}[- ]?[0-9]{8,})$", ErrorMessage = "Số điện thoại không hợp lệ")]
        public required string PhoneNumber { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        public required string Password { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập địa chỉ")]
        public required string Address { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập email")]
        [EmailAddress(ErrorMessage = "Trường này phải là email")]
        public required string Email { get; set; }

        public int Role { get; set; } = 1;
    }
}
