<%@ Page Title="View Suggestions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSuggestions.aspx.cs" Inherits="FunWebTriviaFinal.Suggestions.ViewSuggestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="suggestionID" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="suggestionID" HeaderText="suggestionID" InsertVisible="False" ReadOnly="True" SortExpression="suggestionID" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
            <asp:BoundField DataField="month" HeaderText="month" SortExpression="month" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:FunWebTriviaDBConnectionString %>" DeleteCommand="DELETE FROM [Suggestions] WHERE [suggestionID] = @original_suggestionID AND [description] = @original_description AND [email] = @original_email AND [day] = @original_day AND [month] = @original_month AND [year] = @original_year" InsertCommand="INSERT INTO [Suggestions] ([description], [email], [day], [month], [year]) VALUES (@description, @email, @day, @month, @year)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Suggestions]" UpdateCommand="UPDATE [Suggestions] SET [description] = @description, [email] = @email, [day] = @day, [month] = @month, [year] = @year WHERE [suggestionID] = @original_suggestionID AND [description] = @original_description AND [email] = @original_email AND [day] = @original_day AND [month] = @original_month AND [year] = @original_year">
        <DeleteParameters>
            <asp:Parameter Name="original_suggestionID" Type="Int32" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_day" Type="Int32" />
            <asp:Parameter Name="original_month" Type="Int32" />
            <asp:Parameter Name="original_year" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="day" Type="Int32" />
            <asp:Parameter Name="month" Type="Int32" />
            <asp:Parameter Name="year" Type="Int32" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="description" Type="String" />
            <asp:Parameter Name="email" Type="String" />
            <asp:Parameter Name="day" Type="Int32" />
            <asp:Parameter Name="month" Type="Int32" />
            <asp:Parameter Name="year" Type="Int32" />
            <asp:Parameter Name="original_suggestionID" Type="Int32" />
            <asp:Parameter Name="original_description" Type="String" />
            <asp:Parameter Name="original_email" Type="String" />
            <asp:Parameter Name="original_day" Type="Int32" />
            <asp:Parameter Name="original_month" Type="Int32" />
            <asp:Parameter Name="original_year" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
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
