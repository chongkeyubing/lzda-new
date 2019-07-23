<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%--<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="layui/css/layui.css" />
		<style type="text/css">
			.layui-textarea.txtArea {
				width: 878px;
				height: 120px;
			}
			.layui-input-block.area{margin-left: 130px;}
			.layui-input-block.reset{margin-left: 0;text-align: center;}
			form.form1{margin-top: 15px;}
			.layui-input{width: 878px;}
		</style>
	</head>--%>

	<%--<body style="display: flex;justify-content: center;">--%>
		<form class="layui-form form1" action="rptincorrupt/add" id="reportForm" method="post">


			<input type="hidden" name="committerName" value="${currentUser.realname}">
			<input type="hidden" name="committerId" value="${currentUser.id}">
			<input type="hidden" name="organizationId" value="${currentUser.organizationId}">
			<input type="hidden" name="organizationName" value="${currentUser.organizationName}">


			<br>
			<div class="layui-form-item" style="margin-left: 2px;">
				<label class="layui-form-label">标题</label>
				<div class="layui-input-block">
					<input type="text" name="title" id="title" lay-filter="queryReport" lay-verify="title" autocomplete="off" placeholder="请输入标题" style="width: 75%;" class="layui-input">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">内容</label>
				<div class="layui-input-block area">
					<textarea placeholder="请输入内容" lay-filter="queryReport" name="content" id="content" class="layui-textarea txtArea"></textarea>
				</div>
			</div>

			<%--<div class="layui-form-item">--%>
				<%--<div class="layui-input-block reset">--%>
					<%--<button class="layui-btn" lay-submit="" lay-filter="demo1">提交</button>--%>
					<%--<button type="reset" class="layui-btn">返回</button>--%>
				<%--</div>--%>
			<%--</div>--%>

			<%@ include file="./common/report_submit.jsp" %>
		</form>


		<%--<script src="static/layui/layui.js"></script>--%>




		<script>
			layui.use(['form', 'layedit', 'laydate'], function() {
				var form = layui.form,
					layer = layui.layer,
					layedit = layui.layedit,
					laydate = layui.laydate;

				//日期
				laydate.render({
					elem: '#date'
				});
				laydate.render({
					elem: '#date1'
				});


				//
				// //点击提交
				// form.on('submit(demo1)', function () {
				// 	debugger;
				// 	$("#reportFrom").ajaxSubmit({
				// 		success: function (data) {
				// 			if (data.success) {
				// 				//关闭当前弹窗
				// 				layer.closeAll();
				// 				layer.msg("提交成功");
				//
				// 				//重载查询页面表格
				// 				$("#resetQueryReport").click();
				// 				$("#queryReport").click();
				// 			} else {
				// 				layer.msg("提交失败，请重新尝试或联系管理员");
				// 			}
				// 		}
				// 	});
				// 	return false;//阻止表单跳转
				// });




			});










		</script>

<%--
	</body>

</html>--%>
