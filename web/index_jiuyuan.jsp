<%@ page import="com.emsys.pojo.jiuyuan" %>
<%@ page import="com.emsys.pojo.daiban" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.emsys.pojo.renwu" %>
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
  <style type="text/css">
    html{height:100%}
    body{height:100%;margin:0px;padding:0px}
    div.container{height:100%;width: 100%;margin-left: 1px}
    #container{height: 100%;width: 100%}
  </style>
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
  <![endif]-->
  <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=wdZd8GgAQj28xQI1kUbllz3gPmuorZhB">
    //v3.0版本的引用方式：src="http://api.map.baidu.com/api?v=3.0&ak=您的密钥"
  </script>
  <script src="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>
  <script src="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.all.min.js"></script>
  <link href="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.css" rel="stylesheet">
  <script src="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.js"></script>
  <link href="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.min.css" rel="stylesheet">
  <script src="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
  <%
    HttpSession s = request.getSession();
    if(s.getAttribute("id_jiuyuan") == null) response.sendRedirect("start.jsp");
    else {
      jiuyuan g = (jiuyuan) s.getAttribute("id_jiuyuan");
      int count = 0;

  %>
  <style type="text/css">
    　　 a:link { text-decoration: none;color: black}
    　　 a:active { text-decoration:blink}
    　　 a:hover { text-decoration:underline;color: #3c3c3c}
    　　 a:visited { text-decoration: none;color: black}
  </style>
  <link href="${pageContext.request.contextPath}/file/sidebar.css" rel="stylesheet">
</head>

<body>
<%
  List<daiban> l_daiban = (ArrayList<daiban>)request.getAttribute("daiban_list");
  List<renwu> l_renwu = ((ArrayList<renwu>)request.getAttribute("renwu_list"));
%>
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
  <div id="viewport" class="col col-sm-3">
    <div id="sidebar">
      <header>
        <a href="#"><h2><b>我的待办事项</b></h2></a>
      </header>
      <ul class="nav">
        <%
          int ct = 0;
          for(daiban d: l_daiban) {
            ++ct;
        %>
        <li>
          <a href="#" onclick="show(<%=ct%>)">
            <i class="zmdi"></i> <b>待办#<%=ct%></b>&nbsp;主题：<%=d.getZhuti()%>
          </a>
        </li>
        <%
          }
        %>
      </ul>

    </div>
  </div>
</nav><!-- /.navbar -->

<div class="container">

  <div class="row" style="margin-left: 0">
    <div class="col-xs-12 col-sm-12">
      <p class="pull-right visible-xs">
        <button type="button" class="btn btn-primary btn-xs" data-toggle="offcanvas">Toggle nav</button>
      </p>

        <div id="container"></div>
        <script type="text/javascript">
          var renwuArr = [];
          <%
            for(renwu r: l_renwu) {
          %>
          var point = {
            x: <%=r.getX()%>,
            y: <%=r.getY()%>,
            description:"<%=r.getMiaoshu()%>"
          };
          renwuArr.push(point);
          <%
              }
          %>
          //地图初始化
          var bm = new BMap.Map("container");
          var ipoint = new BMap.Point(renwuArr[0].x, renwuArr[0].y);
          bm.centerAndZoom("中国", 5);
          bm.addControl(new BMap.NavigationControl());
          bm.enableScrollWheelZoom(true);

          //添加gps marker和labe
          //bm.addOverlay(markergg); //添加GPS marker

          function addmarker(renwuArr) {
            //循环建立标注点
            for(var i=0, pointsLen = renwuArr.length; i < pointsLen; i++) {
              var point = new BMap.Point(renwuArr[i].x, renwuArr[i].y); //将标注点转化成地图上的点
              var marker = new BMap.Marker(point); //将点转化成标注点
              bm.addOverlay(marker);  //将标注点添加到地图上
              //添加监听事件
              (function() {
                var thePoint = renwuArr[i];
                marker.addEventListener("click",
                        //显示信息的方法
                        function() {
                          showInfo(this,thePoint);
                        });
              })();
              var label = new BMap.Label("",{offset:new BMap.Size(20,-10)});
            }
          }
          //坐标转换完之后的回调函数

          function showInfo(thisMarker,point) {
            //获取点的信息
            var sContent =
                    '<ul style="margin:0 0 5px 0;padding:0.2em 0">'
                    +'<li style="line-height: 26px;font-size: 15px;">'
                    +'<span style="width: 50px;display: inline-block;">x：</span>' + point.x + '</li>'
                    +'<li style="line-height: 26px;font-size: 15px;">'
                    +'<span style="width: 50px;display: inline-block;">y：</span>' + point.y + '</li>'
                    +'<li style="line-height: 26px;font-size: 15px;">'
                    +'<span style="width: 50px;display: inline-block;">描述：</span>' + point.description + '</li>'
                    +'</ul>';
            var infoWindow = new BMap.InfoWindow(sContent); //创建信息窗口对象
            thisMarker.openInfoWindow(infoWindow); //图片加载完后重绘infoWindow
          }

        addmarker(renwuArr);
        </script>

    </div>

  </div>
  <form method="post" action="jiuyuan_servlet" id="passForm" name="passForm">
    <input id = "index" type="hidden" name="index" value="0">
  </form>
  <script>
    function show(ct) {
      var form = document.forms["passForm"];
      form.index.value = ct;
      //var formObj = document.getElementById('passForm');
      $.ajax(
              {
                type:"POST",
                url:"jiuyuan_servlet",
                data:$('#passForm').serialize()
              }
      );
      <%String index = request.getParameter("index");
      System.out.println("index:" + index);
        if(index == null) index = "1";
      %>
      Swal.fire({
        title: '待办事项#' + ct,
        text: '<%=l_daiban.get(Integer.parseInt(index) - 1).getNeirong()%>',
        confirmButtonText: '完毕'
      });
    }
  </script>
</div>

  <hr>

  <%
    }
  %>

</div><!--/.container-->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="https://v3.bootcss.com/assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="https://v3.bootcss.com/assets/js/ie10-viewport-bug-workaround.js"></script>
<script src="https://v3.bootcss.com/examples/offcanvas/offcanvas.js"></script>
</body>
</html>

