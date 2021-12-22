<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examinerRegistration.aspx.cs" Inherits="PostGSQL.examinerRegistration" %>

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
            Examiner Registration
        </p>
        <p>
            Name:
            <asp:TextBox ID="name" runat="server"></asp:TextBox>
        </p>
        <p>
        National (If yes: type &#39;1&#39;, If no: type &#39;0&#39;): 
        <asp:TextBox ID="national" runat="server"></asp:TextBox>
        </p>
        <p>
        Field of Work: 
        <asp:TextBox ID="fieldOfWork" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="register" runat="server" Text="Register" OnClick="Register" />
    </form>
    </body>
</html>
