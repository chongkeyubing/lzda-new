<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='punviolation/add' id="punishForm" method="post">
        <%--隐藏表单--%>
        <input type="hidden" name="organizationId" id="selectOrganizationId">
        <!-- 填表人 -->
        <input type="hidden" name="operatorId" value="${currentUser.id}">

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
                <label class="layui-form-label">性 别</label>
                <div class="layui-input-inline">
                    <input type="text" name="gender" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectGender">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出生年月</label>
                <div class="layui-input-inline">
                    <input type="text" name="birthday" lay-verify="required" readonly id="selectBirthday"
                           autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">是否移交司法机关</label>
                <div class="layui-input-inline">
                    <select name="transfer" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="是">是</option>
                        <option value="否">否</option>
                    </select>
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">违规级别</label>
                <div class="layui-input-inline">
                    <select name="violationLevel" id="violationLevel" lay-filter="violationLevel">
                        <option value="">请选择</option>
                        <option value="政务处分">政务处分</option>
                        <option value="党纪处分">党纪处分</option>
                        <option value="问责">问责</option>
                        <option value="违纪">违纪</option>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">违纪类型</label>
                <div class="layui-input-inline">
                    <select name="violationType" id="violationType">
                        <option value="">请选择违规级别</option>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">查处单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="violationOrg" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">处理时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="handleTime" lay-verify="required|date" id="handleTime" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">填表人</label>
                <div class="layui-input-inline">
                    <input type="text" name="operator" autocomplete="off" lay-verify="required" class="layui-input"
                           readonly
                           value="${currentUser.realname}">
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">处理情况</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" lay-verify="required"
                          name="handleInfo"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">主要错误事实</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" lay-verify="required"
                          name="mistakeFact"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">处理依据</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" lay-verify="required"
                          name="handleBasis"></textarea>
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
            elem: '#handleTime'
        });

        form.render();

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

        var violationLevel = [
            {name: '政务处分', types: ['政务警告', '记大过', '降级', '撤职', '开除']},
            {name: '党纪处分', types: ['党纪警告', '严重警告', '撤销党内职务', '留党查看', '开除党籍']},
            {name: '问责', types: ['通报', '诫勉谈话', '停职检查', '调整职务', '责令辞职', '降职', '免职']},
            {name: '违纪', types: ['分局通报', '提醒谈话', '书面检查', '记分']}
        ];

        //违纪下拉联动
        form.on('select(violationLevel)', function (data) {
            debugger;
            console.log(data);
            $("violationType").html('');
            for (var i = 0; i < violationLevel.length; i++) {
                if (!data.value) {
                    $("#violationType").html('<option value="">请选择违规级别</option>');
                    break;
                }
                if (data.value == violationLevel[i].name) {
                    //渲染违纪类型
                    var types = violationLevel[i].types;
                    var typeHtml = '';
                    for (var j = 0; j < types.length; j++) {
                        typeHtml += '<option value="' + types[j] + '"> ' + types[j] + '</option>';
                    }
                    $("#violationType").html(typeHtml);
                    break;
                }
            }
            form.render();

        });

    });
</script>

