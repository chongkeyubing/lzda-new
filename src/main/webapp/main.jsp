<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<html>
<head>
    <meta charset="utf-8">
    <title>廉政档案管理系统</title>
    <link rel="stylesheet" type="text/css" href="static/css/index.css">
    <link rel="stylesheet" type="text/css" href="static/layui/css/layui.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/imgUp.css"/>
    <link rel="stylesheet" type="text/css" href="static/css/tableCss.css"/>
    <script src="static/layui/layui.js"></script>
</head>

<body>
<div class="wrapper">
    <div class="header">
        <div class="logo"><img src="static/images/logo.png"><span>廉政档案管理系统</span></div>
        <div class="sign">
            <ul>
                <li>
                    <i>${currentUser.realname}</i>
                </li>
                <li>
                    <a href="logout"><span>退出</span></a>
                </li>
            </ul>
        </div>
    </div>
    <div class="Box">
        <div class="left">
            <div class="leftNav">
                <dl>
                    <dd>
                        <h2 class="menu menu01">档案管理</h2>
                        <ul class="menuSideBar">
                            <li>
                                <a id="archiveInfo" href="views/archive/common/archive_list.jsp">档案信息</a>
                            </li>

                            <li>
                                <a href="incorruptselfsummary/toList?userid=${currentUser.id}">廉政自律小结</a>
                            </li>
                        </ul>
                    </dd>

                    <dd>
                        <h2 class="menu menu02">奖惩管理</h2>
                        <ul class="menuSideBar">
                            <shiro:hasPermission name="奖励信息">
                                <li>
                                    <a href="views/reward/reward_list.jsp">奖励信息</a>
                                </li>
                            </shiro:hasPermission>
                            <shiro:hasPermission name="违惩信息">
                                <li>
                                    <a href="views/punish/common/punish_list.jsp">违惩信息</a>
                                </li>
                            </shiro:hasPermission>
                        </ul>
                    </dd>

                    <shiro:hasPermission name="上报管理">
                        <dd>
                            <h2 class="menu menu03">上报管理</h2>
                            <ul class="menuSideBar">
                                <li>
                                    <a href="rptresponsibilityreport/toList">主体责任上报</a>
                                </li>
                                <li>
                                    <a href="rptteamthinking/toList">队伍思想状况上报</a>
                                </li>
                                <li>
                                    <a href="rptincorrupt/toList">廉政信息上报</a>
                                </li>
                                <li>
                                    <a href="rptresponsibilityperform/toList">履责纪实上报</a>
                                </li>
                            </ul>
                        </dd>
                    </shiro:hasPermission>

                    <shiro:hasPermission name="廉政管理">
                        <dd>
                            <h2 class="menu menu04">廉政管理</h2>
                            <ul class="menuSideBar">
                                <shiro:hasPermission name="廉政审批">
                                    <li>
                                        <a href="views/approve/approve_list.jsp">廉政审批</a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="廉政预警">
                                    <li>
                                        <a href="views/incorrupt/warning_list.jsp">廉政预警</a>
                                    </li>
                                </shiro:hasPermission>
                                <shiro:hasPermission name="廉政报告">
                                    <li>
                                        <a href="incorruptReport/toList">廉政报告</a>
                                    </li>
                                </shiro:hasPermission>
                            </ul>
                        </dd>
                    </shiro:hasPermission>

                    <%--<shiro:hasPermission name="统计">--%>
                    <%--<dd>--%>
                    <%--<h2 class="menu menu05">统计</h2>--%>
                    <%--<ul class="menuSideBar">--%>
                    <%--<li>--%>
                    <%--<a href="punViolationStatistic/toList">违纪统计</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a href="rewardstatistic/toList">表彰统计</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a href="punReport/toList">信访统计</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a href="arcpoliceinvolvestatistic/toList">涉警报备统计</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a href="arcEffectGiftatistic/toList">收受礼品登记统计</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a href="arcBanquet/toList">操办宴席申请统计</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a href="arcFamilyCriminaltistic/toList">家人被追究刑事责任统计</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a href="arcAffect/toList">影响公正执行职务报备统计</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a href="">主体责任统计</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a href="">队伍思想状况统计</a>--%>
                    <%--</li>--%>
                    <%--<li>--%>
                    <%--<a href="">履责纪实统计</a>--%>
                    <%--</li>--%>
                    <%--</ul>--%>

                    <%--</dd>--%>
                    <%--</shiro:hasPermission>--%>

                    <shiro:hasPermission name="日志">
                        <dd>
                            <h2 class="menu menu06">日志</h2>
                            <ul class="menuSideBar">
                                <li>
                                    <a href="views/operate_log_list.jsp">日志信息</a>
                                </li>
                            </ul>
                        </dd>
                    </shiro:hasPermission>

                    <dd>
                        <h2 class="menu menu07">用户权限</h2>
                        <ul class="menuSideBar">
                            <shiro:hasPermission name="用户管理">
                                <li>
                                    <a href="user/toUserList">用户管理</a>
                                </li>
                                <%--<li>--%>
                                <%--<a href="views/role/role_list.jsp">权限管理</a>--%>
                                <%--</li>--%>
                            </shiro:hasPermission>
                            <li>
                                <a href="user/toPersonalInfo">个人信息</a>
                            </li>
                            <li>
                                <a href="views/user/password_update.jsp">密码修改</a>
                            </li>

                        </ul>
                    </dd>
                </dl>
            </div>
        </div>

        <!-- 主体内容部分 -->
        <div class="right">
            <div class="mainContent"></div>
        </div>

    </div>

</div>
<script src="static/js/jquery-2.1.4.js"></script>
<script src="static/js/jquery-form.js"></script>
<%--<script src="static/js/jquery.pjax.js"></script>--%>
<script>
    layui.use('layer', function () {
        var layer = layui.layer;
        $(document).ready(function () {
            $('.menu').click(function () {
                if (!$(this).hasClass("cur")) {
                    $('.menu').removeClass("cur").next("ul").slideUp();
                    $(this).addClass("cur").next("ul").slideDown();

                } else {
                    $(this).removeClass("cur").next("ul").slideUp();
                }
            });

            var checkIndex = null;
            $(".leftNav dl dd ul li").click(function () {
                if (!$(this).hasClass("cur")) {
                    checkIndex = this
                    $(this).removeClass("cur").siblings().addClass("cur");
                    $(this).addClass("cur").siblings().removeClass('cur');
                } else {
                    if (this == checkIndex) {
                        return
                    }
                    $(this).removeClass("cur").siblings().addClass("cur");
                }
            })

            // ajax加载右侧主体部分页面
            $(".leftNav a").on("click", function (event) {
                event.preventDefault();
                var url = $(this).attr("href");
                if (url != '') {
                    var index = layer.load(2);
                    $(".Box .right .mainContent").load(url, function () {
                        layer.close(index);
                    });
                }
            });

            //直接展示档案信息页面
            $(".menu01").click();
            $("#archiveInfo").click();

            //全局的ajax设置，处理ajax清求时sesion超时
            $.ajaxSetup({
                // contentType: "application/x-www-form-urlencoded;charset=utf-8",
                complete: function (XMLHttpRequest, textStatus) {
                    var sessionstatus = XMLHttpRequest.getResponseHeader("sessionstatus"); // 通过XMLHttpRequest取得响应头，sessionstatus，
                    if (sessionstatus == "timeout") {
                        // 如果超时跳转到登陆页面
                        // layer.confirm('登陆已超时，请重新登陆', {btn: ['重新登陆'], closeBtn: 0}, function () {
                        window.location.href = "index.jsp";
                        // });
                    }
                }
            })
        });
    });
</script>
</body>

</html>