<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='arcfamilycriminal/add' id="archiveForm" method="post">
        <div class="layui-form-item">

            <%--<div class='layui-inline'>--%>
            <%--<label class="layui-form-label">有无变化</label>--%>
            <%--<div class='layui-input-inline'>--%>
            <%--<select name="q">--%>
            <%--<option value="">请选择输入内容</option>--%>
            <%--<option value="">有</option>--%>
            <%--<option value="">无</option>--%>
            <%--</select>--%>
            <%--</div>--%>
            <%--</div>--%>

            <div class='layui-inline'>
                <label class='layui-form-label'>姓名</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='familyName' placeholder='' autocomplete='off' class='layui-input' value="" lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">称谓</label>
                <div class="layui-input-inline">
                    <input type="text" name="familyAppellation" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>被追究时间</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='time' id='time' placeholder='' autocomplete='off' class='layui-input' value="" lay-verify="required">
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class="layui-form-label">处理阶段</label>
                <div class='layui-input-inline'>
                    <select name="period" lay-verify="required">
                        <option value="">请选择输入内容</option>
                        <option value="立案侦查">立案侦查</option>
                        <option value="审查起诉">审查起诉</option>
                        <option value="刑事审判">刑事审判</option>
                        <option value="刑罚执行">刑罚执行</option>
                        <option value="执行完毕">执行完毕</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>

        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">被追究原因</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="reason" lay-verify="required"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">处理结果</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="result" lay-verify="required"></textarea>
            </div>
        </div>

        <%-- 审核人选择 --%>
        <%@ include file = "../approve/approver_select.jsp" %>

        <%-- 隐藏表单 --%>
        <%@ include file = "./common/hidden_form.jsp" %>

        <%-- 提交 --%>
        <%@ include file = "./common/archive_submit.jsp" %>


    </form>

</div>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#time'
        });
        form.render();
    });
</script>

