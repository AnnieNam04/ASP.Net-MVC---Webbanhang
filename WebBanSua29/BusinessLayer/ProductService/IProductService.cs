using DataLayer.Entities;
using DataLayer.Interfaces;
using DataLayer.Interfaces.ProductInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.ProductService
{
    public interface IProductService
    {
        Task<IResultApi> GetProductsAsync(int page, int? minPrices, int? maxPrices, string? name, int typeEndDate);
        Task<Product> findByIdAsync(int productId);
        Task<IResultApi> CreateProductAsync(Product model);
        Task<IResultApi> UpdateProductAsync(Product model);
        Task<IResultApi> DeleteProduct(int productId);
    }
}
