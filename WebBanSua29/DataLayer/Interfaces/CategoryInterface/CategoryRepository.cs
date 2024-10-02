using DataLayer.Data;
using DataLayer.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.CategoryInterface
{
    public class CategoryRepository: ICategoryRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public CategoryRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IEnumerable<Category>> GetCategoriesAsync()
        {
            var result = (from category in _dbContext.Categories select category).ToListAsync();
            return await result;
        }

        public async Task<IResultApi> CreateCategoryAsync(Category model)
        {
            IResultApi result = new IResultApi();
            try
            {
                _dbContext.Categories.Add(model);
                await _dbContext.SaveChangesAsync();



                result.statusCode = 200;
                result.message = "Thêm thành công";
                return result;
            }
            catch
            {
                result.statusCode = 400;
                result.message = "Thêm thất bại";
                return result;
            }
        }

        public async Task<IResultApi> UpdateCategoryAsync(Category model)
        {
            IResultApi result = new IResultApi();
            try
            {
                _dbContext.Categories.Update(model);
                await _dbContext.SaveChangesAsync();

                result.statusCode = 200;
                result.message = "Cập nhật khách hàng thành công";
                return result;
            }
            catch (Exception ex)
            {
                result.statusCode = 400;
                result.message = "Cập nhật thất bại";
                return result;
            }
        }

        public async Task<Category> findByIdAsync(int customerId)
        {
            return await _dbContext.Categories.FirstAsync(x => x.Id == customerId);
        }

        public async Task<IResultApi> DeleteCategory(int customerId)
        {
            {
                IResultApi result = new IResultApi();

                result.statusCode = 400;
                result.message = "Xóa thất bại";
                try
                {
                    Category? customer = _dbContext.Categories.Find(customerId);
                    if (customer == null) return result;
                    _dbContext.Categories.Remove(customer);
                    await _dbContext.SaveChangesAsync();
                    result.statusCode = 200;
                    result.message = "Xóa thành công";
                    return result;
                }
                catch
                {
                    return result;
                }
            }
        }
    }
}
