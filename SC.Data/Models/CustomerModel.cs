using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SC.Data.Models {
	[Table("Customers")]
	public class CustomerModel {
		[Key]
		[Column("CustomerID")]
		public virtual int ID { get; set; }

		[Required]
		public virtual string Name { get; set; }
	}
}
