<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='punreport/add' id="punishForm" method="post">
        <%--隐藏表单--%>
        <input type="hidden" name="organizationId" id="selectOrganizationId">
        <!-- 填表人 -->
        <input type="hidden" name="operatorId" value="${currentUser.id}">
        <%--<input type="hidden" name="operator" value="${currentUser.realname}">--%>
        <input type="hidden" name="userId" id="selectUserId">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">被举报人姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="点击选择" style="width: 74%;display: inline-block;"
                           id="selectUserName">
                    <button class="layui-btn  layui-btn-sm layui-btn-normal" type="button" id="selectUser">选择</button>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">被举报人单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="organization" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectOrganization">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">被举报人职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="jobPosition" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectJobPosition">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">举报形式</label>
                <div class="layui-input-inline">
                    <select name="type" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="写检举">写检举</option>
                        <option value="电话举报">电话举报</option>
                        <option value="当面向有关人员举报">当面向有关人员举报</option>
                        <option value="网上举报">网上举报</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">举报时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="time" id="time" lay-verify="required|date" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">受理部门</label>
                <div class="layui-input-inline">
                    <div class="layui-input-inline">
                        <input type="text" name="handleOrg" lay-verify="required" autocomplete="off"
                               class="layui-input">
                    </div>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">举报人</label>
                <div class="layui-input-inline">
                    <input type="text" name="reportPersonName" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">联系方式</label>
                <div class="layui-input-inline">
                    <input type="text" name="contact" lay-verify="required|number" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">核实结束时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="endTime" id="endTime" lay-verify="required|date" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">负责人</label>
                <div class="layui-input-inline">
                    <input type="text" name="chargePerson" readonly lay-verify="required" autocomplete="off"
                            class="layui-input" placeholder="点击选择" style="width: 74%;display: inline-block;"
                           id="selectSecondUserName" >
                    <button class="layui-btn  layui-btn-sm layui-btn-normal" type="button" id="selectSecondUser">选择</button>
                    <input type="hidden" name="chargePersonId" id="selectSecondUserId" readonly lay-verify="required"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">填表科室</label>
                <div class="layui-input-inline">
                    <input type="text" name="handleDep" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">填表人</label>
                <div class="layui-input-inline">
                    <input type="text" name="operator" lay-verify="required" autocomplete="off" class="layui-input"
                           readonly value="${currentUser.realname}">
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">反映主要问题</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" lay-verify="required"
                          name="problem"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">核实结果</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" lay-verify="required"
                          name="result"></textarea>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">处理结果</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" lay-verify="required"
                          name="hanldeResult"></textarea>
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

        laydate.render({
            elem: '#endTime'
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

        //选择负责人
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
