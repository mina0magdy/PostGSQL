<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="publicationPage.aspx.cs" Inherits="PostGSQL.publicationPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Publication Page</h1>
            Title:<br />
            <asp:TextBox ID="title" runat="server" placeholder="Enter your title here" Width="251px" ></asp:TextBox>
        </div>

        Publication Date:<br />
        <asp:TextBox ID="pubdate" runat="server" placeholder="dd/mm/yyyy" Width="153px"></asp:TextBox>
        <p>
            Host:<br />
            <asp:TextBox ID="host" runat="server" placeholder="Enter host here" Width="153px"></asp:TextBox>
        </p>
        Place:<br />
        <asp:TextBox ID="place" runat="server" placeholder="Enter place here" Width="154px"></asp:TextBox>
        <p>
         Accepted:   
        <asp:RadioButtonList ID="accepted" runat="server" >
            <asp:ListItem Text="yes"  selected="true"></asp:ListItem>
            <asp:ListItem Text="no"></asp:ListItem>
        </asp:RadioButtonList>
          Thesis serialno:<br />  
        <asp:TextBox ID="serialno" placeholder="xxxx" runat="server" ></asp:TextBox>
           
            <asp:Panel ID="messagePanel" runat="server">
            <asp:Literal ID="textMessage" runat="server"></asp:Literal>
        </asp:Panel>
            <asp:Button ID="Button1" runat="server" Onclick= "linknadd" style="margin-left: 1185px" Text="Add and Link" Width="171px" />
                   <asp:Button ID="Button2" runat="server" style="margin-left: 1212px; margin-bottom: 2px;" OnClick="Backbutton" Text="Back" Width="129px" />

        </p>
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
            $('[id*=pubdate]').datepicker({
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
