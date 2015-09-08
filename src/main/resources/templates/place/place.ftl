<#import "/_layout/searchLayerLayout.ftl" as layout>

<#assign internalCss>
<style>
    .place {
        list-style-position: inside;
        border: 1px solid black;
        padding: 10px;
        margin: 5px;
    }

    .place-header {
        padding: 10px;`
        border-bottom: 1px dotted black;
    }

    .place-name {
        display: inline;
    }

    .place-description {
        overflow: hidden;
        font-size: 1.2em;
        margin: 5px;
    }

    .place-description > dt {
        float: left;
        width: 3em;
        clear: both;
        margin-bottom: 5px;
    }

    .place-description > dd {
        margin-left: 3em;
        margin-bottom: 5px;
    }
</style>
</#assign>

<#assign internalContent>

<div class="map-wrapper">
    <div id="map" style="height:300px;"></div>
</div>

<div class="place-search-result">
    <div class="panel panel-default">
        <div class="panel-body">
            주변의 스터디룸 12개를 찾았습니다.
        </div>
    </div>

    <div class="current-position" data-locationLat="${requestLocation.latitude?c}"
         data-locationLon="${requestLocation.longitude?c}" style="display:none"></div>

    <ul class="place-list list-unstyled">

        <#list placeList as place>
            <li class="place"
                data-placeId="${place.id}"
                data-placeLat="${place.position.latitude?c}"
                data-placeLon="${place.position.longitude?c}"
                data-placeName="${place.name}"
                data-placeType="PLACE">

                <div class="place-header">
                    <h3 class="place-name">${place.name}</h3>
                <span>
                    <#if place.distance gt 1000 >
                    ${(place.distance / 1000)?string["0.##"]}km
                    <#else>
                    ${place.distance / 1000}m
                    </#if>
                </span>
                    <button class="pull-right btn btn-default btn-sm">
                        <span class="glyphicon glyphicon-modal-window"></span>
                        상세보기
                    </button>
                </div>
                <dl class="place-description">
                    <dt><span class="glyphicon glyphicon-phone" aria-hidden="true"></span></dt>
                    <dd><a href="tel:${place.telephoneNumber}">${place.telephoneNumber}</a></dd>

                    <#if place.url?has_content>
                        <dt><span class="glyphicon glyphicon-globe" aria-hidden="true"></span></dt>
                        <dd><a href="${place.url}">${place.url}</a></dd>
                    </#if>

                    <dt><span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span></dt>
                    <dd>
                        <address>${place.address}</address>
                    </dd>
                </dl>
            </li>
        </#list>
    </ul>

    <div class="pagenation-wrapper text-center">
        <nav>
            <ul class="pagination pagination-lg">
                <li>
                    <a href="#" aria-label="Previous">
                        <span aria-hidden="true">&laquo;</span>
                    </a>
                </li>
                <li><a href="#">1</a></li>
                <li><a href="#">2</a></li>
                <li><a href="#">3</a></li>
                <li><a href="#">4</a></li>
                <li><a href="#">5</a></li>
                <li>
                    <a href="#" aria-label="Next">
                        <span aria-hidden="true">&raquo;</span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>

</div>

</#assign>

<#assign script>
<script src="//apis.daum.net/maps/maps3.js?apikey=6d75c4dcd7552ffe62ee38c84d5487a1"></script>
<script>
    (function () {
        var map = null;

        var initializeMap = function () {
            map = createMap();

            //요청 위치를 가져온다.
            var requestLocation = getRequestLocation();
            //장소 리스트를 가져온다.
            var places = getPlaces();

            putMapMarkers(map, requestLocation, places);
            setMapBounds(map, requestLocation, places);
        };

        var createMap = function () {
            var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
            //지도를 생성할 때 필요한 기본 옵션
            var options = {
                center: new daum.maps.LatLng(${requestLocation.latitude?c}, ${requestLocation.longitude?c}), //지도의 중심좌표.
            };

            var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

            map.setDraggable(false);
            map.setZoomable(false);

            return map;
        };

        var getRequestLocation = function () {
            var $requestLocation = $(".current-position");

            return new daum.maps.LatLng(
                    $requestLocation.attr("data-locationLat"),
                    $requestLocation.attr("data-locationLon")
            );
        };

        var getPlaces = function () {
            var $places = $("ul.place-list > li.place");
            var places = [];

            for (var i = 0; i < $places.length; i++) {
                var $place = $($places[i]);

                var place = {
                    id: $place.attr("data-placeId"),
                    name: $place.attr("data-placeName"),
                    position: new daum.maps.LatLng(
                            $place.attr("data-placeLat"),
                            $place.attr("data-placeLon")
                    )
                };

                places.push(place);
            }
            return places;
        };

        var putMapMarkers = function (map, requestLocation, places) {
            // 요청 위치 표기
            new daum.maps.Marker({position: requestLocation}).setMap(map);

            // 장소 마커 및 윈도우 표기
            for (var i = 0; i < places.length; i++) {
                // 배열의 좌표들이 보이게 마커를 지도에 추가합니다
                var place = places[i];
                var marker = new daum.maps.Marker({position: place.position});
                marker.setMap(map);

                // 인포윈도우를 생성합니다
                new daum.maps.InfoWindow({
                    position: place.position,
                    content: '<div style="padding:5px;">' + place.name + '</div>'
                }).open(map, marker);
            }
        };

        var setMapBounds = function (map, requestLocation, places) {
            // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
            var bounds = new daum.maps.LatLngBounds();

            bounds.extend(requestLocation);

            for (var i = 0; i < places.length; i++) {
                // LatLngBounds 객체에 좌표를 추가합니다
                bounds.extend(places[i].position);
            }

            map.setBounds(bounds);
        };

        initializeMap();
    })();
</script>

</#assign>

<@layout.searchLayer title=title css=internalCss content=internalContent script=script/>
