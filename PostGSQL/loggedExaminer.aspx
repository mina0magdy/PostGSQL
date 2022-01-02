<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loggedExaminer.aspx.cs" Inherits="PostGSQL.loggedExaminer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Examiner</title>
    
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
        #form1{
            align-self:center;
            margin-top:150px;
            
        }  
    </style>
</head>
<body>
    
    <nav class="navbar navbar-light bg-light">
  <div class="container-fluid">
    <a class="navbar-brand">Welcome</a>
  </div>
</nav>
    
    <form runat="server" id="form1">

        <p>
        <asp:Button ID="Button6" runat="server" Text="Back"   class="btn btn-secondary btn-lg" OnClick="backButton" Width="150px" style="position:absolute; top:10px;left:10px"/>
            </p>
        
        <p>
        <asp:Button ID="Button1" runat="server" Text="Edit profile"   class="btn btn-secondary btn-lg" OnClick="editProfile" Width="275px" style="margin-left:42%"/>
            </p>
        
        <p>
        <asp:Button ID="Button2" runat="server" Text="view my theses" Width="275px" class="btn btn-secondary btn-lg" OnClick="viewThesis" style="margin-left:42%"/>
        </p>
        
        <p>
        <asp:Button ID="Button4" runat="server" Text="Add comments for a defense" Width="275px" class="btn btn-secondary btn-lg" OnClick="addComment" style="margin-left:42%"/>
        </p>
            
        <p>
            <asp:Button ID="Button5" runat="server" Text=" Add grade for a defense" Width="275px" class="btn btn-secondary btn-lg" OnClick="addGrade" style="margin-left:42%"/>
        </p>

            <p>
                <asp:TextBox ID="searchForThesis" runat="server"  type="search" placeholder="Search for a thesis" Height="45px" style="position:absolute; left:28%; border-radius=8px;border:groove" ></asp:TextBox>
                <asp:Button ID="Button3" runat="server" Text="search for a thesis" Width="275px" class="btn btn-secondary btn-lg" OnClick="thesisSearch" style="margin-left:42%"/>
            </p>
        
        

      </form>  
    
    
    </body>
</html>
