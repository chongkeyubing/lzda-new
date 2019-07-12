<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='arcorganizationmeeting/add' id="archiveForm" method="post">
        <div class="layui-form-item">
            <div class='layui-inline'>
                <label class='layui-form-label'>姓名</label>
                <div class='layui-input-inline input'>
                    <input type='text' lay-verify="required" autocomplete='off' class='layui-input' value="${currentUser.realname}" readonly>
                </div>
            </div>

            <div class='layui-inline'>
                <label class="layui-form-label">职务</label>
                <div class='layui-input-inline'>
                    <input type='text'  lay-verify="required" autocomplete='off' class='layui-input' value="${currentUser.jobPosition}" readonly>
                </div>
            </div>
            <div class='layui-inline'>
                <label class="layui-form-label">单位</label>
                <div class='layui-input-inline'>
                    <input type='text' lay-verify="required" autocomplete='off' class='layui-input' value="${currentUser.organizationName}" readonly>
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class='layui-form-label'>会议议题</label>
                <div class='layui-input-inline input'>
                    <input type='text' lay-verify="required" name='meetingSubject'  placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>参加组织生活会时间</label>
                <div class='layui-input-inline input'>
                    <input type='text' lay-verify="required" name='meetingTime' id='meetingTime' placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">查找问题</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" lay-verify="required" class="layui-textarea txtArea" name="problem"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">整改措施</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" lay-verify="required" class="layui-textarea txtArea" name="rectify"></textarea>
            </div>
        </div>
        <%--<div class="layui-form-item layui-form-text">--%>
            <%--<label class="layui-form-label">单位党组织意见</label>--%>
            <%--<div class="layui-input-block">--%>
                <%--<textarea placeholder="请输入内容" class="layui-textarea txtArea"></textarea>--%>
            <%--</div>--%>
        <%--</div>--%>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="remark"></textarea>
            </div>
        </div>

        <%-- 审核人选择 --%>
        <%@ include file="../approve/approver_select.jsp" %>

        <%-- 隐藏表单 --%>
        <%@ include file="./common/hidden_form.jsp" %>

        <%-- 提交 --%>
        <%@ include file="./common/archive_submit.jsp" %>

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
            elem: '#meetingTime'
        });
    });
</script>



