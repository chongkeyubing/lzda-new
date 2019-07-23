<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='arcmarriageinfo/add' id="archiveForm" method="post">
        <div class="layui-form-item">

            <div class='layui-inline'>
                <label class="layui-form-label">婚姻现状</label>
                <div class='layui-input-inline'>
                    <select name="marriageStatus">
                        <option value="">请选择输入内容</option>
                        <option value="未婚">未婚</option>
                        <option value="已婚">已婚</option>
                        <option value="离异">离异</option>
                        <option value="丧偶">丧偶</option>
                    </select>
                </div>
            </div>
            <div class='layui-inline'>
                <label class="layui-form-label">变化情况</label>
                <div class='layui-input-inline'>
                    <select name="changeSituation" lay-verify="required">
                        <option value="">请选择输入内容</option>
                        <option value="无变化">无变化</option>
                        <option value="有变化">有变化</option>
                    </select>
                </div>
            </div>

            <div class='layui-inline'>
                <label class="layui-form-label">有变化</label>
                <div class='layui-input-inline'>
                    <select name="changeStatus">
                        <option value="">请选择输入内容</option>
                        <option value="结婚">结婚</option>
                        <option value="离婚">离婚</option>
                        <option value="丧偶">丧偶</option>
                        <option value="再婚">再婚</option>
                    </select>
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class='layui-form-label'>变化时间</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='changeDate' id='changeDate' placeholder='' autocomplete='off'
                           class='layui-input' value="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>变化原因</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='changeReason' id='' placeholder='' autocomplete='off' class='layui-input'
                           value="">
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
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#changeDate'
        });
        form.render();
    });
</script>

