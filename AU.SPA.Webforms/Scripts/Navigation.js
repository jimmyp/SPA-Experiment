var Navigation = (function () {

    function restoreAllClientSideData() {
        $(".clientSideOutput").each(function () {
            $("#" + $(this).attr('id')).html(localStorage[$(this).attr('id')]);
        });
        $(".clientSideInput").each(function () {
            $("#" + $(this).attr('id')).val(localStorage[$(this).attr('id')]);
        });
    }

    function replaceMainContent(url, template, pageInit) {
        var start = (new Date).getTime();
        $.getJSON(url, function (json) {
            var diff = (new Date).getTime() - start;
            $("#perflist").append("<li>Loaded data " + url + " loaded in " + diff + "ms");
            var html = template(json);
            $(".main").html(html);
            pageInit();
            restoreAllClientSideData();
        });
    }

    function saveAllClientSideData() {
        $(".clientSideInput").each(function () {
            localStorage[$(this).attr('id')] = $(this).val();
        });
    }

    var setupClientSideNavigationBetween = function (options) {
        var start = (new Date).getTime();
        var contentUrl = "/" + options.pageName + "/" + options.pageName + "Content.html";
        $.get(contentUrl, function (htmlTemplate) {

            var diff = (new Date).getTime() - start;
            $("#perflist").append("<li> Loaded html " + options.pageName + "Content.html" + "  in " + diff + "ms");

            var template = Handlebars.compile(htmlTemplate);

            options.linkElement.click(function (event) {
                saveAllClientSideData();
                replaceMainContent("/" + options.pageName + "/json.aspx", template, options.pageInit);
                history.pushState(null, null, $(this).attr('href'));
                return false;
            });
        });
    };

    var loadContent = function (options) {
        var start = (new Date).getTime();
        $.get("/" + options.pageName + "Content.html", function (htmlTemplate) {
            var diff = (new Date).getTime() - start;
            $("#perflist").append("<li> Loaded html " + options.pageName + "Content.html" + "  in " + diff + "ms");

            var template = Handlebars.compile(htmlTemplate);
            replaceMainContent("json.aspx", template);

        });
    };

    return {
        setupClientSideNavigationBetween: setupClientSideNavigationBetween,
        loadContent: loadContent,
        replaceMainContent: replaceMainContent
    };
});