<#import "/spring.ftl" as spring/>
<#import "/_layout/baseLayout.ftl" as layout>

<#assign internalContent>
    <form action="/management/place/save" method="post">
        <div class="form-group">
            <label for="place.name">장소명</label>
            <@spring.bind "place.name" />
            <input type="text"
                   name="${spring.status.expression}"
                   value="${spring.status.value?default("")}" />
        </div>
        <div class="form-group">
            <label for="place.address">주소</label>
            <@spring.bind "place.address" />
            <input type="text"
                   name="${spring.status.expression}"
                   value="${spring.status.value?default("")}" />
        </div>
        <div class="form-group">
            <label for="place.location.longitude">위도/경도</label>
            <@spring.bind "place.location.longitude" />
            <input type="text"
                   name="${spring.status.expression}"
                   value="${spring.status.value?default("")}" />
            /
            <@spring.bind "place.location.latitude" />
            <input type="text"
                   name="${spring.status.expression}"
                   value="${spring.status.value?default("")}" />
        </div>
        <div class="form-group">
            <label for="place.telephoneNumber">연락처</label>
            <@spring.bind "place.telephoneNumber" />
            <input type="text"
                   name="${spring.status.expression}"
                   value="${spring.status.value?default("")}" />
        </div>

        <div class="form-group">
            <label for="place.telephoneNumber">URL</label>
            <@spring.bind "place.url" />
            <input type="text"
                   name="${spring.status.expression}"
                   value="${spring.status.value?default("")}" />
        </div>
        <div class="form-group">
            <@spring.bind "place.id" />
            <input type="hidden"
                   name="${spring.status.expression}"
                   value="${spring.status.value?default("")}" />
            <button type="submit" class="btn btn-default">저장</button>
            <a href="/management/places">목록</a>
        </div>
    </form>
</#assign>

<@layout.base content=internalContent/>
