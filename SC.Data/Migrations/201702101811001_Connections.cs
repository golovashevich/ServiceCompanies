namespace SC.Data.Migrations
{
    using System;
    using System.Data.Entity.Migrations;
    
    public partial class Connections : DbMigration
    {
        public override void Up()
        {
            CreateTable(
                "dbo.CustomerServices",
                c => new
                    {
                        CustomerServiceID = c.Int(nullable: false, identity: true),
                        CustomerID = c.Int(nullable: false),
                        ServiceID = c.Int(nullable: false),
                    })
                .PrimaryKey(t => t.CustomerServiceID)
                .ForeignKey("dbo.Customers", t => t.CustomerID, cascadeDelete: true)
                .ForeignKey("dbo.Services", t => t.ServiceID, cascadeDelete: true)
                .Index(t => new { t.CustomerID, t.ServiceID }, unique: true, name: "UQ_CustomerService");
            
            AddColumn("dbo.Services", "CompanyID", c => c.Int(nullable: false));
            CreateIndex("dbo.Services", "CompanyID");
            AddForeignKey("dbo.Services", "CompanyID", "dbo.Companies", "CompanyID", cascadeDelete: true);
        }
        
        public override void Down()
        {
            DropForeignKey("dbo.CustomerServices", "ServiceID", "dbo.Services");
            DropForeignKey("dbo.Services", "CompanyID", "dbo.Companies");
            DropForeignKey("dbo.CustomerServices", "CustomerID", "dbo.Customers");
            DropIndex("dbo.Services", new[] { "CompanyID" });
            DropIndex("dbo.CustomerServices", "UQ_CustomerService");
            DropColumn("dbo.Services", "CompanyID");
            DropTable("dbo.CustomerServices");
        }
    }
}
