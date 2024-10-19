<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Project.NET.profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Personal Details</title>
    <style type="text/css">
        
        body {
            font-family: 'Arial', sans-serif;
             background:linear-gradient(45deg, #8a3489, transparent);
             background-size:100% 120%;
             background-repeat:repeat;
            margin: 0;
            padding: 0;
            color: #333;
        }

        
        form {
            max-width: 900px;
            margin: 40px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
            position: relative;
        }

        
        h1 {
            color: #4CAF50; 
            font-size: 32px;
            margin-bottom: 20px;
            font-weight: 600;
            text-align: left;
        }

        
        h2 {
            font-size: 20px;
            font-weight: bold;
            color: #4CAF50;
            margin-bottom: 15px;
            border-bottom: 2px solid #4CAF50;
            padding-bottom: 5px;
        }

        
        .details-table {
            width: 100%;
            margin-bottom: 30px;
        }

        .details-table td {
            padding: 10px;
            font-size: 16px;
        }

        .details-table label {
            font-weight: bold;
            color: #555;
        }

       
        .upload-section {
            margin-bottom: 30px;
        }

        .upload-section label {
            font-weight: bold;
            color: #555;
            font-size: 16px;
        }

       
        #GridView1 {
            position: absolute;
            top: 20px;
            right: 20px;
            
            background-color: #fff;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            border-radius: 10px;
            padding: 10px;
        }

        
        .profile-image {
            text-align: center;
            margin-top: 30px;
        }

        .profile-image img {
            border-radius: 50%;
            height: 150px;
            width: 150px;
            box-shadow: 0px 4px 15px rgba(0, 0, 0, 0.1);
        }

        .button-container {
            text-align: right;
            margin-top: 20px;
        }

        input[type="submit"], input[type="button"], .aspNetButton {
            padding: 10px 25px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-right: 10px;
        }

        input[type="submit"]:hover, input[type="button"]:hover, .aspNetButton:hover {
            background-color: #388e3c;
        }

        
        @media (max-width: 768px) {
            form {
                padding: 15px;
            }

            h1 {
                font-size: 28px;
            }

            h2 {
                font-size: 18px;
            }

            input[type="submit"], input[type="button"], .aspNetButton {
                width: 100%;
                margin-bottom: 10px;
            }

            .button-container {
                text-align: center;
            }

            .profile-image img {
                height: 120px;
                width: 120px;
            }

            
            #GridView1 {
                position: static;
                width: 100%;
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
       
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeader="False" BorderStyle="None">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <table>
                            <tr>
                                <td>
                                    <asp:Image ID="ProfileImage" Height="150" Width="150" ImageUrl='<%# Eval("image_name") %>' runat="server" />
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>

        <h1>Personal Details</h1>

        <h2>Basic Information</h2>
        <table class="details-table">
            <tr>
                <td><label>Name:</label></td>
                <td><asp:Label ID="NameLabel" runat="server" Text="John Doe"></asp:Label></td>
            </tr>
            <tr>
                <td><label>Gender:</label></td>
                <td><asp:Label ID="GenderLabel" runat="server" Text="01 Jan 1990"></asp:Label></td>
            </tr>
            <tr>
                <td><label>User Id:</label></td>
                <td><asp:Label ID="UserIdLabel" runat="server" Text="1234 Street, City, Country"></asp:Label></td>
            </tr>
            <tr>
                <td><label>Email:</label></td>
                <td><asp:Label ID="EmailLabel" runat="server" Text="johndoe@example.com"></asp:Label></td>
            </tr>
        </table>

        <h2>Uploaded Documents</h2>
        <div class="upload-section" id="uploads" runat="server">
            <label for="FileUpload1">Upload Your Image:</label>
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
            <br />
        </div>

        

        <div class="button-container">
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="UPDATE" CssClass="aspNetButton" Visible="False" />
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="SAVE" CssClass="aspNetButton" />
            <br />
            <br />
        </div>
    </form>
</body>
</html>