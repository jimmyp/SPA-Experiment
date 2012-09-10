/*
$(function () {
    var Ctor = (function () {

        function privateFunction(parameters) {
            //somewthing private
        }

        function publicFucntion(parameters) {
            privateFunction();
        }

        return { publicFunctionExternalName: publicFucntion };
    })();

    var object = new Ctor();
});
*/

function testChecked() {
    // find all the tag with this attribute.
    $("*[showWhenSelected]").each(function (i) {

        var element = $(this);

        //get an array of the the values of the attribute.
        var v = $(this).attr("showWhenSelected").split(" ");
        var values = createSelectStringFromArray(v, "");

        // for each of those values
        $(values).each(function (j) {

            // hook into the change function.
            $(this).change(function () {

                var allChecked = createSelectStringFromArray(v, ":checked");

                
                var allChk = true;
                // check if all the values in the attribute are checked.
                $(values).each(function (k) {
                    if ($(this).is(":checked") == false) {
                        allChk = false;
                        return; // we can break here, since we know the result.
                    }
                });
                

                // if they are all checked, show it, otherwise hide it.
                if ($(allChecked) == v.length) {
                    element.show();
                } else {
                    element.hide();
                }
            });
        });
    });
}

function RadioChanged(radio) {

    if ($(radio).is(":checked")) {
        var hideVal = $(radio).attr("hideWhenChecked").split(' ');
        var showVal = $(radio).attr("showWhenChecked").split(' ');

        var hideElems = getElementsFromArray(hideVal, false);
        var showElems = getElementsFromArray(showVal, false);

        $(hideElems).each(function() {
            $(this).hide();
        });

        $(showElems).each(function() {
            $(this).show();
        });
    }
}

function getElementsFromArray(spVal, onlyVis) {
    var selectStr = createSelectStringFromArray(spVal, onlyVis == true ? ":visible" : "");
    return $(selectStr);
}

function createSelectStringFromArray(spVal, extra) {
    var selectStr = "";
    $(spVal).each(function (i) {
        selectStr += spVal[i] + extra + (i != (spVal.length - 1) ? "," : "");
    });

    return selectStr;
}

function testVisible() {

    $("*[visibleIfAllVisible]").each(function () {

        var spVal = $(this).attr("visibleIfAllVisible").split(' ');

        var visElems = getElementsFromArray(spVal, true);
        if (visElems.length == spVal.length) {
            //all of them are visible
            $(this).show();
        } else {
            $(this).hide();
        }
    });

    $("*[visibleIfOneVisible]").each(function () {

        var spVal = $(this).attr("visibleIfOneVisible").split(' ');

        //select all the elements from the value of the attribute that are visible
        var selectStr = "";
        $(spVal).each(function (i) {
            selectStr += spVal[i] + ":visible" + (i != (spVal.length - 1) ? "," : "");
        });

        var visElems = $(selectStr);
        if (visElems.length > 0) {
            //all of them are visible
            $(this).show();
        } else {
            $(this).hide();
        }
    });
}