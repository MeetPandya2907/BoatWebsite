using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace BoatWebsite
{
    public partial class Default : System.Web.UI.Page
    {
        // Public property so ASPX can use it
        public int cartCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Handle logout
            if (Request.QueryString["logout"] == "1")
            {
                Session.Clear();
                Session.Abandon();
                Response.Redirect("Default.aspx");
                return;
            }

            // Get cart count
            if (Session["UserID"] != null)
            {
                cartCount = GetCartCount(int.Parse(Session["UserID"].ToString()));
            }

            if (!IsPostBack)
            {
                LoadFeaturedProducts();
                LoadBestsellers();
                LoadNewArrivals();
            }
        }

        private void LoadFeaturedProducts()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["BoatWebsiteDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    // Featured = Sale Is Live section
                    string q = @"SELECT TOP 6 ProductID, ProductName, Price, OldPrice, 
                                        ImageURL, Rating, ReviewCount, Discount, IsBestseller
                                 FROM Products 
                                 WHERE IsActive=1 AND IsFeatured=1 
                                 ORDER BY Discount DESC";
                    using (SqlCommand cmd = new SqlCommand(q, conn))
                    {
                        DataTable dt = new DataTable();
                        dt.Load(cmd.ExecuteReader());
                        rptFeatured.DataSource = dt;
                        rptFeatured.DataBind();
                    }
                }
            }
            catch { /* handle DB errors silently */ }
        }

        private void LoadBestsellers()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["BoatWebsiteDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    string q = @"SELECT TOP 6 ProductID, ProductName, Price, OldPrice,
                                        ImageURL, Rating, ReviewCount, Discount
                                 FROM Products 
                                 WHERE IsActive=1 AND IsBestseller=1 
                                 ORDER BY ReviewCount DESC";
                    using (SqlCommand cmd = new SqlCommand(q, conn))
                    {
                        DataTable dt = new DataTable();
                        dt.Load(cmd.ExecuteReader());
                        rptBestsellers.DataSource = dt;
                        rptBestsellers.DataBind();
                    }
                }
            }
            catch { }
        }

        private void LoadNewArrivals()
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["BoatWebsiteDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    string q = @"SELECT TOP 6 ProductID, ProductName, Price, OldPrice,
                                        ImageURL, Rating, Discount, IsNewLaunch
                                 FROM Products 
                                 WHERE IsActive=1 
                                 ORDER BY CreatedDate DESC";
                    using (SqlCommand cmd = new SqlCommand(q, conn))
                    {
                        DataTable dt = new DataTable();
                        dt.Load(cmd.ExecuteReader());
                        rptNewArrivals.DataSource = dt;
                        rptNewArrivals.DataBind();
                    }
                }
            }
            catch { }
        }

        // Helper to build star string — accessible from ASPX
        public string GetStars(decimal rating)
        {
            int full = (int)Math.Floor(rating);
            int empty = 5 - full;
            return new string('★', full) + new string('☆', empty);
        }

        public string GetReviewCount(int count)
        {
            return count >= 1000 ? (count / 1000.0).ToString("F1") + "K" : count.ToString();
        }

        private int GetCartCount(int userId)
        {
            try
            {
                string connStr = ConfigurationManager.ConnectionStrings["BoatWebsiteDB"].ConnectionString;
                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();
                    string q = "SELECT ISNULL(SUM(Quantity),0) FROM Cart WHERE UserID=@uid";
                    using (SqlCommand cmd = new SqlCommand(q, conn))
                    {
                        cmd.Parameters.AddWithValue("@uid", userId);
                        return (int)cmd.ExecuteScalar();
                    }
                }
            }
            catch { return 0; }
        }

        protected void btnShopNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}