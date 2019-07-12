<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='arcincomeinfo/add' id="archiveForm" method="post">
        <div class="layui-form-item">
            <div class='layui-inline'>
                <label class='layui-form-label'>姓名</label>
                <div class='layui-input-inline input'>
                    <input type='text' value="${currentUser.realname}" readonly  placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>

            <div class='layui-inline'>
                <label class="layui-form-label">单位</label>
                <div class='layui-input-inline'>
                    <input type='text' lay-verify="required" autocomplete='off' class='layui-input' value="${currentUser.organizationName}" readonly>
                </div>
            </div>

            <div class='layui-inline'>
                <label class="layui-form-label">职务</label>
                <div class='layui-input-inline'>
                    <input type='text'  lay-verify="required" autocomplete='off' class='layui-input' value="${currentUser.jobPosition}" readonly>
                </div>
            </div>

        </div>

        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">从事股票、基金、理财产品收益所得（元）</label>
                <div class="layui-input-inline">
                    <input type="text" name="stock" autocomplete="off" lay-verify="number" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">各类奖金、津贴、补贴及福利费等（元）</label>
                <div class="layui-input-inline">
                    <input type="text" name="award" lay-verify="number"  autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">从事咨询、讲学、写作、审稿、书画等劳务所得（元）</label>
                <div class="layui-input-inline">
                    <input type="text" name="labour" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">申报上年度工资收入（元）</label>
                <div class="layui-input-inline">
                    <input type="text" name="lastYear" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">其它（元）</label>
                <div class="layui-input-inline">
                    <input type="text" name="other" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">收入合计（元）</label>
                <div class="layui-input-inline">
                    <input type="text" name="total" lay-verify="number" autocomplete="off" class="layui-input">
                </div>
            </div>

        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">个人说明</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="personalInfo"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="remark"></textarea>
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
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });
    });
</script>
