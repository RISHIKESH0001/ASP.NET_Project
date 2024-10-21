<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admission_data.aspx.cs" Inherits="Project.NET.admission_data" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ADMISSION DATA</title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }
        body {
            background: linear-gradient(45deg, transparent, #000000);
            background-size: 100% 100%;
            background-repeat: no-repeat;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="auto-style1">
                <br />
                <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" 
                    BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource1" 
                    ForeColor="Black" GridLines="Horizontal" DataKeyNames="Id">
                    <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
                    <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
                    <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F7F7F7" />
                    <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                    <SortedDescendingCellStyle BackColor="#E5E5E5" />
                    <SortedDescendingHeaderStyle BackColor="#242121" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dbcol %>" 
                    DeleteCommand="DELETE FROM [Admission] WHERE [Id] = @Id" 
                    InsertCommand="INSERT INTO [Admission] ([Name], [Age], [Gender], [Email], [Phone], [Discipline], 
                    [HighestQualification], [Course], [Address]) VALUES (@Name, @Age, @Gender, @Email, @Phone, 
                    @Discipline, @HighestQualification, @Course, @Address)" 
                    SelectCommand="SELECT * FROM [Admission]" 
                    UpdateCommand="UPDATE [Admission] SET [Name] = @Name, [Age] = @Age, [Gender] = @Gender, 
                    [Email] = @Email, [Phone] = @Phone, [Discipline] = @Discipline, [HighestQualification] = @HighestQualification, 
                    [Course] = @Course, [Address] = @Address WHERE [Id] = @Id">
                    <DeleteParameters>
                        <asp:Parameter Name="Id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Age" Type="Int32" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Discipline" Type="String" />
                        <asp:Parameter Name="HighestQualification" Type="String" />
                        <asp:Parameter Name="Course" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Name" Type="String" />
                        <asp:Parameter Name="Age" Type="Int32" />
                        <asp:Parameter Name="Gender" Type="String" />
                        <asp:Parameter Name="Email" Type="String" />
                        <asp:Parameter Name="Phone" Type="String" />
                        <asp:Parameter Name="Discipline" Type="String" />
                        <asp:Parameter Name="HighestQualification" Type="String" />
                        <asp:Parameter Name="Course" Type="String" />
                        <asp:Parameter Name="Address" Type="String" />
                        <asp:Parameter Name="Id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
        </div>
    </form>
</body>
</html>
