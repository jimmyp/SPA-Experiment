var Navigation = (function () {

    var pageInits = {};

    function restoreAllClientSideData() {
        $(".clientSideOutput").each(function () {
            $("#" + $(this).attr('id')).html(localStorage[$(this).attr('id')]);
        });
        $(".clientSideInput").each(function () {
            $("#" + $(this).attr('id')).val(localStorage[$(this).attr('id')]);
        });
    }

    function updateContent(state) {
        $(".main").html(state.html);
        pageInits[state.pageName]();
        restoreAllClientSideData();
    }

    function replaceMainContent(url, template, pageName, historyUrl) {
        var start = (new Date).getTime();
        $.getJSON(url, function (json) {
            var diff = (new Date).getTime() - start;
            $("#perflist").append("<li>Loaded data " + url + " loaded in " + diff + "ms");
            var html = template(json);
            var state = { html: html, pageName: pageName };
            history.pushState(state, pageName, historyUrl);
            updateContent(state);
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
        $.get(contentUrl, function (htmlTemplate, status) {

            var diff = (new Date).getTime() - start;
            $("#perflist").append("<li> Loaded html " + options.pageName + "Content.html" + "  in " + diff + "ms");

            var template = Handlebars.compile(htmlTemplate);
            pageInits[options.pageName] = options.pageInit;

            options.linkElement.click(function (event) {
                saveAllClientSideData();
                replaceMainContent("/" + options.pageName + "/json.aspx", template, options.pageName, $(this).attr('href'));
                $(this).unbind('click');
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
        updateContent: updateContent
    };
});