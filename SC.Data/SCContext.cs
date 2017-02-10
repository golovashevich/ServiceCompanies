using System.Data.Entity;
using SC.Data.Interfaces;
using SC.Data.Models;

namespace SC.Data {
	public class SCContext : DbContext, ISCContext {
		public SCContext() : base("name=scDB") {
		}

		public SCContext(bool MultipleActiveResultSets = false) {
		}

		public IDbSet<CompanyModel> Companies { get; set; }
		public IDbSet<ServiceModel> Services { get; set; }
		public IDbSet<CustomerModel> Customers { get; set; }
		public IDbSet<CustomerServiceModel> CustomerServices { get; set; }
	}
}
