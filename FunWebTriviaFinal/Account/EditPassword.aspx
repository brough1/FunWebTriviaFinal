<%@ Page Title="Edit Your Password" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditPassword.aspx.cs" Inherits="FunWebTriviaFinal.Account.EditPassword" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <p>
        Change Your Password</p>
    <p>
        <asp:Label ID="lblError" runat="server" CssClass="alert-danger" Visible="False"></asp:Label>
    </p>
    <p>
        Old Password:
        <asp:TextBox ID="txtOldPassword" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtOldPassword" CssClass="alert-danger" Display="Dynamic" ErrorMessage="You must enter an old password!"></asp:RequiredFieldValidator>
    </p>
    <p>
        New Password:
        <asp:TextBox ID="txtNewPassword" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtNewPassword" CssClass="alert-danger" Display="Dynamic" ErrorMessage="You must enter a new password!"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtNewPassword" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Your password must have at least one uppercase, one numeric digit, and be between 8 and 15 characters!" ValidationExpression="^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,15}$"></asp:RegularExpressionValidator>
    </p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
    </p>

</asp:Content>
