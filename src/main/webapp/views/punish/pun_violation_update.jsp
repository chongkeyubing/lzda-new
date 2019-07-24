<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='punviolation/update' id="punishForm" method="post">
        <input type="hidden" name="id" value="${punish.id}">
        <%--隐藏表单--%>
        <input type="hidden" name="organizationId" id="selectOrganizationId" value="${punish.organizationId}">
        <!-- 填表人 -->
        <input type="hidden" name="operatorId" value="${punish.operatorId}">

        <input type="hidden" name="userId" id="selectUserId" value="${punish.userId}">
        <%--附件id--%>
        <input type="hidden" name="attachmentId" value="${punish.attachmentId}">
        <input type="hidden" name="punishType" value="${punishType}">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓 名</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" placeholder="点击选择" style="width: 74%;display: inline-block;"
                           id="selectUserName" value="${punish.userName}">
                    <button class="layui-btn  layui-btn-sm layui-btn-normal" type="button" id="selectUser">选择</button>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="organization" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectOrganization" value="${punish.organization}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">职 务</label>
                <div class="layui-input-inline">
                    <input type="text" name="jobPosition" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectJobPosition" value="${punish.jobPosition}">
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">性 别</label>
                <div class="layui-input-inline">
                    <input type="text" name="gender" readonly lay-verify="required" autocomplete="off"
                           class="layui-input" id="selectGender" value="${punish.gender}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出生年月</label>
                <div class="layui-input-inline">
                    <input type="text" name="birthday" lay-verify="required" readonly id="selectBirthday"
                           autocomplete="off" class="layui-input" value="${punish.birthday}">
                </div>
            </div>
            <%-- <div class="layui-inline">
                 <label class="layui-form-label">是否移交司法机关</label>
                 <div class="layui-input-inline">
                     <select name="transfer" lay-verify="required">
                         <c:forTokens items="是,否" delims="," var="transfer">
                             <option value="${transfer}"
                                     <c:if test="${punish.transfer == transfer}">selected</c:if>
                             >${transfer}</option>
                         </c:forTokens>
                     </select>
                 </div>
             </div>--%>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">违规级别</label>
                <div class="layui-input-inline">
                    <select name="violationLevel" id="violationLevel" lay-filter="violationLevel">
                        <c:forTokens items="政务处分,党纪处分,问责,违规,违法" delims="," var="violationLevel">
                            <option value="${violationLevel}"
                                    <c:if test="${punish.violationLevel == violationLevel}">selected</c:if>
                            >${violationLevel}</option>
                        </c:forTokens>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">违纪类型</label>
                <div class="layui-input-inline">
                    <select name="violationType" id="violationType">

                    </select>

                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">查处单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="violationOrg" lay-verify="required" autocomplete="off" class="layui-input"
                           value="${punish.violationOrg}">
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">处理时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="handleTime" lay-verify="required|date" id="handleTime" autocomplete="off"
                           class="layui-input" value="${punish.handleTime}">
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
                          name="handleInfo">${punish.handleInfo}</textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">主要错误事实</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" lay-verify="required"
                          name="mistakeFact">${punish.mistakeFact}</textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">处理依据</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" lay-verify="required"
                          name="handleBasis">${punish.mistakeFact}</textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="remark">${punish.remark}</textarea>
            </div>
        </div>

        <div class="imgBox">
            <p>照片</p>
            <div class="article">
                <c:forEach items="${attachments}" var="attachment">
                    <div class="items">
                        <img class="addImg" onclick="clickImg(this);" src="static/images/addImg.png"
                             style="display: none;"/>
                        <input name="url" type="file" class="upload_input" onchange="change(this)" accept="image/*"
                               capture="camera"/>
                        <div class="preBlock">
                            <img class="preview" alt="" name="pic" src="${attachment.url}"/>
                        </div>
                        <img class="delete deleteImg" src="static/images/delete.png"
                             style="display: block;" data-id="${attachment.id}"/>
                    </div>
                </c:forEach>

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
            {name: '违规', types: ['分局通报', '提醒谈话', '书面检查', '记分']},
            {name: '违法', types: ['移交司法机关', '未移交司法机关']}
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

        //违纪类型初始化渲染
        for (var i = 0; i < violationLevel.length; i++) {
            if ('${punish.violationLevel}' == violationLevel[i].name) {
                //渲染违纪类型
                var types = violationLevel[i].types;
                var typeHtml = '';
                for (var j = 0; j < types.length; j++) {
                    if (types[j] == '${punish.violationType}') {
                        typeHtml += '<option value="' + types[j] + '" selected> ' + types[j] + '</option>';
                    } else {
                        typeHtml += '<option value="' + types[j] + '"> ' + types[j] + '</option>';
                    }
                }
                $("#violationType").html(typeHtml);
                break;
            }
        }
        form.render();

        //图片删除
        $(".deleteImg").click(function () {
            debugger;
            var _this = this;
            layer.confirm('确定删除原图片？', function (index) {
                $.get("attachment/delete?id= " + $(_this).data("id"), function (data) {
                    layer.close(index); //关闭确定删除弹窗
                    if (data.success) {
                        layer.msg("删除成功");
                        deleteImg(_this);
                    } else {
                        layer.msg("删除失败");
                    }
                });
            });
        });

    });
</script>

