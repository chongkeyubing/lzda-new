<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='rptresponsibilityreport/add' id="reportForm" method="post">
        <%--隐藏表单--%>
        <input type="hidden" name="committerId" value="${currentUser.id}">
        <input type="hidden" name="committerName" value="${currentUser.realname}">
        <input type="hidden" name="organizationId" value="${currentUser.organizationId}">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">单位名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="organizationName" autocomplete="off" class="layui-input"
                           lay-verify="required" value="${currentUser.organizationName}" readonly>

                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">年份</label>
                <div class="layui-input-inline">
                    <input type="text" name="year" id="year1" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">季度</label>
                <div class="layui-input-inline">
                    <select name="quarter" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="第一季度">第一季度</option>
                        <option value="第二季度">第二季度</option>
                        <option value="第三季度">第三季度</option>
                        <option value="第四季度">第四季度</option>
                    </select>
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">工单类别</label>
                <div class="layui-input-inline">
                    <select name="type" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="主体责任季度工单">主体责任季度工单</option>
                        <option value='"第一责任人"责任季度工单'>"第一责任人"责任季度工单</option>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">任务序号</label>
                <div class="layui-input-inline">
                    <input type="text" name="taskOrder" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">是否完成</label>
                <div class="layui-input-inline">
                    <select name="complete" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">具体落实情况</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" lay-verify="required"
                          name="completeInfo"></textarea>
            </div>
        </div>
        <div class="layui-inline" style="margin-bottom: 20px;margin-left: 100px">
            <div class="layui-input-inline">
                <p class="remark">注：1、“任务序号”指本季度工单对应任务，对照任务序号逐一填写任务落实情况；</p>
                <p class="remark" style="text-indent: 2em;">2、填写内容要求实事求是，简要描述工作完成情况；</p>
                <p class="remark" style="text-indent: 2em;">3、本表请于每季度末月25前填报</p>
            </div>
        </div>

        <%--添加图片--%>
        <%@ include file="./common/img_add.jsp" %>

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
            elem: '#year1',
            type: 'year'
        });

    });
</script>

