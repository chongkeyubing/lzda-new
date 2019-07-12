<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='arcleaveofficehandover/add' id="archiveForm" method="post">
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
                <label class='layui-form-label'>任职时间</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='duringTime' id="duringTime" lay-verify="required" placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class="layui-form-label">调往单位</label>
                <div class='layui-input-inline'>
                    <input type='text' name='toOrganization' lay-verify="required" placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class="layui-form-label">职务</label>
                <div class='layui-input-inline'>
                    <input type='text' name='toJobPosition' lay-verify="required"  placeholder='' autocomplete='off' class='layui-input' value="">
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class="layui-form-label">公文、资料是否按规定移交</label>
                <div class='layui-input-inline'>
                    <select name="documentHandover" lay-verify="required">
                        <option value="">请选择输入内容</option>
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>
                </div>
            </div>
            <div class='layui-inline'>
                <label class="layui-form-label">办公用具是否按规定移交</label>
                <div class='layui-input-inline'>
                    <select name="officeHandover" lay-verify="required">
                        <option value="">请选择输入内容</option>
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>
                </div>
            </div>
            <div class='layui-inline'>
                <label class="layui-form-label">生活用具是否按规定移交</label>
                <div class='layui-input-inline'>
                    <select name="lifeHandover" lay-verify="required">
                        <option value="">请选择输入内容</option>
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>
                </div>
            </div>
        </div>
        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class="layui-form-label">有无单位欠款</label>
                <div class='layui-input-inline'>
                    <select name="debt" lay-verify="required">
                        <option value="">请选择输入内容</option>
                        <option value="有">有</option>
                        <option value="无">无</option>
                    </select>
                </div>
            </div>

            <%--<div class='layui-inline'>--%>
                <%--<label class="layui-form-label">调离单位主管领导</label>--%>
                <%--<div class='layui-input-inline'>--%>
                    <%--<select name="q">--%>
                        <%--<option value="">请选择输入内容</option>--%>
                        <%--<option value="">是</option>--%>
                        <%--<option value="">否</option>--%>
                    <%--</select>--%>
                <%--</div>--%>
            <%--</div>--%>
        </div>

        <div class="layui-form-item layui-form-text">
            <div class='layui-inline'>
                <label class='layui-form-label'>其他公物按规定移交情况</label>
                <div class='layui-input-inline'>
                    <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="otherHandover" lay-verify="required"></textarea>
                </div>
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

        //日期范围选择
        laydate.render({
            elem: '#duringTime'
            ,range: true //或 range: '~' 来自定义分割字符
        });

        form.render();
    });
</script>

