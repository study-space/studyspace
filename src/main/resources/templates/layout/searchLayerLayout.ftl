<#import "/layout/baseLayout.ftl" as layout>

<#macro searchLayer title="Study Place" css="" script="" content="">

    <#assign internalContent>

    <div class="search-wrapper">
        <div class="input-group">
            <input type="text" class="form-control" placeholder="Search for...">
            <span class="input-group-btn">
                <button class="btn btn-default" type="button">Go!</button>
            </span>
        </div><!-- /input-group -->

        <div class="search-layer hidden">
            <div class="search-recommend">
                <!-- 자주 찾는 장소 -->
                <div class="recommend-place">
                    <a class="button" href="/search?q=신촌">신촌</a>
                    <a class="button" href="/search?q=홍대">홍대</a>
                    <a class="button" href="/search?q=강남">강남</a>
                    <a class="button" href="/search?q=대학로">대학로</a>
                    <a class="button" href="/search?q=건대">건대</a>
                </div>

                <!-- 거리순으로 보여주기 -->
                <div class="recommend-distance">
                    <a class="button" href="/search?d=300">300m</a>
                    <a class="button" href="/search?d=500">500m</a>
                    <a class="button" href="/search?d=1000">1km</a>
                </div>
            </div>

            <!-- test-->
            <div class="search-history">
                <div>가가가가</div>
                <div>나나나나</div>
                <div>다다다다</div>
                <div>라라라라</div>
                <div>마마마마</div>
            </div>
        </div>
    </div>

    ${content}

    </#assign>

    <@layout.base title=title content=internalContent script=script css=css/>

</#macro>
