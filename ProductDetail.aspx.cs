using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace BoatWebsite
{
    public partial class ProductDetail : System.Web.UI.Page
    {
        // Public property so ASPX can access it
        public int cartCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Load cart count for badge
            if (Session["UserID"] != null)
            {
                cartCount = GetCartCount(int.Parse(Session["UserID"].ToString()));
            }

            if (!IsPostBack)
            {
                // Get product ID from query string
                int productId = 0;
                if (Request.QueryString["id"] == null || !int.TryParse(Request.QueryString["id"], out productId))
                {
                    ShowError();
                    return;
                }
                LoadProduct(productId);
            }
        }

        private void LoadProduct(int productId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["BoatWebsiteDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                // Load product details
                string query = @"
                    SELECT p.*, c.CategoryName 
                    FROM Products p
                    LEFT JOIN Categories c ON p.CategoryID = c.CategoryID
                    WHERE p.ProductID = @ProductID AND p.IsActive = 1";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@ProductID", productId);
                    using (SqlDataReader r = cmd.ExecuteReader())
                    {
                        if (!r.Read()) { ShowError(); return; }

                        // Set page title
                        pageTitle.InnerText = r["ProductName"].ToString() + " - boAt";

                        // Breadcrumb
                        litCategory.Text = r["CategoryName"].ToString();
                        litProductName.Text = r["ProductName"].ToString();

                        // Images (use same image for thumbs - in real app you'd have multiple)
                        string imgUrl = r["ImageURL"].ToString();
                        imgMain.ImageUrl = imgUrl;
                        imgThumb1.ImageUrl = imgUrl;
                        imgThumb2.ImageUrl = imgUrl;
                        imgThumb3.ImageUrl = imgUrl;

                        // Discount badge
                        int discount = Convert.ToInt32(r["Discount"]);
                        if (discount > 0)
                        {
                            lblDiscount.Text = discount + "% Off";
                            lblDiscount.Visible = true;
                        }

                        // New launch badge
                        bool isNew = Convert.ToBoolean(r["IsNewLaunch"]);
                        lblNewBadge.Visible = isNew;

                        // Title
                        litTitle.Text = r["ProductName"].ToString();

                        // Rating stars
                        decimal rating = Convert.ToDecimal(r["Rating"]);
                        litStars.Text = GetStars(rating);
                        litRating.Text = rating.ToString("F1");
                        int reviews = Convert.ToInt32(r["ReviewCount"]);
                        litReviews.Text = reviews > 1000
                            ? (reviews / 1000.0).ToString("F1") + "K"
                            : reviews.ToString();
                        litRevScore.Text = "<span class='big-score'>" + rating.ToString("F1") + "</span><br/>out of 5";

                        // Price
                        decimal price = Convert.ToDecimal(r["Price"]);
                        decimal oldPrice = Convert.ToDecimal(r["OldPrice"]);
                        litPrice.Text = "₹" + price.ToString("N0");
                        litOldPrice.Text = oldPrice > 0 ? "₹" + oldPrice.ToString("N0") : "";
                        decimal saved = oldPrice - price;
                        litSave.Text = saved > 0 ? "Save ₹" + saved.ToString("N0") : "";

                        // Description
                        string desc = r["Description"].ToString();
                        litDesc.Text = desc;
                        litDescFull.Text = desc;

                        // Stock
                        int stock = Convert.ToInt32(r["Stock"]);
                        if (stock < 10)
                        {
                            lblStock.Text = "⚠ Only " + stock + " left in stock!";
                            lblStock.CssClass = "pd-stock-low";
                        }

                        // Store product ID in ViewState for button clicks
                        ViewState["ProductID"] = productId;
                    }
                }

                // Load related products (same category, excluding current)
                string relQuery = @"
                    SELECT TOP 6 ProductID, ProductName, Price, OldPrice, ImageURL, Rating, Discount
                    FROM Products 
                    WHERE CategoryID = (SELECT CategoryID FROM Products WHERE ProductID = @pid)
                    AND ProductID != @pid AND IsActive = 1";

                using (SqlCommand cmd2 = new SqlCommand(relQuery, conn))
                {
                    cmd2.Parameters.AddWithValue("@pid", productId);
                    DataTable dt = new DataTable();
                    dt.Load(cmd2.ExecuteReader());
                    rptRelated.DataSource = dt;
                    rptRelated.DataBind();
                }
            }

            pnlProduct.Visible = true;
            pnlError.Visible = false;
        }

        // Called from Repeater ItemTemplate
        public string GetStars(decimal rating)
        {
            int full = (int)Math.Floor(rating);
            int half = (rating - full) >= 0.5m ? 1 : 0;
            int empty = 5 - full - half;
            return new string('★', full) + (half == 1 ? "½" : "") + new string('☆', empty);
        }

        protected void btnAddToCart_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=" + Request.Url.PathAndQuery);
                return;
            }

            int userId = int.Parse(Session["UserID"].ToString());
            int productId = (int)ViewState["ProductID"];
            int qty = int.Parse(txtQty.Text);

            AddToCart(userId, productId, qty);
            cartCount = GetCartCount(userId);

            lblCartMsg.Text = "✓ Added to cart successfully!";
            lblCartMsg.CssClass = "cart-msg success";
            lblCartMsg.Visible = true;
        }

        protected void btnBuyNow_Click(object sender, EventArgs e)
        {
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            int userId = int.Parse(Session["UserID"].ToString());
            int productId = (int)ViewState["ProductID"];
            int qty = int.Parse(txtQty.Text);
            AddToCart(userId, productId, qty);
            Response.Redirect("Cart.aspx");
        }

        private void AddToCart(int userId, int productId, int qty)
        {
            string connStr = ConfigurationManager.ConnectionStrings["BoatWebsiteDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                // Check if already in cart → update qty
                string check = "SELECT CartID FROM Cart WHERE UserID=@uid AND ProductID=@pid";
                using (SqlCommand cmd = new SqlCommand(check, conn))
                {
                    cmd.Parameters.AddWithValue("@uid", userId);
                    cmd.Parameters.AddWithValue("@pid", productId);
                    object existing = cmd.ExecuteScalar();

                    if (existing != null)
                    {
                        // Update quantity
                        string upd = "UPDATE Cart SET Quantity = Quantity + @qty WHERE CartID = @cid";
                        using (SqlCommand updCmd = new SqlCommand(upd, conn))
                        {
                            updCmd.Parameters.AddWithValue("@qty", qty);
                            updCmd.Parameters.AddWithValue("@cid", existing);
                            updCmd.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        // Insert new
                        string ins = "INSERT INTO Cart (UserID, ProductID, Quantity) VALUES (@uid, @pid, @qty)";
                        using (SqlCommand insCmd = new SqlCommand(ins, conn))
                        {
                            insCmd.Parameters.AddWithValue("@uid", userId);
                            insCmd.Parameters.AddWithValue("@pid", productId);
                            insCmd.Parameters.AddWithValue("@qty", qty);
                            insCmd.ExecuteNonQuery();
                        }
                    }
                }
            }
        }

        private int GetCartCount(int userId)
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

        private void ShowError()
        {
            pnlError.Visible = true;
            pnlProduct.Visible = false;
        }
    }
}