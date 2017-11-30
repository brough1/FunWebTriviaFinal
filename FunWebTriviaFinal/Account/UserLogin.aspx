<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="FunWebTriviaFinal.Account.UserLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h4>
        Sign-In To Your Account</h4>
    <br />
    <asp:Label ID="lblError" runat="server" Visible="False"></asp:Label>
    <br />
    <div class="form-group">
        <p>Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" CssClass="alert-danger" Display="Dynamic" ErrorMessage="Must enter an email." ControlToValidate="txtEmail"></asp:RequiredFieldValidator>
&nbsp;</p>
    </div>
    <br />
    <div class="form-group">
        <p>Password:&nbsp; <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="alert-danger" ErrorMessage="Must enter a password." ControlToValidate="txtPassword"></asp:RequiredFieldValidator>
        </p>
    </div>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnSubmit" runat="server" BorderStyle="None" OnClick="btnSubmit_Click" Text="Submit" CssClass ="btn btn-primary"/>
    <br />
</asp:Content>
