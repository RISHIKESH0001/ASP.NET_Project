using System;
using System.Data;
using System.Data.SqlClient;

namespace Project.NET
{
    public partial class Result : System.Web.UI.Page
    {
        // Connection string for your SQL Server
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\rishi\\source\\repos\\Project.NET\\Project.NET\\App_Data\\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Check if user is a student
            if (Session["Role"] == null || Session["Role"].ToString() != "Student")
            {
                Response.Redirect("login.aspx");
            }

            if (!IsPostBack)
            {
                // Get the department of the logged-in student
                string studentDepartment = Session["Department"]?.ToString();

                if (!string.IsNullOrEmpty(studentDepartment))
                {
                    LoadCSVDataForDepartment(studentDepartment);
                }
                else
                {
                    Response.Write("<script>alert('Unable to determine your department.');</script>");
                }
            }
        }

        private void LoadCSVDataForDepartment(string department)
        {
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    // Check if the table for this department exists
                    string checkTableQuery = $"IF OBJECT_ID('dbo.Result_{department}', 'U') IS NOT NULL SELECT 1 ELSE SELECT 0;";
                    SqlCommand checkCmd = new SqlCommand(checkTableQuery, conn);
                    bool tableExists = (int)checkCmd.ExecuteScalar() == 1;

                    if (tableExists)
                    {
                        // If the table exists, fetch the data
                        string selectQuery = $"SELECT * FROM dbo.Result_{department};";
                        SqlDataAdapter da = new SqlDataAdapter(selectQuery, conn);
                        DataTable dt = new DataTable();
                        da.Fill(dt);

                        if (dt.Rows.Count > 0)
                        {
                            // Bind the data to the GridView
                            GridViewCSVData.DataSource = dt;
                            GridViewCSVData.DataBind();
                        }
                        else
                        {
                            Response.Write("<script>alert('No data available for your department.');</script>");
                        }
                    }
                    else
                    {
                        // Alert if no CSV file has been uploaded for this department
                        Response.Write("<script>alert('No CSV file has been uploaded for your department yet.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle any errors that occur during data fetching
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }
    }
}
