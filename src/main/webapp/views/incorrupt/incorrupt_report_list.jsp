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
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryUser" id="queryUser">查询
                </button>
                <button class="layui-btn layui-btn-warm" type="reset" id="resetQueryUser">清空</button>
            </div>
            <div style="float: right;">
                <div class="layui-inline">
                    <label class="layui-form-label">报告时间段</label>
                    <div class="layui-input-inline">
                        <input type="text" name="time" id="time" autocomplete="off" class="layui-input">
                    </div>
                </div>
            </div>
        </div>
    </form>

    <table id="userTable" lay-filter="userTable"></table>

    <script type="text/html" id="userTableBar">
        <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="detail">生成报告</a>
    </script>
</div>

<script>
    layui.use(['form', 'table', 'layer', 'laydate'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;
        form.render();

        laydate.render({
            elem: '#time',
            range: true
        });

        var tableIns = table.render({
            elem: '#userTable',
            url: 'user/list',
            page: true, //开启分页
            method: 'post',
            cols: [[ //表头
                {field: 'realname', title: '姓名', minWidth: 100},
                {field: 'policeCode', title: '警号', minWidth: 100},
                // {field: 'role', title: '角色', minWidth: 120},
                {field: 'organizationName', title: '单位', minWidth: 340},
                {field: 'jobPosition', title: '职务', minWidth: 200},
                {field: 'operate', align: 'center', title: '操作', toolbar: '#userTableBar', width: 220}
            ]]
        });

        //明细按钮监听
        table.on('tool(userTable)', function (obj) {
            debugger;
            var data = obj.data;
            var param = '?id=' + data.id + '&time=' + $("#time").val();
            if (obj.event === 'detail') {
                layer.msg("正在生成报告");
                var a = document.createElement('a');
                a.setAttribute('href', 'incorruptReport/export' + param);
                a.setAttribute('download', '');
                a.style.display = 'none';
                document.body.appendChild(a);
                a.click();
                document.body.removeChild(a);
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
    });
</script>

