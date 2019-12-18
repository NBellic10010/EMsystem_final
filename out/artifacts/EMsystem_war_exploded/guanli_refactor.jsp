<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/18
  Time: 0:13
  To change this template use File | Settings | File Templates.
--%>
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

    <title>Dashboard Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="https://cdn.bootcss.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
    <link href="https://v3.bootcss.com/assets/css/ie10-viewport-bug-workaround.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="https://v3.bootcss.com/examples/dashboard/dashboard.css" rel="stylesheet">

    <!-- Just for debugging purposes. Don't actually copy these 2 lines! -->
    <!--[if lt IE 9]><script src="https://v3.bootcss.com/assets/js/ie8-responsive-file-warning.js"></script><![endif]-->
    <script src="https://v3.bootcss.com/assets/js/ie-emulation-modes-warning.js"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
    <script src="https://cdn.bootcss.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>

    <![endif]-->

</head>
<body>
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">应急管理后台系统</a>
            </div>
            <div id="navbar" class="navbar-collapse collapse">
                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#">修改密码</a></li>
                    <li><a href="guanli_servlet">管理面板</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <%
                if(request.getAttribute("verify_ok") == null) {
            %>
            <form class="form-inline" action="verify_servlet" method="get">
                <div class="form-group">
                    <label for="oldpassword">请输入原密码</label>
                    <input type="text" class="form-control" id="oldpassword" name="oldpassword" placeholder="原密码">
                    <button class="btn btn-default btn-sm" type="submit">验证</button>
                </div>
            </form>
            <%
                }else {

            %>
            <form class="form-inline" action="guanli_refactor" method="GET">
                <div class="form-group">
                    <label for="password1">新密码</label>
                    <input type="password" class="form-control" id="password1" name="password1" placeholder="新密码">
                </div>
                <div class="form-group">
                    <label for="password2">再次输入新密码</label>
                    <input type="password" class="form-control" id="password2" name="password2" placeholder="新密码">
                </div>
                <div class="checkbox">
                    <label>
                        <input type="checkbox"> Check me out
                    </label>
                </div>
                <button type="submit" class="btn btn-default">Submit</button>
            </form>
            <%
                }
            %>
        </div>

    </div>
    <script>
        $(document).ready(function(){
            $("#oldpassword").blur(function(){
                var param=$("#oldpassword").val();
                $.ajax({
                    url:"${HttpPath}/user/checkoldpassword",
                    data:{oldpassword:param},
                    success:function(e){
                        if(e.code==1){
                            $("#tip1").html("<font color=\"green\" size=\"2\">  Correct</font>");
                        }
                        else{
                            $("#tip1").html("<font color=\"red\" size=\"2\">  Wrong</font>");
                        }
                    }
                });
            });
            $("#password1").blur(function(){
                var num=$("#password1").val().length;
                if(num<6){
                    $("#tip2").html("<font color=\"red\" size=\"2\">  too short</font>");
                }
                else if(num>18){
                    $("#tip2").html("<font color=\"red\" size=\"2\">  too long</font>");
                }
                else{
                    $("#tip2").html("<font color=\"green\" size=\"2\"> Accept</font>");
                }
            }) ;
            $("#password2").blur(function(){
                var tmp=$("#password1").val();
                var num=$("#password2").val().length;
                if($("#password2").val()!=tmp){
                    $("#tip3").html("<font color=\"red\" size=\"2\">  Wrong</font>");
                }
                else{
                    if(num>=6&&num<=18){
                        $("#tip3").html("<font color=\"green\" size=\"2\">  Correct</font>");
                    }
                    else{
                        $("#tip3").html("<font color=\"red\" size=\"2\">  invalid</font>");
                    }
                }
            });
            $("#btn").click(function(){
                let flag = true;
                var old=$("#oldpassword").val();
                var pass=$("#password1").val();
                var pass2=$("#password2").val();
                var num1=$("#password1").val().length;
                var num2=$("#password2").val().length;
                if(num1!=num2||num1<6||num2<6||num1>18||num2>18||pass!=pass2){
                    flag=false;
                }
                else{
                    flag=true;
                }
                if(flag){
                    $.ajax({
                        url:"${HttpPath}/user/editPassowrdyet",
                        data:{oldpassword:old,password:pass},
                        success:function(e){
                            if(e.code==1){
                                $("#tip4").show().html("<font color=\"green\" size=\"3\">  Edit Success!</font>");
                                $("#oldpassword").val("");
                                $("#password1").val("");
                                $("#password2").val("");
                                $("#tip1").empty();
                                $("#tip2").empty();
                                $("#tip3").empty();
                                $("#tip4").delay(2000).hide(0);
                            }
                            else{
                                $("#tip4").show().html("<font color=\"red\" size=\"3\">  OldPassword is Wrong!</font>");
                            }
                        }
                    });
                }
                else{

                    $("#tip4").show().html("<font color=\"red\" size=\"3\">  Please follow the tips!</font>");
                }
            });
        });
    </script>
</body>
</html>
