using BusinessLayer.CategoryService;
using BusinessLayer.OrderService;
using BusinessLayer.ProductService;
using DataLayer.Entities;
using DataLayer.Interfaces;
using DataLayer.Interfaces.ProductInterface;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using PresentationLayer.Models.Order;

namespace PresentationLayer.Controllers
{
    public class CartController : Controller
    {


        private readonly IOrderService _orderService;
        private readonly IProductService _productService;

        private const string CartName = "Cart";

        public CartController(IOrderService orderService, IProductService productService)
        {
            _orderService = orderService;
            _productService = productService;
        }
        public IActionResult Index()
        {
            return View();
        }

        public IActionResult OrderSuccess()
        {
            return View();
        }

        public IActionResult OrderFail()
        {
            return View();
        }

        [HttpPost]
        public async Task<IResultApi> OnOrder([FromBody] Order body)
        {
            string? cartSession = HttpContext.Session.GetString(CartName);
            List<OrderInSession> cart = [];
            IResultApi res = new IResultApi();
            if (cartSession != null)
            {
                cart = JsonConvert.DeserializeObject<List<OrderInSession>>(cartSession);
                int sumPrices = 0;
                //check count product
                for (int i = 0; i < cart.Count; i++)
                {
                    Product productInDB = await _productService.findByIdAsync(cart[i].Id);
                    int countInProduct = productInDB.Count;
                    if (countInProduct - cart[i].Count < 0)
                    {
                        res.statusCode = 400;
                        res.message = "Số lượng hàng k đủ";
                        return res;
                    }
                }
                
                if (cart == null || cart.Count == 0) {
                    res.statusCode = 400;
                    res.message = "Không thành công";
                    return res;
                }

                int orderId = await _orderService.saveOrder(body);
                for (int i = 0; i < cart.Count; i++)
                {
                    Product product = await _productService.findByIdAsync(cart[i].Id);
                    ProductOrders productOrders = new ProductOrders();
                    productOrders.productId = cart[i].Id;
                    productOrders.orderId = orderId;
                    productOrders.countOrder = cart[i].Count;
                    await _orderService.addProductOrder(productOrders);
                    product.Count = product.Count - cart[i].Count;
                    await _productService.UpdateProductAsync(product);
                    sumPrices = sumPrices + (cart[i].Prices * cart[i].Count);
                }

                await _orderService.findByIdAndUpdatePrices(orderId, sumPrices);

            }
            HttpContext.Session.Remove(CartName);
            res.statusCode = 200;
            res.message = "Đặt hàng thành công";
            return res;
        }

        [HttpPost]
        public IResultApi onUpdateCart([FromBody] IUpdateCartModel model)
        {
            IResultApi res = new IResultApi();
            string? cartSession = HttpContext.Session.GetString(CartName);
            List<OrderInSession> cart = [];

            if (cartSession != null)
            {
                cart = JsonConvert.DeserializeObject<List<OrderInSession>>(cartSession);
                if (cart == null || cart.Count == 0)
                {
                    return res;
                }

                int index = cart.FindIndex(x => x.Id == model.id);
                if (index > -1)
                {
                    cart[index].Count = model.count;
                    HttpContext.Session.SetString(CartName, JsonConvert.SerializeObject(cart));
                }
            }
            return res;
        }

        [HttpPost]
        public IActionResult onDeleteCart([FromBody] IUpdateCartModel model)
        {
            string? cartSession = HttpContext.Session.GetString(CartName);
            List<OrderInSession> cart = [];

            if (cartSession != null)
            {
                cart = JsonConvert.DeserializeObject<List<OrderInSession>>(cartSession);
                if (cart == null || cart.Count == 0)
                {
                    return View();
                }

                int index = cart.FindIndex(x => x.Id == model.id);
                if (index > -1)
                {
                    cart.RemoveAt(index);
                    HttpContext.Session.SetString(CartName, JsonConvert.SerializeObject(cart));
                }
            }
            return RedirectToAction("Index");
        }
    }
}
