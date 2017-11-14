<%@ Page Title="Suggestions" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Suggestions.aspx.cs" Inherits="FunWebTriviaFinal.Suggestions.Suggestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="jumbotron">
    <h1>Got a suggestion?</h1>
    <p>Leave all the information below and we'll get right to work on adding your trivia after we approve it!</p>
    </div>
     
    <br />
    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
    Email:&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtEmail"
                                CssClass="text-danger" ErrorMessage="The email field is required." Display="Dynamic" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" CssClass="text-danger" Display="Dynamic" ErrorMessage="You must enter a valid email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    <br />
    <br />
    Month:&nbsp;&nbsp;
    <asp:DropDownList ID="cmboMonth" runat="server" CssClass="form-control" TabIndex="1">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>8</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    Day:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:DropDownList ID="cmboDay" runat="server" Enabled="true" CssClass="form-control" TabIndex="2">
        <asp:ListItem>1</asp:ListItem>
        <asp:ListItem>2</asp:ListItem>
        <asp:ListItem>3</asp:ListItem>
        <asp:ListItem>4</asp:ListItem>
        <asp:ListItem>5</asp:ListItem>
        <asp:ListItem>6</asp:ListItem>
        <asp:ListItem>7</asp:ListItem>
        <asp:ListItem>8</asp:ListItem>
        <asp:ListItem>9</asp:ListItem>
        <asp:ListItem>10</asp:ListItem>
        <asp:ListItem>11</asp:ListItem>
        <asp:ListItem>12</asp:ListItem>
        <asp:ListItem>13</asp:ListItem>
        <asp:ListItem>14</asp:ListItem>
        <asp:ListItem>15</asp:ListItem>
        <asp:ListItem>16</asp:ListItem>
        <asp:ListItem>17</asp:ListItem>
        <asp:ListItem>18</asp:ListItem>
        <asp:ListItem>19</asp:ListItem>
        <asp:ListItem>20</asp:ListItem>
        <asp:ListItem>21</asp:ListItem>
        <asp:ListItem>22</asp:ListItem>
        <asp:ListItem>23</asp:ListItem>
        <asp:ListItem>24</asp:ListItem>
        <asp:ListItem>25</asp:ListItem>
        <asp:ListItem>26</asp:ListItem>
        <asp:ListItem>27</asp:ListItem>
        <asp:ListItem>28</asp:ListItem>
        <asp:ListItem>29</asp:ListItem>
        <asp:ListItem>30</asp:ListItem>
        <asp:ListItem>31</asp:ListItem>
    </asp:DropDownList>
    <br />
    <br />
    Year:&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtYear" runat="server" MaxLength="4" TabIndex="3" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtYear"
                                CssClass="text-danger" ErrorMessage="You must enter a year" Display="Dynamic" />
    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Must enter a numeric year value" Operator="DataTypeCheck" Type="Integer" CssClass="text-danger" ControlToValidate="txtYear" Display="Dynamic"></asp:CompareValidator>
    <br />
    <br />
    Description :<br />
&nbsp;<asp:TextBox ID="txtDescription" runat="server" Height="115px" Width="320px" TabIndex="4" TextMode="MultiLine" CssClass="form-control"></asp:TextBox>
    <asp:RequiredFieldValidator runat="server" ControlToValidate="txtDescription"
                                CssClass="text-danger" ErrorMessage="You must enter a description for what happened on that date." />
    <br />
    <br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" CssClass="btn btn-default" TabIndex="5" />
     
</asp:Content>
