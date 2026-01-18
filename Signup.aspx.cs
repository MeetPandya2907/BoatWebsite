using System;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;

namespace BoatWebsite
{
    public partial class Signup : System.Web.UI.Page
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

        protected void btnSignup_Click(object sender, EventArgs e)
        {
            try
            {
                if (!chkTerms.Checked)
                {
                    lblError.Text = "Please accept Terms & Conditions.";
                    lblError.Visible = true;
                    return;
                }

                string fullName = txtFullName.Text.Trim();
                string email = txtEmail.Text.Trim();
                string phone = txtPhone.Text.Trim();
                string password = txtPassword.Text;
                bool newsletter = chkNewsletter.Checked;

                string hashedPassword = HashPassword(password);
                string connectionString = ConfigurationManager.ConnectionStrings["BoatWebsiteDB"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Check if email exists
                    string checkQuery = "SELECT COUNT(*) FROM Users WHERE Email = @Email";
                    using (SqlCommand checkCmd = new SqlCommand(checkQuery, conn))
                    {
                        checkCmd.Parameters.AddWithValue("@Email", email);
                        int count = (int)checkCmd.ExecuteScalar();

                        if (count > 0)
                        {
                            lblError.Text = "Email already registered.";
                            lblError.Visible = true;
                            return;
                        }
                    }

                    // Insert new user
                    string insertQuery = @"INSERT INTO Users (FullName, Email, PhoneNumber, Password, Newsletter, CreatedDate) 
                                          VALUES (@FullName, @Email, @Phone, @Password, @Newsletter, @CreatedDate)";

                    using (SqlCommand cmd = new SqlCommand(insertQuery, conn))
                    {
                        cmd.Parameters.AddWithValue("@FullName", fullName);
                        cmd.Parameters.AddWithValue("@Email", email);
                        cmd.Parameters.AddWithValue("@Phone", phone);
                        cmd.Parameters.AddWithValue("@Password", hashedPassword);
                        cmd.Parameters.AddWithValue("@Newsletter", newsletter);
                        cmd.Parameters.AddWithValue("@CreatedDate", DateTime.Now);

                        int result = cmd.ExecuteNonQuery();

                        if (result > 0)
                        {
                            lblSuccess.Text = "Account created! Redirecting to login...";
                            lblSuccess.Visible = true;
                            lblError.Visible = false;
                            Response.AddHeader("REFRESH", "2;URL=Login.aspx");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                lblError.Text = "Registration error. Try again.";
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