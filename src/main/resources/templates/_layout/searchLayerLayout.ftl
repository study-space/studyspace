<#import "./baseLayout.ftl" as layout>

<#macro searchLayer title="Study Place" css="" script="" content="">
    <#assign internalCss>
    <link rel="stylesheet" href="/css/search.css">
    ${css}

    </#assign>

    <#assign internalContent>

    <div class="search-wrapper">

        <div class="search-input input-group">
            <input type="text" class="input-place-search input-lg form-control" placeholder="공부할 장소를 찾아보세요...">
            <span class="input-group-btn">
                <button class="btn btn-default btn-lg" type="button">
                    <span class="glyphicon glyphicon-search" aria-hidden="true"></span>
                </button>
            </span>
        </div><!-- /input-group -->

        <div class="search-layer container" style="display: none">

            <div class="simple-search search-layer-body">
                <!-- 자주 찾는 장소 -->
                <div class="recommend-place">
                    <p class="search-description"><u>자주 찾는 장소</u></p>

                    <div class="btn-group btn-group-justified" role="group">
                        <div class="btn-group" role="group">
                            <button type="button"
                                    class="btn-search-by-position btn btn-default"
                                    data-query="신촌"
                                    data-position="37.555242,126.937358">신촌
                            </button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn-search-by-position btn btn-default"
                                    data-query="건대"
                                    data-position="37.540389,127.069236">건대
                            </button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn-search-by-position btn btn-default"
                                    data-query="강남"
                                    data-position="37.497942,127.027621">강남
                            </button>
                        </div>
                    </div>
                    <div class="btn-group btn-group-justified" role="group">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn-search-by-position btn btn-default"
                                    data-query="대학로"
                                    data-position="37.58208,127.001892">대학로
                            </button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn-search-by-position btn btn-default"
                                    data-query="홍대"
                                    data-position="37.556838,126.923774">홍대
                            </button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn-search-by-position btn btn-default"
                                    data-query="종로"
                                    data-position="37.5704239,126.9917678">종로
                            </button>
                        </div>
                    </div>
                </div>

                <!-- 거리순으로 보여주기 -->
                <div class="recommend-distance">
                    <p class="search-description"><u>현재 위치 기준</u></p>

                    <div class="btn-group btn-group-justified" role="group">
                        <div class="btn-group" role="group">
                            <button type="button" class="btn-search-by-distance btn btn-default"
                                    data-distance="300">300m
                            </button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn-search-by-distance btn btn-default"
                                    data-distance="700">700m
                            </button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button" class="btn-search-by-distance btn btn-default"
                                    data-distance="1500">1.5km
                            </button>
                        </div>
                    </div>
                </div><!--/#simpleSearch-->

                <div class="auto-complete-search search-layer-body">
                </div>


            </div><!--//.tab-content-->

            <div class="search-layer-footer text-right">
                <button type="button" class="btn-search-layer-close btn btn-default">닫기</button>
            </div>
        </div><!--//.search-layer-->

        <div class="search-layer-bg" style="display: none"></div>
    </div><!--//.search-wrapper-->

    ${content}

    </#assign>

    <#assign internalScript>
    <script src="/js/search.js"></script>
    ${script}
    </#assign>

    <@layout.base title=title content=internalContent script=internalScript css=internalCss/>
</#macro>
