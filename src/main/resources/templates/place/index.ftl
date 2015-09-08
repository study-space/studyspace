<#import "/_layout/searchLayerLayout.ftl" as layout>

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
        left: 0;
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
    var slides = [
        {src: '/img/index/bg1.jpg'},
        {src: '/img/index/bg2.jpg'},
        {src: '/img/index/bg3.jpg'},
        {src: '/img/index/bg4.jpg'},
        {src: '/img/index/bg5.jpg'},
        {src: '/img/index/bg6.jpg'}
    ];

    $('body').vegas({
        transitionDuration: 4000,
        delay: 12000,
        slides: _.shuffle(slides),
        overlay: {
            src: 'https://cdnjs.cloudflare.com/ajax/libs/vegas/2.1.3/overlays/06.png'
        },
        animationDuration : 30000,
        animation: [ 'kenburns', 'kenburnsUp', 'kenburnsDown', 'kenburnsLeft', 'kenburnsRight' ]
    });
</script>
</#assign>

<@layout.searchLayer css=internalCss content=internalContent script=internalScript/>