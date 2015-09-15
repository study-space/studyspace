<#import "/_layout/baseLayout.ftl" as layout>

<#assign internalCss>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/bootstrap-social/4.10.1/bootstrap-social.min.css">
<style>
    .img-contributor {
        width: 200px;
    }
</style>
</#assign>

<#assign internalContent>

<h1>누가 만들었나요??</h1>

<div class="contributor panel panel-default">
    <div class="panel-body">
        <h2 class="media-heading">최한수</h2>

        <div class="media">
            <div class="media-left">
                <a href="#">
                    <img class="img-contributor media-object"
                         src="https://avatars0.githubusercontent.com/u/274195?v=3&s=460">
                </a>
            </div>
            <div class="media-body">
                <p>가나다라마바사아자차카타파하.</p>
                <div class="social">
                    <a class="btn btn-social btn-github btn-lg" href="https://github.com/evilimp">
                        <i class="fa fa-github"></i>
                    </a>

                </div>
            </div>
        </div>
    </div>

</div>

<div class="contributor panel panel-default">
    <div class="panel-body">
        <h2 class="media-heading">박세종</h2>

        <div class="media">
            <div class="media-left">
                <a href="#">
                    <img class="img-contributor media-object"
                         src="https://avatars3.githubusercontent.com/u/3116341?v=3&s=460">
                </a>

            </div>
            <div class="media-body">
                <p>가나다라마바사아자차카타파하.</p>
                <div class="social">
                    <a class="btn btn-social btn-github btn-lg" href="https://github.com/devsejong">
                        <i class="fa fa-github"></i>
                    </a>

                </div>

            </div>
        </div>
    </div>
</div>



</#assign>

<@layout.base content=internalContent css=internalCss/>