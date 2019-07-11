<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<style type="text/css">
    .layui-textarea.txtArea {
        width: 818px;
        height: 120px;
    }

    .layui-input-block.reset {
        margin-left: 0;
        text-align: center;
    }

    form.form1 {
        margin-top: 15px;
    }
</style>

<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='archkmoinfo/add' id="archiveForm" method="post">
        <div class="layui-form-item">

            <div class='layui-inline'>
                <label class='layui-form-label'>证件名称</label>
                <div class='layui-input-inline'>
                    <input type='text' name='certificateName' lay-verify="required" autocomplete='off'
                           class='layui-input' value="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>证件号码</label>
                <div class='layui-input-inline'>
                    <input type='text' name='certificateNumber' lay-verify="required" autocomplete='off'
                           class='layui-input' value="">
                </div>
            </div>

            <div class='layui-inline'>
                <label class='layui-form-label'>有效期</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='expiryDate' id='expiryDate' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class="layui-form-label">保管单位</label>
                <div class='layui-input-inline'>
                    <select name="storekeeper" lay-verify="required">
                        <option value="">请选择输入内容</option>
                        <option value="个人保管">个人保管</option>
                        <option value="单位保管">单位保管</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备 注</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" name="remark" class="layui-textarea txtArea"></textarea>
            </div>
        </div>

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
            elem: '#expiryDate'
        });

        form.render();
    });
</script>
