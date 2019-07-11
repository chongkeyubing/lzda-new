<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<html>
	<head>
		<meta charset="utf-8">
		<title>廉政档案管理系统</title>
		<link rel="stylesheet" type="text/css" href="static/css/index.css">
		<link rel="stylesheet" type="text/css" href="static/layui/css/layui.css"/>
		<link rel="stylesheet" type="text/css" href="static/css/imgUp.css"/>
		<%--<link rel="stylesheet" type="text/css" href="static/css/tableCss.css" />--%>
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
										<a href="views/archive/common/archive_list.jsp">档案信息</a>
									</li>
									<li>
										<a href="views/approve/approve_list.jsp">档案审核</a>
									</li>
								</ul>
							</dd>
							
							<dd>
								<h2 class="menu menu02">奖惩管理</h2>
								<ul class="menuSideBar">
									<li>
										<a href="">奖励信息</a>
									</li>
									<li>
										<a href="">违惩信息</a>
									</li>
								</ul>

							</dd>
							<dd>
								<h2 class="menu menu03">上报管理</h2>
								<ul class="menuSideBar">
									<li>
										<a href="">主体责任上报</a>
									</li>
									<li>
										<a href="">队伍思想状况上报</a>
									</li>
									<li>
										<a href="">廉政信息上报</a>
									</li>
									<li>
										<a href="">履责纪实上报</a>
									</li>
								</ul>
							</dd>
							<dd>
								<h2 class="menu menu04">廉政报告</h2>
								<ul class="menuSideBar">
									<li>
										<a href="">廉政报告管理</a>
									</li>

								</ul>
							</dd>

							<dd>
								<h2 class="menu menu05">统计</h2>
								<ul class="menuSideBar">
									<li>
										<a href="">违规统计</a>
									</li>
									<li>
										<a href="">出国(境)统计</a>
									</li>
									<li>
										<a href="">影响公正执行职务报备统计</a>
									</li>

								</ul>

							</dd>

							<dd>
								<h2 class="menu menu06">日志</h2>
								<ul class="menuSideBar">
									<li>
										<a href="">日志信息</a>
									</li>

								</ul>

							</dd>
							<dd>
								<h2 class="menu menu07">用户权限</h2>
								<ul class="menuSideBar">
									<li>
										<a href="">用户管理</a>
									</li>
									<li>
										<a href="">权限管理</a>
									</li>
									<li>
										<a href="">密码修改</a>
									</li>
								</ul>
							</dd>
						</dl>

					</div>
				</div>
				<!-- 主体内容部分 -->
				<div class="right">


				</div>

			</div>

		</div>

		</div>
		<script src="static/js/jquery-2.1.4.js"></script>
		<script src="static/js/jquery-form.js"></script>
		<script>
			$(document).ready(function() {
				$('.menu').click(function() {
					if(!$(this).hasClass("cur")) {
						$('.menu').removeClass("cur").next("ul").slideUp();
						$(this).addClass("cur").next("ul").slideDown();

					} else {
						$(this).removeClass("cur").next("ul").slideUp();
					}
				});

				var checkIndex = null;
				$(".leftNav dl dd ul li").click(function() {
					if(!$(this).hasClass("cur")) {
						checkIndex = this
						$(this).removeClass("cur").siblings().addClass("cur");
						$(this).addClass("cur").siblings().removeClass('cur');
					} else {
						if(this == checkIndex) {
							return
						}
						$(this).removeClass("cur").siblings().addClass("cur");
					}

				})

				// ajax加载右侧主体部分页面
				$(".leftNav a").on("click",function(event){
					event.preventDefault();
					var url = $(this).attr("href");
					if(url != ''){
						$(".Box .right").load(url);
					}
				});
			});
		</script>
	</body>

</html>