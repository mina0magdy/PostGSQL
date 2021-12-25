<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addExaminer.aspx.cs" Inherits="PostGSQL.addExaminer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Add Examiner</h1>
        <p>
            ExaminerName:
            <asp:TextBox ID="ExaminerName" runat="server" required ="true"></asp:TextBox>
        </p>
        <p>
            Thesis Serial Number:
            <asp:TextBox ID="ThesisSerialNo" runat="server" required ="true"></asp:TextBox>
        </p>
        <p>
      
            <p>
            <asp:RadioButtonList ID="National" runat="server" required ="true">
                <asp:ListItem Value ="1" Selected ="0"> National:</asp:ListItem>
                <asp:ListItem Value ="1">International</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        </p>

        <p>
            fieldOfWork:
            <asp:TextBox ID="fieldOfWork" runat="server" required ="true"></asp:TextBox>
        </p>
        <p>
            Defense Date:
            <asp:TextBox ID="DefenseDate" runat="server"  autocomplete="off" placeHolder ="dd/mm/yyyy" required ="true"></asp:TextBox>
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
            $('[id*=DefenseDate]').datepicker({
                changeMonth: true,
                changeYear: true,
                format: "dd/mm/yyyy",
                language: "tr"
            });
        });
    </script>
            
        </p>
        
        

        <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
        
        

    </form>
</body>
</html>
