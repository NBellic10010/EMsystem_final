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

    <link href="https://cdn.jsdelivr.net/npm/froala-editor@3.0.6/css/froala_editor.pkgd.min.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/froala-editor@3.0.6/js/froala_editor.pkgd.min.js"></script>
    <link href="file/froala-editor/froala_style.css" rel="stylesheet" type="text/css" />
</head>
<body>
<label>
    <input type="text" class="fr-text-spaced" name="zhuti" id="zhuti" placeholder="主题：">
    <input type="hidden" name="neirong" id="neirong">
</label>

<h3><b>待办事项：</b></h3>
    <div id="example"></div>
    <button class="fr-btn" onclick="saveArticle()">提交</button>
    <script>
        var editor = new FroalaEditor('#example');
        function saveArticle(){
            var h = document.getElementById('edit').froalaEditor('html.get', true);
            //返回富文本编辑里面的html代码
            $.ajax({
                type: 'POST',
                url: "daiban_insert_servlet",
                data:{
                    "zhuti":$("zhuti").val(),
                    "neirong": h
                },
                success: function(data){
                    if(data.success){
                        layer.msg("保存成功", {icon: 1, time: 1500},function(){
                            window.parent.location.reload();
                        });
                    }else{
                        layer.msg("保存失败", {icon: 1, time: 1500},function(){
                            window.parent.location.reload();
                        });
                    }
                },
                error:function(data) {
                    //console.log(data.msg);
                },
            });
        }

    </script>
</body>
</html>
