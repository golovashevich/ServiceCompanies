using System.Data;
using System.Linq;
using System.Web.Http;
using SC.Data;
using SC.Data.Models;

namespace SC.Web.Controllers {
	[RoutePrefix("api/Customers")]
	public class CustomersController : ApiController {
		private SCContext _db = new SCContext();

		[HttpGet]
		[Route("Serviceless")]
		public IQueryable<CustomerModel> GetServicelessCustomers() {
			return from customer in _db.Customers
				   where !_db.CustomerServices.Any(cs => cs.CustomerID == customer.ID)
				   select customer;
		}

		[HttpGet]
		[Route("NotOfService")]
		public IQueryable<CustomerModel> GetNotServiceCustomers(int serviceID) {
			return from customer in _db.Customers
				   where !(from customerService in _db.CustomerServices
						   where customerService.ServiceID == serviceID
						   select customerService.CustomerID).Contains(customer.ID)
				   select customer;
		}


		protected override void Dispose(bool disposing) {
			if (disposing) {
				_db.Dispose();
			}
			base.Dispose(disposing);
		}
	}
}