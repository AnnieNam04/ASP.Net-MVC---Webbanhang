using DataLayer.Entities;
using DataLayer.Interfaces;
using DataLayer.Interfaces.CategoryInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.CategoryService
{
    public class CategoryService : ICategoryService
    {
        private readonly ICategoryRepository _categoryRepository;

        public CategoryService(ICategoryRepository categoryRepository)
        {
            _categoryRepository = categoryRepository;
        }


        public async Task<IEnumerable<Category>> GetCategoriesAsync()
        {
            return await _categoryRepository.GetCategoriesAsync();
        }

        public async Task<Category> findByIdAsync(int categoryId)
        {
            return await _categoryRepository.findByIdAsync(categoryId);
        }

        public async Task<IResultApi> CreateCategoryAsync(Category model)
        {
            return await _categoryRepository.CreateCategoryAsync(model);
        }

        public async Task<IResultApi> UpdateCategoryAsync(Category model)
        {
            return await _categoryRepository.UpdateCategoryAsync(model);
        }

        public async Task<IResultApi> DeleteCategory(int categoryId)
        {
            return await _categoryRepository.DeleteCategory(categoryId);
        }
    }
}
