using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Project.NET
{
    public partial class details : System.Web.UI.Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcol"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            if (Session["UserId"] != null)
            {
                if (!IsPostBack)
                {
                    //Response.Write("Your Role Is : " + Session["id"].ToString() + "<br>");
                    NameText.Text = Session["Name"].ToString();
                    EmailText.Text = Session["Email"].ToString();
                    PhoneText.Text = Session["Phone"].ToString();
                    UserIdText.Text = Session["UserId"].ToString();
                    RoleText.Text = Session["Role"].ToString();
                    PasswordText.Text = Session["Password"].ToString();
                    ConfirmPasswordText.Text = Session["Password"].ToString();
                    if (Session["Gender"].ToString().Equals("Male", StringComparison.OrdinalIgnoreCase))
                    {
                        GenderDrop.Items[1].Selected = true;
                    }
                    else if (Session["Gender"].ToString().Equals("Female", StringComparison.OrdinalIgnoreCase))
                    {
                        GenderDrop.Items[2].Selected = true;
                    }
                    else if (Session["Gender"].ToString().Equals("Others", StringComparison.OrdinalIgnoreCase))
                    {
                        GenderDrop.Items[3].Selected = true;
                    }
                    else
                    {
                        GenderDrop.Items[0].Selected = true;
                    }
                }
            }
            else
            {
                Response.Redirect("login.aspx");
            }


        }

        protected void Button1_Click(object sender, EventArgs e)
        {


            SqlConnection con = new SqlConnection(cs);
            string query = "update Data set Name=@Name,Email=@Email,Phone=@Phone,Gender=@Gender,UserId=@UserId,Password=@Password where Id =@Id";
            SqlCommand cmd = new SqlCommand(query, con);
            cmd.Parameters.AddWithValue("@Name", NameText.Text);
            cmd.Parameters.AddWithValue("@Email", EmailText.Text);
            cmd.Parameters.AddWithValue("@Phone", PhoneText.Text);
            cmd.Parameters.AddWithValue("@Gender", GenderDrop.SelectedItem.Value);
            cmd.Parameters.AddWithValue("@UserId", UserIdText.Text);
            cmd.Parameters.AddWithValue("@Password", PasswordText.Text);
            cmd.Parameters.AddWithValue("@Id", Session["Id"]);

            con.Open();

            int a = cmd.ExecuteNonQuery();

            if (a > 0)
            {
                Response.Redirect("dashboard.aspx");
            }

            con.Close();






        }
    }
}