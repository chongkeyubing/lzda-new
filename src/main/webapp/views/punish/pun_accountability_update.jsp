<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='punaccountability/update' id="punishForm" method="post">
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
                <label class="layui-form-label">问责类型</label>
                <div class="layui-input-inline">
                    <select name="type" lay-verify="required">
                        <c:forTokens items="诫勉谈话,书面检查,责令公开道歉,停职检查,引咎辞职,责令辞职,免职,辞退或解聘" delims="," var="type">
                            <option value="${type}"
                                    <c:if test="${punish.type == type}">selected</c:if>
                            >${type}</option>
                        </c:forTokens>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">问责时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="time" id="time" lay-verify="required|date" autocomplete="off"
                           class="layui-input" value="${punish.time}">
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">问责内容</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="content"
                          lay-verify="required">${punish.content}</textarea>
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
