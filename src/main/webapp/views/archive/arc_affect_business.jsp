<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class='layui-form form1' action='arcaffectbusiness/add' id="archiveForm" method="post">
        <div class="layui-form-item">
            <div class='layui-inline'>
                <label class='layui-form-label'>时间</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='time' id="time" lay-verify="required" placeholder='' autocomplete='off'
                           class='layui-input' value="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>姓名</label>
                <div class='layui-input-inline input'>
                    <input type='text' value="${currentUser.realname}" readonly lay-verify="required" placeholder=''
                           autocomplete='off' class='layui-input' value="">
                </div>
            </div>

            <div class='layui-inline'>
                <label class="layui-form-label">单位</label>
                <div class='layui-input-inline'>
                    <input type='text' lay-verify="required" autocomplete='off' class='layui-input'
                           value="${currentUser.organizationName}" readonly>
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class="layui-form-label">与民警关系</label>
                <div class='layui-input-inline'>
                    <select name="relationship" lay-verify="required">
                        <option value="">请选择输入内容</option>
                        <option value="家人">家人</option>
                        <option value="亲戚">亲戚</option>
                        <option value="朋友">朋友</option>
                        <option value="同事">同事</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">可能影响公正执行职务内容</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="content"
                          lay-verify="required"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">处理情况</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="handleInfo"
                          lay-verify="required"></textarea>
            </div>
        </div>
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
            laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#time'
        });
        form.render();
    });
</script>

