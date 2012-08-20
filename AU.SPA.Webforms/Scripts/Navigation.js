var Navigation = (function () {

    function replaceMainContent(url, template, pageInit) {
        var start = (new Date).getTime();
        $.getJSON(url, function (json) {
            var diff = (new Date).getTime() - start;
            $("#perflist").append("<li>Loaded data " + url + " loaded in " + diff + "ms");
            var html = template(json);
            $(".main").html(html);
            pageInit();
        });
    }

    var setupClientSideNavigationBetween = function (options) {
        var start = (new Date).getTime();
        $.get(options.pageName + "/" + options.pageName + "Content.html", function (htmlTemplate) {

            var diff = (new Date).getTime() - start;
            $("#perflist").append("<li> Loaded html " + options.pageName + "Content.html" + "  in " + diff + "ms");

            var template = Handlebars.compile(htmlTemplate);

            options.linkElement.click(function (event) {
                replaceMainContent(options.pageName + "/json.aspx", template, options.pageInit);
                return false;
            });
        });
    };

    var loadContent = function (options) {
        var start = (new Date).getTime();
        $.get(options.pageName + "Content.html", function (htmlTemplate) {
            var diff = (new Date).getTime() - start;
            $("#perflist").append("<li> Loaded html " + options.pageName + "Content.html" + "  in " + diff + "ms");

            var template = Handlebars.compile(htmlTemplate);
            replaceMainContent("json.aspx", template);

        });
    };

    return {
        setupClientSideNavigationBetween: setupClientSideNavigationBetween,
        loadContent: loadContent
    };
});