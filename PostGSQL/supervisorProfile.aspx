<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="supervisorProfile.aspx.cs" Inherits="PostGSQL.supervisorProfile" %>

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
            &nbsp;</p>
        <p>
        <asp:Button ID="editSupervisor" runat="server" Text="Edit my profile" OnClick="editSupervisor_Click" Width="176px" />
        </p>
        <asp:Button ID="back" runat="server" Text="back" OnClick="back_Click" />
    </form>
    </body>
</html>
