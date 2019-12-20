<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
        <meta name="description" content="">
        <meta name="author" content="">

        <title>Off Canvas Template for Bootstrap</title>

        <!-- Bootstrap core CSS -->
        <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="https://v3.bootcss.com/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

        <!-- Custom styles for this template -->
        <link href="https://v3.bootcss.com/examples/offcanvas/offcanvas.css" rel="stylesheet">

        <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
        <!--[if lt IE 9]><script src="https://v3.bootcss.com/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
        <script src="https://v3.bootcss.com/assets/js/ie-emulation-modes-warning.js"></script>

        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
        <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
        <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=wdZd8GgAQj28xQI1kUbllz3gPmuorZhB">
            //v3.0版本的引用方式：src="http://api.map.baidu.com/api?v=3.0&ak=您的密钥"
        </script>
        <script type="text/javascript" src="http://api.map.baidu.com/library/DrawingManager/1.4/src/DrawingManager_min.js&quot;"></script>
        <script type="text/javascript" src="http://api.map.baidu.com/library/SearchInfoWindow/1.4/src/SearchInfoWindow_min.js&quot;"></script>
        <![endif]-->
        <style type="text/css">
            html{height:100%}
            body{height:100%;margin:0px;padding:0px}
            #allmap{height:100%}
        </style>
    </head>
    <body>
        <nav class="navbar navbar-fixed-top navbar-inverse">
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="#">救援员个人面板</a>
                </div>
                <div id="navbar" class="collapse navbar-collapse">
                    <ul class="nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="jiuyuan_refactor.jsp">修改信息</a></li>
                    </ul>
                </div><!-- /.nav-collapse -->
            </div><!-- /.container -->
        </nav><!-- /.navbar -->

        <div id="allmap">
        </div>
    </body>
</html>
<script type="text/javascript">
    var map = new BMap.Map("allmap");

    var x = 116.32715863448607;
    var y = 39.990912172420714;
    var ggPoint = new BMap.Point(x,y);

    map.centerAndZoom(ggpoint, 11);
    map.addControl(new BMap.MapTypeControl({
        mapTypes:[
            BMAP_NORMAL_MAP,
            BMAP_HYBRID_MAP
        ]}));

    //添加gps marker和label
    var markergg = new BMap.Marker(ggPoint);
    //bm.addOverlay(markergg); //添加GPS marker
    map.enableScrollWheelZoom(true);

</script>


