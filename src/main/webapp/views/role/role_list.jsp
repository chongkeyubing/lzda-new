<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%--<form class="layui-form form1">--%>
    <%--<div class="layui-form-item">--%>
        <%--<div class="layui-inline" style="float:right">--%>
            <%--<button class="layui-btn layui-btn-normal" type="button" id="addRole">新增角色</button>--%>
        <%--</div>--%>
    <%--</div>--%>
<%--</form>--%>

<table id="roleTable" lay-filter="roleTable" class="layui-table"></table>

<script type="text/html" id="roleTableBar">
    <%--<a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="detail">明细</a>--%>
    <a class="layui-btn layui-btn-sm layui-btn-warm" lay-event="update">修改权限</a>
    <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del">删除</a>
</script>

<script>
    layui.use(['form', 'table', 'layer', 'laytpl'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laytpl = layui.laytpl;

        form.render();

        var tableIns = table.render({
            elem: '#roleTable',
            url: 'role/list',
            page: true, //开启分页
            method: 'post',
            cols: [[ //表头
                {field: 'roleName', title: '角色名'},
                {
                    field: 'createTime',
                    title: '创建时间',
                    templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"
                },
                {field: 'operate', align: 'center', title: '操作', toolbar: '#roleTableBar'}
            ]]
        });

        //明细按钮监听
        table.on('tool(roleTable)', function (obj) {
            debugger;
            var data = obj.data;
            if (obj.event === 'update') {
                $.get('role/toUpdate?id=' + data.id, function (html) {
                    layer.open({
                        type: 1,
                        title: '修改' + data.roleName + '权限',
                        area: ['450px', '550px'],
                        content: html
                    });
                });
            } else if (obj.event === 'del') {
                debugger;
                layer.confirm('确定删除？', function (index) {
                    $.get('role/delete?id=' + data.id, function (data) {
                        layer.close(index);
                        if (data.success) {
                            layer.msg("删除成功");
                        } else {
                            layer.msg(data.message);
                        }
                    });
                });
            }
        });

        //查询按钮监听
        form.on('submit(queryRole)', function (data) {
            debugger;
            reloadTable(data.field);//当前容器的全部表单字段，名值对形式：{name: value}
            return false; //阻止表单跳转
        });

        //表格重载
        function reloadTable(param) {
            tableIns.reload({
                where: param //设定异步数据接口的额外参数，任意设
            });
        }

        $("#addRole").click(function () {
            $.get('reward/toAddRole', function (html) {
                layer.open({
                    type: 1,
                    title: '新增角色',
                    area: ['100%', '100%'],
                    content: html
                });
            });
        });
    });
</script>



