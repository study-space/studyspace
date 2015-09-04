<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>스터디장소 검색기</title>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!--Bootstrap-->
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
    <link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css">
</head>
<body>

<div class="container">

    <div class="place-list-wrapper">
        <table id="dynamic-table" class="table table-striped table-bordered table-hover">
            <thead>
                <tr>
                    <th>장소명</th>
                    <th>주소</th>
                    <th>연락처</th>
                    <th>url</th>
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
                    <td>${place.url!}</td>
                    <td>${place.location.longitude}</td>
                    <td>${place.location.latitude}</td>
                </tr>
                </#list>
            </#if>
            </tbody>
            <tfoot>
                <tr>
                    <td colspan="6"><a href="/management/place/form">장소추가</a></td>
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
</div>


<!-- script -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>