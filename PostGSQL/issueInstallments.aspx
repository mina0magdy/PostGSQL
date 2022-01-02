<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="issueInstallments.aspx.cs" Inherits="PostGSQL.issueInstallments" %>

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
            Payment ID:
            <asp:TextBox ID="paymentID" runat="server" type ="number"></asp:TextBox>
        </p>
        <p>
            Installments Start Date:
            <asp:TextBox ID="startDate" runat="server" placeHolder ="dd/mm/yyyy"></asp:TextBox>
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
            $('[id*=startDate]').datepicker({
                changeMonth: true,
                changeYear: true,
                format: "dd/mm/yyyy",
                language: "tr"
            });
        });
    </script>
        </p>
        <p>
            <asp:Button ID="issueInstallmentsP" runat="server" Text="Issue Installments" OnClick="issueInstallmentsP_Click" />
        </p>
        <asp:Button ID="back" runat="server" Text="back" OnClick="back_Click" />
    </form>
</body>
</html>
