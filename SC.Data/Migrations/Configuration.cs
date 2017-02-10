namespace SC.Data.Migrations {
	using System.Data.Entity.Migrations;
	using Models;

	internal sealed class Configuration : DbMigrationsConfiguration<SC.Data.SCContext> {
		public Configuration() {
			AutomaticMigrationsEnabled = false;
		}

		protected override void Seed(SC.Data.SCContext context) {

			var foogle = new CompanyModel { Name = "Foogle", ID = 10 };
			var foosoft = new CompanyModel { Name = "Foosoft", ID = 20 };
			var foodonalds = new CompanyModel { Name = "Foodonalds", ID = 30 };

			var search = new ServiceModel { Name = "Search", ID = 1, CompanyID = foogle.ID };
			var storage = new ServiceModel { Name = "Storage", ID = 2, CompanyID = foogle.ID };

			var ad = new ServiceModel { Name = "Ad", ID = 3, CompanyID = foosoft.ID };

			var food = new ServiceModel { Name = "Food", ID = 4, CompanyID = foodonalds.ID };

			var andrew = new CustomerModel { Name = "Andrew Peters", ID = 100 };
			var ivan = new CustomerModel { Name = "Ivan Peters", ID = 150 };
			var brice = new CustomerModel { Name = "Brice Lambson", ID = 200 };
			var rowan = new CustomerModel { Name = "Rowan Miller", ID = 300 };

			// Dictionaries
			context.Companies.AddOrUpdate(c => c.Name, foogle, foosoft, foodonalds);
			context.Services.AddOrUpdate(s => s.Name, search, ad, storage, food);
			context.Customers.AddOrUpdate(c => c.Name, andrew, ivan, brice, rowan, 
					new CustomerModel { Name = "Lonely Heart", ID = 400 });

			// Customer services
			context.CustomerServices.AddOrUpdate(cs => new { cs.CustomerID, cs.ServiceID },
					new CustomerServiceModel { CustomerID = andrew.ID, ServiceID = food.ID },
					new CustomerServiceModel { CustomerID = andrew.ID, ServiceID = search.ID },
					new CustomerServiceModel { CustomerID = andrew.ID, ServiceID = storage.ID },

					new CustomerServiceModel { CustomerID = ivan.ID, ServiceID = food.ID },
					new CustomerServiceModel { CustomerID = ivan.ID, ServiceID = search.ID },
					new CustomerServiceModel { CustomerID = ivan.ID, ServiceID = storage.ID },

					new CustomerServiceModel { CustomerID = brice.ID, ServiceID = food.ID },
					new CustomerServiceModel { CustomerID = brice.ID, ServiceID = storage.ID },

					new CustomerServiceModel { CustomerID = rowan.ID, ServiceID = food.ID });
		}
	}
}
