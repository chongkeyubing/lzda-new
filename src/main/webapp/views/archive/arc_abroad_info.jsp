<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class='layui-form form1' action='arcabroadinfo/add' id="archiveForm" method="post">
        <div class="layui-form-item">
            <div class='layui-inline'>
                <label class='layui-form-label'>姓名</label>
                <div class='layui-input-inline input'>
                    <input type='text' value="${currentUser.realname}" readonly lay-verify="required"  placeholder='' autocomplete='off' class='layui-input' value="">
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
                <label class='layui-form-label'>开始时间</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='beginTime' id="beginTime" lay-verify="required" placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>目的地</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='destination' lay-verify="required" placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>结束时间</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='endTime' id="endTime" lay-verify="required" placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class="layui-form-label">批准单位</label>
                <div class='layui-input-inline'>
                    <input type='text' name='approveOrganization' lay-verify="required" placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>资金来源</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='fundSource' lay-verify="required" placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>

        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">出国（境）事由</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" lay-verify="required" class="layui-textarea txtArea" name="goabroadReason"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">出国（境）情况报告</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" lay-verify="required" class="layui-textarea txtArea" name="report"></textarea>
            </div>
        </div>
        <div class="layui-form-item" style="margin-left:100px">注：此表应在一般干部出国（境）归来后一周内填写上报。</div>

        <%-- 审核人选择 --%>
        <%@ include file = "./common/select_approver.jsp" %>

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
            elem: '#beginTime'
        });
        laydate.render({
            elem: '#endTime'
        });
    });
</script>

