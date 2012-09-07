function initialisePage(navigation) {
    
    var home = {};
    
    var page2 = function () {
        navigation.setupClientSideNavigationBetween({ linkElement: $("#prev"), pageName: "Page1", pageInit: page1 });
    };

    var page1 = function () {

        $("#popupModal").click(function () { $('#modal').modal(); });
        navigation.setupClientSideNavigationBetween({ linkElement: $("#next"), pageName: "Page2", pageInit: page2 });
    };
    
    home = function () {
        navigation.setupClientSideNavigationBetween({ linkElement: $("#next"), pageName: "Page1", pageInit: page1 });
    };
    
    home();
}
