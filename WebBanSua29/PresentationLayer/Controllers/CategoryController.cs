using BusinessLayer.CategoryService;
using BusinessLayer.CustomerService;
using DataLayer.Entities;
using DataLayer.Interfaces;
using Microsoft.AspNetCore.Mvc;
using PresentationLayer.Models;

namespace PresentationLayer.Controllers
{
    public class CategoryController : Controller
    {
        private readonly ICategoryService _categoryService;

        public CategoryController(ICategoryService categoryService)
        {
            _categoryService = categoryService;
        }
        public async Task<IActionResult> Index()
        {
            IEnumerable<Category> categories = await _categoryService.GetCategoriesAsync();
            return View(categories);
        }

        public async Task<IActionResult> Detail(int id)
        {
            Category category = await _categoryService.findByIdAsync(id);
            return View(category);
        }

        public async Task<IActionResult> Create()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Create([Bind("CategoryName")] Category model)
        {
            IResultApi res = await _categoryService.CreateCategoryAsync(model);
            if (res.statusCode != 200)
            {
                return RedirectToAction("Index", new { messgae = res.message });
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Edit(int id)
        {
            Category category = await _categoryService.findByIdAsync(id);
            return View(category);
        }

        [HttpPost]
        public async Task<IActionResult> Edit([Bind("Id","CategoryName")] Category model)
        {
            IResultApi res = await _categoryService.UpdateCategoryAsync(model);
            if (res.statusCode != 200)
            {
                return RedirectToAction("Index", new { messgae = res.message });
            }
            return RedirectToAction("Index");
        }

        public async Task<IActionResult> Delete(int id)
        {
            Category category = await _categoryService.findByIdAsync(id);
            return View(category);
        }

        [HttpPost]
        public async Task<IActionResult> Delete([Bind("Id")] Category model)
        {
            IResultApi res = await _categoryService.DeleteCategory(model.Id);
            if (res.statusCode != 200)
            {
                return RedirectToAction("Index", new { messgae = res.message });
            }
            return RedirectToAction("Index");
        }
    }
}
