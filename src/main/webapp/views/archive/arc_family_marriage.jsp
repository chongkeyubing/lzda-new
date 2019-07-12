<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='arcfamilymarriage/add' id="archiveForm" method="post">
        <div class="layui-form-item">
            <%--<div class="layui-inline">--%>
            <%--<label class="layui-form-label">有无变化</label>--%>
            <%--<div class="layui-input-inline">--%>
            <%--<select name="quiz">--%>
            <%--<option value="">请选择</option>--%>
            <%--<option value="">有变化</option>--%>
            <%--<option value="">无变化</option>--%>
            <%----%>
            <%--</select>--%>
            <%--</div>--%>
            <%--</div>--%>

            <div class="layui-inline">
                <label class="layui-form-label">子女姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="familyName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">称谓</label>
                <div class="layui-input-inline">
                    <input type="text" name="familyAppellation" lay-verify="required" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">子女配偶姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="partnerName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">地区</label>
                <div class="layui-input-inline">
                    <input type="text" name="partnerArea" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="partnerJob" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">登记时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="time" id="time" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

        </div>
        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">配偶工作（学习）单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="partnerOrg" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

        </div>


        <%-- 审核人选择 --%>
        <%@ include file="./common/select_approver.jsp" %>

        <%-- 隐藏表单 --%>
        <%@ include file="./common/hidden_form.jsp" %>

        <%-- 提交 --%>
        <%@ include file="./common/archive_submit.jsp" %>

    </form>
</div>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form,
            laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#time'
        });

    });
</script>

