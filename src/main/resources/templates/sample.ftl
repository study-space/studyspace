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

    <div class="map-wrapper">
        <img src="http://cfs13.tistory.com/image/5/tistory/2008/11/25/23/49/492c106a94f75"/>
    </div>

    <div class="place-list-wrapper">
        <ul class="list-group">
            <li class="list-group-item">Cras justo odio</li>
            <li class="list-group-item">Dapibus ac facilisis in</li>
            <li class="list-group-item">Morbi leo risus</li>
            <li class="list-group-item">Porta ac consectetur ac</li>
            <li class="list-group-item">Vestibulum at eros</li>
        </ul>

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
<!-- /script-->
</body>
</html>