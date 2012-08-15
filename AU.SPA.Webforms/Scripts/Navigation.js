var Navigation = (function() {

    function replaceMainContent(url, template) {
        $.get(url, function(json) {
            var html = template(json);
            $(".main").html(html);
        });
    }

    var setupClientSideNavigationBetween = function(options) {
        $.get(options.pageName + "/" + options.pageName + "Content.html", function(htmlTemplate) {

            var template = Handlebars.compile(htmlTemplate);

            options.linkElement.click(function() {
                replaceMainContent(options.pageName + "/json.aspx", template);
            });
        });
    };

    var loadContent = function(options) {
        $.get(options.pageName + "Content.html", function(htmlTemplate) {

            var template = Handlebars.compile(htmlTemplate);
            replaceMainContent("json.aspx", template);


        });
    };

    return {
        setupClientSideNavigationBetween: setupClientSideNavigationBetween,
        loadContent: loadContent
    };
});