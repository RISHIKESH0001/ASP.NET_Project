<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="signup.aspx.cs" Inherits="Project.NET.signup" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Sign Up</title>
    <style type="text/css">
        .form-container {
            text-align: center;
            border-radius: 6%;
            padding: 10px;
            background: rgba(0, 0, 0, 0.348);
            backdrop-filter: blur(10px);
            color: white;
        }
        .form-field {
            text-align: left;
            width: 210px;
        }
        body {
            background-image: url("Images/signup-bg.jpg");
            background-repeat: no-repeat;
            background-size: cover;
            height: 100vh;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2 class="form-container">SIGN UP / REGISTER</h2>
            <table align="center" cellpadding="5" cellspacing="10" class="form-container">
                <tr>
                    <td class="form-field">NAME:</td>
                    <td class="form-field">
                        <asp:TextBox ID="NameText" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="NameText" ErrorMessage="Enter your name" ForeColor="Red">*</asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="form-field">GENDER:</td>
                    <td class="form-field">
                        <asp:RadioButton ID="Male" runat="server" GroupName="gender" Text="Male" />
                        <asp:RadioButton ID="Female" runat="server" GroupName="gender" Text="Female" />
                        <asp:RadioButton ID="Others" runat="server" GroupName="gender" Text="Others" />
                        <asp:CustomValidator ID="CustomValidator1" runat="server" ErrorMessage="Select a gender" ForeColor="Red" OnServerValidate="CustomValidator1_ServerValidate" />
                    </td>
                </tr>
                <tr>
                    <td class="form-field">AGE:</td>
                    <td class="form-field">
                        <asp:TextBox ID="Age" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="Age" ErrorMessage="Enter your age" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="Age" ErrorMessage="Invalid age" ForeColor="Red" MaximumValue="120" MinimumValue="0" Type="Integer" />
                    </td>
                </tr>
                <tr>
                    <td class="form-field">PHONE NO.:</td>
                    <td class="form-field">
                        <asp:TextBox ID="PhoneNo" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PhoneNo" ErrorMessage="Enter your contact no." ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="PhoneNo" ErrorMessage="Invalid phone number" ForeColor="Red" ValidationExpression="^\d{10}$" />
                    </td>
                </tr>
                <tr>
                    <td class="form-field">EMAIL ADDRESS:</td>
                    <td class="form-field">
                        <asp:TextBox ID="EmailText" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="EmailText" ErrorMessage="Enter your email" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="EmailText" ErrorMessage="Invalid email format" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$" />
                    </td>
                </tr>
                <tr>
                    <td class="form-field">DEPARTMENT:</td>
                    <td class="form-field">
                        <asp:DropDownList ID="Department" runat="server">
                            <asp:ListItem Selected="True">Select one</asp:ListItem>
                            <asp:ListItem Value="CSE">Computer Science Engineering</asp:ListItem>
                            <asp:ListItem Value="CSBS">Computer Science & Business Studies</asp:ListItem>
                            <asp:ListItem Value="ECE">Electronics & Communication Engineering</asp:ListItem>
                            <asp:ListItem Value="EE">Electrical Engineering</asp:ListItem>
                            <asp:ListItem Value="ME">Mechanical Engineering</asp:ListItem>
                            <asp:ListItem Value="CE">Civil Engineering</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="Department" ErrorMessage="Select a department" ForeColor="Red" InitialValue="" />
                    </td>
                </tr>
                <tr>
                    <td class="form-field">USER ID:</td>
                    <td class="form-field">
                        <asp:TextBox ID="UserText" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="UserText" ErrorMessage="Enter User ID" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server" ControlToValidate="UserText" ErrorMessage="Invalid User ID" ForeColor="Red" ValidationExpression="^[a-zA-Z\s]+$" />
                    </td>
                </tr>
                <tr>
                    <td class="form-field">ROLE:</td>
                    <td class="form-field">
                        <asp:DropDownList ID="Role" runat="server">
                            <asp:ListItem>Student</asp:ListItem>
                            <asp:ListItem>Faculty</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Role" ErrorMessage="Select a role" ForeColor="Red" InitialValue="" />
                    </td>
                </tr>
                <tr>
                    <td class="form-field">PASSWORD:</td>
                    <td class="form-field">
                        <asp:TextBox ID="PassWordText" runat="server" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="PassWordText" ErrorMessage="Enter a strong password" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="PassWordText" ErrorMessage="Invalid password format" ForeColor="Red" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%&*])[A-Za-z\d@#$%&*]{8,}$" />
                    </td>
                </tr>
                <tr>
                    <td class="form-field">CONFIRM PASSWORD:</td>
                    <td class="form-field">
                        <asp:TextBox ID="ConfirmPassWordText" runat="server" TextMode="Password" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="ConfirmPassWordText" ErrorMessage="Confirm your password" ForeColor="Red">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="PassWordText" ControlToValidate="ConfirmPassWordText" ErrorMessage="Passwords do not match" ForeColor="Red" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="Sign_Up" runat="server" Text="Sign Up" OnClick="Sign_Up_Click" BackColor="Gold" BorderColor="Black" BorderWidth="4px" Height="47px" Width="111px" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
