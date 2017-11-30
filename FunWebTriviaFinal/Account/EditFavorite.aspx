<%@ Page Title="Edit Your Favorite Topic" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EditFavorite.aspx.cs" Inherits="FunWebTriviaFinal.Account.EditFavorite" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Edit Your Favorite Topic</h2>
    <p>Your favorite topic: 
        <asp:DropDownList ID="ddlFavoriteSubject" runat="server" CssClass="form-control">
            <asp:ListItem>WW2</asp:ListItem>
            <asp:ListItem>Religion</asp:ListItem>
            <asp:ListItem>European History</asp:ListItem>
            <asp:ListItem>American History</asp:ListItem>
            <asp:ListItem>Major Earth Events</asp:ListItem>
        </asp:DropDownList>
    </p>
    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnSubmit" runat="server" OnClick="btnSubmit_Click" Text="Submit" />
    </p>
</asp:Content>
