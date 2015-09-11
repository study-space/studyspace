//현재 기기에서 위치정보를 가져온다.
var positionService = (function () {
    var _currentPosition = null;
    (function () {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(function (position) {
                console.log(position);

                _currentPosition = {
                    latitude: position.coords.latitude,
                    longitude: position.coords.longitude
                };
            });
        } else {
            alert("Geolocation is not supported by this browser.");
        }
    })();

    var isPositionExist = function () {
        return _currentPosition != null
    };

    var getPosition = function () {
        return _currentPosition;
    };

    return {
        isPositionExist: isPositionExist,
        getPosition: getPosition
    };
})();

var pageAction = (function () {

    var search = function (condition) {
        //set searchParam;
        var searchParamArr = [];
        if (condition.distance)
            searchParamArr.push("d=" + condition.distance);
        if (condition.positionStr)
            searchParamArr.push("p=" + condition.positionStr);

        var searchParam = searchParamArr.join("&");

        location.href = "/place?" + searchParam;
    };

    return {
        search: search
    }

})();

//Event Binding
{
    $(".input-place-search").on("focus", function () {
        $(".search-layer").show();
        $(".search-layer-bg").show();
    });

    $(".btn-search-layer-close").on("click", function () {
        $(".search-layer").hide();
        $(".search-layer-bg").hide();
    });

    $(".btn-search-by-position").on("click", function (e) {
        pageAction.search({
            positionStr: $(this).attr("data-position")
        });
    });

    $(".btn-search-by-distance").on("click", function (e) {
        if (!positionService.isPositionExist()) {
            alert("위치정보를 조회하고 있습니다. \n 잠시후 다시 시도해주세요.");
        } else {
            var currentPosition = positionService.getPosition();
            pageAction.search({
                distance: $(this).attr("data-distance"),
                positionStr: currentPosition.latitude + "," + currentPosition.longitude
            });
        }
    });

}
