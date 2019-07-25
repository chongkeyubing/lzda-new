<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div style="display: flex;justify-content: center;">

    <form class="layui-form form1" action="rptincorrupt/update" id="reportForm" method="post">


        <input type="hidden" name="committerName" value="${rptIncorrupt.committerName}">
        <input type="hidden" name="committerId" value="${rptIncorrupt.committerId}">
        <input type="hidden" name="organizationId" value="${rptIncorrupt.organizationId}">
        <input type="hidden" name="organizationName" value="${rptIncorrupt.organizationName}">

        <input type="hidden" id="id" name="id" value="${rptIncorrupt.id}">

        <br>
        <div class="layui-form-item">
            <label class="layui-form-label">标题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" id="title" lay-verify="title" lay-filter="queryReport"
                       autocomplete="off" placeholder="请输入标题"
                       style="width: 818px;" class="layui-input" value="${rptIncorrupt.title}">
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" name="content" lay-filter="queryReport" id="content"
                          class="layui-textarea txtArea">${rptIncorrupt.content}</textarea>
            </div>
        </div>

        <%--<div class="layui-form-item">--%>
        <%--<div class="layui-input-block reset">--%>
        <%--<button class="layui-btn" lay-submit lay-filter="demo1" >提交</button>--%>
        <%--<button type="reset" class="layui-btn">返回</button>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%-- 提交 --%>
        <%@ include file="./common/report_submit.jsp" %>
    </form>
</div>

<%--<script src="static/layui/layui.js"></script>--%>


<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
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
        //
        //
        // 				//重载查询页面表格
        // 				/*$("#resetQueryReport").click();
        // 				$("#queryReport").click();*/
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
