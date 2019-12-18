<%--
  Created by IntelliJ IDEA.
  User: ASUS
  Date: 2019/12/18
  Time: 15:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">注册</a>
        </div>
        <div id="navbar" class="collapse navbar-collapse">
            <ul class="nav navbar-nav">
                <li><a href="start.jsp">开始</a></li>
                <li class="active" href="#">注册</li>
            </ul>
        </div><!--/.nav-collapse -->
    </div>
</nav>

<div class="container">
    <!-- private int gonghao;
        private String xingming;
        private int danwei;
        private String dianhua;
        private String idnumber;
        private String mima;
        private boolean zhuangtai;-->
    <div class="row">
        <form class="form-inline" action="jiuyuan_insert_servlet" method="get">
            <div class="form-group">
                <label>姓名</label>
                <input type="text" name="xingming_refactor" id="xingming_refactor">
            </div>
            <div class="form-group">
                <label>单位</label>
                <input type="text" name="danwei_refactor" id="danwei_refactor">
            </div>
            <div class="form-group">
                <label>电话</label>
                <input type="text" name="dianhua_refactor" id="dianhua_refactor">
            </div>
            <div class="form-group">
                <label>身份证号</label>
                <input type="text" name="idnum_refactor" id="idnum_refactor">
            </div>
            <div class="form-group">
                <label>密码</label>
                <input type="text" name="mima_refactor" id="mima_refactor">
            </div>
            <button type="submit" class="btn btn-default">提交</button>
        </form>
    </div>

</div><!-- /.container -->


<!-- Bootstrap core JavaScript
================================================== -->
<!-- Placed at the end of the document so the pages load faster -->
<script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
<script>window.jQuery || document.write('<script src="https://v3.bootcss.com/assets/js/vendor/jquery.min.js"><\/script>')</script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
<script src="https://v3.bootcss.com/assets/js/ie10-viewport-bug-workaround.js"></script>
</body>

</html>
