using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Web;

namespace Project.NET
{
    public partial class profile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcol"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["UserId"] != null)
            {
                string loadedUserId = Request.QueryString["UserId"]; // Get UserId from query string
                if (!IsPostBack)
                {
                    LoadProfileData(loadedUserId);
                    CheckExisting(loadedUserId); // Check for existing image
                }

                // Hide buttons if the loaded UserId doesn't match the session UserId
                if (Session["UserId"].ToString() != loadedUserId)
                {
                    uploads.Visible = false;
                    Button1.Visible = false; // Hide Upload button
                    Button2.Visible = false; // Hide Update button
                    // Hide save button if needed
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }
        }

        // Method to load profile data from the Data table
        private void LoadProfileData(string loadedUserId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Data WHERE UserId = @UserId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@UserId", loadedUserId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    // Populate the labels with data from the database
                    NameLabel.Text = reader["Name"].ToString();
                    GenderLabel.Text = reader["Gender"].ToString();
                    UserIdLabel.Text = reader["UserId"].ToString();
                    EmailLabel.Text = reader["Email"].ToString();
                    // Add other fields as needed
                }
            }
        }

        // Method to check for existing images
        void CheckExisting(string loadedUserId)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM img WHERE UserId = @ImgId";
                SqlCommand cmd = new SqlCommand(query, con);
                cmd.Parameters.AddWithValue("@ImgId", loadedUserId);

                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    Button1.Visible = false; // Hide Upload button if image exists
                    Button2.Visible = true;  // Show Update button if image exists

                    // Load the image as previously
                    SqlConnection con1 = new SqlConnection(cs);
                    string query1 = "SELECT Image_name FROM img WHERE UserId=@UserId";
                    SqlDataAdapter sda = new SqlDataAdapter(query1, con1);
                    sda.SelectCommand.Parameters.AddWithValue("@UserId", loadedUserId);
                    DataTable table = new DataTable();
                    sda.Fill(table);

                    GridView1.DataSource = table;
                    GridView1.DataBind();
                }
            }
        }

        // Method for uploading an image
        protected void Button1_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string path = Server.MapPath("Images/");

            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string extension = Path.GetExtension(fileName);
                HttpPostedFile pf = FileUpload1.PostedFile;
                int length = pf.ContentLength;

                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (length <= 20000000)
                    {
                        FileUpload1.SaveAs(path + fileName);
                        string name = "Images/" + fileName;

                        string query = "INSERT INTO img (UserId, Image_name) VALUES (@Id, @Img)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Id", Session["UserId"]); // Use session UserId for image insert
                        cmd.Parameters.AddWithValue("@Img", name);

                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Response.Redirect("profile.aspx?UserId=" + Session["UserId"]);
                        }
                    }
                    else
                    {
                        Label1.Text = "Image file should not be greater than 20 MB";
                        Label1.ForeColor = Color.Red;
                        Label1.Visible = true;
                    }
                }
                else
                {
                    Label1.Text = "Image format is not supported!";
                    Label1.ForeColor = Color.Red;
                    Label1.Visible = true;
                }
            }
            else
            {
                Label1.Text = "Please upload an image";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;
            }
        }

        // Method for updating an image
        protected void Button2_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(cs);
            string path = Server.MapPath("Images/");

            if (FileUpload1.HasFile)
            {
                string fileName = Path.GetFileName(FileUpload1.FileName);
                string extension = Path.GetExtension(fileName);
                HttpPostedFile pf = FileUpload1.PostedFile;
                int length = pf.ContentLength;

                if (extension.ToLower() == ".jpg" || extension.ToLower() == ".png" || extension.ToLower() == ".jpeg")
                {
                    if (length <= 20000000)
                    {
                        FileUpload1.SaveAs(path + fileName);
                        string name = "Images/" + fileName;

                        string query = "UPDATE img SET Image_name = @Img WHERE UserId = @Id";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Id", Session["UserId"]); // Use session UserId for image update
                        cmd.Parameters.AddWithValue("@Img", name);

                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Response.Redirect("profile.aspx?UserId=" + Session["UserId"]);
                        }
                    }
                    else
                    {
                        Label1.Text = "Image file should not be greater than 20 MB";
                        Label1.ForeColor = Color.Red;
                        Label1.Visible = true;
                    }
                }
                else
                {
                    Label1.Text = "Image format is not supported!";
                    Label1.ForeColor = Color.Red;
                    Label1.Visible = true;
                }
            }
            else
            {
                Label1.Text = "Please upload an image";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;
            }
        }
    }
}
