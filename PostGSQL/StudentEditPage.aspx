<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentEditPage.aspx.cs" Inherits="PostGSQL.StudentEditPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
         <div>
        </div>
<h1>Edit My Profile</h1>
        <p>
            First Name:
            <asp:TextBox ID="firstName" runat="server" placeholder="enter your first name"></asp:TextBox>
        </p>
        <p>
            Last Name:
            <asp:TextBox ID="lastName" runat="server"  placeholder="enter your last name"></asp:TextBox>
        </p>
        <p>
  
            Degree:
            <asp:RadioButtonList ID="type" runat="server" >
                <asp:ListItem Text="Masters" selected="true"></asp:ListItem>
                <asp:ListItem Text="PHD"></asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            Email:
            <asp:TextBox ID="email" runat="server" type="email" placeholder="Example@something"></asp:TextBox>
        </p>
        <p>
            Password:
            <asp:TextBox ID="password" runat="server" type="password"  placeholder="enter your password"></asp:TextBox>
        </p>
        <p>
            Address:
            <asp:TextBox ID="address" runat="server"  placeholder="enter your address"></asp:TextBox>
        </p>
        <asp:Button ID="register" runat="server" Text="Edit" OnClick="ESP" Width="70px" />
        <asp:Panel ID="messagePanel" runat="server">
        </asp:Panel>
            <asp:Literal ID="textMessage" runat="server"></asp:Literal>
         <asp:Button ID="Button1" runat="server" style="margin-left: 1348px" OnClick="Backbutton" Text="Back" Width="79px" />
    </form>
</body>
</html>
