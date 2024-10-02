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
    public interface ICustomerService
    {
        Task<IEnumerable<Customer>> GetCustomersAsync();
        Task<Customer> findByIdAsync(int customerId);
        Task<IResultApi> CreateCustomerAsync(Customer model);
        Task<IResultApi> onLogin(ILoginCustomer model);
        Task<IResultApi> UpdateCustomerAsync(Customer model);
        Task<IResultApi> DeleteCustomer(int customerId);
    }
}
