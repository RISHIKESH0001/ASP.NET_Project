using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.NET
{
    public partial class profile : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcol"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserId"] != null)
            {
                NameLabel.Text = Session["Name"].ToString();
                GenderLabel.Text = Session["Gender"].ToString();
                UserIdLabel.Text = Session["UserId"].ToString();
                EmailLabel.Text = Session["Email"].ToString();
                CheckExisting();
            }
            else
            {
                Response.Redirect("login.aspx");
            }

        }

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

                        string query = "insert into img values(@Id,@Img)";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Id", Session["Id"]);
                        cmd.Parameters.AddWithValue("@Img", name);
                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Response.Redirect("profile.aspx");
                        }
                    }
                    else
                    {
                        Label1.Text = "image file should not be greater than 20 MB";
                        Label1.ForeColor = Color.Red;
                        Label1.Visible = true;
                    }
                }
                else
                {
                    Label1.Text = "image format is not supported !! ";
                    Label1.ForeColor = Color.Red;
                    Label1.Visible = true;
                }

            }
            else
            {
                Label1.Text = "Pease Upload an image";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;
            }
        }


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

                        string query = "update img set Image_name=@Img where UserId=@Id";
                        SqlCommand cmd = new SqlCommand(query, con);
                        cmd.Parameters.AddWithValue("@Id", Session["Id"]);
                        cmd.Parameters.AddWithValue("@Img", name);
                        con.Open();
                        int a = cmd.ExecuteNonQuery();
                        if (a > 0)
                        {
                            Response.Redirect("profile.aspx");
                        }
                    }
                    else
                    {
                        Label1.Text = "image file should not be greater than 20 MB";
                        Label1.ForeColor = Color.Red;
                        Label1.Visible = true;
                    }
                }
                else
                {
                    Label1.Text = "image format is not supported !! ";
                    Label1.ForeColor = Color.Red;
                    Label1.Visible = true;
                }

            }
            else
            {
                Label1.Text = "Pease Upload an image";
                Label1.ForeColor = Color.Red;
                Label1.Visible = true;
            }
        }

        void CheckExisting()
        {
            SqlConnection con = new SqlConnection(cs);
            string query = "select * from img where UserId= @ImgId";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@ImgId", Session["Id"]);
            con.Open();
            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {

                Button1.Visible = false;
                SqlConnection con1 = new SqlConnection(cs);
                string query1 = "select Image_name from img where UserId=@UserId";
                SqlDataAdapter sda = new SqlDataAdapter(query1, con1);
                sda.SelectCommand.Parameters.AddWithValue("@UserId", Session["Id"]);
                DataTable table = new DataTable();
                sda.Fill(table);

                GridView1.DataSource = table;
                GridView1.DataBind();
                Button2.Visible = true;
            }

        }
    }
}