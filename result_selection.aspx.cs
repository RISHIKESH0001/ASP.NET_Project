using System;
using System.Web.UI;

namespace Project.NET
{
    public partial class result_selection : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // You can add any additional checks here if needed (e.g., check if the user is logged in)
        }

        // Event handler for the ViewResult button click
        protected void ViewResultButton_Click(object sender, EventArgs e)
        {
            // Get the selected value from the DropDownList
            string selectedDepartment = ResultDropdownList.SelectedValue;

            // Check if a valid department is selected
            if (!string.IsNullOrEmpty(selectedDepartment) && selectedDepartment != "Select One")
            {
                // Store the selected department in the session
                Session["Department"] = selectedDepartment;

                // Redirect the user to the Result page
                Response.Redirect("Result.aspx");
            }
            else
            {
                // If no department is selected, show an alert
                Response.Write("<script>alert('Please select a valid department.');</script>");
            }
        }
    }
}
