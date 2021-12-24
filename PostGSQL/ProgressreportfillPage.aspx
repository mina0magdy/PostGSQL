<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProgressreportfillPage.aspx.cs" Inherits="PostGSQL.ProgressreportPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div> 
              <h1>Fill Progress Report</h1>
           Thesis serialno:<br /><asp:TextBox ID="Thesis" runat="server" Type="number" placeholder="xxxx" style="margin-left: 2px" Width="136px"></asp:TextBox>
           
        </div>
        <p>
             ProgressReport no:<br />
            <asp:TextBox ID="repno" runat="server" Type="number" placeholder="xxxx" style="margin-left: 0px"></asp:TextBox>
        </p>
        <p>
              State:<br />
             <asp:TextBox ID="State" Type="number" placeholder="xx" runat="server"></asp:TextBox>
        </p>
        <p>
             Description:</p>
        <asp:TextBox ID="Report" runat="server" Height="244px" placeholder="Fill your report here" Width="1195px"></asp:TextBox>
        <asp:Button ID="Fill" runat="server" Text="Fill" OnClick="Fillprogress" Width="129px" />
        <asp:Panel ID="messagePanel" runat="server">
            <asp:Literal ID="textMessage" runat="server"></asp:Literal>

        </asp:Panel>
        <asp:Button ID="Button2" runat="server" style="margin-left: 1228px; margin-bottom: 2px;" OnClick="Backbutton" Text="Back" Width="89px" />
            </p>
    </form>
</body>
</html>
