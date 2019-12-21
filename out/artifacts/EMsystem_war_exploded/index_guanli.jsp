<%@ page import="com.emsys.pojo.gunali" %>
<%@ page import="com.emsys.pojo.jiuyuan" %>
<%@ page import="java.util.ArrayList" %>
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
    <style>
        h1 {
            text-decoration-style: dashed;
        }

    </style>
</head>

<body>
<%
    HttpSession s = request.getSession();
    gunali d = null;
    if(s.getAttribute("id_guanli") == null) response.sendRedirect("start.jsp");
    else{
        d = (gunali)s.getAttribute("id_guanli");
    }
    assert d != null;%>
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
                <li><a href="guanli_refactor.jsp">修改密码</a></li>
                <li><a href="guanli_servlet">管理面板</a></li>
                <li><a href="signup.jsp">新增救援者信息</a></li>
            </ul>
            <form class="navbar-form navbar-right" action="search_servlet">
                <label>
                    <input type="text" class="form-control" placeholder="输入工号或姓名" name="query">
                </label>
                <button onclick="search()" type="submit" id="search">查询</button>
            </form>
        </div>
    </div>
</nav>
<form action="index_guanli.jsp" id="dumform">
    <input id="gonghao_dispatch" type="hidden" name="gonghao_dispatch">
</form>
<form action="guanli_servlet" id="dumform2">
    <input id="show" type="hidden" name="show" value="">
    <input id="gonghao_renwu" type="hidden" name="gonghao_renwu" value="-1">
</form>
<script>
    function dispatch(gonghao) {
        var form = document.forms['renwuform'];
        //document.getElementById('gonghao_renwu').setAttribute("value", gonghao);
        form.setAttribute('style', 'height: 51px');
        document.getElementById('x').setAttribute('type', 'text');
        document.getElementById('y').setAttribute('type', 'text');
        document.getElementById('description').setAttribute('type', 'text');
        document.getElementById('submit').setAttribute('style', 'visibility: visible');
        document.getElementById('cancel').setAttribute('style', 'visibility: visible');
        document.getElementById('jiuyuan_gonghao').setAttribute("value", gonghao);
         $.ajax(
         {
            type: 'POST',
            url: "guanli_servlet",
            data: $('#dumform2').serialize()
        }
         );
    }

    function submit(gonghao) {
        $.ajax(
            {
                url: 'renwu_servlet',
                type: 'post',
                data: $('#hiddenform' + gonghao).serialize()
            }
        )
    }

    function quxiao() {
        var form = document.forms['renwuform'];
        //document.getElementById('gonghao_renwu').setAttribute("value", gonghao);
        form.setAttribute('style', 'height: 0');
        document.getElementById('x').setAttribute('type', 'hidden');
        document.getElementById('y').setAttribute('type', 'hidden');
        document.getElementById('description').setAttribute('type', 'hidden');
        document.getElementById('submit').setAttribute('style', 'visibility: hidden');
        document.getElementById('cancel').setAttribute('style', 'visibility: hidden');
        document.getElementById('jiuyuan_gonghao').setAttribute("value", '');
    }

</script>
<div class="container-fluid">
    <div class="row">
        <div class="col-sm-12 main">
            <h1 class="page-header">应急救援员管理面板</h1>
            <div class="row placeholders">
                <div class="col-xs-6 col-sm-6 placeholder">
                    <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
                    <h4>Label</h4>
                    <span class="text-muted">Something else</span>
                </div>
                <div class="col-xs-6 col-sm-6 targ">
                    <span><h2>亲爱的管理员#<%=d.getGonghao()%> ，欢迎回来！</h2></span>
                    <span><h1><b>国家的安全，是我们的责任</b></h1></span>
                </div>
            </div>
            <h2 class="sub-header">Section title</h2>

            <form action="renwu_servlet" method="post" id="renwuform" style="height: 0">
                <span class="col-sm-3"><input type="hidden" id="x" name="x" placeholder="任务x坐标"></span>
                <span class="col-sm-3"><input type="hidden" id="y" name="y" placeholder="任务y坐标"></span>
                <span class="col-sm-3"><input type="hidden" id="description" name="description" placeholder="任务描述"></span>
                <input type="hidden" name="jiuyuan_gonghao" id="jiuyuan_gonghao" value="">
                <span class="col-sm-3">
                    <button class="col col-sm-5" id="submit" type="submit" style="visibility: hidden">确认</button>
                    &nbsp;
                    <button class="col col-sm-5" id="cancel" type="button" onclick="quxiao()" style="visibility: hidden">取消</button>
                </span>
            </form>

            <div class="table-responsive col-lg-12">
                <table class="table table-striped">
                    <thead>
                    <tr>
                        <td>工号</td>
                        <td>姓名</td>
                        <td>单位</td>
                        <td>电话</td>
                        <td>身份证号</td>
                        <td>操作</td>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<jiuyuan> l = (ArrayList<jiuyuan>)request.getAttribute("list");
                        //System.out.println(l.get(0));
                        if(request.getAttribute("found") != null) {
                            jiuyuan j = (jiuyuan)request.getAttribute("result");
                    %>
                    <tr>
                        <td><%=j.getGonghao()%></td>
                        <td><%=j.getXingming()%></td>
                        <td><%=j.getDanwei()%></td>
                        <td><%=j.getDianhua()%></td>
                        <td><%=j.getIdnumber()%></td>
                        <td>
                            <form method="post" action="dispatcher_servlet">
                                <input type="hidden" name="mobile" value="<%=j.getDianhua()%>">
                                <input type="hidden" name="gonghao_value" value="<%=j.getGonghao()%>">
                                <span><button class="btn btn-default col-sm-4" onclick="dispatch(<%=j.getGonghao()%>)" type="button">添加外出任务</button></span>
                            </form>
                            <!--height:51.2px-->
                            <span><a type="button" class="btn btn-default col-sm-4" href="daiban.jsp?gonghao=<%=j.getGonghao()%>">添加待办事项</a></span>
                            <span><a type="button" class="btn btn-default col-sm-4" href="jiuyuan_refactor.jsp?<%System.out.print("gonghao:" + j.getGonghao());%>gonghao=<%=j.getGonghao()%>">修改救援员信息</a></span>
                        </td>
                    </tr>
                    <%
                        }else{
                        for(jiuyuan g: l) {
                    %>
                    <tr>
                        <td><%=g.getGonghao()%></td>
                        <td><%=g.getXingming()%></td>
                        <td><%=g.getDanwei()%></td>
                        <td><%=g.getDianhua()%></td>
                        <td><%=g.getIdnumber()%></td>
                        <td>
                            <form method="post" action="dispatcher_servlet">
                                <input type="hidden" name="mobile" value="<%=g.getDianhua()%>">
                                <input type="hidden" name="gonghao_value" value="<%=g.getGonghao()%>">
                                <span><button class="btn btn-default col-sm-4" onclick="dispatch(<%=g.getGonghao()%>)" type="button">添加外出任务</button></span>
                            </form>

                            <span><a type="button" class="btn btn-default col-sm-4" href="daiban.jsp?gonghao=<%=g.getGonghao()%>">添加待办事项</a></span>
                            <span><a type="button" class="btn btn-default col-sm-4" href="jiuyuan_refactor.jsp?gonghao=<%=g.getGonghao()%>">修改救援员信息</a></span>
                        </td>
                    </tr>

                    <%
                        }
                    }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</div>
<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script>

</script>
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="https://v3.bootcss.com/assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- Just to make our placeholder images work. Don't actually copy the next line! -->
<script src="https://v3.bootcss.com/assets/js/vendor/holder.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="https://v3.bootcss.com/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>
