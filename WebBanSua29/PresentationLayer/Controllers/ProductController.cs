using BusinessLayer.CategoryService;
using BusinessLayer.ProductService;
using BusinessLayer.SaleService;
using DataLayer.Entities;
using DataLayer.Interfaces;
using DataLayer.Interfaces.ProductInterface;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using PresentationLayer.Models.Order;
using PresentationLayer.Models.Product;
using System.Collections;
using System.Collections.Generic;
using System.Drawing;
using static Azure.Core.HttpHeader;

namespace PresentationLayer.Controllers
{
    public class ProductController : Controller
    {

        private readonly IProductService _productService;
        private readonly ICategoryService _categoryService;
        private readonly ISaleService _saleService;

        private const string CartName = "Cart";

        public ProductController(IProductService productService, ICategoryService categoryService, ISaleService saleService)
        {
            _productService = productService;
            _categoryService = categoryService;
            _saleService = saleService;
        }

        public async Task<IActionResult> Index(int page, int minPrices, int maxPrices, string name, int typeEndDate)
        {
            IResultApi res = await _productService.GetProductsAsync(page, minPrices,maxPrices, name, typeEndDate);
            IResultDataProducts data = (IResultDataProducts)res.resultData;
            ViewBag.countProduct = data.count;
            ViewBag.pageCount = data.pageCount;
            ViewBag.currentPage = page > 0 ? page : 1;
            return View(data.resultList);
        }

        public async Task<IActionResult> Create()
        {
            IEnumerable<Category> categories = await _categoryService.GetCategoriesAsync();
            ViewBag.Categories = categories;
            IEnumerable<Sale> sales = await _saleService.GetSalesAsync();
            ViewBag.Sales = sales;
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create(CreateProduct model)
        {
            Product product = new Product()
            {
                SaleId = model.SaleId,
                CategoryId = model.CategoryId,
                ProductName = model.ProductName,
                Count = model.Count,
                Image = "",
                Prices = model.Prices,
                EndDate = model.EndDate,
            };
            if (model.imgFile != null)
            {

                //Set Key Name
                string ImageName = Guid.NewGuid().ToString() + Path.GetExtension(model.imgFile.FileName);

                //Get url To Save
                string SavePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/img", ImageName);
                using (var stream = new FileStream(SavePath, FileMode.Create))
                {
                    model.imgFile.CopyTo(stream);
                }
                product.Image = "/img/" + ImageName;
            }
            IResultApi res = await _productService.CreateProductAsync(product);
            if (res.statusCode != 200)
            {
                return RedirectToAction("Index", new { messgae = res.message });
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Edit(int id)
        {
            Product product = await _productService.findByIdAsync(id);
            UpdateProduct updateProduct = new UpdateProduct().convertToUpdateProduct(product);
            IEnumerable<Category> categories = await _categoryService.GetCategoriesAsync();
            ViewBag.Categories = categories;
            IEnumerable<Sale> sales = await _saleService.GetSalesAsync();
            ViewBag.Sales = sales;
            return View(updateProduct);
        }

        [HttpPost]
        public async Task<IActionResult> Edit(UpdateProduct model)
        {
            Product productOld = await _productService.findByIdAsync(model.Id);
            productOld.SaleId = model.SaleId;
            productOld.CategoryId = model.CategoryId;
            productOld.ProductName = model.ProductName;
            productOld.Count = model.Count;
            productOld.Prices = model.Prices;
            productOld.EndDate = model.EndDate;
            if (model.imgFile != null)
            {

                //Set Key Name
                string ImageName = Guid.NewGuid().ToString() + Path.GetExtension(model.imgFile.FileName);

                //Get url To Save
                string SavePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/img", ImageName);
                using (var stream = new FileStream(SavePath, FileMode.Create))
                {
                    model.imgFile.CopyTo(stream);
                }
                productOld.Image = "/img/" + ImageName;
            }
            IResultApi res = await _productService.UpdateProductAsync(productOld);
            if (res.statusCode != 200)
            {
                return RedirectToAction("Index", new { messgae = res.message });
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Delete(int id)
        {
            Product product = await _productService.findByIdAsync(id);
            return View(product);
        }

        [HttpPost]
        public async Task<IActionResult> Delete([Bind("Id")] Product model)
        {
            IResultApi res = await _productService.DeleteProduct(model.Id);
            if (res.statusCode != 200)
            {
                return RedirectToAction("Index", new { messgae = res.message });
            }
            return RedirectToAction("Index");
        }

        public IActionResult addToCart(int Id, string ProductName, string Image, int Prices, int SumCount, int PercentSale)
        {
            string? cartSession = HttpContext.Session.GetString(CartName);
            List<OrderInSession> cart = [];
            if (cartSession != null) {
                cart = JsonConvert.DeserializeObject<List<OrderInSession>>(cartSession);
            }
            int index = cart.FindIndex(x => x.Id == Id);
            if (index > -1) {
                cart[index].Count = cart[index].Count + 1;
            }
            else
            {
                OrderInSession item = new OrderInSession();
                item.Id = Id;
                item.ProductName = ProductName;
                item.Image = Image;
                item.Prices = (Prices * (100 - PercentSale) / 100);
                item.SumCount = SumCount;
                item.Count = 1;
                cart.Add(item);
            }
            HttpContext.Session.SetString(CartName, JsonConvert.SerializeObject(cart));


            return Redirect("/Cart");
        }
    }
}
