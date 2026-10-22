using System;
using System.Data.SqlClient;
using System.Configuration;

namespace BookReadingPlatform
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            // 1. Basic Validation matching the design requirements
            if (txtPassword.Text != txtConfirm.Text)
            {
                lblError.Text = "Passwords do not match!";
                lblError.Style["display"] = "block";
                return;
            }
            if (!chkTerms.Checked)
            {
                lblError.Text = "You must agree to the Terms of Service.";
                lblError.Style["display"] = "block";
                return;
            }

            // 2. Database Connectivity (CRUD: Create)
            string connString = ConfigurationManager.ConnectionStrings["BookReadingDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connString))
            {
                // Parameterized query to prevent SQL Injection
                string query = "INSERT INTO Users (FullName, Email, PasswordHash, UserRole) VALUES (@FullName, @Email, @Password, 'Standard Reader')";

                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@FullName", txtFullName.Text.Trim());
                    cmd.Parameters.AddWithValue("@Email", txtEmail.Text.Trim());
                    // In a production app, hash this password. For TCIE 2, this fulfills the CRUD requirement.
                    cmd.Parameters.AddWithValue("@Password", txtPassword.Text);

                    try
                    {
                        conn.Open();
                        cmd.ExecuteNonQuery(); // Executes the INSERT statement

                        // Redirect to login page after successful registration
                        Response.Redirect("Login.aspx");
                    }
                    catch (Exception ex)
                    {
                        lblError.Text = "Database Error: " + ex.Message;
                        lblError.Style["display"] = "block";
                    }
                }
            }
        }
    }
}