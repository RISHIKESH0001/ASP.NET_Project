﻿using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI.WebControls;

namespace Project.NET
{
    public partial class dashboard : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcol"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Prevent browser caching
            Response.Cache.SetExpires(DateTime.UtcNow.AddMinutes(-1));
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Cache.SetNoStore();

            // Check if the session is valid
            if (Session["UserId"] != null && Session["Role"] != null)
            {
                string userRole = Session["Role"].ToString(); // "admin" or "user"

                if (userRole.Equals("Student", StringComparison.OrdinalIgnoreCase))
                {
                    BindGridViewForRole(Session["UserId"].ToString());
                    Admission.Visible = false;
                    Students.Visible = false;
                    Faculties.Visible = false;
                    Administration.Visible = false;
                }
                else if (userRole.Equals("Faculty", StringComparison.OrdinalIgnoreCase))
                {
                    BindGridViewForRole(Session["UserId"].ToString());
                    Admission.Visible = false;
                    Fee_Payment.Visible = false;
                    Faculties.Visible = false;
                    Students.Visible = false;
                    Administration.Visible = false;
                    Result.PostBackUrl = "Sheetupload.aspx";

                }
                else if (userRole.Equals("Admin", StringComparison.OrdinalIgnoreCase))
                {
                    BindGridViewForRole(Session["UserId"].ToString());
                    Fee_Payment.PostBackUrl = "Payment_Data.aspx";
                    Result.PostBackUrl = "result_selection.aspx";
                }
                else if (userRole.Equals("Administration", StringComparison.OrdinalIgnoreCase))
                {
                    BindGridViewForRole(Session["UserId"].ToString());
                    Result.PostBackUrl = "result_selection.aspx";
                    Fee_Payment.PostBackUrl = "Payment_Data.aspx";
                    GridView1.AutoGenerateDeleteButton = false;
                    GridView1.AutoGenerateEditButton = false;
                }
            }
            else
            {
                // If no valid session, redirect to login
                Response.Redirect("login.aspx");
            }
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            // After updating the row, trigger a postback action here

            // Perform your post-update logic
            // e.g., display a confirmation message, log an event, or redirect to another page

            // Example: Redirect to the same page to refresh the data
            Response.Redirect(Request.Url.AbsoluteUri); // This will cause a full postback to refresh the page
        }

        // Method to bind GridView for Student and Faculty
        private void BindGridViewForRole(string userId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Data WHERE UserId = @UserId";
                SqlDataAdapter sql = new SqlDataAdapter(query, con);
                sql.SelectCommand.Parameters.AddWithValue("@UserId", userId);
                DataTable table = new DataTable();
                sql.Fill(table);

                // Loop through each row and mask the Password column
                foreach (DataRow row in table.Rows)
                {
                    if (table.Columns.Contains("Password"))
                    {
                        row["Password"] = "****"; // Mask the password field
                    }
                }

                GridView1.DataSourceID = null; // Break the connection with SqlDataSource1
                GridView1.DataSource = table;
                GridView1.AutoGenerateEditButton = false;
                GridView1.AutoGenerateDeleteButton = false;
                GridView1.DataBind();
            }
        }

        // Event handler for deleting rows
        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int id = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("DELETE FROM Data WHERE Id = @Id", con);
                cmd.Parameters.AddWithValue("@Id", id);
                con.Open();
                cmd.ExecuteNonQuery();
                con.Close();
            }

            // Rebind the GridView to reflect the changes
            BindGridViewForRole(Session["UserId"].ToString());
        }

        protected void Log_Out_Click(object sender, EventArgs e)
        {
            // Clear all session data
            Session.Clear();
            Session.Abandon();

            // Remove session cookie
            if (Request.Cookies[Session.SessionID] != null)
            {
                HttpCookie myCookie = new HttpCookie(Session.SessionID);
                myCookie.Expires = DateTime.Now.AddDays(-1); // Set expiration date in the past
                Response.Cookies.Add(myCookie);
            }

            // Redirect to login page
            Response.Redirect("index.aspx");
        }
    }
}
