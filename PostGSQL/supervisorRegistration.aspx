<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supervisorRegistration.aspx.cs" Inherits="PostGSQL.supervisorRegistration" %>

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
            Supervisor Registration</p>
        <p>
            First name:
            <asp:TextBox ID="firstName" runat="server"></asp:TextBox>
        </p>
        <p>
            Last Name:
            <asp:TextBox ID="lastName" runat="server"></asp:TextBox>
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
            <asp:TextBox ID="address" runat="server" style="margin-bottom: 0px"></asp:TextBox>
        </p>

        <asp:Button ID="register" runat="server" OnClick="Register" Text="Register" />

    </form>
    </body>
</html>