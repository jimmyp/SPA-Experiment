<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="AU.SPA.Webforms.Page1.Index" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
</asp:Content>
<asp:Content runat="server" ContentPlaceHolderID="ScriptContent">
    <script type="text/javascript">
        $(function () {

            var template;
            $.get('<%:ResolveUrl("~/Page1/Page1Content.html")%>', function (data) {
                
                template = Handlebars.compile(data);
                
                //Replace Content
                $.get('<%:ResolveUrl("~/Page1/json.aspx")%>', function (data) {
                    var html = template(data);
                    $(".main").html(html);
                });
                
            });

            

            //Rebind next link
        });
    </script>
</asp:Content>
