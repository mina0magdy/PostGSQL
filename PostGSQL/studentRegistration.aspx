<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="studentRegistration.aspx.cs" Inherits="PostGSQL.studentRegistration" %>

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
        Student Registration:</p>
        <p>
            First Name:
            <asp:TextBox ID="firstName" runat="server"   placeholder="enter your first name"></asp:TextBox>
        </p>
        <p>
            Last Name:
            <asp:TextBox ID="lastName" runat="server"  placeholder="enter your last name"></asp:TextBox>
        </p>
        <p>
            GUCian:
            <asp:RadioButtonList ID="gucselect" runat="server" >
                <asp:ListItem Value="1" Selected="true">Yes</asp:ListItem>
                <asp:ListItem Value="0">No</asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            Degree:
            <asp:RadioButtonList ID="type" runat="server">
                <asp:ListItem Text="Masters" selected="true"></asp:ListItem>
                <asp:ListItem Text="PHD"></asp:ListItem>
            </asp:RadioButtonList>
        </p>
        <p>
            Email:
            <asp:TextBox ID="email" runat="server" type="email"  placeholder="Example@something"></asp:TextBox>
        </p>
        <p>
            Password:
            <asp:TextBox ID="password" runat="server" type="password"  placeholder="enter your password"></asp:TextBox>
        </p>
        <p>
            Faculty:
            <asp:TextBox ID="faculty" runat="server"  placeholder="enter your faculty"></asp:TextBox>
        </p>
        <p>
            Address:
            <asp:TextBox ID="address" runat="server"  placeholder="enter your address"></asp:TextBox>
        </p>
        <asp:Button ID="register" runat="server" Text="Register" OnClick="Register" />
        <asp:Panel ID="messagePanel" runat="server">
            <asp:Literal ID="textMessage" runat="server"></asp:Literal>
        </asp:Panel>
           <asp:Button ID="Button2" runat="server" style="margin-left: 1212px; margin-bottom: 2px;" OnClick="Backbutton" Text="Back" Width="129px" />
    </form>
    </body>
</html>