<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2019/12/18
  Time: 3:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加待办事项</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="http://twitter.github.com/bootstrap/assets/js/google-code-prettify/prettify.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-combined.no-icons.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/twitter-bootstrap/2.3.1/css/bootstrap-responsive.min.css" rel="stylesheet">
    <link href="http://netdna.bootstrapcdn.com/font-awesome/3.0.2/css/font-awesome.css" rel="stylesheet">
    <link href="index.css" rel="stylesheeft">
    <script src="http://cdn.bootcss.com/jquery/1.9.1/jquery.min.js"></script>
    <!--键盘事件-->
    <script src="https://mindmup.s3.amazonaws.com/lib/jquery.hotkeys.js"></script>
    <script src="http://cdn.bootcss.com/twitter-bootstrap/2.3.1/js/bootstrap.min.js"></script>
    <script src="bootstrap-wysiwyg.js"></script>
    <style>
        .container-fluid.main {
            height: 100vh;
        }
    </style>
</head>
<body>
    <div class="container-fluid main">
        <div class="row">
            <form class="form-inline" action="jiuyuan_servlet" method="GET">
                <div class="row">
                    <div class="form-group">
                        <label>主题：</label>
                        <input type="text" name="title" id="title" placeholder="主题">
                    </div>
                </div>
                <div class="row">
                    <div class="form-group">
                       <label>内容</label>
                        <input type="text" name="content_daiban" id="content_daiban" placeholder="待办事项">
                    </div>
                </div>
                <div class="row">
                    <button type="submit" class="btn btn-primary">提交</button>
                    <button type="reset" class="btn btn-primary">重写</button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
