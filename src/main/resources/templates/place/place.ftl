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
        padding: 10px;
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

    <ul class="place-list list-unstyled">
        <#list placeList as place>
            <li class="place" data-placeId="${place.id}">
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
    var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
    var options = { //지도를 생성할 때 필요한 기본 옵션
        center: new daum.maps.LatLng(${currentLocation.longitude?c}, ${currentLocation.latitude?c}), //지도의 중심좌표.
        level: 5 //지도의 레벨(확대, 축소 정도)
    };

    var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
    map.setDraggable(false);
    map.setZoomable(false);


    // 버튼을 클릭하면 아래 배열의 좌표들이 모두 보이게 지도 범위를 재설정합니다
    var points = [
        {
            markerType: "SELF",
            location : new daum.maps.LatLng(${currentLocation.longitude?c}, ${currentLocation.latitude?c})
        },
        <#list placeList as place>
            {
                markerType: "PLACE",
                name : "${place.name}",
                location : new daum.maps.LatLng(${place.location.longitude?c}, ${place.location.latitude?c})
            },
        </#list>
    ];

    // 지도를 재설정할 범위정보를 가지고 있을 LatLngBounds 객체를 생성합니다
    var bounds = new daum.maps.LatLngBounds();

    var i, marker;
    for (i = 0; i < points.length; i++) {
        // 배열의 좌표들이 잘 보이게 마커를 지도에 추가합니다
        var point = points[i];

        marker = new daum.maps.Marker({position: point.location});
        marker.setMap(map);

        // 인포윈도우를 생성합니다
        if(point.markerType === "PLACE"){
            var infowindow = new daum.maps.InfoWindow({
                position : point.location,
                content : '<div style="padding:5px;">'+points[i].name+'</div>'
            });

            // 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
            infowindow.open(map, marker);
        }

        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(point.location);
    }

    function setBounds() {
        // LatLngBounds 객체에 추가된 좌표들을 기준으로 지도의 범위를 재설정합니다
        // 이때 지도의 중심좌표와 레벨이 변경될 수 있습니다
        map.setBounds(bounds);
    }

    setBounds();

</script>
</#assign>

<@layout.searchLayer title=title css=internalCss content=internalContent script=script/>
