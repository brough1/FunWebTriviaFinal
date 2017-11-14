<%@ Page Title="View Suggestions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSuggestions.aspx.cs" Inherits="FunWebTriviaFinal.Suggestions.ViewSuggestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="suggestionID" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
            <asp:BoundField DataField="suggestionID" HeaderText="suggestionID" InsertVisible="False" ReadOnly="True" SortExpression="suggestionID" />
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:BoundField DataField="month" HeaderText="month" SortExpression="month" />
            <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" DeleteCommand="DELETE FROM [Suggestions] WHERE [suggestionID] = @suggestionID" InsertCommand="INSERT INTO [Suggestions] ([description], [year], [month], [day], [email]) VALUES (@description, @year, @month, @day, @email)" SelectCommand="SELECT * FROM [Suggestions]" UpdateCommand="UPDATE [Suggestions] SET [description] = @description, [year] = @year, [month] = @month, [day] = @day, [email] = @email WHERE [suggestionID] = @suggestionID">
        <DeleteParameters>
            <asp:Parameter Name="suggestionID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="year" Type="Int32" />
            <asp:Parameter Name="month" Type="String" />
            <asp:Parameter Name="day" Type="Int32" />
            <asp:Parameter Name="email" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="year" Type="Int32" />
            <asp:Parameter Name="month" Type="String" />
            <asp:Parameter Name="day" Type="Int32" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="suggestionID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
