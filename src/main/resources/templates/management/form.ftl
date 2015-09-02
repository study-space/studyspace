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
            <label for="place.longitude">위도/경도</label>
            <@spring.bind "place.longitude" />
            <input type="text"
                   name="${spring.status.expression}"
                   value="${spring.status.value?default("")}" />
            /
            <@spring.bind "place.latitude" />
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
            <@spring.bind "place.id" />
            <input type="hidden"
                   name="${spring.status.expression}"
                   value="${spring.status.value?default("")}" />
            <button type="submit" class="btn btn-default">저장</button>
        </div>
    </form>
</#assign>

<@layout.base content=internalContent/>
