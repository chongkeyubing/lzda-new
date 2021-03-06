<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<form class="layui-form form1">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="userName" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">警号</label>
            <div class="layui-input-inline">
                <input type="text" name="policeCode" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryReward" id="queryReward">查询
            </button>
            <button class="layui-btn layui-btn-warm" type="reset" id="resetQueryReward">清空</button>
        </div>
        <shiro:hasPermission name="奖励信息新增">
            <div class="layui-inline" style="float:right">
                <button class="layui-btn layui-btn-normal" type="button" id="addReward">新增表彰</button>
            </div>
        </shiro:hasPermission>

    </div>
</form>

<table id="rewardTable" lay-filter="rewardTable"></table>

<script type="text/html" id="rewardTableBar">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="detail">明细</a>
    <shiro:hasPermission name="奖励信息修改">
        <a class="layui-btn layui-btn-sm layui-btn-warm" lay-event="update">修改</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="奖励信息删除">
        <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del">删除</a>
    </shiro:hasPermission>
</script>

<script>
    layui.use(['form', 'table', 'layer', 'laytpl'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laytpl = layui.laytpl;

        form.render();

        var tableIns = table.render({
            elem: '#rewardTable',
            url: 'reward/list',
            page: true, //开启分页
            method: 'post',
            cols: [[ //表头
                {field: 'userName', title: '姓名', minWidth: 100},
                {field: 'policeCode', title: '警号', minWidth: 100},
                {field: 'organizationName', title: '单位', minWidth: 300},
                {field: 'rewardType', title: '表彰类型', minWidth: 90},
                {field: 'operatorName', title: '表彰填写人', minWidth: 100},
                {field: 'rewardTime', title: '表彰时间', minWidth: 110},
                /*{field: 'createTime', title: '创建时间',templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>",minWidth:110},*/
                {
                    field: 'operate',
                    align: 'center',
                    title: '操作',
                    minWidth: 200,
                    toolbar: '#rewardTableBar',
                    minWidth: 200
                }
            ]]
        });

        //明细按钮监听
        table.on('tool(rewardTable)', function (obj) {
            debugger;
            var data = obj.data;
            if (obj.event === 'detail') {
                $.get('reward/toRewardDetail?id=' + data.id, function (html) {
                    layer.open({
                        type: 1,
                        title: data.rewardType + "-" + data.userName,
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            } else if (obj.event === 'update') {
                $.get('reward/toRewardUpdate?id=' + data.id, function (html) {
                    layer.open({
                        type: 1,
                        title: '修改表彰' + "-" + data.userName,
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            } else if (obj.event === 'del') {
                debugger;
                layer.confirm('确定删除？', function (index) {
                    $.get('reward/delete?id=' + data.id, function (data) {
                        layer.close(index);
                        if (data.success) {
                            layer.msg("删除成功");
                            $("#queryReward").click();
                        } else {
                            layer.msg("删除失败");
                        }
                    });
                });
            }
        });

        //查询按钮监听
        form.on('submit(queryReward)', function (data) {
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

        $("#addReward").click(function () {
            $.get('reward/toAddReward', function (html) {
                layer.open({
                    type: 1,
                    title: '新增表彰',
                    area: ['100%', '100%'],
                    content: html
                });
            });
        });
    });
</script>

