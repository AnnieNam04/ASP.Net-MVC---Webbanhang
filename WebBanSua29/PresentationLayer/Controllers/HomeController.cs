using BusinessLayer.OrderService;
using Microsoft.AspNetCore.Mvc;
using PresentationLayer.Models;
using System.Diagnostics;

namespace PresentationLayer.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;

        private readonly IOrderService _orderService;

        public HomeController(ILogger<HomeController> logger, IOrderService orderService)
        {
            _logger = logger;
            _orderService = orderService;
        }

        public async Task<IActionResult> Index(DateTime? startDate = null, DateTime? endDate = null)
        {
            DateTime d1 = DateTime.Now;
            if (startDate == null) {
                startDate = d1.AddMonths(-1);
            }
            if (endDate == null)
            {
                endDate = d1.AddDays(1);
            }
            int res = await _orderService.statisticalForMonth((DateTime)startDate, (DateTime)endDate);
            ViewBag.sumPrices = res;
            ViewBag.startDate = startDate;
            ViewBag.endDate = endDate;
            return View();
        }

        public IActionResult Privacy()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
