using DataLayer.Entities;
using DataLayer.Interfaces;
using DataLayer.Interfaces.CustomerInterface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BusinessLayer.CustomerService
{
    public class CustomerService : ICustomerService
    {
        private readonly ICustomersRepository _customersRepository;

        public CustomerService(ICustomersRepository customersRepository)
        {
            _customersRepository = customersRepository;
        }

        public async Task<IEnumerable<Customer>> GetCustomersAsync()
        {
            return await _customersRepository.GetCustomersAsync();
        }

        public async Task<IResultApi> onLogin(ILoginCustomer model)
        {
            return await _customersRepository.onLogin(model);
        }

        public async Task<Customer> findByIdAsync(int customerId)
        {
            return await _customersRepository.findByIdAsync(customerId);
        }

        public async Task<IResultApi> CreateCustomerAsync(Customer model)
        {
            return await _customersRepository.CreateCustomerAsync(model);
        }

        public async Task<IResultApi> UpdateCustomerAsync(Customer model)
        {
            return await _customersRepository.UpdateCustomerAsync(model);
        }

        public async Task<IResultApi> DeleteCustomer(int customerId)
        {
            return await _customersRepository.DeleteCustomer(customerId);
        }
    }
}
