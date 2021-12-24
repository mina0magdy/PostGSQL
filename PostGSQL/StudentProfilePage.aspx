<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentProfilePage.aspx.cs" Inherits="PostGSQL.StudentProfilePage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>My Profile</h1>
        </div>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="EMP" style="margin-left: 1276px" Text="Edit my profile" Width="151px" />
            </p>
        <div>
            <p>
        
        <p>
               <asp:Button ID="Button2" runat="server" style="margin-left: 1348px; margin-bottom: 2px;" OnClick="Backbutton" Text="Back" Width="79px" />
            </p>
        <p>
            &nbsp;</p>
        </div>
    </form>
</body>
</html>
