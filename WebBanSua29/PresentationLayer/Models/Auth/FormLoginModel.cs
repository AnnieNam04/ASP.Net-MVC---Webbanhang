using System.ComponentModel.DataAnnotations;

namespace PresentationLayer.Models.Auth
{
    public class FormLoginModel
    {
        [Required(ErrorMessage = "Vui lòng nhập email")]
        [EmailAddress(ErrorMessage = "Trường này phải là email")]
        public string Email { get; set; }

        [Required(ErrorMessage = "Vui lòng nhập mật khẩu")]
        public string Password { get; set; }
    }
}
