<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='arcfamilystock/add' id="archiveForm" method="post">
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
                <label class='layui-form-label'>持有人姓名</label>
                <div class='layui-input-inline'>
                    <input type='text' name='familyName' lay-verify="required" placeholder='' autocomplete='off'
                           class='layui-input' value="">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">称谓</label>
                <div class="layui-input-inline">
                    <input type="text" name="familyAppellation" lay-verify="required" autocomplete="off"
                           class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>股票名称或代码</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='stockName' lay-verify="required" placeholder='' autocomplete='off'
                           class='layui-input' value="">
                </div>
            </div>
        </div>

        <div class='layui-form-item'>

            <div class='layui-inline'>
                <label class='layui-form-label'>持股数量</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='stockNumber' lay-verify="required|number" placeholder='' autocomplete='off'
                           class='layui-input' value="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label label'>填报前一交易日市值（万元）</label>
                <div class='layui-input-inline'>
                    <input type='text' name='price' lay-verify="required|number" placeholder='' autocomplete='off'
                           class='layui-input' value="">
                </div>
            </div>
            <%--<div class='layui-inline'>--%>
            <%--<label class='layui-form-label'>填报前一交易日所有股票的总市值（万元）</label>--%>
            <%--<div class='layui-input-inline input'>--%>
            <%--<input type='text' name='totalPrice' lay-verify="required|number" placeholder='' autocomplete='off' class='layui-input' value="">--%>
            <%--</div>--%>
            <%--</div>--%>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class='layui-form-label'>备注</label>
                <div class='layui-input-inline'>
						<textarea placeholder='' class='layui-textarea txtArea' name='remark'></textarea>
                </div>
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


