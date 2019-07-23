<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action="user/add" method="post" id="userAddForm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="realname" lay-verify="required" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">警号</label>
                <div class="layui-input-inline">
                    <input type="text" name="policeCode" lay-verify="required" autocomplete="off" class="layui-input"
                           onkeyup="this.value=this.value.replace(/[^\d]/g,'') " onafterpaste="this.value=this.value.replace(/[^\d]/g,'')">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">单位</label>
                <div class="layui-input-inline">
                    <select name="organizationId" lay-search lay-verify="required" id="organizationName">
                        <option value="">请选择或搜索单位</option>
                        <c:forEach items="${organizations}" var="o">
                            <option value="${o.id}">${o.name}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">角色</label>
                <div class="layui-input-inline">
                    <select name="roleid" lay-verify="required">
                        <option value="">请选择角色</option>
                        <c:forEach items="${roles}" var="r">
                            <option value="${r.id}">${r.roleName}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <select name="gender" lay-verify="required">
                        <option value="">请选择性别</option>
                        <option value="男">男</option>
                        <option value="女">女</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出生日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="birthday" id="birthday" lay-verify="required" autocomplete="off"
                           class="layui-input">
                </div>
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="jobPosition" autocomplete="off" lay-verify="required" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">身份证</label>
                <div class="layui-input-inline">
                    <input type="text" name="identityNumber" autocomplete="off" lay-verify="required|identity"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item" style="text-align: center;margin-top: 20px">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="addUserSubmit" id="addUserSubmit">
                提交
            </button>
        </div>

    </form>

</div>

<script>
    layui.use(['form', 'table', 'layer', 'laytpl', 'laydate'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var form = layui.form;
        var laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#birthday'
        });

        form.render();

        form.on("submit(addUserSubmit)", function () {
            debugger;

            //添加单位名称字段
            var myform = $('#userAddForm'); //得到form对象
            var tmpInput = $("<input type='hidden' name='organizationName'/>");
            tmpInput.attr("value", $('#organizationName option:selected').text());   //将会得到选中的text值
            myform.append(tmpInput);

            layer.load(2)
            $("#userAddForm").ajaxSubmit({
                success: function (data) {
                    if (data.success) {
                        //关闭当前弹窗
                        layer.closeAll();
                        layer.msg("新增成功");

                        //重载查询页面表格
                        $("#resetQueryArchive").click();
                        $("#queryArchive").click();
                    } else {
                        layer.msg("新增失败，请重新尝试或联系管理员");
                    }
                }
            });

            return false;
        });
    });
</script>

