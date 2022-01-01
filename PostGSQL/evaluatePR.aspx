<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="evaluatePR.aspx.cs" Inherits="PostGSQL.evaluatePR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <h1>Evaluate</h1>

        
        <p>
            SupervisorID:<%=Session["user"]%>
            </p>
        <p>
            thesisSerialNo:
            <asp:TextBox ID="thesisSerialNo" runat="server"  required ="true"></asp:TextBox>
            
        </p>
        <p>
            progressReportNo:
            <asp:TextBox ID="progressReportNo" runat="server" required ="true"></asp:TextBox>
        </p>
         <p>
            evaluation:
            <asp:TextBox ID="evaluation" runat="server" placeHolder="From 0 to 3" required ="true"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="addButton" runat="server" Text="Add" OnClick="addButton_Click" />
        </p>


    </form>
</body>
</html>
