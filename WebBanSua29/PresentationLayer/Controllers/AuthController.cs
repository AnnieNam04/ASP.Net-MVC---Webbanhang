using BusinessLayer.CustomerService;
using DataLayer.Entities;
using DataLayer.Interfaces;
using DataLayer.Interfaces.CustomerInterface;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PresentationLayer.Models.Auth;

namespace PresentationLayer.Controllers
{
    public class AuthController : Controller
    {
        private readonly ICustomerService _customerService;

        private const string DataUser = "DataUser";

        public AuthController(ICustomerService customerService)
        {
            _customerService = customerService;
        }
        public IActionResult Login()
        {
            return View();
        }
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IResultApi> onLogin([FromBody] ILoginCustomer body)
        {
            IResultApi res = await _customerService.onLogin(body);
            if (res.statusCode == 200) {
                HttpContext.Session.SetString(DataUser, JsonConvert.SerializeObject(res.resultData));
            }
            return res;
        }

        [HttpPost]
        public async Task<IResultApi> onRegister([FromBody] Customer model)
        {
            IResultApi res = await _customerService.CreateCustomerAsync(model);
            return res;
        }

        [HttpGet]
        public async Task<IActionResult> Logout()
        {
            HttpContext.Session.Remove(DataUser);
            return RedirectToAction("Login");
        }
    }
}
