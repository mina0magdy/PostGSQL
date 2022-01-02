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
        <h1>Hello Admin</h1>
            <asp:HyperLink ID="listSupervisors" href ="listSupervisors.aspx" runat="server">List all supervisors</asp:HyperLink>
        <p>
            <asp:HyperLink ID="listTheses" href ="listTheses.aspx" runat="server">List All Theses</asp:HyperLink>
        </p>
        <asp:HyperLink ID="issuePayment" href ="issuePayment.aspx" runat="server">Issue payment for a thesis</asp:HyperLink>
        <p>
            <asp:HyperLink ID="issueInstallments" href ="issueInstallments.aspx" runat="server">Issue Installments for a thesis</asp:HyperLink>
        </p>
        <p>
            Update the number of extensions for a thesis:</p>
        <p>
            Thesis serial number:
            <asp:TextBox ID="thesisSSn" runat="server" required ="true" type ="number"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="updateExt" runat="server" Text="Update" OnClick="updateExt_Click" />
        </p>
    </form>
</body>
</html>
