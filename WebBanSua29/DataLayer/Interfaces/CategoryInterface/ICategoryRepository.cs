using DataLayer.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.CategoryInterface
{
    public interface ICategoryRepository
    {
        Task<IEnumerable<Category>> GetCategoriesAsync();
        Task<Category> findByIdAsync(int categoryId);
        Task<IResultApi> CreateCategoryAsync(Category model);
        Task<IResultApi> UpdateCategoryAsync(Category model);
        Task<IResultApi> DeleteCategory(int categoryId);
    }
}
