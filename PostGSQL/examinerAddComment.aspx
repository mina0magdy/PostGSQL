<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examinerAddComment.aspx.cs" Inherits="PostGSQL.examinerAddComment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add comment</title>
        <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <style>
        body{
            background-image:url('/public/1.jpg');
            background-repeat: no-repeat;
            background-size: 100%;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
            overflow: hidden
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="thesisSerial" type="number" runat="server" Height="30px" required="true" placeholder="Enter thesis serial number" style="margin-left: 43.3%; margin-top:13%" Width="200px"></asp:TextBox>
            <br />
            <br />
                
                &nbsp;<asp:TextBox ID="thesisComment" runat="server" Height="30px" required="true" placeholder="Enter your comment" style="margin-left: 43% " Width="200px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" Text=" Add comment" Width="275px" class="btn btn-secondary btn-lg" OnClick="addComment" style="margin-left:41%"/>
            <br />
            

        </div>
    </form>
</body>
</html>