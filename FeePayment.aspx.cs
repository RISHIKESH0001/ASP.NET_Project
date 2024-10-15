using Razorpay.Api;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Services;

namespace Project.NET
{
    public partial class FeePayment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string studentId = txtStudentID.Text;
            string name = txtName.Text;
            string program = ddlProgram.SelectedItem.Value;
            string feeAmount = txtFeeAmount.Text;

            bool userExists = DoesUserIdExist(studentId);
            if (!userExists)
            {
                lblMessage.Text = "User ID does not exist. Please check and try again.";
                return;
            }

            // Generate Razorpay Order
            try
            {
                var client = new RazorpayClient("rzp_test_CxdxEw0DRnnWc2", "TQNxtvIiLwEyDin5mYZYWcKK");
                Dictionary<string, object> options = new Dictionary<string, object>
            {
                { "amount", Convert.ToInt32(feeAmount) * 100 },  // Convert feeAmount to paise
                { "currency", "INR" },
                { "receipt", "rcpt_" + studentId },
                { "payment_capture", 1 }  // Auto capture payment
            };

                Order order = client.Order.Create(options);

                // Store Razorpay order ID and fee amount in hidden fields
                hdnRazorpayOrderId.Value = order["id"].ToString();
                hdnFeeAmount.Value = feeAmount;

                // Pass this to client-side
                ClientScript.RegisterStartupScript(this.GetType(), "razorpay", "submitPayment();", true);
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Error creating order: " + ex.Message;
            }
        }

        [WebMethod]
        public static bool DoesUserIdExist(string UserId)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbcol"].ConnectionString;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "SELECT COUNT(*) FROM Data WHERE UserId = @UserId";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@UserId", UserId);

                    conn.Open();
                    int count = (int)cmd.ExecuteScalar();

                    return count > 0;
                }
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                return false;
            }
        }


        [WebMethod]
        public static string StorePaymentDetails(string paymentId, string orderId, string studentId, string name, string program, string feeAmount, string paymentMethod)
        {
            string connectionString = ConfigurationManager.ConnectionStrings["dbcol"].ConnectionString;
            try
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    string query = "INSERT INTO Payments (PaymentID, OrderID, StudentID, Name, Program, FeeAmount, PaymentMethod, PaymentDate) " +
                                   "VALUES (@PaymentID, @OrderID, @StudentID, @Name, @Program, @FeeAmount, @PaymentMethod, GETDATE())";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@PaymentID", paymentId);
                    cmd.Parameters.AddWithValue("@OrderID", orderId);
                    cmd.Parameters.AddWithValue("@StudentID", studentId);
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Program", program);
                    cmd.Parameters.AddWithValue("@FeeAmount", feeAmount);
                    cmd.Parameters.AddWithValue("@PaymentMethod", paymentMethod);

                    conn.Open();
                    cmd.ExecuteNonQuery();
                }
                return "Payment stored successfully!";
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine("Error: " + ex.Message);
                return "Error storing payment: " + ex.Message;
            }
        }

        [WebMethod]
        public static RazorpayOptions GetPaymentOptions(decimal feeAmount, string studentId)
        {
            // Generate Razorpay order server-side
            var client = new RazorpayClient("rzp_test_CxdxEw0DRnnWc2", "TQNxtvIiLwEyDin5mYZYWcKK");
            Dictionary<string, object> options = new Dictionary<string, object>
        {
            { "amount", feeAmount * 100 },  // Convert to paise
            { "currency", "INR" },
            { "receipt", "rcpt_" + studentId },
            { "payment_capture", 1 }  // Auto capture
        };

            Order order = client.Order.Create(options);

            // Return Razorpay options to client-side
            return new RazorpayOptions
            {
                Key = "rzp_test_CxdxEw0DRnnWc2",
                OrderId = order["id"].ToString(),
                Amount = feeAmount * 100,
                Currency = "INR"
            };
        }

        public class RazorpayOptions
        {
            public string Key { get; set; }
            public string OrderId { get; set; }
            public decimal Amount { get; set; }
            public string Currency { get; set; }
        }
    }
}