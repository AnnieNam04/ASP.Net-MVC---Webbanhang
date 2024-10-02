using DataLayer.Data;
using DataLayer.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Text;
using System.Text.Json.Nodes;
using System.Threading.Tasks;

namespace DataLayer.Interfaces.CustomerInterface
{
    public class CustomerRepository : ICustomersRepository
    {
        private readonly ApplicationDbContext _dbContext;

        private const string DataUser = "DataUser";
        public CustomerRepository(ApplicationDbContext dbContext)
        {
            _dbContext = dbContext;
        }

        public async Task<IEnumerable<Customer>> GetCustomersAsync()
        {
            var result = (from customer in _dbContext.Customers select customer).ToListAsync();
            return await result;
        }

        public async Task<IResultApi> CreateCustomerAsync(Customer model)
        {
            IResultApi result = new IResultApi();
            try
            {
                _dbContext.Customers.Add(model);
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

        public async Task<IResultApi> onLogin(ILoginCustomer model)
        {
            IResultApi result = new IResultApi();
            try
            {

                Customer customer = await _dbContext.Customers.FirstAsync(x => x.Email == model.Email && x.Password == model.Password);
                if (customer == null) {
                    result.statusCode = 401;
                    result.message = "Tài khoản hoặc mật khẩu không đúng";
                    return result;
                }
                result.statusCode = 200;
                result.message = "Đăng nhập thành công";
                result.resultData = customer;
                return result;
            }
            catch(Exception ex)
            {
                result.statusCode = 401;
                result.message = "Đăng nhập thất bại";
                return result;
            }
        }

        public async Task<IResultApi> UpdateCustomerAsync(Customer model)
        {
            IResultApi result = new IResultApi();
            try
            {
                _dbContext.Customers.Update(model);
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

        public async Task<Customer> findByIdAsync(int customerId)
        {
            return await _dbContext.Customers.FirstAsync(x => x.Id == customerId);
        }

        public async Task<IResultApi> DeleteCustomer(int customerId)
        {
            {
                IResultApi result = new IResultApi();

                result.statusCode = 400;
                result.message = "Xóa thất bại";
                try
                {
                    Customer? customer = _dbContext.Customers.Find(customerId);
                    if (customer == null) return result;
                    _dbContext.Customers.Remove(customer);
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
