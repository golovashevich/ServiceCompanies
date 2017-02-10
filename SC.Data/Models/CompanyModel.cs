using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace SC.Data.Models {
	[Table("Companies")]
	public class CompanyModel {
		[Key]
		[Column("CompanyID")]
		public virtual int ID { get; set; }

		[Required]
		public virtual string Name { get; set; }
	}
}		    
