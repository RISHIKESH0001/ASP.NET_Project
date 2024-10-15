using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.NET
{
    public partial class signup : System.Web.UI.Page
    {
        private readonly string connectionString = ConfigurationManager.ConnectionStrings["dbcol"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            // Check if at least one gender option is selected
            args.IsValid = Male.Checked || Female.Checked || Others.Checked;
        }

        protected void Sign_Up_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
            {
                return; // Validation failed
            }

            string gender = Male.Checked ? "Male" : Female.Checked ? "Female" : "Others";

            using (SqlConnection con = new SqlConnection(connectionString))
            {
                string query = "INSERT INTO Data (Name, Age, Email, Role, Department, UserId, Password, Phone, Gender) VALUES (@Name, @Age, @Email, @Role, @Department, @UserId, @Password, @Phone, @Gender)";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", NameText.Text);
                    cmd.Parameters.AddWithValue("@Age", Convert.ToInt32(Age.Text));
                    cmd.Parameters.AddWithValue("@Email", EmailText.Text);
                    cmd.Parameters.AddWithValue("@Role", Role.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Department", Department.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@UserId", UserText.Text);
                    cmd.Parameters.AddWithValue("@Password", PassWordText.Text);
                    cmd.Parameters.AddWithValue("@Phone", PhoneNo.Text);
                    cmd.Parameters.AddWithValue("@Gender", gender);

                    con.Open();
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        Response.Redirect("login.aspx?signup=10");
                    }
                }
            }
        }

    }
}
