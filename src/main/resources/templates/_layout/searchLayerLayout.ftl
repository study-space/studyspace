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
            <!-- Nav tabs -->
            <ul class="tab-search-type nav nav-pills nav-justified" role="tablist">
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
                        <p class="search-description"><u>자주 찾는 장소</u></p>

                        <div class="btn-group btn-group-justified" role="group">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn-search-by-position btn btn-default"
                                        data-position="37.555242,126.937358">신촌
                                </button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn-search-by-position btn btn-default"
                                        data-position="37.540389,127.069236">건대
                                </button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn-search-by-position btn btn-default"
                                        data-position="37.497942,127.027621">강남
                                </button>
                            </div>
                        </div>
                        <div class="btn-group btn-group-justified" role="group">
                            <div class="btn-group" role="group">
                                <button type="button" class="btn-search-by-position btn btn-default"
                                        data-position="37.58208,127.001892">대학로
                                </button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn-search-by-position btn btn-default"
                                        data-position="37.556838,126.923774">홍대
                                </button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button" class="btn-search-by-position btn btn-default"
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
                    </div>
                </div><!--/#simpleSearch-->

                <div role="tabpanel" class="tab-pane" id="recentSearch">
                    <div class="list-group">
                        <button type="button" class="list-group-item">Cras justo odio</button>
                        <button type="button" class="list-group-item">Dapibus ac facilisis in</button>
                        <button type="button" class="list-group-item">Morbi leo risus</button>
                        <button type="button" class="list-group-item">Porta ac consectetur ac</button>
                        <button type="button" class="list-group-item">Vestibulum at eros</button>
                    </div>
                </div><!--//#recentSearch-->
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
