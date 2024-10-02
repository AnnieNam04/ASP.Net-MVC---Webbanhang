using DataLayer.Interfaces.ProductInterface;
using DataLayer.Interfaces;
using Microsoft.AspNetCore.Mvc;
using DataLayer.Interfaces.OrderInterface;
using BusinessLayer.SaleService;
using BusinessLayer.OrderService;
using BusinessLayer.CategoryService;
using BusinessLayer.ProductService;

namespace PresentationLayer.Controllers
{
    public class OrderController : Controller
    {
        private readonly IOrderService _orderService;

        public OrderController(IOrderService orderService, ICategoryService categoryService, ISaleService saleService)
        {
            _orderService = orderService;
        }
        public async Task<IActionResult> Index(int page)
        {
            IResultApi res = await _orderService.getListOrderAysnc(page);
            IResultDataOrders data = (IResultDataOrders)res.resultData;
            ViewBag.countProduct = data.count;
            ViewBag.pageCount = data.pageCount;
            ViewBag.currentPage = page > 0 ? page : 1;
            return View(data.resultList);
        }

        public async Task<IActionResult> Detail(int id) {
            IOrderJoinProductOrders dataDetail = await _orderService.getDetailOrder(id);
            return View(dataDetail);
        }
    }
}
