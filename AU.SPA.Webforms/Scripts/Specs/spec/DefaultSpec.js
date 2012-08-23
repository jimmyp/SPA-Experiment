describe("When deafult page is initialised", function () {

    var navigation;

    beforeEach(function () {
        navigation = new Navigation();

        spyOn(navigation, "setupClientSideNavigationBetween");
    });

    it("should setup clientside nave between", function () {
        initialisePage(navigation);

        expect(navigation.setupClientSideNavigationBetween).toHaveBeenCalled();
    });
})