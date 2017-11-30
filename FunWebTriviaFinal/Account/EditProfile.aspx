<%@ Page Title="Edit Your Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="FunWebTriviaFinal.Account.EditProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
        <h2>Edit Your Profile</h2>
        <asp:Label ID="lblError" runat="server" CssClass="alert-danger" Visible="False"></asp:Label>
        <br />
        <br />
        Enter new
        <asp:Label ID="lblBasicChange" runat="server" Enabled="True"></asp:Label>
        :
        <asp:TextBox ID="txtChangedValue" runat="server" Enabled="True"></asp:TextBox>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnBasicSubmit" runat="server" Text="Submit" OnClick="btnBasicSubmit_Click" />
</asp:Content>
