<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

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

        <div class="layui-inline" style="float:right">
            <button class="layui-btn layui-btn-normal" type="button" id="addReward">新增</button>
        </div>

    </div>
</form>

<table id="rewardTable" lay-filter="rewardTable"></table>

<script type="text/html" id="rewardTableBar">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="detail">明细</a>
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
                {field: 'userName', title: '姓名'},
                {field: 'policeCode', title: '警号'},
                {field: 'organization', title: '单位',width:320},
                {field: 'rewardType', title: '表彰类型'},
                {field: 'rewardTime', title: '表彰时间'},
                {field: 'operate', align: 'center', title: '操作', toolbar: '#rewardTableBar'}
            ]]
        });

        //查询按钮监听
        form.on('submit(queryOperateLog)', function (data) {
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
            $.post('reward/toAddReward', function (html) {
                layer.open({
                    type: 1,
                    title: '新增表彰',
                    area: ['1200', '700px'],
                    content: html
                });
            });
        });
    });
</script>

