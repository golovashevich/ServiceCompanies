using System.Data.Entity;
using SC.Data.Models;

namespace SC.Data.Interfaces {
	public interface ISCContext {
		IDbSet<CompanyModel> Companies { get; set; }
		IDbSet<ServiceModel> Services { get; set; }
		IDbSet<CustomerModel> Customers { get; set; }
		IDbSet<CustomerServiceModel> CustomerServices { get; set; }
	}
}
