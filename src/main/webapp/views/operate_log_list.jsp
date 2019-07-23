<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<form class="layui-form form1">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">操作人姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="operatorName" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">操作人警号</label>
            <div class="layui-input-inline">
                <input type="text" name="operatorCode" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryOperateLog" id="queryOperateLog">查询
            </button>
            <button class="layui-btn layui-btn-warm" type="reset">清空</button>
        </div>

    </div>
</form>
<table id="operateLogTable" lay-filter="operateLogTable"></table>


<script>
    layui.use(['form', 'table', 'layer', 'laytpl'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laytpl = layui.laytpl;

        form.render();

        var tableIns = table.render({
            elem: '#operateLogTable',
            url: 'operatelog/list',
            page: true, //开启分页
            method: 'post',
            cols: [[ //表头
                {field: 'operatorName', title: '操作人姓名'},
                {field: 'operatorCode', title: '操作人警号'},
                {field: 'operatorIp', title: '操作人IP'},
                {field: 'archiveOwnerName', title: '表中人姓名'},
                {field: 'ownerOrg', title: '表中人单位'},
                {field: 'operateObject', title: '操作表类型'},
                {field: 'operateType', title: '操作类型'},
                {
                    field: 'createTime',
                    title: '操作时间',
                    templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"  //时间戳格式化
                }

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
    });
</script>

