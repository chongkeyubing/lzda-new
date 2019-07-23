<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center">
    <form class='layui-form form1' action='arcpersonalother/add' id="archiveForm" method="post">
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">个人认为需要报告的其他事项</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="otherInfo" lay-verify="required"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">本 人 承 诺</label>
            <div class="layui-input-inline area">
                <textarea placeholder="请输入内容" name="promise" class="layui-textarea txtArea" readonly
                          style="text-indent: 2em;">我已认真学习《领导干部报告个人有关事项规定》和《领导干部个人有关事项报告查核结果处理办法》，认真阅读《填表须知和每一事项表格下方的填表说明，所填内容已与配偶、子女及其配偶进行了认真核实。我郑重承诺，本人对以上所填内容的真实性和完整性负责，井自愿接受组织监督和查核。</textarea>
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
            elem: '#date'
        });
        laydate.render({
            elem: '#date1'
        });
    });
</script>

