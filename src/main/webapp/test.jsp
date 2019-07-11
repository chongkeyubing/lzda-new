<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<html>
<head>
    <meta charset="UTF-8">
    <title>示例</title>
</head>
<body>

<h2>分页查询</h2>
<form type="POST" action="/test" enctype="multipart/form-data" method="post">
    档案:<br>
    用户名：<input type="input" name="arcBasicInfo.realname" value="李宝刚"> <br>
    职位：<input type="input" name="arcBasicInfo.jobPosition" value="队长"><br>
    关系一：<br>
    姓名：<input type="input" name="arcs[0].name" value="严"><br>
    职位：<input type="input" name="arcs[0].jobPosition" value="工人"><br>
    关系二：<br>
    姓名：<input type="input" name="arcs[1].name" value="李"><br>
    职位：<input type="input" name="arcs[1].jobPosition" value="工人"><br>
    文件:<br>
    <input type="file" name="file"><br>

    <button type="button">提交</button>
</form>
<script src="/static/js/jquery-2.1.4.js"></script>
<script src="/static/js/jquery-form.js"></script>
<script>

    $("button").click(function () {
        $("form").ajaxSubmit();
    });
</script>
</body>
</html>