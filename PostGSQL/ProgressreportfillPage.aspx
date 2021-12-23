<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProgressreportfillPage.aspx.cs" Inherits="PostGSQL.ProgressreportPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div> 
           Thesis serialno:<br /><asp:TextBox ID="Thesis" runat="server" style="margin-left: 2px" Width="136px"></asp:TextBox>
           
        </div>
        <p>
             ProgressReport no:<br />
            <asp:TextBox ID="repno" runat="server" style="margin-left: 0px"></asp:TextBox>
        </p>
        <p>
              State:<br />
             <asp:TextBox ID="State" runat="server"></asp:TextBox>
        </p>
        <p>
             Description:</p>
        <asp:TextBox ID="Report" runat="server" Height="372px" Width="1195px"></asp:TextBox>
        <asp:Button ID="Fill" runat="server" Text="Fill" OnClick="Fillprogress" Width="129px" />
    </form>
</body>
</html>
