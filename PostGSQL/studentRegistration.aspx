<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentRegistration.aspx.cs" Inherits="PostGSQL.studentRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
    <p>
        Student Registration:</p>
        <p>
            First Name:
            <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
        </p>
        <p>
            Last Name:
            <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
        </p>
        <p>
            GUCian:
            <asp:RadioButtonList ID="gucselect" runat="server">
                <asp:ListItem Value="1">Yes</asp:ListItem>
                <asp:ListItem Value="0">No</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            Degree:
            <asp:RadioButtonList ID="type" runat="server">
                <asp:ListItem Text="Masters"></asp:ListItem>
                <asp:ListItem Text="PHD"></asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            Email:
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
        </p>
        <p>
            Password:
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
        </p>
        <p>
            Faculty:
            <asp:TextBox ID="faculty" runat="server"></asp:TextBox>
        </p>
        <p>
            Address:
            <asp:TextBox ID="address" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="register" runat="server" Text="Register" OnClick="Register" />
    </form>
    </body>
</html>