<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile_selection.aspx.cs" Inherits="Project.NET.profile_selection" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>PROFILE SELECTION</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-image: url(Images/ps.jpg);
            background-repeat: repeat;
            background-size: 100%;
            margin: 0;
            padding: 0;
            color: #333;
        }

        form {
            max-width: 700px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #3498db;
            font-size: 28px;
            text-align: center;
            margin-bottom: 30px;
        }

        label {
            display: block;
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 10px;
            color: #555;
        }

        select, input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            font-size: 16px;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        input[type="submit"] {
            background-color: #3498db;
            color: white;
            border: none;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Select a Profile</h1>
            <asp:DropDownList ID="ProfileDropdownList" runat="server"></asp:DropDownList>
            <asp:Button ID="ViewProfileButton" runat="server" Text="View Profile" OnClick="ViewProfileButton_Click" />
        </div>
    </form>
</body>
</html>
