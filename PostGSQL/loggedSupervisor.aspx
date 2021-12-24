<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="loggedSupervisor.aspx.cs" Inherits="PostGSQL.loggedSupervisor" %>

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
            <asp:HyperLink ID="viewProfile" href ="supervisorProfile.aspx" runat="server">View my profile</asp:HyperLink>
        </p>
        <asp:HyperLink ID="listStudents" href ="listSuperStudents.aspx" runat="server">List my students</asp:HyperLink>
        <p>
            &nbsp;</p>
        <p>
            List publications of a student:</p>
        <p>
            Student ID:
            <asp:TextBox ID="studentID" runat="server" required ="true"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="listStudentPublications" runat="server" OnClick="listPublications" Text="List" />
        </p>
        <p>
            &nbsp;</p>
        <p>
            <asp:HyperLink ID="addDefense" href ="addDefense.aspx" runat="server">Add Defense</asp:HyperLink>
        </p>
        <p>
            <asp:HyperLink ID="addExaminer" href ="addExaminer.aspx" runat="server">Add Examiner</asp:HyperLink>
        </p>
        <asp:HyperLink ID="evaluatePR" href ="evaluatePR.aspx" runat="server">Evaluate Progress Report</asp:HyperLink>
        <br />
        <p>
            &nbsp;</p>
        <asp:HyperLink ID="cancelThesis" href ="cancelThesis.aspx" runat="server">Cancel Thesis</asp:HyperLink>
    </form>
</body>
</html>