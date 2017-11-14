<%@ Page Title="Trivia" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainTrivia.aspx.cs" Inherits="FunWebTriviaFinal.TriviaPages.MainTrivia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="TriviaData" ForeColor="Black" GridLines="Horizontal">
        <Columns>
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
            <asp:BoundField DataField="day" HeaderText="Day" SortExpression="day" />
            <asp:BoundField DataField="month" HeaderText="Month" SortExpression="month" />
            <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <asp:SqlDataSource ID="TriviaData" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [description], [day], [month], [year] FROM [Trivia] ORDER BY [year], [month], [day]"></asp:SqlDataSource>
</asp:Content>
