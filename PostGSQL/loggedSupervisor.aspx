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
            <asp:TextBox ID="studentID" runat="server"></asp:TextBox>
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
        <br />
        Cancel Thesis:<br />
        Thesis Serial Number:
        <asp:TextBox ID="ThesisSN" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="cancel" runat="server" OnClick="cancelThesis" Text="Cancel" />
        </p>
    </form>
</body>
</html>