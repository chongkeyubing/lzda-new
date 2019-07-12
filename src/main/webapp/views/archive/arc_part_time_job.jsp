<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center">
    <form class='layui-form form1' action='arcparttimejob/add' id="archiveForm" method="post">
        <div class="layui-form-item">
            <div class='layui-inline'>
                <label class='layui-form-label'>姓名</label>
                <div class='layui-input-inline input'>
                    <input type='text' value="${currentUser.realname}" readonly lay-verify="required" name=''
                           placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class="layui-form-label">单位</label>
                <div class='layui-input-inline'>
                    <input type='text' lay-verify="required" autocomplete='off' class='layui-input'
                           value="${currentUser.organizationName}" readonly>
                </div>
            </div>
            <div class='layui-inline'>
                <label class="layui-form-label">职务</label>
                <div class='layui-input-inline'>
                    <input type='text' lay-verify="required" autocomplete='off' class='layui-input'
                           value="${currentUser.jobPosition}" readonly>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">兼职单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="parttimeOrg" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">兼职单位性质</label>
                <div class="layui-input-inline">
                    <select name="parttimeOrgType" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="国家机关">国家机关</option>
                        <option value="全民企业单位">全民企业单位</option>
                        <option value="全民事业单位">全民事业单位</option>
                        <option value="社会团体">社会团体</option>
                        <option value="集体企业">集体企业</option>
                        <option value="民办企业">民办企业</option>
                        <option value="外资企业">外资企业</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">兼任职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="parttimeJob" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">兼职时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="parttimeDuring"  lay-verify="required" id="parttimeDuring" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">兼职取酬情况(元/年)</label>
                <div class="layui-input-inline">
                    <input type="text" name="parttimeSalary" lay-verify="required|number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">兼职批准机关</label>
                <div class="layui-input-inline">
                    <input type="text" name="approveOrg" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">情况说明以及本人意见</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="advice"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">纠正处理情况</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="handle"></textarea>
            </div>
        </div>
        <%--<div class="layui-form-item layui-form-text">--%>
        <%--<label class="layui-form-label">党组织审核意见</label>--%>
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
            elem: '#parttimeDuring',
            range: true

        });
        form.render();
    });
</script>

