using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Net.Mail;
using System.Web.UI.WebControls;

namespace Project.NET
{
    public partial class login : System.Web.UI.Page
    {
        private string cs = ConfigurationManager.ConnectionStrings["dbcol"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            // Handle query string parameters to show messages
            HandleQueryStringMessages();
        }

        private void HandleQueryStringMessages()
        {
            try
            {
                string error = Request.QueryString["error"];
                string signup = Request.QueryString["signup"];

                if (!string.IsNullOrEmpty(error))
                {
                    ShowMessage("Invalid User Name or Password", Color.Red, Color.LightYellow);
                }
                else if (!string.IsNullOrEmpty(signup))
                {
                    ShowMessage("You have successfully signed up!!", Color.Green, Color.LightCyan);
                }
            }
            catch (Exception ex)
            {
                // Log error and display a user-friendly message
                Label1.Text = "An error occurred while processing your request.";
                Label1.ForeColor = Color.Red;
                Label1.CssClass = "error-message";
            }
        }

        private void ShowMessage(string message, Color textColor, Color backColor)
        {
            Label1.Text = message;
            Label1.ForeColor = textColor;
            Label1.Font.Bold = true;
            Label1.Font.Size = FontUnit.Larger;
            Label1.BackColor = backColor;
            Label1.BorderStyle = BorderStyle.Solid;
            Label1.BorderColor = textColor;
            Label1.BorderWidth = Unit.Pixel(2);
            Label1.CssClass = textColor == Color.Red ? "error-message" : "success-message";
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            // Basic validation for input fields
            if (string.IsNullOrEmpty(UserText.Text) || string.IsNullOrEmpty(PassWordText.Text))
            {
                ShowMessage("Please enter both username and password.", Color.Red, Color.LightYellow);
                return;
            }

            // Check session validity before proceeding
            if (Session["UserId"] != null)
            {
                // Inform user that they need to log out first
                ClientScript.RegisterStartupScript(this.GetType(), "alert", "ShowLogoutPopup();", true);
                return;
            }

            // Authenticate user
            AuthenticateUser();
        }

        private void AuthenticateUser()
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string query = "SELECT * FROM Data WHERE UserId=@UserId AND Password=@Password";
                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@UserId", UserText.Text);
                    cmd.Parameters.AddWithValue("@Password", PassWordText.Text);

                    con.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            reader.Read(); // Read the first row

                            // Store session data
                            Session["UserId"] = UserText.Text;
                            Session["Password"] = PassWordText.Text;
                            Session["Phone"] = reader["Phone"].ToString();
                            Session["Role"] = reader["Role"].ToString();
                            Session["Gender"] = reader["Gender"].ToString();
                            Session["Name"] = reader["Name"].ToString();
                            Session["Email"] = reader["Email"].ToString();
                            Session["Id"] = reader["Id"].ToString();
                            Session["Department"] = reader["Department"].ToString();

                            // Redirect to dashboard
                            Response.Redirect("dashboard.aspx");
                        }
                        else
                        {
                            // Invalid credentials
                            Response.Redirect("login.aspx?error=100");
                        }
                    }
                }
            }
        }

        // Forgot Password Functionality
        protected void ForgotPassword_Click(object sender, EventArgs e)
        {
            string userId = UserText.Text.Trim();

            if (string.IsNullOrEmpty(userId))
            {
                ShowMessage("Please enter your User ID to reset the password.", Color.Red, Color.LightYellow);
                return;
            }

            // Retrieve email and password from the database
            string query = "SELECT Email, Password FROM Data WHERE UserId = @UserId";
            string email = string.Empty;
            string password = string.Empty;

            using (SqlConnection conn = new SqlConnection(cs))
            {
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    conn.Open();
                    using (SqlDataReader reader = cmd.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            email = reader["Email"].ToString();
                            password = reader["Password"].ToString();
                        }
                        else
                        {
                            ShowMessage("User ID not found.", Color.Red, Color.LightYellow);
                            return;
                        }
                    }
                }
            }

            // Send password to the user's email
            try
            {
                SendPasswordByEmail(email, password);
                ShowMessage("Password has been sent to your email address.", Color.Green, Color.LightCyan);
            }
            catch (Exception ex)
            {
                ShowMessage("Error sending email. Please try again.", Color.Red, Color.LightYellow);
            }
        }

        private void SendPasswordByEmail(string email, string password)
        {
            try
            {
                using (MailMessage mail = new MailMessage())
                using (SmtpClient smtpServer = new SmtpClient("smtp.gmail.com", 587))
                {
                    mail.From = new MailAddress("rkgrylls@gmail.com");
                    mail.To.Add(email);
                    mail.Subject = "Password Recovery";
                    mail.Body = "Your password is: " + password;

                    // Use your Gmail app password here
                    smtpServer.Credentials = new System.Net.NetworkCredential("rkgrylls@gmail.com", "sfqw zhhd bdid ejyq");
                    smtpServer.EnableSsl = true;

                    // Send the email
                    smtpServer.Send(mail);

                    // Log for successful sending
                    Console.WriteLine($"Email sent to {email} at {DateTime.Now}");
                }
            }
            catch (SmtpException smtpEx)
            {
                // Log SMTP-specific error messages with detailed stack trace
                ShowMessage("SMTP Error: " + smtpEx.ToString(), Color.Red, Color.LightYellow);
            }
            catch (Exception ex)
            {
                // Log general error messages with detailed stack trace
                ShowMessage("Error sending email: " + ex.ToString(), Color.Red, Color.LightYellow);
            }
        }


    }
}
