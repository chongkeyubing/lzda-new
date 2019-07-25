<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center">
    <form class='layui-form form1' action='arcpoliceinvolve/add' id="archiveForm" method="post">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="time" id="time" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">民警姓名</label>
                <div class="layui-input-inline">
                    <input type="text" autocomplete="off" class="layui-input" value="${currentUser.realname}" readonly>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">单位</label>
                <div class="layui-input-inline">
                    <input type="text" autocomplete="off" class="layui-input" value="${currentUser.organizationName}" readonly>
                </div>
            </div>

        </div>

        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">涉警人姓名</label>
                <div class="layui-input-inline">
                    <input type="text" autocomplete="off" lay-verify="required" class="layui-input" id="involvedName" name="involvedName">
                </div>
            </div>



            <div class="layui-inline">
                <label class="layui-form-label">与民警关系</label>
                <div class="layui-input-inline">
                    <select name="relationship" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="家人">家人</option>
                        <option value="亲戚">亲戚</option>
                        <option value="朋友">朋友</option>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">涉警人单位</label>
                <div class="layui-input-inline">
                    <input type="text" autocomplete="off" class="layui-input" lay-verify="required" id="involvedOrganization" name="involvedOrganization">
                </div>
            </div>

        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">涉警内容</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="content" lay-verify="required"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">处理情况</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="result" lay-verify="required"></textarea>
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
            laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#time'
        });

        form.render();
    });
</script>

