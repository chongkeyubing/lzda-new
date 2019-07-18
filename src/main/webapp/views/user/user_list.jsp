<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="">
    <form class="layui-form form1">
        <div class="layui-form-item">

            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="realname" autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">警号</label>
                <div class="layui-input-inline">
                    <input type="text" name="policeCode" autocomplete="off" class="layui-input">
                </div>
            </div>


            <div class="layui-inline">
                <label class="layui-form-label">单位</label>
                <div class="layui-input-inline">
                    <select name="organizationId" lay-search>
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
                    <select name="roleid">
                        <option value="">请选择角色</option>
                        <c:forEach items="${roles}" var="r">
                            <option value="${r.id}">${r.rolename}</option>
                        </c:forEach>
                    </select>
                </div>
            </div>

        </div>
        <div class="layui-form-item">
            <div class="layui-input-block">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryUser" id="queryUser">查询
                </button>
                <button class="layui-btn layui-btn-warm" type="reset" id="resetQueryUser">清空</button>
            </div>

            <div class="layui-input-inline" style="float:right">
                <button class="layui-btn layui-btn-normal" lay-filter="addUserButton" type="button" id="addUserButton">
                    新增用户
                </button>
            </div>
        </div>

    </form>

    <table id="userTable" lay-filter="userTable"></table>

    <script type="text/html" id="userTableBar">
        <%--<a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="detail">明细</a>--%>
        <a class="layui-btn layui-btn-sm layui-btn-warm" lay-event="update">修改</a>
        <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="del">删除</a>
    </script>
</div>

<script>
    layui.use(['form', 'table', 'layer', 'laytpl'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var form = layui.form;
        form.render();

        var tableIns = table.render({
            elem: '#userTable',
            url: 'user/list',
            page: true, //开启分页
            method: 'post',
            cols: [[ //表头
                {field: 'realname', title: '姓名', width: 100},
                {field: 'policeCode', title: '警号', width: 100},
                {field: 'gender', title: '性别', width: 60},
                {field: 'role', title: '角色', width: 120},
                {field: 'birthday', title: '出生日期',width:120},
                {field: 'organizationName', title: '单位'},
                {field: 'jobPosition', title: '职务'},
                {field: 'identityNumber', title: '身份证'},
                {field: 'operate', align: 'center', title: '操作', toolbar: '#userTableBar', width: 180}
            ]]
        });

        //明细按钮监听
        table.on('tool(userTable)', function (obj) {
            debugger;
            var data = obj.data;

            if (obj.event === 'update') {
                $.get('user/toUpdateUser?id=' + data.id, function (html) {
                    layer.open({
                        type: 1,
                        title: "修改用户",
                        area: ['800px', '500px'],
                        content: html
                    });
                });
            } else if (obj.event === 'del') {
                debugger;
                layer.confirm('确定删除？', function (index) {
                    $.get('user/delete?id=' + data.id, function (data) {
                        layer.close(index);
                        if (data.success) {
                            layer.msg("删除成功");
                            $("#queryUser").click();
                        } else {
                            layer.msg("删除失败");
                        }
                    });
                });
            }
        });

        //查询按钮监听
        form.on('submit(queryUser)', function (data) {
            console.log(data.field); //当前容器的全部表单字段，名值对形式：{name: value}
            reloadTable(data.field);
            return false; //阻止表单跳转
        });

        //表格重载
        function reloadTable(param) {
            tableIns.reload({
                where: param //设定异步数据接口的额外参数，任意设
            });
        }

        //新增用户弹窗
        $("#addUserButton").click(function () {
            debugger;
            $.get('user/toAddUser', function (html) {
                layer.open({
                    type: 1,
                    title: '新增用户',
                    area: ['800px', '500px'],
                    content: html
                });
            });
        });

    });
</script>

