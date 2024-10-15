using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Project.NET
{
    public partial class admission : Page
    {
        string cs = ConfigurationManager.ConnectionStrings["dbcol"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = MALE.Checked || FEMALE.Checked || OTHERS.Checked;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid) return; // Check if the page is valid

            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "INSERT INTO Admission (Name, Age, Gender, Email, Phone, Discipline, HighestQualification, Course, Address) VALUES (@Name, @Age, @Gender, @Email, @Phone, @Discipline, @HighestQualification, @Course, @Address)";
                string gender = MALE.Checked ? "Male" : FEMALE.Checked ? "Female" : "Others";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name.Text);
                    cmd.Parameters.AddWithValue("@Age", age.Text);
                    cmd.Parameters.AddWithValue("@Gender", gender);
                    cmd.Parameters.AddWithValue("@Email", email.Text);
                    cmd.Parameters.AddWithValue("@Phone", phone.Text);
                    cmd.Parameters.AddWithValue("@Discipline", stream.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@HighestQualification", qualification.Text);
                    cmd.Parameters.AddWithValue("@Course", Courses.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@Address", address.Text);

                    con.Open();
                    int result = cmd.ExecuteNonQuery();
                    con.Close();

                    if (result > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "PopupAndRedirect", "showPopupAndRedirect();", true);
                    }
                }
            }
        }
    }
}
