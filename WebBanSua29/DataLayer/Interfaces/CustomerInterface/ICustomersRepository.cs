using DataLayer.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.CustomerInterface
{
    public interface ICustomersRepository
    {
        Task<IEnumerable<Customer>> GetCustomersAsync();
        Task<Customer> findByIdAsync(int customerId);
        Task<IResultApi> CreateCustomerAsync(Customer model);
        Task<IResultApi> onLogin(ILoginCustomer model);
        Task<IResultApi> UpdateCustomerAsync(Customer model);
        Task<IResultApi> DeleteCustomer(int customerId);
    }
}
