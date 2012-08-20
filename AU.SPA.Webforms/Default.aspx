<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" %>

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
    <asp:HyperLink runat="server" ID="next" NavigateUrl="Page1/Index.aspx">Next</asp:HyperLink>
</asp:Content>
<asp:Content runat="server" ID="ScriptContent" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        var test;
        
        $(function () {
            var home = {};
            var page2 = function() {
                navigation.setupClientSideNavigationBetween({ linkElement: $("#prev"), pageName: "Page1", pageInit: page1 });
            };
            var page1 = function () {
                navigation.setupClientSideNavigationBetween({ linkElement: $("#next"), pageName: "Page2", pageInit: page2 });
            };
            home = function () {
                navigation.setupClientSideNavigationBetween({ linkElement: $("#<%:next.ClientID %>"), pageName: "Page1", pageInit: page1 });
            };
            home();
        });
        
        
    </script>
</asp:Content>
