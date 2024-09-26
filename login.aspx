<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Project.NET.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style type="text/css">
        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .auto-style1 {
            background: linear-gradient(45deg, rgb(127, 131, 116, 20), transparent);
            width: 90%;
            max-width: 500px;
            margin: 50px auto;
            border: 2px ridge #333;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }

        .auto-style2, .auto-style3 {
            width: 100%;
            font-weight: bold;
            color: #333;
            display: block;
            margin-bottom: 10px;
        }

        td {
            padding: 10px;
            display: block;
            width: 100%;
        }

        input[type="checkbox"] {
            margin-right: 6px;
        }

        a {
            text-decoration: none;
            color: #6015ba;
        }

        body {
            background-image: url("Images/login-bg.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            font-family: Arial, sans-serif;
        }

        input, button, .aspnet-form {
            width: 100%;
            max-width: 100%;
        }

        @media (min-width: 600px) {
            td {
                display: table-cell;
                width: auto;
            }

            .auto-style2, .auto-style3 {
                display: table-cell;
            }
        }

        .auto-style4 {
            width: 50%;
            font-weight: bold;
            color: #333;
            display: table-cell;
            margin-bottom: 10px;
        }

        .auto-style5 {
            width: 50%;
        }

        .auto-style6 {
            width: 4%;
        }
    </style>

    <script type="text/javascript">
        function ShowLogoutPopup() {
            alert("Please log out first before proceeding.");
            setTimeout(function () {
                window.location.href = 'dashboard.aspx';
            }, 100);
        }
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <h2>LOG IN FORM</h2>
        <table cellpadding="3" cellspacing="3" class="auto-style1">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">
                    <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">USER ID:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="UserText" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="UserText" Display="Dynamic" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="UserText" Display="Dynamic" ErrorMessage="Invalid" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">PASSWORD:</td>
                <td class="auto-style5">
                    <asp:TextBox ID="PassWordText" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <input onchange="document.getElementById('PassWordText').type=this.checked ? 'text' : 'password'" type="checkbox" class="auto-style6" /> Show Password
                </td>
                <td class="auto-style5">
                    <asp:Button ID="Button1" runat="server" BackColor="#00CC00" BorderColor="#006600" BorderStyle="Solid" BorderWidth="3px" ForeColor="White" OnClick="Button1_Click" Text="LOG IN" />
                </td>
            </tr>
            <tr>
                <td class="auto-style5">
                    <asp:Button ID="ForgotPasswordButton" runat="server" Text="Forgot Password?" OnClick="ForgotPassword_Click" ForeColor="White" BackColor="#FF4500" />
                </td>
                <td class="auto-style5"><a href="signup.aspx">New User !! Sign Up Here </a></td>
            </tr>
            </table>
    </form>
</body>
</html>
