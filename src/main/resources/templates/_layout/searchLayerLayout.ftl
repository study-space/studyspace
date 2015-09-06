<#import "./baseLayout.ftl" as layout>

<#macro searchLayer title="Study Place" css="" script="" content="">

    <#assign internalCss>
    <style>
        .search-layer {
            position: absolute;
            background-color: #fff;
            z-index: 999;
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
                        <a href="#simpleSearch" class="btn-search-type" aria-controls="simpleSearch" role="tab"
                           data-toggle="tab">
                            간편검색
                        </a>
                    </li>
                    <li role="presentation">
                        <a href="#recentSearch" class="btn-search-type" aria-controls="recentSearch" role="tab"
                           data-toggle="tab">
                            최근검색
                        </a>
                    </li>
                </ul>

                <!-- Tab panes -->
                <div class="tab-content">
                    <div role="tabpanel" class="tab-pane active" id="simpleSearch">
                        <!-- 자주 찾는 장소 -->
                        <div class="recommend-place">
                            <button type="button" class="btn-search-by-location btn btn-primary btn-sm"
                                    data-location="37.555242,126.937358">신촌
                            </button>
                            <button type="button" class="btn-search-by-location btn btn-primary btn-sm"
                                    data-location="37.540389,127.069236,17">건대
                            </button>
                            <button type="button" class="btn-search-by-location btn btn-primary btn-sm"
                                    data-location="37.497942,127.027621">강남
                            </button>
                            <button type="button" class="btn-search-by-location btn btn-primary btn-sm"
                                    data-location="37.58208,127.001892">대학로
                            </button>
                        </div>

                        <!-- 거리순으로 보여주기 -->
                        <div class="recommend-distance">
                            <button type="button" class="btn-search-by-distance btn btn-primary btn-sm"
                                    data-distance="300">300m
                            </button>
                            <button type="button" class="btn-search-by-distance btn btn-primary btn-sm"
                                    data-distance="700">700m
                            </button>
                            <button type="button" class="btn-search-by-distance btn btn-primary btn-sm"
                                    data-distance="1500">1.5km
                            </button>
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
    </script>

    ${script}
    </#assign>

    <@layout.base title=title content=internalContent script=internalScript css=internalCss/>
</#macro>
