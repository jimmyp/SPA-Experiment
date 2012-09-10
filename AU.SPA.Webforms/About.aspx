<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        About
    </h2>
    <p id="content">
    </p>
    
    <script type="text/javascript" src="Scripts/jquery-1.4.1.js"></script>
    
    <script type="text/javascript">

        $(document).ready(function () {

            var bName = sessionStorage.buttonname;
            var cCount = sessionStorage.clickcount;
            var lSess = localStorage.lastsession;

            var st = "you clicked " + bName + " to get to this page.<br/>You have clicked " + cCount + " times. Last click was at " + lSess + ".";

            $("#content").text(st);
        });

    </script>

</asp:Content>
