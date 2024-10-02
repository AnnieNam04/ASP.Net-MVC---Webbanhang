using DataLayer.Entities;
using DataLayer.Interfaces.ProductInterface;
using DataLayer.Interfaces;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.ProductService
{
    public class ProductService : IProductService
    {
        private readonly IProductRepository _productRepository;

        public ProductService(IProductRepository productRepository)
        {
            _productRepository = productRepository;
        }

        public async Task<IResultApi> GetProductsAsync(int page, int? minPrices, int? maxPrices, string? name, int typeEndDate)
        {
            return await _productRepository.GetProductsAsync(page, minPrices, maxPrices, name, typeEndDate);
        }

        public async Task<Product> findByIdAsync(int productId)
        {
            return await _productRepository.findByIdAsync(productId);
        }

        public async Task<IResultApi> CreateProductAsync(Product model)
        {
            return await _productRepository.CreateProductAsync(model);
        }

        public async Task<IResultApi> UpdateProductAsync(Product model)
        {
            return await _productRepository.UpdateProductAsync(model);
        }

        public async Task<IResultApi> DeleteProduct(int productId)
        {
            return await _productRepository.DeleteProduct(productId);
        }
    }
}
