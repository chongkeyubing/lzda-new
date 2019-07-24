<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class='layui-form form1' action='arcbanquetapply/add' id="archiveForm" method="post">
        <div class="layui-form-item">
            <div class='layui-inline'>
                <label class='layui-form-label'>申报人姓名</label>
                <div class='layui-input-inline input'>
                    <input type='text' value="${currentUser.realname}" readonly lay-verify="required" name='' placeholder='' autocomplete='off' class='layui-input' value="">
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
                <label class='layui-form-label'>亲属</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='relativesNumber' lay-verify="required|number" autocomplete='off' class='layui-input' value="" placeholder="人数">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>好友</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='friendNumber' lay-verify="required|number" autocomplete='off' class='layui-input' value="" placeholder="人数">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>其他</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='otherNumber' lay-verify="required|number" autocomplete='off' class='layui-input' value="" placeholder="人数">
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class='layui-form-label'>宴席标准（元）</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='totalLevel' lay-verify="required|number" autocomplete='off' class='layui-input' value="" placeholder="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>酒水标准（元）</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='wineLevel' lay-verify="required|number" autocomplete='off' class='layui-input' value="" placeholder="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>香烟和礼品标准（元）</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='cigaretteGiftLevel' lay-verify="required|number" autocomplete='off' class='layui-input' value="" placeholder="">
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class='layui-form-label'>车辆来源</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='vehicleSource' lay-verify="required" autocomplete='off' class='layui-input' value="" placeholder="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>车辆号码</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='vehicleNumber' lay-verify="required"  autocomplete='off' class='layui-input' value="" placeholder="">
                </div>
            </div>
            <div class='layui-inline'>
                <label class='layui-form-label'>活动时间</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='activityTime' id='activityTime' lay-verify="required" autocomplete='off' class='layui-input' value="" placeholder="">
                </div>
            </div>
        </div>

        <div class='layui-form-item'>
            <div class='layui-inline'>
                <label class='layui-form-label'>活动地点</label>
                <div class='layui-input-inline input'>
                    <input type='text' name='activityPosition' lay-verify="required" autocomplete='off' class='layui-input' value="" placeholder="">
                </div>
            </div>

        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">申报事由</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" lay-verify="required" class="layui-textarea txtArea" name="reason"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">其他需要申报和说明的情况</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="otherInfo"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">个人申请</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea"></textarea>
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
    layui.use(['laydate'], function () {
        var laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#activityTime'
        });

    });
</script>