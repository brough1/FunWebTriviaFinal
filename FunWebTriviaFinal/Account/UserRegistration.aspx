<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="FunWebTriviaFinal.Account.UserRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        Sign-up to keep track of all your favorite trivia!</p>
    <p>
        <asp:Label ID="lblError" runat="server" CssClass="alert-danger" Visible="False"></asp:Label>
    </p>
    <div class="form-group">
    <p>
        Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="txtEmail" runat="server" CssClass ="form-control"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtEmail" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Must enter an Email"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Must enter a valid email address" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </p>
    <p>
        Password:&nbsp; <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"></asp:TextBox>
&nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPassword" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Must enter a password"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPassword" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Your password must have one uppercase letter, one numeric digit, and have a length of 8-15 characters" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$"></asp:RegularExpressionValidator>
    </p>
    <p>
        First Name:
        <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtFirstName" CssClass="alert-danger" Display="Dynamic">Must enter a name</asp:RequiredFieldValidator>
    </p>
    <p>
        Last Name: <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="txtLastName" CssClass="alert-danger" Display="Dynamic">Must enter a name</asp:RequiredFieldValidator>
    </p>
    <p>
        What would you say is your favorite subject? (Choose from this list)</p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:DropDownList ID="ddlFavoriteSubject" runat="server" CssClass="form-control">
            <asp:ListItem>WW2</asp:ListItem>
            <asp:ListItem>Religion</asp:ListItem>
            <asp:ListItem>European History</asp:ListItem>
            <asp:ListItem>American History</asp:ListItem>
            <asp:ListItem>Major Earth Events</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnRegister" runat="server" OnClick="btnRegister_Click" Text="Register" CssClass="btn btn-primary" />
    </p>
    </div>

</asp:Content>
