<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='arcfamilyworkabroad/add' id="archiveForm" method="post">
        <div class="layui-form-item">
            <%--<div class="layui-inline">--%>
            <%--<label class="layui-form-label">有无变化</label>--%>
            <%--<div class="layui-input-inline">--%>
            <%--<select name="quiz">--%>
            <%--<option value="">请选择</option>--%>
            <%--<option value="">有变化</option>--%>
            <%--<option value="">无变化</option>--%>

            <%--</select>--%>
            <%--</div>--%>
            <%--</div>--%>

            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="familyName" autocomplete="off" class="layui-input" lay-verify="required">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">称谓</label>
                <div class="layui-input-inline">
                    <input type="text" name="familyAppellation" autocomplete="off" class="layui-input" lay-verify="required">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">所在国家（地区）</label>
                <div class="layui-input-inline">
                    <input type="text" name="country" autocomplete="off" class="layui-input" lay-verify="required">
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">工作、生活城市</label>
                <div class="layui-input-inline">
                    <input type="text" name="city" autocomplete="off" class="layui-input" lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">起始时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="time" id="time" autocomplete="off" class="layui-input" lay-verify="required">
                </div>
            </div>

        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="remark"></textarea>
            </div>
        </div>

        <%-- 审核人选择 --%>
        <%@ include file = "./common/select_approver.jsp" %>

        <%-- 隐藏表单 --%>
        <%@ include file = "./common/hidden_form.jsp" %>

        <%-- 提交 --%>
        <%@ include file = "./common/archive_submit.jsp" %>
    </form>
</div>
<script>
    layui.use(['form', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#time'
        });

    });
</script>


