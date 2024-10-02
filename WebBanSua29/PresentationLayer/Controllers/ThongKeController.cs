using BusinessLayer.OrderService;
using Microsoft.AspNetCore.Mvc;

namespace PresentationLayer.Controllers
{
    public class ThongKeController : Controller
    {
        private readonly IOrderService _orderService;

        public ThongKeController(IOrderService orderService)
        {
            _orderService = orderService;
        }

        public async Task<IActionResult> Index(DateTime? startDate = null, DateTime? endDate = null)
        {
            DateTime d1 = DateTime.Now;
            if (startDate == null)
            {
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
    }
}
