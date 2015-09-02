<div class="<#import "/_layout/baseLayout.ftl" as layout>

<#assign internalContent>

<div class="place-list-wrapper">
    <table id="dynamic-table" class="table table-striped table-bordered table-hover">
        <thead>
        <tr>
            <th>장소명</th>
            <th>주소</th>
            <th>연락처</th>
            <th>위도</th>
            <th>경도</th>
        </tr>
        </thead>
        <tbody>
            <#if placeList?size != 0 >
                <#list placeList as place>
                <tr>
                    <td><a href="/management/place/form?p=${place.id}">${place.name}</a></td>
                    <td>${place.address}</td>
                    <td>${place.telephoneNumber}</td>
                    <td>${place.longitude}</td>
                    <td>${place.latitude}</td>
                </tr>
                </#list>
            </#if>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="5"><a href="/management/place/form">장소추가</a></td>
        </tr>
        </tfoot>
    </table>


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

<@layout.base content=internalContent/>

