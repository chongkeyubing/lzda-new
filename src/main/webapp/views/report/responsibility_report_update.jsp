<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='rptresponsibilityreport/update' id="reportForm" method="post">
        <%--隐藏表单--%>
        <input type="hidden" name="id" value="${report.id}">
        <input type="hidden" name="committerId" value="${report.committerId}">
        <input type="hidden" name="committerName" value="${report.committerName}">
        <input type="hidden" name="organizationId" value="${report.organizationId}">
        <input type="hidden" name="attachmentId" value="${report.attachmentId}">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">单位名称</label>
                <div class="layui-input-inline">
                    <input type="text" autocomplete="off" class="layui-input"
                           lay-verify="required" value="${report.organizationName}" readonly>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">年份</label>
                <div class="layui-input-inline">
                    <input type="text" name="year" id="year" autocomplete="off" class="layui-input"
                           lay-verify="required" value="${report.year}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">季度</label>
                <div class="layui-input-inline">
                    <select name="quarter" lay-verify="required">
                        <c:forTokens items="第一季度,第二季度,第三季度,第四季度" delims="," var="quarter">
                            <option value="${quarter}"
                                    <c:if test="${report.quarter == quarter}">selected</c:if>
                            >${quarter}</option>
                        </c:forTokens>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">工单类别</label>
                <div class="layui-input-inline">
                    <select name="type" lay-verify="required">
                        <c:forTokens items='主体责任季度工单,"第一责任人"责任季度工单' delims="," var="type">
                            <option value="${type}"
                                    <c:if test="${report.type == type}">selected</c:if>
                            >${type}</option>
                        </c:forTokens>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">任务序号</label>
                <div class="layui-input-inline">
                    <input type="text" name="taskOrder" autocomplete="off" class="layui-input"
                           lay-verify="required" value="${report.taskOrder}">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">是否完成</label>
                <div class="layui-input-inline">
                    <select name="complete" lay-verify="required">
                        <c:forTokens items="是,否" delims="," var="complete">
                            <option value="${complete}"
                                    <c:if test="${report.complete == complete}">selected</c:if>
                            >${complete}</option>
                        </c:forTokens>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">具体落实情况</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" lay-verify="required"
                          name="completeInfo">${report.completeInfo}</textarea>
            </div>
        </div>


        <%-- 修改附件图片 --%>
        <%@ include file="common/img_update.jsp" %>

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
            elem: '#year',
            type: 'year'
        });

    });
</script>

