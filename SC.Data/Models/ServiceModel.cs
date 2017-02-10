using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SC.Data.Models {
	[Table("Services")]
	public class ServiceModel {
		[Key]
		[Column("ServiceID")]
		public virtual int ID { get; set; }

		[Required]
		public virtual string Name { get; set; }

		public virtual int CompanyID { get; set; }
		public virtual CompanyModel Company { get; set; }
	}
}
