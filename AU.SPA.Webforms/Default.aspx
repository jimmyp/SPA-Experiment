<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true"%>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
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
    
    <div id="firstDiv">
        This is this first div.
    </div>
    
    <div id="secondDiv" style="display:none;">
        This is the second Div.
    </div>

    <div visibleIfAllVisible="#firstDiv">
        This is visible if the first and second are
    </div>
    
    <div>
        Fourth div.    
    </div>

    <br/>
    <br/>
  
    <div id="radio1">
        First values<br/>
        <input type="radio" name="testRadio1" value="Value 1" hideWhenChecked="#radio2" showWhenChecked="#radio3">Value 1</input><br/>
        <input type="radio" name="testRadio1" value="Value 2" hideWhenChecked="#radio3" showWhenChecked="#radio2">Value 2</input><br/>
        <input type="radio" name="testRadio1" value="Value 3" hideWhenChecked="#radio2" showWhenChecked="#radio3">Value 3</input>
    </div>
    
    <div id="radio2" style="display:none;">
        Second values<br/>
        <input type="radio" name="testRadio2" value="Value 1" hideWhenChecked="" showWhenChecked="#radio3">Value 1</input><br/>
        <input type="radio" name="testRadio2" value="Value 2" hideWhenChecked="" showWhenChecked="#radio3">Value 2</input><br/>
        <input type="radio" name="testRadio2" value="Value 3" hideWhenChecked="" showWhenChecked="#radio3">Value 3</input>
    </div>

    <div id="radio3" style="display:none;">
        Third values<br/>
        <input type="radio" name="testRadio3" value="Value 1" hideWhenChecked="" showWhenChecked="">Value 1</input><br/>
        <input type="radio" name="testRadio3" value="Value 2" hideWhenChecked="" showWhenChecked="">Value 2</input><br/>
        <input type="radio" name="testRadio3" value="Value 3" hideWhenChecked="" showWhenChecked="">Value 3</input>
    </div>
    
    <hr/>

    <!-- reverse way of doing things -->
    <div id="radio10">
        First values<br/>
        <input type="radio" name="testRadio10" value="Value 1">Value 1</input><br/>
        <input id="crazyThinking" type="radio" name="testRadio10" value="Value 2">Value 2</input><br/>
        <input type="radio" name="testRadio10" value="Value 3">Value 3</input>
    </div>
    
    <div id="radio20" style="display:none;" showWhenSelected="#crazyThinking">
        Second values<br/>
        <input type="radio" name="testRadio20" value="Value 1">Value 1</input><br/>
        <input type="radio" name="testRadio20" value="Value 2">Value 2</input><br/>
        <input type="radio" name="testRadio20" value="Value 3">Value 3</input>
    </div>

    <div id="radio30" style="display:none;">
        Third values<br/>
        <input type="radio" name="testRadio30" value="Value 1">Value 1</input><br/>
        <input type="radio" name="testRadio30" value="Value 2">Value 2</input><br/>
        <input type="radio" name="testRadio30" value="Value 3">Value 3</input>
    </div>
    <hr/>
    <br/>
    <br/>
    <div>
        <input type="button" value="Button1" onclick="ButtonClicked('Button1');" />
        <input type="button" value="Button2" onclick="ButtonClicked('Button2');" />
        <div id="localstoragetest">
        
        </div>
    </div>

    <script type="text/javascript" src="Scripts/jquery-1.4.1.js"></script>
    <script type="text/javascript" src="Scripts/myScript.js"></script>

    <script type="text/javascript">

        function ButtonClicked(value) {
            sessionStorage.buttonname = value;
            if( sessionStorage.clickcount) {
                sessionStorage.clickcount=Number(sessionStorage.clickcount)+1;
            } else {
                sessionStorage.clickcount = 1;
            }

            var t = new Date();
            localStorage.lastsession = t.getTime();

            window.location.href = "about.aspx";
        }

        $(document).ready(function () {
            testVisible();
            
            // bootstrap all the radio buttons to respond to the change event, passing a ref to itself
            $(":radio").each(function (i) {
                $(this).change(function () {
                    RadioChanged(this);
                });
            });
            

            testChecked();
        });

        if( typeof (Storage) !== undefined) {
            $("#localstoragetest").text("local storage supported");
        } else {
            $("#localstoragetest").text("not supported");
        }

    </script>

</asp:Content>
