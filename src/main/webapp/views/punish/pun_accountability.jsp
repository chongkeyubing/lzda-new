<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='punaccountability/add' id="punishForm" method="post">
        <%--隐藏表单--%>
        <input type="hidden" name="organizationId" id="selectOrganizationId">
        <!-- 填表人 -->
        <input type="hidden" name="operatorId" value="${currentUser.id}">
        <input type="hidden" name="operator" value="${currentUser.realname}">
        <input type="hidden" name="userId" id="selectUserId">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓 名</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="点击选择" style="width: 74%;display: inline-block;"
                           id="selectUserName">
                    <button class="layui-btn  layui-btn-sm layui-btn-normal" type="button" id="selectUser">选择</button>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="organization" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectOrganization">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">职 务</label>
                <div class="layui-input-inline">
                    <input type="text" name="jobPosition" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectJobPosition">
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">问责类型</label>
                <div class="layui-input-inline">
                    <select name="type" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="诫勉谈话">诫勉谈话</option>
                        <option value="书面检查">书面检查</option>
                        <option value="责令公开道歉">责令公开道歉</option>
                        <option value="停职检查">停职检查</option>
                        <option value="引咎辞职">引咎辞职</option>
                        <option value="责令辞职">责令辞职</option>
                        <option value="免职">免职</option>
                        <option value="辞退或解聘">辞退或解聘</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">问责时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="time" id="time" lay-verify="required|date" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">问责内容</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="content"
                          lay-verify="required"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备 注</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="remark"></textarea>
            </div>
        </div>

        <div class="imgBox">
            <p>照片</p>
            <div class="article">
                <div class="items">
                    <img class="addImg" onclick="clickImg(this);" src="static/images/addImg.png"/>
                    <input name="url" type="file" class="upload_input" onchange="change(this)" accept="image/*"
                           capture="camera"/>
                    <div class="preBlock">
                        <img class="preview" alt="" name="pic"/>
                    </div>
                    <img class="delete" onclick="deleteImg(this)" src="static/images/delete.png"/>
                </div>
            </div>
        </div>

        <%-- 提交 --%>
        <%@ include file="./common/punish_submit.jsp" %>
    </form>
    <div id="template" style="display: none;">

        <div class="items">

            <img class="addImg" onclick="clickImg(this);" src="static/images/addImg.png"/>

            <input name="url{ID}" type="file" class="upload_input" onchange="change(this)" accept="image/*"
                   capture="camera"/>

            <div class="preBlock">
                <img class="preview" alt="" name="pic"/>
            </div>

            <img class="delete" onclick="deleteImg(this)" src="static/images/delete.png"/>
        </div>
    </div>
</div>

<script src="static/js/initDom.js"></script>
<script src="static/js/imgUp1.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        form.render();

        //日期
        laydate.render({
            elem: '#time'
        });

        //选择用户
        $("#selectUser").click(function (e) {
            $.get('user/toUserSelect', function (html) {
                layer.open({
                    type: 1,
                    title: '选择用户',
                    area: ['1000'],
                    content: html
                });
            });
        });

    });
</script>
