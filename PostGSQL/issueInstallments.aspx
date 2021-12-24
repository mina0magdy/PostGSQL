<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="issueInstallments.aspx.cs" Inherits="PostGSQL.issueInstallments" %>

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
            Payment ID:
            <asp:TextBox ID="paymentID" runat="server"></asp:TextBox>
        </p>
        <p>
            Installments Start Date:
            <asp:TextBox ID="startDate" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="issueInstallmentsP" runat="server" Text="Issue Installments" OnClick="issueInstallmentsP_Click" />
        </p>
    </form>
</body>
</html>
