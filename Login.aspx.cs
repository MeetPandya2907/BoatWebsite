using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace BoatWebsite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["UserEmail"] != null)
                {
                    Response.Redirect("Default.aspx");
                }
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                string email = txtEmail.Text.Trim();
                string password = txtPassword.Text;
                string hashedPassword = HashPassword(password);

                string connectionString = ConfigurationManager.ConnectionStrings["BoatWebsiteDB"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "SELECT UserID, FullName, Email FROM Users WHERE Email = @Email AND Password = @Password";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);

                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                // Login successful
                                Session["UserID"] = reader["UserID"].ToString();
                                Session["UserEmail"] = reader["Email"].ToString();
                                Session["FullName"] = reader["FullName"].ToString();

                                if (chkRememberMe.Checked)
                                {
                                    Response.Cookies["UserEmail"].Value = email;
                                    Response.Cookies["UserEmail"].Expires = DateTime.Now.AddDays(30);
                                }

                                Response.Redirect("Default.aspx");
                            }
                            else
                            {
                                lblError.Text = "Invalid email or password.";
                                lblError.Visible = true;
                            }
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Login error. Please try again.";
                lblError.Visible = true;
            }
        }

        private string HashPassword(string password)
        {
            using (SHA256 sha256 = SHA256.Create())
            {
                byte[] bytes = sha256.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                return builder.ToString();
            }
        }
    }
}