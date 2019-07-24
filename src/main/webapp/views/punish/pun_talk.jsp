<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='puntalk/add' id="punishForm" method="post">

        <%--隐藏表单--%>
        <input type="hidden" name="organizationId" id="selectOrganizationId">
        <!-- 填表人 -->
        <input type="hidden" name="operatorId" value="${currentUser.id}">
        <input type="hidden" name="operator" value="${currentUser.realname}">
        <input type="hidden" name="userId" id="selectUserId">
        <%--谈话人id--%>
        <input type="hidden" name="talkPersonId" autocomplete="off" class="layui-input" id="selectSecondUserId">
            <input type="hidden" name="punishType" value="${punishType}">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">被谈话人姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="点击选择" style="width: 74%;display: inline-block;"
                           id="selectUserName">
                    <button class="layui-btn  layui-btn-sm layui-btn-normal" type="button" id="selectUser">选择</button>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">被谈话人单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="organization" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectOrganization">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">被谈话人职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="jobPosition" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectJobPosition">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">谈话人姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="talkPersonName" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="点击选择" style="width: 74%;display: inline-block;"
                           id="selectSecondUserName">
                    <button class="layui-btn  layui-btn-sm layui-btn-normal" type="button" id="selectSecondUser">选择
                    </button>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">谈话人单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="talkPersonOrg" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectSecondOrganization">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">谈话人职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="talkPersonJob" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectSecondJobPosition">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">谈话类型</label>
                <div class="layui-input-inline">
                    <input type="text" name="type" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">谈话地点</label>
                <div class="layui-input-inline">
                    <input type="text" name="address" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">谈话时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="time" id="time" readonly lay-verify="required|date" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>


        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">谈话内容</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="content"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">被谈话人意见</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="talkedPersonAdvice"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注</label>
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
    layui.use(['form', 'layedit', 'laydate', 'layer'], function () {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#time'
        });

        //选择用户
        $("#selectUser").click(function (e) {
            $.get('views/user/user_select.jsp', function (html) {
                layer.open({
                    type: 1,
                    title: '选择用户',
                    area: ['1000'],
                    content: html
                });
            });
        });

        //选择谈话人
        $("#selectSecondUser").click(function (e) {
            $.get('views/user/user_select_second.jsp', function (html) {
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

