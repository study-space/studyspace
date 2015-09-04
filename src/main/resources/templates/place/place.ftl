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
        margin : 5px;
    }

    .place-description > dt {
        float: left;
        width: 3em;
        clear: both;
        margin-bottom : 5px;
    }
    .place-description > dd {
        margin-left: 3em;
        margin-bottom : 5px;
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
                <dd><address>${place.address}</address></dd>
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
        center: new daum.maps.LatLng(33.450701, 126.570667), //지도의 중심좌표.
        level: 3 //지도의 레벨(확대, 축소 정도)
    };

    var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴
</script>
</#assign>

<@layout.searchLayer title=title css=internalCss content=internalContent script=script/>
