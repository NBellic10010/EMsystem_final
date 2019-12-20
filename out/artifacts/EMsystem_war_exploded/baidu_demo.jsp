<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Hello, World</title>
    <style type="text/css">
        html{height:100%}
        body{height:100%;margin:0px;padding:0px}
        #container{height:100%}
    </style>
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="https://v3.bootcss.com/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://v3.bootcss.com/examples/offcanvas/offcanvas.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="https://v3.bootcss.com/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="https://v3.bootcss.com/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]-->
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
      <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=wdZd8GgAQj28xQI1kUbllz3gPmuorZhB">
          //v3.0版本的引用方式：src="http://api.map.baidu.com/api?v=3.0&ak=您的密钥"
      </script>
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
    <div id="container"></div>
  <%
        double x = 116;
        double y = 39;
  %>
    <script type="text/javascript">
        var map = new BMap.Map("container");

        var x = <%=x%>;
        var y = <%=y%>;
        var ggPoint = new BMap.Point(x,y);
        var mmpoint = new BMap.Point(x+1, y+1)

        //地图初始化
        var bm = new BMap.Map("container");
        bm.centerAndZoom(ggPoint, 15);
        bm.addControl(new BMap.NavigationControl());
        bm.enableScrollWheelZoom(true);

        //添加gps marker和label
        var markergg = new BMap.Marker(ggPoint);
        var markermm = new BMap.Marker(mmpoint);
        //bm.addOverlay(markergg); //添加GPS marker

        //坐标转换完之后的回调函数
        translateCallback = function (data){
            if(data.status === 0) {
                var marker = new BMap.Marker(data.points[0]);
                bm.addOverlay(marker);
                var marker1 = new BMap.Marker(data.points[1]);
                bm.addOverlay(marker1);
                var label = new BMap.Label("",{offset:new BMap.Size(20,-10)});
                marker.setLabel(label); //添加百度label
                bm.setCenter(data.points[0]);
            }
        };

        setTimeout(function(){
            var convertor = new BMap.Convertor();
            var pointArr = [];
            pointArr.push(ggPoint);
            pointArr.push(mmpoint);
            convertor.translate(pointArr, 1, 5, translateCallback)
        }, 1000);
    </script>
</body>
</html>
