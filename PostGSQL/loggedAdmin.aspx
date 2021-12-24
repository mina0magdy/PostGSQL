<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loggedAdmin.aspx.cs" Inherits="PostGSQL.loggedAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        </div>
            <asp:HyperLink ID="listSupervisors" href ="listSupervisors.aspx" runat="server">List all supervisors</asp:HyperLink>
        <p>
            <asp:HyperLink ID="listTheses" href ="listTheses.aspx" runat="server">List All Theses</asp:HyperLink>
        </p>
        <asp:HyperLink ID="issuePayment" href ="issuePayment.aspx" runat="server">Issue payment for a thesis</asp:HyperLink>
    </form>
</body>
</html>
