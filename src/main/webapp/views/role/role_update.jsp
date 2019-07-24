<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<style>
    .auth_check {
        margin-left: 110px
    }

    .auth_check .layui-form-checkbox span {
        height: auto;
    }

    .auth_check .layui-form-radio {
        line-height: 20px;
        color: #666;
    }

    .auth_check .layui-form-checkbox {
        display: block;
    }
</style>
<div style="display: flex;justify-content: center;margin-top: 20px">
    <div class="layui-form">
        <input type="hidden" value="${roleWithAuths.roleId}" id="roleId">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">角色名</label>
                <div class="layui-input-inline">
                    <input type='text' value="${roleWithAuths.roleName}" name="roleName" placeholder=''
                           autocomplete='off'
                           class='layui-input' id="roleName">
                </div>
            </div>

            <div class="layui-inline">
                <button class="layui-btn layui-btn-normal" type="button" id="updateRoleName">修改</button>
            </div>

        </div>

        <div class="layui-form-item auth_check">

            <div class="layui-input-inline">
                <p>数据查看范围</p>
                <c:forEach var="auth" items="${authorities}">
                    <c:if test="${auth.type == 1}">
                        <input value="${auth.id}" type="radio" name="authId" lay-skin="primary" title="${auth.name}"
                        <c:forEach var="roleAuth" items="${roleWithAuths.authorityList}">
                               <c:if test="${roleAuth.name == auth.name}">checked</c:if>
                        </c:forEach>
                        >
                    </c:if>
                </c:forEach>
                <p style="margin-top: 20px">菜单权限</p>
                <c:forEach var="auth" items="${authorities}">
                    <c:if test="${auth.type == 0}">
                        <input value="${auth.id}" type="checkbox" name="authId" lay-skin="primary" title="${auth.name}"
                        <c:forEach var="roleAuth" items="${roleWithAuths.authorityList}">
                               <c:if test="${roleAuth.name == auth.name}">checked</c:if>
                        </c:forEach>
                        >
                    </c:if>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<script>
    layui.use(['element', 'table', 'layer', 'form'], function () {
        var element = layui.element;
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;

        form.render();

        var originViewAuthId = $("input[type='radio']:checked").val();

        var rid = $("#roleId").val();

        //复选监听
        form.on('checkbox', function (data) {
            debugger;
            var param = {rid: rid, aid: data.value};
            if (data.elem.checked) {
                $.post('roleauth/add', param);
            } else {
                $.post('roleauth/delete', param);
            }
        });

        //单选监听
        form.on('radio', function (data) {
            debugger;
            var param = {rid: rid, aid: data.value, originViewAuthId: originViewAuthId};
            $.post('roleauth/update', param);
            originViewAuthId = data.value;
        });

        //修改
        $("#updateRoleName").click(function () {
            debugger;
            var param = {id: rid, roleName: $("#roleName").val()};
            $.post('role/update', param, function (data) {
                layer.closeAll();
                if (data.success) {
                    layer.msg("修改成功");

                    //重载表格
                    table.reload('roleTable', {url: 'role/list'});
                } else {
                    layer.msg("修改失败");
                }
            });
        });
    });

</script>

