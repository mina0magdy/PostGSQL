<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="publicationPage.aspx.cs" Inherits="PostGSQL.publicationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Title:<br />
            <asp:TextBox ID="title" runat="server" Width="251px" required="true"></asp:TextBox>
        </div>

        Publication Date:<br />
        <asp:TextBox ID="pubdate" runat="server" required="true" Width="153px"></asp:TextBox>
        <p>
            Host:<br />
            <asp:TextBox ID="host" runat="server" required="true" Width="153px"></asp:TextBox>
        </p>
        Place:<br />
        <asp:TextBox ID="place" runat="server" required="true" Width="154px"></asp:TextBox>
        <p>
         Accepted:   
        <asp:RadioButtonList ID="accepted" runat="server" required="true">
            <asp:ListItem Text="yes" selected="true"></asp:ListItem>
            <asp:ListItem Text="no"></asp:ListItem>
        </asp:RadioButtonList>
          Thesis serialno:<br />  
        <asp:TextBox ID="serialno" runat="server" required="true"></asp:TextBox>
           
        <p>
            <asp:Button ID="Button1" runat="server" Onclick= "linknadd" style="margin-left: 1185px" Text="Add and Link" Width="171px" />
        </p>
           
    </form>
</body>
</html>
