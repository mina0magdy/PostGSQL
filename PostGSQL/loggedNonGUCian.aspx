<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loggedNonGUCian.aspx.cs" Inherits="PostGSQL.loggedNonGUCian" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
             <asp:TextBox ID="mobile" runat="server" style="margin-left: 1280px; margin-bottom: 0px;" Width="154px"></asp:TextBox>
        <asp:Button ID="addMob" runat="server" OnClick="Mobile" style="margin-left: 1277px; margin-bottom: 2px;" Text="Add Mobile Number" />
        </div>
    </form>
</body>
</html>