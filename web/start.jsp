<%@ page import="java.awt.*" %>
<%@ page import="java.util.Random" %>
<%@ page import="javax.imageio.ImageIO" %>
<%@ page import="java.awt.image.BufferedImage" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- 上述3个meta标签*必须*放在最前面，任何其他内容都*必须*跟随其后！ -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="https://v3.bootcss.com/favicon.ico">

    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="https://v3.bootcss.com//assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://v3.bootcss.com/examples/signin/signin.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="https://v3.bootcss.com//assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="https://v3.bootcss.com//assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style>
        body {
            background-image: url("https://ss3.bdstatic.com/70cFv8Sh_Q1YnxGkpoWK1HF6hhy/it/u=1592610894,1953140181&fm=15&gp=0.jpg");
        }
    </style>
    <script src="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.all.js"></script>
    <script src="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.all.min.js"></script>
    <link href="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.js"></script>
    <link href="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.min.css" rel="stylesheet">
    <script src="https://cdn.bootcss.com/limonte-sweetalert2/8.11.8/sweetalert2.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/core-js/2.4.1/core.js"></script>
</head>

<body>

<div class="container">
    <div class="col col-sm-8">

    </div>
    <div class="col col-sm-4">
        <form class="form-signin" action="loginservlet" method="GET" role="form">
            <h2 class="form-signin-heading">请登录</h2>
            <div class="form-group">
                <label for="gonghao" class="sr-only">工号</label>
                <input type="text" id="gonghao" class="form-control" name="gonghao" placeholder="工号" value="1">
            </div>

            <div class="form-group">
                <label for="mima" class="sr-only">密码</label>
                <input type="password" id="mima" class="form-control" name="mima" placeholder="密码" value="123">
            </div>

            <div class="form-group col-sm-offset-1">
                <div class="row">
                    <div class="radio-inline col-sm-5">
                        <label>
                            <input type="radio" name="optionsRadios" id="optionsRadios1" value="option2"> 救援者
                        </label>
                    </div>
                    <div class="radio-inline col-sm-5">
                        <label>
                            <input type="radio" name="optionsRadios" id="optionsRadios2" value="option1" checked> 管理员
                        </label>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <button class="btn btn-sm btn-primary btn-block" type="submit">登录</button>
                    <a class="btn btn-sm btn-primary btn-block" href="signup.jsp">注册为救援者！</a>
                </div>
            </div>

        </form>
    </div>


</div> <!-- /container -->
    <%
        String info = "";
        if(request.getAttribute("errorinfo") != null) {
            info += (String)request.getAttribute("errorinfo");
        }
        request.removeAttribute("errorinfo");
    %>

<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="https://v3.bootcss.com//assets/js/ie10-viewport-bug-workaround.js"></script>
<script>
    var info = '<%=info%>';
    if(info !== '') error();
    function error() {
        Swal.fire({
            icon: 'error',
            title: '哎呀……',
            text: '<%=info%>',
        });
    }
</script>
</body>
</html>
