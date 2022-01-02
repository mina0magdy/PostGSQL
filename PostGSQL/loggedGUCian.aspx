<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loggedGUCian.aspx.cs" Inherits="PostGSQL.loggedGUCian" %>

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
        <h1>Hello GUCian :)</h1></p>
        <asp:TextBox ID="mobile" runat="server" Type="number" style="margin-left: 1254px; margin-bottom: 0px;" Width="161px"></asp:TextBox>
        <asp:Button ID="addMob" runat="server" OnClick="Mobile" style="margin-left: 1277px; margin-bottom: 2px;" Text="Add Mobile Number" Height="22px" Width="134px" />
        <p>
            <asp:Panel ID="messagePanel" runat="server">
            <asp:Literal ID="textMessage" runat="server"></asp:Literal>
        </asp:Panel>
        <asp:HyperLink ID="HyperLink1" runat="server" href="StudentProfilePage.aspx">View my Profile</asp:HyperLink>
        </p>
        <asp:HyperLink ID="HyperLink2" runat="server" href="ThesisPage.aspx">View Thesis</asp:HyperLink>
         <br />
        <br />
        <asp:HyperLink ID="HyperLink4" runat="server" href="ProgressreportaddPage.aspx">Add progress report</asp:HyperLink>
         <br />
        <br />
        <asp:HyperLink ID="HyperLink5" runat="server" href="ProgressreportfillPage.aspx">Fill progress report</asp:HyperLink>
          <br />
        <br />
        <asp:HyperLink ID="HyperLink6" runat="server" href="publicationPage.aspx">Add and Link publication</asp:HyperLink>
                 <asp:Button ID="Button2" runat="server" style="margin-left: 1228px; margin-bottom: 2px;" OnClick="Backbutton" Text="Back" Width="139px" />

    </form>
    </body>
</html>