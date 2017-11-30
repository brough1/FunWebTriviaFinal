<%@ Page Title="Trivia" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MainTrivia.aspx.cs" Inherits="FunWebTriviaFinal.TriviaPages.MainTrivia" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>The History Of Everything</h2>
    <asp:Label ID="lblError" runat="server" Visible="False"></asp:Label>
    <br />
    <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="TriviaData" ForeColor="Black" GridLines="Horizontal" OnRowCommand="GridView1_SelectedIndexChanged" OnPageIndexChanged="GridView1_PageIndexChanged">
        <Columns>
            <asp:BoundField DataField="description" HeaderText="Description" SortExpression="description" />
            <asp:TemplateField HeaderText="Day" SortExpression="day">
                <HeaderTemplate>
                    Day <asp:DropDownList ID="ddDay"
                        DataTextField="day"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddDay_SelectedIndexChanged"
                        OnPreRender="SetValueDay"
                        DataSourceID="DataSourceDay" runat="server">                  
                        </asp:DropDownList>
                </HeaderTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("day") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("day") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Month" SortExpression="month">
                <HeaderTemplate>
                    Month <asp:DropDownList ID="ddMonth"
                        DataTextField="month"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddMonth_SelectedIndexChanged"
                        OnPreRender="SetValueMonth"
                        DataSourceID="DataSourceMonth" runat="server">                  
                        </asp:DropDownList>
                </HeaderTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("month") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("month") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Year" SortExpression="year">
                <HeaderTemplate>
                    Year <asp:DropDownList ID="ddYear"
                        DataTextField="year"
                        AutoPostBack="true"
                        OnSelectedIndexChanged="ddYear_SelectedIndexChanged"
                        OnPreRender="SetValueYear"
                        DataSourceID="DataSourceYear" runat="server">                  
                        </asp:DropDownList>
                </HeaderTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("year") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("year") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:ButtonField ButtonType="Button" CommandName="Select" Text="Favorite" AccessibleHeaderText="Favorite" />
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
    
    <asp:SqlDataSource ID="TriviaData" runat="server" ConnectionString="<%$ ConnectionStrings:FunWebTriviaDBConnectionString %>" SelectCommand="SELECT DISTINCT [description], [day], [month], [year] FROM [Trivia] ORDER BY [year], [month], [day]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DataSourceDay" runat="server" ConnectionString="<%$ ConnectionStrings:FunWebTriviaDBConnectionString %>" SelectCommand="SELECT ' ' as Day UNION Select distinct [Day] as Day From[Trivia] ORDER BY [Day]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DataSourceMonth" runat="server" ConnectionString="<%$ ConnectionStrings:FunWebTriviaDBConnectionString %>" SelectCommand="SELECT ' ' as Month UNION Select distinct [Month] as Month From[Trivia] ORDER BY [Month]"></asp:SqlDataSource>
    <asp:SqlDataSource ID="DataSourceYear" runat="server" ConnectionString="<%$ ConnectionStrings:FunWebTriviaDBConnectionString %>" SelectCommand="SELECT ' ' as Year UNION Select distinct [Year] as Year From[Trivia] ORDER BY [Year]"></asp:SqlDataSource>
</asp:Content>
