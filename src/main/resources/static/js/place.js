var internalLocation = null;

//현재 기기에서 위치정보를 가져온다.
(function () {
    if (navigator.geolocation) {
        navigator.geolocation.getCurrentPosition(function (position) {
            console.log(position);

            internalLocation = {
                latitude: position.coords.latitude,
                longitude: position.coords.longitude
            };
        });
    } else {
        alert("Geolocation is not supported by this browser.");
    }
})();

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

$(".btn-search-by-location").on("click", function (e) {
    location.href = "/place?l=" + $(this).attr("data-location");
});

$(".btn-search-by-distance").on("click", function (e) {
    if (internalLocation === null)
        alert("위치정보를 조회하고 있습니다.\n잠시후 다시 시도해주세요.");
    else
        location.href = "/place?d=" + $(this).attr("data-distance") + "&l=" + internalLocation.latitude + "," + internalLocation.longitude;
});