<#import "./baseLayout.ftl" as layout>

<#macro searchLayer title="Study Place" css="" script="" content="">

    <#assign internalCss>
    <style>
        .search-layer {
            position: absolute;
            background-color: #fff;
            z-index : 999;
        }
    </style>
    ${css}
    </#assign>

    <#assign internalContent>

    <div class="search-wrapper">

        <div class="input-group">
            <input type="text" class="input-place-search form-control" placeholder="Search for...">
            <span class="input-group-btn">
                <button class="btn btn-default" type="button">Go!</button>
            </span>
        </div><!-- /input-group -->

        <div class="search-layer" style="display:none">
            <div class="container">
                <!-- Nav tabs -->
                <ul class="tab-search-type nav nav-tabs" role="tablist">
                    <li role="presentation" class="active">
                        <a href="#simpleSearch" aria-controls="simpleSearch" role="tab" data-toggle="tab">
                            간편검색
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#recentSearch" aria-controls="recentSearch" role="tab" data-toggle="tab">
                            최근검색
                        </a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="simpleSearch">
                        <!-- 자주 찾는 장소 -->
                        <div class="recommend-place">
                            <a class="btn-search button" href="/place?q=신촌역&l=37.555242,126.937358">신촌</a>
                            <a class="btn-search button" href="/place?q=홍대입구역&l=37.556838,126.923774">홍대</a>
                            <a class="btn-search button" href="/place?q=강남역&l=37.497942,127.027621">강남</a>
                            <a class="btn-search button" href="/place?q=대학로&l=37.5781487,127.0005132">대학로</a>
                            <a class="btn-search button" href="/place?q=건대입구역&l=37.540389,127.069236">건대</a>
                        </div>

                        <!-- 거리순으로 보여주기 -->
                        <div class="recommend-distance">
                            <a class="btn-search button" href="/place?d=300&l=37.5587855,127.00156049999998">300m</a>
                            <a class="btn-search button" href="/place?d=500&l=37.5587855,127.00156049999998">500m</a>
                            <a class="btn-search button" href="/place?d=1000&l=37.5587855,127.00156049999998">1km</a>
                        </div>
                    </div><!--/#simpleSearch-->

                    <div role="tabpanel" class="tab-pane" id="recentSearch">
                        <ul class="search-history">
                            <li>
                                <a class="btn-search button" href="/place?q=건대">건대</a>
                            </li>
                            <li>
                                <a class="btn-search button" href="/place?q=건대">건대</a>
                            </li>
                            <li>
                                <a class="btn-search button" href="/place?q=건대">건대</a>
                            </li>
                        </ul>
                    </div><!--/#recentSearch-->
                </div><!--/.tab-content-->
            </div><!--/.container-->
        </div><!--/.search-layer-->
    </div>

    ${content}

    </#assign>

    <#assign internalScript>
    <script>

        //현재 기기에서 위치정보를 가져온다.
        (function () {
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    console.log(position);
                    var message ="";
                    message += "위치정보 조회완료\n";
                    message += "Latitude: " + position.coords.latitude + "\n";
                    message += "Longitude: " + position.coords.longitude;

                    console.log(message);
                });
            } else {
                alert("Geolocation is not supported by this browser.");
            }
        })();

        $(".input-place-search").on("focus", function () {
            $(".search-layer").show();
        });

        $('.tab-search-type a').on("click", function (e) {
            e.preventDefault();
            $(this).tab('show');
        });

    </script>

    ${script}
    </#assign>

    <@layout.base title=title content=internalContent script=internalScript css=internalCss/>

</#macro>
