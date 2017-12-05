<%@ Page Title="Your Account" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="FunWebTriviaFinal.Account.UserProfile" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Your Account</h2>
    <p>
        <asp:Label ID="lblMessage" runat="server" Visible="False"></asp:Label>
    </p>
    <div class ="row">
        <div class="col-md-6">
            <h4>
                Your account info
            </h4>

            <table>
                <tr>
                    <td>
                        Email:
                    </td>                   
                    <td>
                        <asp:Label ID="lblEmail" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnEmailChange" runat="server" Text="Change Email" OnClick="btnEmailChange_Click" Width="185px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        First Name:
                    </td>
                    <td>
                        <asp:Label ID="lblFirstName" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnFirstNameChange" runat="server" Text="Change First Name" OnClick="btnFirstNameChange_Click" Width="185px" />
                    </td>
                </tr>

                <tr>
                    <td>
                        Last Name:
                    </td>
                    <td>
                        <asp:Label ID="lblLastName" runat="server"></asp:Label>
                    </td>
                    <td>
                        <asp:Button ID="btnLastNameChange" runat="server" Text="Change Last Name" Width="185px" OnClick="btnLastNameChange_Click" />
                    </td>
                </tr>

            <tr>  
                <td>  
                    Favorite Topic
                </td>
                <td>
                    <asp:Label ID="lblFavorite" runat="server"></asp:Label>
                </td>
                <td>
                    <asp:Button ID="btnFavoriteChange" runat="server" Text="Change Favorite" Width="185px" OnClick="btnFavoriteChange_Click" />
                </td>
            </tr>

            <tr>
                <td>
                    Change your password?
                </td>
                <td>
                    
                </td>
                <td>
                    <asp:Button ID="btnPasswordChange" runat="server" Text="Change Password" Width="185px" OnClick="btnPasswordChange_Click" />
                </td>
                </table>
            </div>
        </div>
    <br />
        <div class="col-md-6">

            <asp:Panel ID="pnlAdminSection" runat="server" Visible="False">
                <h4>Welcome admin, here's your options!</h4>
                <ul>
                    <li><a runat="server" href="~/Suggestions/ViewSuggestions.aspx">View Suggestions</a></li>
                    <li><a runat="server" href="~/TriviaPages/AddTrivia.aspx">Add New Trivia/Facts</a></li>
                </ul>
            </asp:Panel>

        </div>
    
    <div class="row">
        <h4>Your Favorites</h4>
        <p>
            <asp:Label ID="lblEmpty" runat="server" Text="You don't have any favorites yet, head over to &lt;a href=&quot;~/TriviaPages/MainTrivia.aspx&quot;&gt;trivia&lt;/a&gt; and select some!" Visible="False"></asp:Label>
        </p>
        <p>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AllowPaging="True" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" DataKeyNames="userID,triviaID" ForeColor="Black" OnRowDeleting="GridView1_RowDeleting" >
                <Columns>
                    <asp:BoundField DataField="userID" HeaderText="userID" SortExpression="userID" ReadOnly="True" Visible="False"/>
                    <asp:BoundField DataField="triviaID" HeaderText="triviaID" SortExpression="triviaID" ReadOnly="True" Visible="False"/>
                    <asp:BoundField DataField="description" HeaderText="description" SortExpression="description" />
                    <asp:BoundField DataField="day" HeaderText="day" SortExpression="day" />
                    <asp:BoundField DataField="month" HeaderText="month" SortExpression="month" />
                    <asp:BoundField DataField="year" HeaderText="year" SortExpression="year" />
                    <asp:ButtonField ButtonType="Button" CommandName="Delete" Text="Delete Favorite" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server"  ConnectionString="<%$ ConnectionStrings:FunWebTriviaDBConnectionString %>" SelectCommand="SELECT * FROM [ViewFavorites] WHERE ([userID] = @userID)" DeleteCommand="Delete FROM [Favorites] WHERE [userID] = @userID and [triviaID] = @triviaID">
                <SelectParameters>
                    <asp:SessionParameter Name="userID" SessionField="userID" Type="Int32" />
                </SelectParameters>
                
                <DeleteParameters>
                    <asp:Parameter Name="userID" Type="Int16" />
                    <asp:Parameter Name="triviaID" Type="Int16" />
                </DeleteParameters>
            </asp:SqlDataSource>
        </p>

    </div>
</asp:Content>
