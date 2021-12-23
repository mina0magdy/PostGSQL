<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProgressreportaddPage.aspx.cs" Inherits="PostGSQL.ProgressreportaddPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            
           Thesis serialno:<br /><asp:TextBox ID="Thesis" runat="server" style="margin-left: 2px" Width="136px"></asp:TextBox>
           
        
        <p>
            Date:<br />
            <asp:TextBox ID="Date" runat="server" style="margin-left: 0px"></asp:TextBox>
        </p>
        </div>
        <asp:Button ID="Add" runat="server" OnClick="Addprogress" Text="Add" Width="158px" />
    </form>
</body>
</html>
