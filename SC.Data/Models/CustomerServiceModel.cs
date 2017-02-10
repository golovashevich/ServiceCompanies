using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SC.Data.Models {
	[Table("CustomerServices")]
	public class CustomerServiceModel {
		[Key]
		[Column("CustomerServiceID")]
		public virtual int ID { get; set; }

		[Index("UQ_CustomerService", 1, IsUnique = true)]
		public virtual int CustomerID { get; set; }
		public virtual CustomerModel Customer { get; set; }

		[Index("UQ_CustomerService", 2, IsUnique = true)]
		public virtual int ServiceID { get; set; }
		public virtual ServiceModel Service { get; set; }
	}
}
