<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admission.aspx.cs" Inherits="Project.NET.admission" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADMISSION FORM</title>
    <style type="text/css">
        h1 {
            text-align: center;
        }

        .form-container {
            backdrop-filter: blur(10px);
            width: 600px;
            margin: 50px auto;
            border: 2px ridge #333;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            background-color:transparent;
        }

        td {
            padding: 10px;
        }

        body {
            padding: 0;
            margin: 0;
            height: 100%;
            color: black;
            background-image:url(Images/admission-bg.jpg);
            background-repeat:no-repeat;
            background-size:100% 100%;
        }
        .auto-style1 {
            text-align: center;
        }
    </style>
    <script type="text/javascript">
        function showPopupAndRedirect() {
            alert("Admission Form Submission - Successful");
            window.location.href = "index.aspx";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <h1>ADMISSION FORM</h1>
        <table cellpadding="3" cellspacing="3" class="form-container">
            <tr>
                <td>Name:</td>
                <td>
                    <asp:TextBox ID="name" runat="server" BackColor="White"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="Name is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="name" Display="Dynamic" ErrorMessage="Invalid name format." ForeColor="Red" ValidationExpression="^[A-Za-z]+([ '-][A-Za-z]+)*$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Age:</td>
                <td>
                    <asp:TextBox ID="age" runat="server" BackColor="White"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="age" Display="Dynamic" ErrorMessage="Age is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="age" Display="Dynamic" ErrorMessage="Age must be between 16 and 60." ForeColor="Red" MaximumValue="60" MinimumValue="16" Type="Integer"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td>Gender:</td>
                <td>
                    <asp:RadioButton ID="MALE" runat="server" GroupName="Gender" Text="Male" />
                    <asp:RadioButton ID="FEMALE" runat="server" GroupName="Gender" Text="Female" />
                    <asp:RadioButton ID="OTHERS" runat="server" GroupName="Gender" Text="Others" />
                    <asp:CustomValidator ID="CustomValidator2" runat="server" Display="Dynamic" ErrorMessage="Please select a gender." ForeColor="Red" OnServerValidate="CustomValidator2_ServerValidate"></asp:CustomValidator>
                </td>
            </tr>
            <tr>
                <td>Email:</td>
                <td>
                    <asp:TextBox ID="email" runat="server" BackColor="White"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="Email is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="email" Display="Dynamic" ErrorMessage="Invalid email format." ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Phone:</td>
                <td>
                    <asp:TextBox ID="phone" runat="server" BackColor="White"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="phone" Display="Dynamic" ErrorMessage="Phone number is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="phone" Display="Dynamic" ErrorMessage="Invalid phone number." ForeColor="Red" ValidationExpression="^[6-9]\d{9}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Discipline:</td>
                <td>
                    <asp:DropDownList ID="stream" runat="server" BackColor="White">
                        <asp:ListItem>Science</asp:ListItem>
                        <asp:ListItem>Arts</asp:ListItem>
                        <asp:ListItem>Commerce</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="stream" Display="Dynamic" ErrorMessage="Discipline is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Highest Qualification:</td>
                <td>
                    <asp:TextBox ID="qualification" runat="server" BackColor="White"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="qualification" Display="Dynamic" ErrorMessage="Qualification is required." ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="qualification" Display="Dynamic" ErrorMessage="Invalid qualification." ForeColor="Red" ValidationExpression="^[A-Za-z.]{1,60}$"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>Course:</td>
                <td>
                    <asp:DropDownList ID="Courses" runat="server" BackColor="White">
                        <asp:ListItem Selected="True">Select a course</asp:ListItem>
                        <asp:ListItem Value="CSE">Computer Science Engineering</asp:ListItem>
                        <asp:ListItem Value="CSBS">Computer Science & Business Studies</asp:ListItem>
                        <asp:ListItem Value="ECE">Electronics & Communication Engineering</asp:ListItem>
                        <asp:ListItem Value="EE">Electrical Engineering</asp:ListItem>
                        <asp:ListItem Value="ME">Mechanical Engineering</asp:ListItem>
                        <asp:ListItem Value="CE">Civil Engineering</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="Courses" Display="Dynamic" ErrorMessage="Course selection is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Address:</td>
                <td>
                    <asp:TextBox ID="address" runat="server" BackColor="White"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="address" Display="Dynamic" ErrorMessage="Address is required." ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td colspan="2" class="auto-style1">
                    <asp:Button ID="Button2" style="font-weight:bolder;" runat="server" Text="Submit" BackColor="black" BorderColor="DarkBlue" BorderStyle="Groove" BorderWidth="2px" ForeColor="white" Height="38px" Width="112px" OnClick="Button2_Click" />
                </td>
            </tr>
        </table>
        <br />
    </form>
</body>
</html>
