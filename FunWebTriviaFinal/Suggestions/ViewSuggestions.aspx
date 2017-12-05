<%@ Page Title="View Suggestions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewSuggestions.aspx.cs" Inherits="FunWebTriviaFinal.Suggestions.ViewSuggestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <br />
    <h2>Suggestions For Review</h2>
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="suggestionID" DataSourceID="SqlDataSource2" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="suggestionID" HeaderText="suggestionID" InsertVisible="False" ReadOnly="True" SortExpression="suggestionID" />
            <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
            <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
            <asp:BoundField DataField="month" HeaderText="month" SortExpression="month" />
            <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
            <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
        </Columns>
        <EditRowStyle BackColor="#2461BF" />
        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#EFF3FB" />
        <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F5F7FB" />
        <SortedAscendingHeaderStyle BackColor="#6D95E1" />
        <SortedDescendingCellStyle BackColor="#E9EBEF" />
        <SortedDescendingHeaderStyle BackColor="#4870BE" />
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
    <br />
    <asp:Button ID="btnAdd" runat="server" CssClass="btn btn-primary" OnClick="btnAdd_Click" Text="Edit and Add Selected Row" />
</asp:Content>
