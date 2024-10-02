using DataLayer.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.SaleInterface
{
    public interface ISaleRepository
    {
        Task<IEnumerable<Sale>> GetSalesAsync();
        Task<Sale> findByIdAsync(int saleId);
        Task<IResultApi> CreateSaleAsync(Sale model);
        Task<IResultApi> UpdateSaleAsync(Sale model);
        Task<IResultApi> DeleteSale(int saleId);
    }
}
