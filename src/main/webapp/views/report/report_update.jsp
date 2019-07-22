<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>


		<form class="layui-form form1" action="rptincorrupt/update" id="reportFrom" method="post">


		<%--	<input type="hidden" name="committerName" value="${currentUser.realname}">
			<input type="hidden" name="committerId" value="${currentUser.id}">
			<input type="hidden" name="organizationId" value="${currentUser.organizationId}">
			<input type="hidden" name="organizationName" value="${currentUser.organizationName}">--%>

			<input type="hidden" id="id" name="id" value="${rptIncorrupt.id}">

			<br>
			<div class="layui-form-item" style="margin-left: 2px;">
				<label class="layui-form-label">标题</label>
				<div class="layui-input-block">
					<input type="text" name="title" id="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
						   style="width: 75%;" class="layui-input" value="${rptIncorrupt.title}">
				</div>
			</div>
			<div class="layui-form-item layui-form-text">
				<label class="layui-form-label">内容</label>
				<div class="layui-input-block area">
					<textarea placeholder="请输入内容" name="content" id="content" class="layui-textarea txtArea">${rptIncorrupt.content}</textarea>
				</div>
			</div>

			<div class="layui-form-item">
				<div class="layui-input-block reset">
					<button class="layui-btn"  lay-filter="demo1">提交</button>
					<button type="reset" class="layui-btn">返回</button>
				</div>
			</div>
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



				//点击提交
				form.on('submit(demo1)', function () {
					debugger;
					$("#reportFrom").ajaxSubmit({
						success: function (data) {
							if (data.success) {
								//关闭当前弹窗
								layer.closeAll();
								layer.msg("提交成功");

								//parent.tableIns.reload();
								parent.reload();
								//重载查询页面表格
								/*$("#resetQueryReport").click();
								$("#queryReport").click();*/
							} else {
								layer.msg("提交失败，请重新尝试或联系管理员");
							}
						}
					});
					return false;//阻止表单跳转
				});




			});










		</script>

<%--
	</body>

</html>--%>
