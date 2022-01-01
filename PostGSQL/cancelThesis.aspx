<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="cancelThesis.aspx.cs" Inherits="PostGSQL.cancelThesis" %>

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
            <asp:TextBox ID="ThesisSN" runat="server" required ="true"></asp:TextBox>
        </p>
        <asp:Button ID="Cancel" runat="server" Text="Cancel" OnClick="cancelThesis_Click" />
    </form>
</body>
</html>
