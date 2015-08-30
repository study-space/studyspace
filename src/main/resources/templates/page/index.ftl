<#import "/layout/searchLayerLayout.ftl" as layout>

<#assign internalCss>
<link rel="stylesheet" href="//cdnjs.cloudflare.com/ajax/libs/vegas/2.1.3/vegas.min.css">
<style>
    html {
        position: relative;
        min-height: 100%;
    }

    body {
        margin-bottom: 60px;
        background-color: gray;
    }

    .index-content h1 {
        margin-top: 30%;
        font-size: 50px;
        color: #fff;
        text-shadow: 0 1px 3px rgba(0, 0, 0, .4), 0 0 30px rgba(0, 0, 0, .075);
    }

    .index-content .lead {
        color: #fff;
    }

    .footer-navi {
        position: fixed;
        left : 0;
        bottom: 0;
        width: 100%;
        background-color: rgba(0, 0, 0, .7);
        color: rgba(255, 255, 255, .2);
        height: 25px;
        padding-bottom: 5px;
        font-size: 15px;
        font: bold;
    }

</style>
</#assign>

<#assign internalContent>
<div class="index-content">
    <div class="text-center">
        <h1>Study Place</h1>

        <p class="lead">
            가까운 스터디룸을 찾아보세요.
        </p>
    </div>
</div>

<nav class="footer-navi">
    <div class="text-center">
        <a href="#">About Us</a> |
        <a href="#">Feedback</a>
    </div>
</nav>

</#assign>

<#assign internalScript>
<script src="//cdnjs.cloudflare.com/ajax/libs/vegas/2.1.3/vegas.min.js"></script>
<script>
    $('body').vegas({
        transitionDuration: 3000,
        delay: 10000,
        slides: [
            {src: '/img/background/1.jpg'},
            {src: '/img/background/2.png'},
            {src: '/img/background/3.jpg'}
        ],
        'overlay': {
            src: 'https://cdnjs.cloudflare.com/ajax/libs/vegas/2.1.3/overlays/06.png'
        }
    });
</script>
</#assign>

<@layout.searchLayer css=internalCss content=internalContent script=internalScript/>