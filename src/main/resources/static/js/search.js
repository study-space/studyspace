//현재 기기에서 위치정보를 가져온다.
var positionService = (function () {

    var that = this;

    var currentPosition = null;

    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            console.log(position);

            currentPosition = {
                latitude: position.coords.latitude,
                longitude: position.coords.longitude
            };
        });
    } else {
        alert("Geolocation is not supported by this browser.");
    }

    that.isPositionExist = function () {
        return currentPosition != null
    };

    that.getPosition = function () {
        return currentPosition;
    };

    return that;
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
        location.href = "/place?l=" + $(this).attr("data-position");
    });

    $(".btn-search-by-distance").on("click", function (e) {
        if (!positionService.isPositionExist()){
            alert("위치정보를 조회하고 있습니다.\n잠시후 다시 시도해주세요.");
        }else{
            var currentPosition = positionService.getPosition();
            location.href = "/place?d=" + $(this).attr("data-distance") + "&l=" + currentPosition.latitude + "," + currentPosition.longitude;
        }

    });
}
