<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="FunWebTriviaFinal._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

        <h1>Daily Fun Trivia</h1>
        <p>Daily Fun Facts is a fun website designed to give you the daily random trivia you're always looking for!</p>
        <p>Come back daily as we're always updating and adding more and more facts for every day of the year.</p>


    
       

    <br />
    
<h2>On This Date In History</h2><br />
    <div class="jumbotron">
    <p class="lead"><asp:Label ID="lblTrivia" runat="server"></asp:Label></p>
    <br />
    <p><asp:Label ID="lblYear" runat="server" Visible="False"></asp:Label></p>
    </div>
    
       

</asp:Content>
