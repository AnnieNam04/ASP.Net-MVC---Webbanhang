using Azure;
using DataLayer.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.ProductInterface
{
    public interface IProductRepository
    {
        Task<IResultApi> GetProductsAsync(int page, int? minPrices, int? maxPrices, string? name, int typeEndDate);
        Task<Product> findByIdAsync(int productId);
        Task<IResultApi> CreateProductAsync(Product model);
        Task<IResultApi> UpdateProductAsync(Product model);
        Task<IResultApi> DeleteProduct(int productId);
    }
}
