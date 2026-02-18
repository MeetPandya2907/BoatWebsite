using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace BoatWebsite
{
    public partial class Cart : System.Web.UI.Page
    {
        public int cartItemCount = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Redirect to login if not logged in
            if (Session["UserID"] == null)
            {
                Response.Redirect("Login.aspx?returnUrl=Cart.aspx");
                return;
            }

            if (!IsPostBack)
            {
                LoadCart();
                LoadSuggestions();
            }
        }

        private void LoadCart()
        {
            int userId = int.Parse(Session["UserID"].ToString());
            string connStr = ConfigurationManager.ConnectionStrings["BoatWebsiteDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string query = @"
                    SELECT c.CartID, c.ProductID, c.Quantity,
                           p.ProductName, p.Price, p.OldPrice, p.ImageURL, p.Stock
                    FROM Cart c
                    INNER JOIN Products p ON c.ProductID = p.ProductID
                    WHERE c.UserID = @UserID
                    ORDER BY c.AddedDate DESC";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserID", userId);
                    DataTable dt = new DataTable();
                    dt.Load(cmd.ExecuteReader());

                    cartItemCount = dt.Rows.Count;

                    if (dt.Rows.Count == 0)
                    {
                        pnlEmpty.Visible = true;
                        pnlCart.Visible = false;
                        return;
                    }

                    pnlEmpty.Visible = false;
                    pnlCart.Visible = true;

                    // Bind repeater
                    rptCart.DataSource = dt;
                    rptCart.DataBind();

                    // Calculate totals
                    decimal subtotal = 0, originalTotal = 0;
                    int totalItems = 0;

                    foreach (DataRow row in dt.Rows)
                    {
                        decimal price = Convert.ToDecimal(row["Price"]);
                        decimal old = Convert.ToDecimal(row["OldPrice"]);
                        int qty = Convert.ToInt32(row["Quantity"]);
                        subtotal += price * qty;
                        originalTotal += old * qty;
                        totalItems += qty;
                    }

                    decimal discount = originalTotal - subtotal;
                    decimal delivery = subtotal >= 499 ? 0 : 49;
                    decimal total = subtotal + delivery;

                    litItemCount.Text = totalItems.ToString();
                    litSubtotal.Text = originalTotal.ToString("N0");
                    litDiscount.Text = discount.ToString("N0");
                    litDelivery.Text = delivery == 0 ? "<span style='color:#22c55e;font-weight:700;'>FREE</span>" : "₹49";
                    litTotal.Text = total.ToString("N0");
                    litSavings.Text = discount.ToString("N0");
                }
            }
        }

        private void LoadSuggestions()
        {
            string connStr = ConfigurationManager.ConnectionStrings["BoatWebsiteDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();
                string q = "SELECT TOP 6 ProductID, ProductName, Price, OldPrice, ImageURL, Discount FROM Products WHERE IsActive=1 AND IsFeatured=1 ORDER BY NEWID()";
                using (SqlCommand cmd = new SqlCommand(q, conn))
                {
                    DataTable dt = new DataTable();
                    dt.Load(cmd.ExecuteReader());
                    rptSuggest.DataSource = dt;
                    rptSuggest.DataBind();
                }
            }
        }

        protected void rptCart_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            int cartId = int.Parse(e.CommandArgument.ToString());
            string connStr = ConfigurationManager.ConnectionStrings["BoatWebsiteDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                conn.Open();

                if (e.CommandName == "Remove")
                {
                    string q = "DELETE FROM Cart WHERE CartID = @CartID";
                    using (SqlCommand cmd = new SqlCommand(q, conn))
                    {
                        cmd.Parameters.AddWithValue("@CartID", cartId);
                        cmd.ExecuteNonQuery();
                    }
                }
                else if (e.CommandName == "IncQty")
                {
                    string q = "UPDATE Cart SET Quantity = Quantity + 1 WHERE CartID = @CartID AND Quantity < 10";
                    using (SqlCommand cmd = new SqlCommand(q, conn))
                    {
                        cmd.Parameters.AddWithValue("@CartID", cartId);
                        cmd.ExecuteNonQuery();
                    }
                }
                else if (e.CommandName == "DecQty")
                {
                    // If qty becomes 0, remove the item
                    string checkQ = "SELECT Quantity FROM Cart WHERE CartID = @CartID";
                    int qty = 1;
                    using (SqlCommand checkCmd = new SqlCommand(checkQ, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@CartID", cartId);
                        qty = (int)checkCmd.ExecuteScalar();
                    }

                    if (qty <= 1)
                    {
                        string del = "DELETE FROM Cart WHERE CartID = @CartID";
                        using (SqlCommand cmd = new SqlCommand(del, conn))
                        {
                            cmd.Parameters.AddWithValue("@CartID", cartId);
                            cmd.ExecuteNonQuery();
                        }
                    }
                    else
                    {
                        string upd = "UPDATE Cart SET Quantity = Quantity - 1 WHERE CartID = @CartID";
                        using (SqlCommand cmd = new SqlCommand(upd, conn))
                        {
                            cmd.Parameters.AddWithValue("@CartID", cartId);
                            cmd.ExecuteNonQuery();
                        }
                    }
                }
            }

            // Reload cart after any change
            LoadCart();
        }

        protected void btnCheckout_Click(object sender, EventArgs e)
        {
            // For now redirect to a thank you or checkout page
            // In Step 3 we'll build full checkout
            Response.Redirect("Checkout.aspx");
        }
    }
}