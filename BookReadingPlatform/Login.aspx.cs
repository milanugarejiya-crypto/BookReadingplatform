using System;
using System.Web.UI;

namespace BookReadingPlatform
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        // This triggers when the user clicks the blue Login button
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            // For now, this simply connects the layout to your Dashboard.
            // Later, we will add the SQL SELECT query here to check the actual password.
            Response.Redirect("Default.aspx");
        }
    }
}