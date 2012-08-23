describe("When Navigator setup client side navigation", function () {

    var navigation;
    var pageinit = function () {
    };

    beforeEach(function () {
        navigation = new Navigation();

        spyOn($, "get");
    });

    it("should load the content template", function () {
        navigation.setupClientSideNavigationBetween({ linkElement: $("#prev"), pageName: "pageName", pageInit: pageinit });

        expect($.get).toHaveBeenCalled();
    });
})