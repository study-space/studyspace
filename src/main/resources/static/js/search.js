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
    (function () {
        var recentSearchCookie = Cookies.get("recentSearch");
        var recentSearchList = (recentSearchCookie != "") ? JSON.parse(recentSearchCookie):[];
        var $recentSearchList = $(".recent-search-list");
        for (var i = 0; i < recentSearchList.length; i++) {
            var recentSearch = recentSearchList[i];
            var button = "";
            button += "<button type='button' class='recent-search list-group-item'";
            button += "        data-url='/place?" + recentSearch.param + "'>";
            button += recentSearch.query;
            button += "</button>";
            $recentSearchList.append(button);
        }
    })();

    var search = function (condition) {
        //set searchParam;
        var searchParamArr = [];
        if (condition.distance)
            searchParamArr.push("d=" + condition.distance);
        if (condition.positionStr)
            searchParamArr.push("p=" + condition.positionStr);

        var searchParam = searchParamArr.join("&");

        //set cookie
        var recentSearchCookie = Cookies.get("recentSearch");
        var recentSearchArr;

        // 쿠키값이 없을 경우에는 새롭게 추가!
        if (!recentSearchCookie)
            recentSearchArr = [];
        else
            recentSearchArr = JSON.parse(recentSearchCookie);

        // 쿠키값이 10개가 넘어가면 마지막 쿠키값은 삭제!
        if (recentSearchArr > 10)
            recentSearchArr.pop();

        var recentSearch = {
            query: condition.query,
            param: searchParam
        };

        console.log(recentSearchArr);

        recentSearchArr.splice(0, 0, recentSearch);
        Cookies.set("recentSearch", JSON.stringify(recentSearchArr));

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

    $(".btn-search-type").on("click", function (e) {
        e.preventDefault();
        $(this).tab('show');
    });

    $(".btn-search-by-position").on("click", function (e) {
        pageAction.search({
            query: $(this).attr("data-query"),
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
                query: "내 주변 검색",
                positionStr: currentPosition.latitude + "," + currentPosition.longitude
            });
        }
    });

    $(".recent-search").on("click", function(){
        location.href = $(this).attr("data-url");
    })
}
