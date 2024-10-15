using System;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web;

namespace Project.NET
{
    public partial class Sheetupload : System.Web.UI.Page
    {
        // Connection string for your database
        string connectionString = "Data Source=(LocalDB)\\MSSQLLocalDB;AttachDbFilename=C:\\Users\\rishi\\source\\repos\\Project.NET\\Project.NET\\App_Data\\Database1.mdf;Integrated Security=True";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Ensure only faculty can access this page
            if (Session["Role"] == null || Session["Role"].ToString() != "Faculty")
            {
                Response.Redirect("login.aspx");
            }
        }

        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUploadCSV.HasFile && FileUploadCSV.PostedFile.ContentType == "text/csv")
            {
                string department = Session["Department"].ToString(); // Assuming session stores faculty department
                string uploadFolderPath = Server.MapPath("~/Uploads/");
                string fileName = Path.GetFileName(FileUploadCSV.FileName);
                string filePath = Path.Combine(uploadFolderPath, fileName);

                try
                {
                    // Create uploads folder if not exists
                    if (!Directory.Exists(uploadFolderPath))
                    {
                        Directory.CreateDirectory(uploadFolderPath);
                    }

                    // Delete previous CSV file for the same department
                    DeletePreviousFileForDepartment(department, uploadFolderPath);

                    // Save new CSV file
                    FileUploadCSV.SaveAs(filePath);

                    // Process CSV and dynamically update table structure
                    DataTable csvData = ReadCSVFile(filePath);
                    UpdateTableStructure(csvData, department);

                    // Show success message
                    Response.Write("<script>alert('File uploaded and processed successfully.');</script>");
                }
                catch (Exception ex)
                {
                    Response.Write($"<script>alert('Error: {ex.Message}');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Please upload a valid CSV file.');</script>");
            }
        }

        private void DeletePreviousFileForDepartment(string department, string uploadFolderPath)
        {
            // Search for any CSV file uploaded by the same department and delete it
            DirectoryInfo directory = new DirectoryInfo(uploadFolderPath);
            foreach (FileInfo file in directory.GetFiles("*.csv"))
            {
                // Check if the file name or metadata contains the department info, delete if matched
                if (file.Name.Contains(department))
                {
                    file.Delete();
                }
            }
        }

        private DataTable ReadCSVFile(string filePath)
        {
            DataTable dt = new DataTable();
            using (StreamReader sr = new StreamReader(filePath))
            {
                string[] headers = sr.ReadLine().Split(',');
                foreach (string header in headers)
                {
                    dt.Columns.Add(header.Trim());
                }

                while (!sr.EndOfStream)
                {
                    string[] rows = sr.ReadLine().Split(',');
                    DataRow dr = dt.NewRow();
                    for (int i = 0; i < headers.Length; i++)
                    {
                        dr[i] = rows[i].Trim();
                    }
                    dt.Rows.Add(dr);
                }
            }
            return dt;
        }

        private void UpdateTableStructure(DataTable csvData, string department)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                // Step 1: Drop the old table for this department if it exists
                string dropTableQuery = $"IF OBJECT_ID('dbo.Result_{department}', 'U') IS NOT NULL DROP TABLE dbo.Result_{department};";
                SqlCommand dropCmd = new SqlCommand(dropTableQuery, conn);
                dropCmd.ExecuteNonQuery();

                // Step 2: Dynamically create a new table with the CSV columns
                string createTableQuery = $"CREATE TABLE dbo.Result_{department} (Id INT IDENTITY(1, 1) PRIMARY KEY, CreatedAt DATETIME DEFAULT GETDATE(),";
                foreach (DataColumn column in csvData.Columns)
                {
                    if (column.ColumnName != "Id" && column.ColumnName != "CreatedAt")
                    {
                        createTableQuery += $"[{column.ColumnName}] NVARCHAR(MAX),";
                    }
                }
                createTableQuery = createTableQuery.TrimEnd(',') + ");";
                SqlCommand createCmd = new SqlCommand(createTableQuery, conn);
                createCmd.ExecuteNonQuery();

                // Step 3: Insert CSV data into the new table
                foreach (DataRow row in csvData.Rows)
                {
                    string insertQuery = $"INSERT INTO dbo.Result_{department} (";
                    foreach (DataColumn column in csvData.Columns)
                    {
                        if (column.ColumnName != "Id" && column.ColumnName != "CreatedAt")
                        {
                            insertQuery += $"[{column.ColumnName}],";
                        }
                    }
                    insertQuery = insertQuery.TrimEnd(',') + ") VALUES (";
                    foreach (DataColumn column in csvData.Columns)
                    {
                        if (column.ColumnName != "Id" && column.ColumnName != "CreatedAt")
                        {
                            insertQuery += $"'{row[column].ToString().Replace("'", "''")}',";
                        }
                    }
                    insertQuery = insertQuery.TrimEnd(',') + ");";
                    SqlCommand insertCmd = new SqlCommand(insertQuery, conn);
                    insertCmd.ExecuteNonQuery();
                }
            }
        }
    }
}
