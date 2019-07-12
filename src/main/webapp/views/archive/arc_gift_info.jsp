<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='arcgiftinfo/add' id="archiveForm" method="post">
        <div class="layui-form-item">
            <div class='layui-inline'>
                <label class='layui-form-label'>姓名</label>
                <div class='layui-input-inline input'>
                    <input type='text' lay-verify="required" autocomplete='off' class='layui-input'
                           value="${currentUser.realname}" readonly>
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
                <label class="layui-form-label">送礼人姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="giftPersonName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">送礼人单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="giftOrg" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">送礼人职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="giftJob" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">送礼时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="giftTime" id="giftTime" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">送礼地点</label>
                <div class="layui-input-inline">
                    <input type="text" name="giftAddress" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">送礼方式</label>
                <div class="layui-input-inline">
                    <input type="text" name="giftWay" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">礼品名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="giftName" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">数量</label>
                <div class="layui-input-inline">
                    <input type="text" name="giftNumber" lay-verify="required|number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">礼品折价（元）</label>
                <div class="layui-input-inline">
                    <input type="text" name="giftPrice" lay-verify="required|number" autocomplete="off" class="layui-input">
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">礼金（元）</label>
                <div class="layui-input-inline">
                    <input type="text" name="giftMoney" lay-verify="required|number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">合计（元）</label>
                <div class="layui-input-inline">
                    <input type="text" name="giftTotal" lay-verify="required|number" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">处理情况</label>
                <div class="layui-input-inline">
                    <select name="giftHandle" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="退还当事人">退还当事人</option>
                        <option value="上缴分局">上缴分局</option>
                        <option value="上缴单位">上缴单位</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">送礼事由</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="giftReason" lay-verify="required"></textarea>
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
    layui.use(['form', 'laydate'], function () {
        var form = layui.form,
            laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#giftTime'
        });
        form.render();

    });
</script>

