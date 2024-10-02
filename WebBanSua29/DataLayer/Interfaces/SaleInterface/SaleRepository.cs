using DataLayer.Data;
using DataLayer.Entities;
using DataLayer.Interfaces.ProductInterface;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.SaleInterface
{
    public class SaleRepository : ISaleRepository
    {
        private readonly ApplicationDbContext _dbContext;

        public SaleRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IEnumerable<Sale>> GetSalesAsync()
        {
            var result = (from sale in _dbContext.Sales select sale).ToListAsync();
            return await result;
        }

        public async Task<IResultApi> CreateSaleAsync(Sale model)
        {
            IResultApi result = new IResultApi();
            try
            {
                _dbContext.Sales.Add(model);
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

        public async Task<IResultApi> UpdateSaleAsync(Sale model)
        {
            IResultApi result = new IResultApi();
            try
            {
                _dbContext.Sales.Update(model);
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

        public async Task<Sale> findByIdAsync(int saleId)
        {
            return await _dbContext.Sales.FirstAsync(x => x.Id == saleId);
        }

        public async Task<IResultApi> DeleteSale(int saleId)
        {
            {
                IResultApi result = new IResultApi();

                result.statusCode = 400;
                result.message = "Xóa thất bại";
                try
                {
                    Sale? sale = _dbContext.Sales.Find(saleId);
                    if (sale == null) return result;
                    _dbContext.Sales.Remove(sale);
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
