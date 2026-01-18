using System;

namespace BoatWebsite
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Page load logic
        }

        //protected void btnSearch_Click(object sender, EventArgs e)
        //{
        //    string search = txtSearch.Text;
        //    Response.Redirect("Products.aspx?search=" + search);
        //}

        protected void btnShopNow_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }

        protected void btnViewAll_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }
    }
}