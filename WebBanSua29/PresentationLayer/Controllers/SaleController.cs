using BusinessLayer.SaleService;
using BusinessLayer.SaleService;
using DataLayer.Entities;
using DataLayer.Interfaces;
using Microsoft.AspNetCore.Mvc;

namespace PresentationLayer.Controllers
{
    public class SaleController : Controller
    {
        private readonly ISaleService _saleService;

        public SaleController(ISaleService saleService)
        {
            _saleService = saleService;
        }
        public async Task<IActionResult> Index()
        {
            IEnumerable<Sale> sales = await _saleService.GetSalesAsync();
            return View(sales);
        }

        public async Task<IActionResult> Detail(int id)
        {
            Sale sale = await _saleService.findByIdAsync(id);
            return View(sale);
        }

        public async Task<IActionResult> Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create([Bind("percentSale")] Sale model)
        {
            IResultApi res = await _saleService.CreateSaleAsync(model);
            if (res.statusCode != 200)
            {
                return RedirectToAction("Index", new { messgae = res.message });
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Edit(int id)
        {
            Sale sale = await _saleService.findByIdAsync(id);
            return View(sale);
        }

        [HttpPost]
        public async Task<IActionResult> Edit([Bind("Id", "percentSale")] Sale model)
        {
            IResultApi res = await _saleService.UpdateSaleAsync(model);
            if (res.statusCode != 200)
            {
                return RedirectToAction("Index", new { messgae = res.message });
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Delete(int id)
        {
            Sale sale = await _saleService.findByIdAsync(id);
            return View(sale);
        }

        [HttpPost]
        public async Task<IActionResult> Delete([Bind("Id")] Sale model)
        {
            IResultApi res = await _saleService.DeleteSale(model.Id);
            if (res.statusCode != 200)
            {
                return RedirectToAction("Index", new { messgae = res.message });
            }
            return RedirectToAction("Index");
        }
    }
}
