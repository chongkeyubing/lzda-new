<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='arcfamilyinsurance/add' id="archiveForm" method="post">
        <div class="layui-form-item">
            <%--<div class='layui-inline'>--%>
            <%--<label class="layui-form-label">有无此类情况</label>--%>
            <%--<div class='layui-input-inline'>--%>
            <%--<select name="q">--%>
            <%--<option value="">请选择输入内容</option>--%>
            <%--<option value="">有此类情况</option>--%>
            <%--<option value="">无此类情况</option>--%>
            <%--</select>--%>
            <%--</div>--%>
            <%--</div>--%>

            <div class='layui-inline'>
                <label class='layui-form-label'>投保人姓名</label>
                <div class='layui-input-inline'>
                    <input type='text' name='familyName' lay-verify="required" placeholder='' autocomplete='off' class='layui-input' value="">
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
                <label class='layui-form-label'>保险产品全称</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='insuranceName' lay-verify="required" placeholder='' autocomplete='off' class='layui-input'
                           value="">
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class='layui-form-label'>保单号</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='insuranceNumber' lay-verify="required" placeholder='' autocomplete='off' class='layui-input'
                           value="">
                </div>
            </div>

            <div class='layui-inline'>
                <label class='layui-form-label label'>保险公司名称</label>
                <div class='layui-input-inline'>
                    <input type='text' name='companyName'  lay-verify="required" placeholder='' autocomplete='off' class='layui-input'
                           value="">
                </div>
            </div>

            <div class='layui-inline'>
                <label class='layui-form-label'>累积缴纳保费、投资资金（万元）</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='price' placeholder='' lay-verify="required|number" autocomplete='off' class='layui-input' value="">
                </div>
            </div>
        </div>

        <%--<div class='layui-form-item'>--%>
        <%--<div class='layui-inline'>--%>
        <%--<label class='layui-form-label'>累计缴纳保费、投资金总额（万元）</label>--%>
        <%--<div class='layui-input-inline input'>--%>
        <%--<input type='text' name='' placeholder='' autocomplete='off' class='layui-input' value="">--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>

        <%-- 审核人选择 --%>
        <%@ include file="./common/select_approver.jsp" %>

        <%-- 隐藏表单 --%>
        <%@ include file="./common/hidden_form.jsp" %>

        <%-- 提交 --%>
        <%@ include file="./common/archive_submit.jsp" %>


    </form>
</div>


