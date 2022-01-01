
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="examinerEditProfile.aspx.cs" Inherits="PostGSQL.examinerEditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="Content/bootstrap.min.css" rel="stylesheet" />

    <style>
        $fonts: "Open Sans", Helvetica, sans-serif;

@mixin border-radius($radius) {
    -webkit-border-radius: $radius;
    -moz-border-radius: $radius;
    -ms-border-radius: $radius;
    border-radius: $radius;
}


@mixin box-shadow($top, $left, $blur, $color) {
    -webkit-box-shadow: $top $left $blur $color;
    -moz-box-shadow: $top $left $blur $color;
    box-shadow: $top $left $blur $color;
}

::selection {
    background-color: #b5e2e7;
}

::-moz-selection {
    background-color: #8ac7d8;
}

body {
            background-image:url('/public/1.jpg');
            background-repeat: no-repeat;
            background-size: 100%;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
            margin: 0; height: 100%; overflow: hidden 

}

#signup{
    height:300px
}

.container {
    
    display: -webkit-flex;
    display: flex;
    height: 100%;
}

#logbox {
    margin: 50px auto;
    width: 340px;
    background-color: #fff;
    @include border-radius(4px);
    @include box-shadow(0, 1px, 5px, rgba(0,0,0,0.25));
}

h1 {
    text-align: center;
    font-size: 175%;
    color: #757575;
    font-weight: 300;
}

h1, input {
    font-family: $fonts;
}

.input {
    width: 75%;
    height: 50px;
    display: block;
    margin: 0 auto 15px;
    padding: 0 15px;
    border: none;
    border-bottom: 2px solid #ebebeb;
    &:focus {
        outline: none;
        border-bottom-color: #58c791 !important;
    }
    &:hover {
        border-bottom-color: #dcdcdc;
    }
    &:invalid {
        box-shadow: none;
    }
}

.pass:-webkit-autofill {
    -webkit-box-shadow: 0 0 0 1000px white inset;
}

.inputButton {
    position: relative;
    width: 85%;
    height: 50px;
    display: block;
    margin: 30px auto 30px;
    @include border-radius(5px);
    color: white;
    background-color: #58c791;
    border: none;
    @include box-shadow(0, 5px, 0, #3aad73);
    &:hover {
        top: 2px;
        @include box-shadow(0, 3px, 0, #3aad73);
    }
    &:active {
        top: 5px;
        box-shadow: none;
    }
    &:focus {
        outline: none;
    }
}

    </style>
</head>  
<body>
    
  <div class="container">
    <div id="logbox">
      <form  runat="server" >
          <p>
        <asp:Button ID="Button1" runat="server" Text="Back"   class="btn btn-secondary btn-lg" OnClick="backButton" Width="150px" style="position:absolute; top:10px;left:10px"/>
            </p>
        <h1 style="margin-top:50px">Edit profile</h1>
        <asp:Textbox ID="newName"  runat="server" class="input pass"  type="text" placeholder="What's your username?"  autofocus="autofocus" CausesValidation="true"  ValidationGroup="first" ></asp:Textbox>
        
        <asp:TextBox ID="newFieldOfWork" runat="server" class="input pass"  type="text" placeholder="What's your field of work?"  CausesValidation="true" ValidationGroup="second"></asp:TextBox>
        <asp:Button runat="server" class="inputButton" Text="submit" type="submit" value="submit" onclick="editProfile" ValidationGroup="second"/>
      </form>

    </div>
  </div>
</body>







    
</body>
</html>
