<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='punnotice/add' id="punishForm" method="post">
        <%--隐藏表单--%>
        <input type="hidden" name="organizationId" id="selectOrganizationId">
        <!-- 填表人 -->
        <input type="hidden" name="operatorId" value="${currentUser.id}">
        <input type="hidden" name="operator" value="${currentUser.realname}">
        <input type="hidden" name="userId" id="selectUserId">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">被通报人姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="点击选择" style="width: 74%;display: inline-block;"
                           id="selectUserName">
                    <button class="layui-btn  layui-btn-sm layui-btn-normal" type="button" id="selectUser">选择</button>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">被通报人单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="organization" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectOrganization">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">被通报人职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="jobPosition" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectJobPosition">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">通报类型</label>
                <div class="layui-input-inline">
                    <select name="type" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="分局通报">分局通报</option>
                        <option value="市局通报">市局通报</option>
                        <option value="省厅通报">省厅通报</option>
                        <option value="其他部门通报">其他部门通报</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">通报时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="time" id="time" autocomplete="off" class="layui-input" lay-verify="required|date">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">处理情况</label>
                <div class="layui-input-inline">
                    <select name="handleInfo" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="通报批评">通报批评</option>
                        <option value="提醒谈话">提醒谈话</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">记分情况</label>
                <div class="layui-input-inline">
                    <select name="score" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                        <option value="6">6</option>
                        <option value="7">7</option>
                        <option value="8">8</option>
                        <option value="9">9</option>
                        <option value="10">10</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">通报内容</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="content" lay-verify="required"></textarea>
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

        //日期
        laydate.render({
            elem: '#time'
        });

        form.render();

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
    });
</script>

