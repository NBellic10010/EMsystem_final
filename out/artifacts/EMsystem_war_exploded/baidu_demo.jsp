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
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=3.0&ak=wdZd8GgAQj28xQI1kUbllz3gPmuorZhB">
        //v3.0版本的引用方式：src="http://api.map.baidu.com/api?v=3.0&ak=您的密钥"
    </script>
</head>

<body>
<div id="container"></div>
<script type="text/javascript">
    var map = new BMap.Map("container");
    // 创建地图实例
    //var point = new BMap.Point(116.404, 39.915);
    // 创建点坐标
    //map.centerAndZoom(point, 15);
    // 初始化地图，设置中心点坐标和地图级别
    // 百度地图API功能
    //GPS坐标
    var x = 116.32715863448607;
    var y = 39.990912172420714;
    var ggPoint = new BMap.Point(x,y);

    //地图初始化
    var bm = new BMap.Map("container");
    bm.centerAndZoom(ggPoint, 15);
    bm.addControl(new BMap.NavigationControl());

    //添加gps marker和label
    var markergg = new BMap.Marker(ggPoint);
    //bm.addOverlay(markergg); //添加GPS marker

    //坐标转换完之后的回调函数
    translateCallback = function (data){
        if(data.status === 0) {
            var marker = new BMap.Marker(data.points[0]);
            bm.addOverlay(marker);
            var label = new BMap.Label("",{offset:new BMap.Size(20,-10)});
            marker.setLabel(label); //添加百度label
            bm.setCenter(data.points[0]);
        }
    }

    setTimeout(function(){
        var convertor = new BMap.Convertor();
        var pointArr = [];
        pointArr.push(ggPoint);
        convertor.translate(pointArr, 1, 5, translateCallback)
    }, 1000);
</script>
</body>
</html>
