<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form class="layui-form form1">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">单位</label>
            <div class="layui-input-inline">
                <select name="organizationId" lay-search>
                    <option value="">请选择或搜索单位</option>
                    <c:forEach var="organization" items="${organizations}">
                        <option value="${organization.id}">${organization.name}</option>
                    </c:forEach>
                </select>
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">时间</label>
            <div class="layui-input-inline">
                <input type="text" name="time" id="time" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryStatistic" id="queryStatistic">查询
            </button>
            <button class="layui-btn layui-btn-warm" type="reset">清空</button>

            <button type="button" lay-submit="" class="layui-btn layui-btn-warm" id="exportStatistic" lay-filter="exportStatistic">
                <i class="layui-icon"></i>导出Excel</button>
        </div>

    </div>
</form>

<table id="statisticTable" lay-filter="statisticTable"></table>


<script type="text/html" id="toolbarDemo">
   <%-- <div class="layui-btn-container">--%>
        <%--<button class="layui-btn layui-btn-sm" lay-event="getCheckData">获取选中行数据</button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button>
        <button class="layui-btn layui-btn-sm" lay-event="isAll">验证是否全选</button>--%>
    <%--</div>--%>
</script>

<script type="text/html" id="statisticBar">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="detail">明细</a>
</script>

<script>
    layui.use(['form', 'table', 'layer', 'laydate'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;

        form.render();

        var time = '';
        //日期
        laydate.render({
            elem: '#time',
            type:'month'
           /* range: true,
            done: function (value, date, endDate) {
                time = value;
            }*/
        });
        //用于存放导出的数据
        var tableData;

        var tableIns = table.render({
            title:'队伍思想状况统计',
            elem: '#statisticTable',
            url: 'teamThink/list',
           // page: false, //开启分页
           // toolbar:'#toolbarDemo',
            limit: 9999,
            method: 'post',
            cols: [[ //表头
                //{field: 'time', title: '时间'},
                {field: 'organizationName', title: '单位'},
                {field: 'count', title: '填报数量'},
                {field: 'operate', align: 'center', title: '操作', toolbar: '#statisticBar'}
            ]],

            done: function (res) {
                tableData = res;
            }
        });

        //导出
        form.on('submit(exportStatistic)', function (data) {
            debugger;
            table.exportFile(tableIns.config.id, tableData.data, 'xlsx');
            return false; //阻止表单跳转
        });

        //明细按钮监听
        table.on('tool(statisticTable)', function (obj) {
            debugger;
            var data = obj.data;
            var param = '?organizationId=' + data.organizationId + '&time=' + time;
            if (obj.event === 'detail') {
                $.get('teamThink/toDetail' + param, function (html) {
                    layer.open({
                        type: 1,
                        title: data.organizationName + '-队伍思想状况统计详情',
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            }
        });

        //查询按钮监听
        form.on('submit(queryStatistic)', function (data) {
            debugger;
            time = $("#time").val();
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