﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="issuePayment.aspx.cs" Inherits="PostGSQL.issuePayment" %>

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
            Thesis Serial Number:
            <asp:TextBox ID="ThesisSSN" runat="server" required ="true"></asp:TextBox>
        </p>
        <p>
            Amount:
            <asp:TextBox ID="Amount" runat="server" required ="true"></asp:TextBox>
        </p>
        <p>
            Number of Installments:
            <asp:TextBox ID="noOfInstallmets" runat="server" required ="true"></asp:TextBox>
        </p>
        <p>
            Fund Percentage:
            <asp:TextBox ID="fundPercentage" runat="server" required ="true"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="issuePaymentThesis" runat="server" Text="Issue Payment" OnClick="issuePayment_Click" />
        </p>
    </form>
</body>
</html>