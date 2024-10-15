<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FeePayment.aspx.cs" Inherits="Project.NET.FeePayment" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fee Payment Form</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
                /* Container for main content and sidebar */
        .container {
            display: flex;
            justify-content: space-between;
        }

        /* Main content styling */
        .main-content {
            flex: 70%;
            padding: 20px;
        }

        /* Sidebar styling */
        .sidebar {
            flex: 30%;
            background-color: #f4f4f4;
            padding: 20px;
            text-align: center;
        }

        /* Centering the image */
        .sidebar img {
            display: block;
            margin: 0 auto;
            width: 100%; /* Adjust the width as per your image size */
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
            color: #555;
        }
        input[type="text"], select {
            width: 98%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            background-color: #fafafa;
        }
        input[type="text"]:focus, select:focus {
            border-color: #007bff;
            outline: none;
        }
        .error-message {
            color: red;
            font-size: 14px;
            margin-bottom: 10px;
        }
        .submit-button {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px 20px;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            width: 100%;
        }
        .submit-button:hover {
            background-color: #0056b3;
        }
        .success-message {
            text-align: center;
            font-size: 16px;
            color: green;
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Main Content Section -->
        <div class="main-content">
            <form id="form1" runat="server">
                <h2>College Fee Payment</h2>

                <!-- Student Information Fields -->
                <asp:Label ID="lblStudentID" runat="server" Text="Student ID"></asp:Label>
                <asp:TextBox ID="txtStudentID" runat="server"></asp:TextBox>

                <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

                <asp:Label ID="lblProgram" runat="server" Text="Program"></asp:Label>
                <br />
                <asp:DropDownList ID="ddlProgram" runat="server">
                    <asp:ListItem Selected="True">Select Your Discipline</asp:ListItem>
                    <asp:ListItem Value="CSE">Computer Science Engineering</asp:ListItem>
                    <asp:ListItem Value="CSBS">Computer Science &amp; Business Studies</asp:ListItem>
                    <asp:ListItem Value="ECE">Electronic &amp; Communication Engineering</asp:ListItem>
                    <asp:ListItem Value="EE">Electrical Engineering</asp:ListItem>
                    <asp:ListItem Value="ME">Mechanical Engineering</asp:ListItem>
                    <asp:ListItem Value="CE">Civil Engineering</asp:ListItem>
                </asp:DropDownList>
                <br />

                <asp:Label ID="lblFeeAmount" runat="server" Text="Fee Amount"></asp:Label>
                <asp:TextBox ID="txtFeeAmount" runat="server"></asp:TextBox>

                <br />

                <asp:Button ID="btnSubmit" runat="server" Text="Submit Payment" CssClass="submit-button" OnClientClick="submitPayment(); return false;" />

                <!-- Hidden fields for storing Razorpay Order ID and Fee Amount -->
                <asp:HiddenField ID="hdnRazorpayOrderId" runat="server" />
                <asp:HiddenField ID="hdnFeeAmount" runat="server" />

                <asp:Label ID="lblMessage" runat="server" CssClass="success-message"></asp:Label>
            </form>
        </div>

        <!-- Sidebar Section -->
        <div class="sidebar">
            <img src="Images/wallet.png" id="sideimg" alt="" />
        </div>
    </div>

    
    

        <!-- Razorpay Payment Script -->
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
    <script type="text/javascript">
        function checkUserId(UserId) {
            return $.ajax({
                type: "POST",
                url: "FeePayment.aspx/DoesUserIdExist",
                data: JSON.stringify({ UserId: UserId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            });
        }

        function getPaymentOptions(feeAmount, studentId) {
            return $.ajax({
                type: "POST",
                url: "FeePayment.aspx/GetPaymentOptions",
                data: JSON.stringify({ feeAmount: feeAmount, studentId: studentId }),
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            });
        }

        function storePaymentDetails(paymentId, orderId, studentId, feeAmount, name, program) {
            return $.ajax({
                type: "POST",
                url: "FeePayment.aspx/StorePaymentDetails",
                data: JSON.stringify({
                    paymentId: paymentId,
                    orderId: orderId,
                    studentId: studentId,
                    name: name,
                    program: program,
                    feeAmount: feeAmount,
                    paymentMethod: "Razorpay"
                }),
                contentType: "application/json; charset=utf-8",
                dataType: "json"
            });
        }

        function submitPayment() {
            var UserId = document.getElementById('<%= txtStudentID.ClientID %>').value;

        // Check if User ID exists
        checkUserId(UserId).done(function (response) {
            if (!response.d) {
                alert("User ID does not exist. Please check and try again.");
                return;
            }

            var feeAmountInput = document.getElementById('<%= txtFeeAmount.ClientID %>').value;
            var feeAmount = parseFloat(feeAmountInput);

            if (isNaN(feeAmount) || feeAmount <= 0) {
                alert("Please enter a valid fee amount.");
                return;
            }

            // Fetch Razorpay payment options from the server
            getPaymentOptions(feeAmount, UserId).done(function (data) {
                var options = {
                    "key": data.d.Key,
                    "amount": data.d.Amount,
                    "currency": data.d.Currency,
                    "order_id": data.d.OrderId,
                    "name": "College Fee Payment",
                    "description": "Fee Payment for Student ID: " + UserId,
                    "handler": function (response) {
                        storePaymentDetails(response.razorpay_payment_id, data.d.OrderId, UserId, feeAmountInput, document.getElementById('<%= txtName.ClientID %>').value, document.getElementById('<%= ddlProgram.ClientID %>').value).done(function (data) {
                            // Show success message
                            document.getElementById('<%= lblMessage.ClientID %>').innerHTML = "Payment successful!";
                            
                            // Change image
                            document.getElementById("sideimg").src = "Images/hand.png";
                            
                            // Show success popup
                            alert("Payment Successful! You will be redirected to the home page in 5 seconds.");

                            // Redirect to home page after 15 seconds
                            setTimeout(function() {
                                window.location.href = 'index.aspx';  // Replace with your actual home page URL
                            }, 5000);  // 5000 ms = 5 seconds
                        }).fail(function (xhr, status, error) {
                            console.error("Error storing payment details: ", xhr.responseText);
                            document.getElementById('<%= lblMessage.ClientID %>').innerHTML = "Payment failed!";
                        });
                    },
                    "theme": {
                        "color": "#007bff"
                    }
                };

                var rzp1 = new Razorpay(options);
                rzp1.open();
            }).fail(function (xhr, status, error) {
                console.error("Error fetching payment options: ", error);
            });
        }).fail(function (xhr, status, error) {
            console.error("Error checking user ID: ", error);
            alert("An error occurred while checking the user ID. Please try again later.");
        });
        }
    </script>






</body>
</html>
