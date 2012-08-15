<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"
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
    <script id="page1Content" type="text/x-handlebars-template" >
<div class="entry">
  <h1>{{title}}</h1>
  <div class="body">
    {{body}}
  </div>
</div>
    </script>
    <script type="text/javascript">
        $(function () {

            $("#next").click(function () {
                //Replace Content
                $.get("Page1/json.aspx", function (data) {
                    var context = jQuery.parseJSON(data);
                    var source = $("#page1Content").html();
                    var template = Handlebars.compile(source);
                    var html = template(context);
                    $(".main").html(html);
                });

                //Rebind next link
            });
        });
    </script>
</asp:Content>
