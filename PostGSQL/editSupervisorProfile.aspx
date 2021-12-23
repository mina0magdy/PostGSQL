<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editSupervisorProfile.aspx.cs" Inherits="PostGSQL.editSupervisorProfile" %>

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
            Name:
            <asp:TextBox ID="Name" runat="server" required ="true"></asp:TextBox>
        </p>
        <p>
            Faculty:
            <asp:TextBox ID="Faculty" runat="server" required ="true"></asp:TextBox>
        </p>
        <asp:Button ID="saveSupervisorEdit" runat="server" Text="Save Changes" OnClick="saveSupervisorEdit_Click" />
    </form>
</body>
</html>
