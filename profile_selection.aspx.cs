using Org.BouncyCastle.Bcpg;
using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace Project.NET
{
    public partial class profile_selection : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcol"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Role"] != null)
            {
                if (Session["Role"].ToString() == "Student")
                {
                    // If the user is a student, redirect them directly to their profile
                    Response.Redirect("profile.aspx?UserId=" + Session["UserId"].ToString());
                }
                else
                {
                    if (!IsPostBack)
                    {
                        LoadProfileOptions();
                    }
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }


        private void LoadProfileOptions()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlDataAdapter sda = new SqlDataAdapter();
                string query = "";

                // Check role of the logged-in user and adjust query accordingly
                if (Session["Role"].ToString() == "Admin" || Session["Role"].ToString() == "Administration")
                {
                    // Admin and Administration can see all profiles
                    query = "SELECT UserId, Name FROM Data";
                }
                else if (Session["Role"].ToString() == "Faculty")
                {
                    // Faculty can only see profiles within the same department
                    query = "SELECT UserId, Name FROM Data WHERE Department = @Department";
                }

                if (!string.IsNullOrEmpty(query))
                {
                    SqlCommand cmd = new SqlCommand(query, con);

                    if (Session["Role"].ToString() == "Faculty")
                    {
                        cmd.Parameters.AddWithValue("@Department", Session["Department"].ToString());
                    }

                    con.Open();
                    sda.SelectCommand = cmd;
                    DataTable dt = new DataTable();
                    sda.Fill(dt);

                    ProfileDropdownList.DataSource = dt;
                    ProfileDropdownList.DataTextField = "Name";
                    ProfileDropdownList.DataValueField = "UserId";
                    ProfileDropdownList.DataBind();

                    ProfileDropdownList.Items.Insert(0, new ListItem("Select a profile", "0"));
                }
            }
        }

        protected void ViewProfileButton_Click(object sender, EventArgs e)
        {
            if (ProfileDropdownList.SelectedValue != "0")
            {
                // Redirect to the profile page, passing the selected UserId in query string
                Response.Redirect("profile.aspx?UserId=" + ProfileDropdownList.SelectedValue);
            }
        }
    }
}
