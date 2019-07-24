<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<div style="padding: 20px;width: 1000px;height: 550px;">
    <!--
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
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryUser">查询</button>
            <button class="layui-btn layui-btn-warm" type="reset">清空</button>
        </div>
    </div>
</form>
-->

<table id="userSelectTable" lay-filter="userSelectTable"></table>

<script type="text/html" id="userSelectTableBar">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="choose">选择</a>
</script>

</div>
<script>
    layui.use(['form', 'table', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        form.render();

        table.render({
            elem: '#userSelectTable',
            url: 'user/findApprover',
            //height: 312,
            page: true, //开启分页
            cols: [[ //表头
                {field: 'policeCode', title: '警号'},
                {field: 'realname', title: '姓名'},
                {field: 'organizationName', title: '单位' ,width:360},
                {field: 'jobPosition', title: '职务'},
                {field: 'operate', align: 'center', title: '操作', toolbar: '#userSelectTableBar'}
            ]]
        });

        //选择按钮监听
        table.on('tool(userSelectTable)', function (obj) {
            debugger;
            var data = obj.data;
            if (obj.event === 'choose') {
                $("#approverId").val(data.id);
                $("#approverName").val(data.realname);
            }
            //关闭当前弹窗
            layer.close(layer.index);
        });
    });
</script>

