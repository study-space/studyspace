<!DOCTYPE html>
<#import "/spring.ftl" as spring />
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

</div>


<!-- script -->
<script src="//ajax.googleapis.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
</body>
</html>