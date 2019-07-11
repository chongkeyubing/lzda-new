<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" type="text/css" href="static/css/index.css"/>
    <link rel="stylesheet" type="text/css" href="static/layui/css/layui.css"/>
    <script src="static/layui/layui.js"></script>
</head>
<body>
<div class="wrap">
    <div class="loginInfo">
        <div class="loginBox">
            <h3>廉政档案管理平台</h3>
            <form action="login" method="post">
                <dl>
                    <dt>
                        <div class="info">
                            <div class="infoImg">
                                <img src="static/images/user.png" alt=""/>
                            </div>
                            <input type="text" placeholder="请输入登录账号" name="policeCode" value="${policeCode}"/>
                        </div>
                    </dt>
                    <dt>
                        <div class="info">
                            <div class="infoImg">
                                <img src="static/images/password.png" alt=""/>
                            </div>
                            <input type="password" placeholder="输入您的密码" name="password"/>
                        </div>
                    </dt>
                    <dd>
                        <input type="submit" value="登录"/>
                    </dd>
                </dl>
            </form>
        </div>
    </div>
</div>
<script src="static/js/jquery-2.1.4.js"></script>
<script>
    layui.use(['layer'], function () {
        var layer = layui.layer;
        if ('${msg}' != '') {
            layer.msg('${msg}');
        }
    })
</script>
</body>
</html>
