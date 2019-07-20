<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action="reward/update" method="post" id="rewardForm">
        <input type="hidden" name="id" value="${reward.id}">
        <input type="hidden" name="userId" id="selectUserId" value="${reward.userId}">
        <input type="hidden" name="organizationId" id="selectOrganizationId" value="${reward.organizationId}">

        <input type="hidden" name="operatorName" value="${reward.operatorName}">
        <input type="hidden" name="operatorId" value="${reward.operatorId}">
        <%--附件id--%>
        <input type="hidden" name="attachmentId" value="${reward.attachmentId}">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">被表彰人</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" readonly autocomplete="off" class="layui-input"
                           placeholder="点击选择被表彰人" lay-verify="required" id="selectUserName" value="${reward.userName}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="organization" lay-verify="required" id="selectOrganization" readonly
                           autocomplete="off"
                           class="layui-input" value="${reward.organization}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="jobPosition" lay-verify="required" id="selectJobPosition" readonly
                           autocomplete="off"
                           class="layui-input" value="${reward.jobPosition}">
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">表彰类型</label>
                <div class="layui-input-inline">
                    <select name="rewardType" lay-verify="required">
                        <c:forTokens items="通报表扬,嘉奖,三等功,二等功,一等功,其他" delims="," var="rewardType">
                            <option value="${rewardType}"
                                    <c:if test="${reward.rewardType == rewardType}">selected</c:if>
                            >${rewardType}</option>
                        </c:forTokens>

                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">表彰时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="rewardTime" id="rewardTime" lay-verify="required" autocomplete="off"
                           class="layui-input" value="${reward.rewardTime}">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">表彰单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="rewardOrganization" lay-verify="required" autocomplete="off"
                           class="layui-input" value="${reward.rewardOrganization}">
                </div>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">表彰内容</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" lay-verify="required" class="layui-textarea txtArea"
                          name="content">${reward.content}</textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备注</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" name="remark" class="layui-textarea txtArea">${reward.remark}</textarea>
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
                        <img class="delete deleteImg"  src="static/images/delete.png"
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
        <div class="layui-form-item">
            <div class="layui-input-block reset">
                <button class="layui-btn layui-btn-normal layui-btn-lg" lay-submit lay-filter="submitReward">
                    提交
                </button>
                <button class="layui-btn layui-btn-warm layui-btn-lg" type="button" id="closeAdd">
                    返回
                </button>
            </div>
        </div>
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
            elem: '#rewardTime'
        });

        //点击提交
        form.on('submit(submitReward)', function () {
            debugger;
            layer.load(2)
            $("#rewardForm").ajaxSubmit({
                success: function (data) {
                    if (data.success) {
                        //关闭当前弹窗
                        layer.closeAll();
                        layer.msg("提交成功");

                        //重载查询页面表格
                        $("#queryReward").click();
                    } else {
                        layer.msg("提交失败，请重新尝试或联系管理员");
                    }
                }
            });
            return false;//阻止表单跳转
        });

        $("#closeAdd").click(function () {
            layer.closeAll();
        });

        //图片删除
        $(".deleteImg").click(function () {
            debugger;
            var _this = this;
            layer.confirm('确定删除？', function (index) {
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
