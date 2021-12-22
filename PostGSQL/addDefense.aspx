<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addDefense.aspx.cs" Inherits="PostGSQL.addDefense" %>

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
            GUCian:</p>
        <p>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" required ="true">
                <asp:ListItem Value ="1" Selected ="True">Yes</asp:ListItem>
                <asp:ListItem Value ="0">No</asp:ListItem>
            </asp:RadioButtonList>
        </p>

        <p>
            Thesis Serial Number:
            <asp:TextBox ID="ThesisSSN" runat="server" required ="true"></asp:TextBox>
        </p>
        <p>
            Date:
            <asp:TextBox ID="dateDefense" runat="server" placeHolder ="dd/mm/yyyy" required ="true"></asp:TextBox>
        </p>
        <p>
            Host:
            <asp:TextBox ID="host" runat="server" required ="true"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="addButton" runat="server" Text="Add" OnClick="addButton_Click" />
        </p>

    </form>
</body>
</html>
