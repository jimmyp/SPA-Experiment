﻿<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="AU.SPA.Webforms._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <div id="test"></div>
    <h2>
        Welcome to ASP.NET!
    </h2>
    <p>
        To learn more about ASP.NET visit <a href="http://www.asp.net" title="ASP.NET Website">www.asp.net</a>.
    </p>
    <p>
        You can also find <a href="http://go.microsoft.com/fwlink/?LinkID=152368&amp;clcid=0x409"
            title="MSDN ASP.NET Docs">documentation on ASP.NET at MSDN</a>.
    </p>
    <a href="#" id="next">Next</a>
</asp:Content>
<asp:Content runat="server" ID="ScriptContent" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $(function () {

            var template;
            $.get("Page1/Page1Content.html", function(data) {
                template = Handlebars.compile(data);
            });

            $("#next").click(function () {
                
                //Replace Content
                $.get("Page1/json.aspx", function (data) {
                    var html = template(data);
                    $(".main").html(html);
                });

                //Rebind next link
            });
        });
    </script>
</asp:Content>
