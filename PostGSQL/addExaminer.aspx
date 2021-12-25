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
            <asp:TextBox ID="DefenseDate" runat="server" placeHolder ="mm/dd/yyyy" required ="true"></asp:TextBox>
            
        </p>
        
        

        <asp:Button ID="Button1" runat="server" Text="Add" OnClick="Button1_Click" />
        
        

    </form>
</body>
</html>
