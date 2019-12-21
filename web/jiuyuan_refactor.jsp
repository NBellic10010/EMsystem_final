
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
    <style>
        div.container {
            width: 50%;
            height: 100vh;
            position: center;
        }
    </style>
</head>
<body>
    <div class="container col-sm-offset-5" >
        <div class="col col-sm-offset-4 col-sm-5">
            <form class="form-signin" action="jiuyuan_dorefactor" method="GET" role="form" style="position: center">
                <input type="hidden" id="gonghao" name="gonghao" value="<%=request.getParameter("gonghao")%>">
                <div class="form-group">
                    <label for="xingming" class="sr-only">姓名</label>
                    <input type="text" id="xingming" class="form-control" name="xingming" placeholder="姓名" >
                </div>
                <div class="form-group">
                    <label for="danwei"class="sr-only">单位</label>
                    <input type="text" id="danwei" class="form-control" name="danwei" placeholder="单位" >
                </div>
                <div class="form-group">
                    <label for="dianhua" class="sr-only">电话</label>
                    <input type="text" id="dianhua" class="form-control" name="dianhua" placeholder="电话" >
                </div>
                <div class="form-group">
                    <label for="idnumber" class="sr-only">身份证</label>
                    <input type="text" id="idnumber" class="form-control" name="idnumber" placeholder="身份证" >
                </div>
                <div class="form-group">
                    <div class="row">
                        <button class="btn btn-sm btn-primary btn-block" type="submit">确认</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
