using BusinessLayer.CustomerService;
using DataLayer.Entities;
using DataLayer.Interfaces;
using Microsoft.AspNetCore.Mvc;
using NuGet.Protocol;
using PresentationLayer.Models;
using static System.Net.Mime.MediaTypeNames;

namespace PresentationLayer.Controllers
{
    public class CustomerController : Controller
    {
        private readonly ICustomerService  _customerService;

        public CustomerController(ICustomerService customerService)
        {
            _customerService = customerService;
        }

        public async Task<IActionResult> Index()
        {
            var customers = await _customerService.GetCustomersAsync();
            return View(customers);
        }

        public async Task<IActionResult> Detail(int id)
        {
            Customer customer = await _customerService.findByIdAsync(id);
            return View(customer);
        }

        public async Task<IActionResult> Delete(int id)
        {
            Customer customer = await _customerService.findByIdAsync(id);
            return View(customer);
        }

        public async Task<IActionResult> Create()
        {
            return View();
        }

        [HttpPost("onCreate")]
        public async Task<IActionResult> onCreate([Bind("Name", "Role", "PhoneNumber", "Password", "Address", "Email")] Customer model)
        {
            IResultApi res = await _customerService.CreateCustomerAsync(model);
            if (res.statusCode != 200) {
                return RedirectToAction("Index",new {  messgae = res.message });
            }
            return RedirectToAction("Index");
        }



        [HttpPost("onDelete")]
        public async Task<IActionResult> onDelete([Bind("Id")] Customer model)
        {
            IResultApi res = await _customerService.DeleteCustomer(model.Id);
            if (res.statusCode != 200)
            {
                return RedirectToAction("Index", new { messgae = res.message });
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Edit(int id)
        {
            Customer customer = await _customerService.findByIdAsync(id);
            EditCustomer editCustomer = new EditCustomer();
            return View(editCustomer.convertToModel(customer));
        }

        [HttpPost("onEdit")]
        public async Task<IActionResult> onEdit([Bind("Id","Name", "PhoneNumber", "Address", "Email","Role")] Customer model)
        {
            Customer customer = await _customerService.findByIdAsync(model.Id);
            customer.PhoneNumber = model.PhoneNumber;
            customer.Name = model.Name;
            customer.Address = model.Address;
            customer.Email = model.Email;
            customer.Role = model.Role;
            IResultApi res = await _customerService.UpdateCustomerAsync(customer);
            if (res.statusCode != 200)
            {
                return RedirectToAction("Index", new { messgae = res.message });
            }
            return RedirectToAction("Index");
        }
    }
}
