<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center">
    <form class='layui-form form1' action='arcpassportinfo/add' id="archiveForm" method="post">
        <div class="layui-form-item">

            <div class='layui-inline'>
                <label class='layui-form-label'>护照号</label>
                <div class='layui-input-inline'>
                    <input type='text' name='passportNumber' autocomplete='off' class='layui-input' >
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>签发日期</label>
                <div class='layui-input-inline'>
                    <input type='text' name='grantDate' id='grantDate' placeholder='' autocomplete='off' class='layui-input' value="" >
                </div>
            </div>

            <div class='layui-inline'>
                <label class='layui-form-label'>有效期</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='expiryDate'  id='expiryDate' placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class="layui-form-label">保管单位</label>
                <div class='layui-input-inline'>
                    <select name="storekeeper">
                        <option value="">请选择输入内容</option>
                        <option value="单位保管">单位保管</option>
                        <option value="个人保管">个人保管</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备 注</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="remark"></textarea>
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
            laydate = layui.laydate;

        laydate.render({
            elem: '#grantDate'
        });
        laydate.render({
            elem: '#expiryDate'
        });

        form.render();
    });
</script>
