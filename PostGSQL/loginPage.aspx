<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loginPage.aspx.cs" Inherits="PostGSQL.loginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
        Username:<br />
        <asp:TextBox ID="Email" runat="server" required="true" placeholder="enter your email"></asp:TextBox>
        <p>
            Password:</p>
        <p>
            <asp:TextBox ID="Password" runat="server" type="password" required="true" placeholder="enter your password"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Login" runat="server" OnClick="LoginButton" Text="Login" />
        </p>
        <asp:HyperLink ID="studentRegistration" href ="studentRegistration.aspx" runat="server">Register as a student</asp:HyperLink>
        <p>
            <asp:HyperLink ID="supervisorRegistration" href ="supervisorRegistration.aspx" runat="server">Register as a supervisor</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="examinerRegistration" href ="examinerRegistration.aspx" runat="server">Register as an examiner</asp:HyperLink>
        </p>
    </form>
</body>
</html>
