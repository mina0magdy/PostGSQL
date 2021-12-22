<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examinerRegistration.aspx.cs" Inherits="PostGSQL.examinerRegistration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <p>
            Examiner Registration
        </p>
        <p>
            Name:</p>
        <p>
            &nbsp;<asp:TextBox ID="name" runat="server" required="true" placeholder="enter your name"></asp:TextBox>
        </p>
        <p>
            Email:</p>
        <p>
            <asp:TextBox ID="Email" runat="server" required="true" type="email" placeholder="Example@something"></asp:TextBox>
        </p>
        <p>
            Password:</p>
        <p>
            <asp:TextBox ID="Password" runat="server" required="true" type="password" placeholder="enter your password"></asp:TextBox>
            <asp:RadioButtonList ID="National" runat="server" Height="59px" required="true">
                <asp:ListItem value="1" Selected="true">National</asp:ListItem>
                <asp:ListItem Value="0">NotNational</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
        Field of Work:</p>
        <p>
        &nbsp;<asp:TextBox ID="fieldOfWork" runat="server" required="true" placeholder="enter your field of work"></asp:TextBox>
        </p>
        <p>
        <asp:Button ID="register" runat="server" Text="Register" OnClick="Register" />
        </p>
    </form>
    </body>
</html>
