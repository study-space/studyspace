<#import "/layout/searchLayerLayout.ftl" as layout>

<#assign internalContent>

<div class="map-wrapper">
    <div id="map" style="height:300px;"></div>
</div>

<div class="place-list-wrapper">
    <ul class="list-group">
        <li class="list-group-item">Cras justo odio</li>
        <li class="list-group-item">Dapibus ac facilisis in</li>
        <li class="list-group-item">Morbi leo risus</li>
        <li class="list-group-item">Porta ac consectetur ac</li>
        <li class="list-group-item">Vestibulum at eros</li>
    </ul>

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
