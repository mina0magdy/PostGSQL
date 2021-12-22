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
            GUCian (If GUCian: type &#39;1&#39;, If NonGUCian: type &#39;0&#39;):
            <asp:TextBox ID="gucian" runat="server"></asp:TextBox>
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
