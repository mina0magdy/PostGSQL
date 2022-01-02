<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProgressreportaddPage.aspx.cs" Inherits="PostGSQL.ProgressreportaddPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
        media="screen" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css"
        type="text/css" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Add Progress Report</h1>
           Thesis serialno:<br /><asp:TextBox ID="Thesis" Type="number" runat="server"  placeholder="xxxx" style="margin-left: 2px" Width="136px"></asp:TextBox>
           
        
        <p>
            Date:<br />
            <asp:TextBox ID="Date" runat="server" placeholder="dd/mm/yyyy" style="margin-left: 0px"></asp:TextBox>
        </p>
 
        </div>
        <asp:Button ID="Add" runat="server" OnClick="Addprogress" Text="Add" Width="153px" />
        <asp:Panel ID="messagePanel" runat="server">
            <asp:Literal ID="textMessage" runat="server"></asp:Literal>
        </asp:Panel>
         <asp:Button ID="Button2" runat="server" style="margin-left: 1228px; margin-bottom: 2px;" OnClick="Backbutton" Text="Back" Width="139px" />
        <!-- Bootstrap -->
    <script type="text/javascript" src='https://ajax.aspnetcdn.com/ajax/jQuery/jquery-1.8.3.min.js'></script>
    <script type="text/javascript" src='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js'></script>
    <link rel="stylesheet" href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/css/bootstrap.min.css'
        media="screen" />
    <!-- Bootstrap -->
    <!-- Bootstrap DatePicker -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/css/bootstrap-datepicker.css"
        type="text/css" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.4/js/bootstrap-datepicker.js"
        type="text/javascript"></script>
    <!-- Bootstrap DatePicker -->
    <script type="text/javascript">
        $(function () {
            $('[id*=Date]').datepicker({
                changeMonth: true,
                changeYear: true,
                format: "dd/mm/yyyy",
                language: "tr"
            });
        });
    </script>
    </form>
</body>
</html>
