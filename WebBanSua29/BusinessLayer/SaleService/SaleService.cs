using DataLayer.Entities;
using DataLayer.Interfaces.SaleInterface;
using DataLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DataLayer.Interfaces.SaleInterface;

namespace BusinessLayer.SaleService
{
   public class SaleService : ISaleService
    {
        private readonly ISaleRepository _saleRepository;

        public SaleService(ISaleRepository saleRepository)
        {
            _saleRepository = saleRepository;
        }


        public async Task<IEnumerable<Sale>> GetSalesAsync()
        {
            return await _saleRepository.GetSalesAsync();
        }

        public async Task<Sale> findByIdAsync(int saleId)
        {
            return await _saleRepository.findByIdAsync(saleId);
        }

        public async Task<IResultApi> CreateSaleAsync(Sale model)
        {
            return await _saleRepository.CreateSaleAsync(model);
        }

        public async Task<IResultApi> UpdateSaleAsync(Sale model)
        {
            return await _saleRepository.UpdateSaleAsync(model);
        }

        public async Task<IResultApi> DeleteSale(int saleId)
        {
            return await _saleRepository.DeleteSale(saleId);
        }
    }
}
