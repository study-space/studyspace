<#import "/_layout/searchLayerLayout.ftl" as layout>

<#assign internalCss>
<style>
    .place {
        border-bottom : dashd 1px black;
        margin-bottom : 5px;
    }
</style>
</#assign>

<#assign internalContent>

<div class="map-wrapper">
    <div id="map" style="height:300px;"></div>
</div>

<div class="place-list-wrapper">
    <ol class="place-list list-unstyled">
        <li class="place">
            <div>
                <div>
                    <h2>토즈 강남점</h2>
                </div>
                <span>324m</span>
            </div>
            <div>
                <div>
                    <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
                    02-222-2222
                </div>
                <div>
                    <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                    <a href="http://toz.com">toz.com</a>
                </div>
                <div>
                    <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
                    서울시 강남구 압구정동 992-233
                </div>
            </div>
        </li>

        <li class="place">
            <div>
                <div>
                    <h2>스터디장소</h2>
                </div>
                <span>324m</span>
            </div>
            <div>
                <div>
                    <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
                    02-222-2222
                </div>
                <div>
                    <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                    <a href="http://toz.com">toz.com</a>
                </div>
                <div>
                    <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
                    서울시 강남구 압구정동 992-233
                </div>
            </div>
        </li>

        <li class="place">
            <div>
                <div>
                    <h2>토즈 강남점</h2>
                </div>
                <span>324m</span>
            </div>
            <div>
                <div>
                    <span class="glyphicon glyphicon-phone" aria-hidden="true"></span>
                    02-222-2222
                </div>
                <div>
                    <span class="glyphicon glyphicon-globe" aria-hidden="true"></span>
                    <a href="http://toz.com">toz.com</a>
                </div>
                <div>
                    <span class="glyphicon glyphicon-map-marker" aria-hidden="true"></span>
                    서울시 강남구 압구정동 992-233
                </div>
            </div>
        </li>
    </ol>

    <div class="pagenation">
        <nav>
            <ul class="pagination">
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

<@layout.searchLayer title=title content=internalContent script=script/>
