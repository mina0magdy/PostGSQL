<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examinerAddGrade.aspx.cs" Inherits="PostGSQL.examinerAddGrade" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add grade</title>
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
        <p>
        <asp:Button ID="Button6" runat="server" Text="Back"   class="btn btn-secondary btn-lg" OnClick="backButton" Width="150px" style="position:absolute; top:10px;left:10px"/>
            </p>
        <div>
            <asp:TextBox ID="thesisSerial" type="number" runat="server" Height="30px"  placeholder="Enter thesis serial number" style="margin-left: 43.3%; margin-top:13%" Width="200px"></asp:TextBox>
            <br />
            <br />
                
                &nbsp;<asp:TextBox ID="thesisGrade"  runat="server" Height="30px"  placeholder="Enter a grade" style="margin-left: 43% " Width="200px"></asp:TextBox>
            <br />
            <br />
            <asp:Button ID="Button5" runat="server" Text=" Add grade" Width="275px" class="btn btn-secondary btn-lg" OnClick="addGrade" style="margin-left:41%"/>
            <br />
            

        </div>
    </form>
</body>
</html>
