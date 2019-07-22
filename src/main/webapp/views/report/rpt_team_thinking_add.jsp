<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='rptteamthinking/add' id="reportForm" method="post">
        <%--隐藏表单--%>
        <input type="hidden" name="committerId" value="${currentUser.id}">
        <input type="hidden" name="committerName" value="${currentUser.realname}">
        <input type="hidden" name="organizationId" value="${currentUser.organizationId}">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">填报单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="organizationName" lay-verify="required" autocomplete="off" readonly
                           value="${currentUser.organizationName}" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">月份</label>
                <div class="layui-input-inline">
                    <input type="text" name="time" id="time" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">民警人数</label>
                <div class="layui-input-inline">
                    <input type="text" name="ploiceNumber" lay-verify="required|number" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">党员人数</label>
                <div class="layui-input-inline">
                    <input type="text" name="partyNumber" lay-verify="required|number" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">遵纪情况</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="obeyInfo"
                          lay-verify="required"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">队伍思想状况</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="teamThinkingInfo"
                          lay-verify="required"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">队伍特色亮点及存在问题</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="teamAdvantageProblem"
                          lay-verify="required"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">采取主要措施</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="mainMeasure"
                          lay-verify="required"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">其它情况</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="otherInfo"
                          lay-verify="required"></textarea>
            </div>
        </div>

        <%-- 提交 --%>
        <%@ include file="./common/report_submit.jsp" %>
    </form>
</div>
<script>
    layui.use(['form', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            laydate = layui.laydate;

        form.render();

        //日期
        laydate.render({
            elem: '#time',
            type:'month'
        });
    });
</script>

