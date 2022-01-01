<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examinerViewAllTheses.aspx.cs" Inherits="PostGSQL.examinerViewAllTheses" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
            <link href="Content/bootstrap.min.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <p>
        <asp:Button ID="Button6" runat="server" Text="Back"   class="btn btn-secondary btn-lg" OnClick="backButton" Width="150px" style="position:absolute; top:10px;left:10px"/>
            </p>
        <div>
        </div>
        <br />
        <br />
        <br />

        <asp:GridView ID="GridView1" runat="server" CellPadding="15" CellSpacing="30" ForeColor="#333333" GridLines="None" style="width: 100%;    word-wrap:break-word;   table-layout: fixed;">
            <AlternatingRowStyle BackColor="White" />
            <EditRowStyle BackColor="#2461BF" />
            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#EFF3FB" />
            <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F5F7FB" />
            <SortedAscendingHeaderStyle BackColor="#6D95E1" />
            <SortedDescendingCellStyle BackColor="#E9EBEF" />
            <SortedDescendingHeaderStyle BackColor="#4870BE" />
        </asp:GridView>
    </form>
</body>
</html>
