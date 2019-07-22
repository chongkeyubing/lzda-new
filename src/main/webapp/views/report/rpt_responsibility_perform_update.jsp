<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='rptresponsibilityperform/update' id="reportForm" method="post">
        <%--隐藏表单--%>
        <input type="hidden" name="id" value="${report.id}">
        <input type="hidden" name="committerId" value="${report.committerId}">
        <input type="hidden" name="committerName" value="${report.committerName}">
        <input type="hidden" name="organizationId" value="${report.organizationId}">
        <input type="hidden" name="attachmentId" value="${report.attachmentId}">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="time" id="time" autocomplete="off" lay-verify="required|date"
                           class="layui-input" value="${report.time}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">地点</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" lay-verify="required" autocomplete="off"
                           lay-verify="required" class="layui-input" value="${report.address}">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <label class="layui-form-label">主题</label>
            <div class="layui-input-inline">
                <input type="text" name="title" lay-verify="title" autocomplete="off" placeholder="请输入标题"
                       class="layui-input" style="width: 818px;" value="${report.title}">
            </div>
        </div>
        <div class="layui-form-item">
            <label class="layui-form-label">参加人员</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="participants"
                          lay-verify="required">${report.participants}</textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">内容</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="content"
                          lay-verify="required">${report.content}</textarea>
            </div>
        </div>

        <%-- 修改附件图片 --%>
        <%@ include file="common/img_update.jsp" %>

        <%-- 提交 --%>
        <%@ include file="./common/report_submit.jsp" %>
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

    });
</script>

