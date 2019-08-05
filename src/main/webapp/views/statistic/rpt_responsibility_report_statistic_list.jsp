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
            <label class="layui-form-label">年份</label>
            <div class="layui-input-inline">
                <input type="text" name="year" id="year" autocomplete="off" class="layui-input">
            </div>
        </div>

        <div class="layui-inline">
            <label class="layui-form-label">季度</label>
            <div class="layui-input-inline">
                <select name="quarter" id="quarter">
                    <option value="">请选择</option>
                    <option value="第一季度">第一季度</option>
                    <option value="第二季度">第二季度</option>
                    <option value="第三季度">第三季度</option>
                    <option value="第四季度">第四季度</option>
                </select>
            </div>
        </div>

        <div class="layui-inline">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryStatistic" id="queryStatistic">查询
            </button>
            <button class="layui-btn layui-btn-warm" type="reset">清空</button>
            <button class="layui-btn layui-btn-normal" lay-submit id="exportStatistic" lay-filter="exportStatistic">导出
            </button>
        </div>

    </div>
</form>

<table id="statisticTable" lay-filter="statisticTable"></table>
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

        var year = '';

        //日期
        laydate.render({
            elem: '#year',
            type: 'year',
            done: function (value, date, endDate) {
                year = value;
            }
        });

        var tableData;

        var tableIns = table.render({
            title:'主体责任统计',  //导出时的文件名
            elem: '#statisticTable',
            url: 'rptresponsibilityreportstatistic/list',
            // page: true, //开启分页
            limit: 9999,
            method: 'post',
            cols: [[ //表头
                {field: 'organizationName', title: '单位'},
                {field: 'count', title: '填报数量'},
                {field: 'operate', align: 'center', title: '操作', toolbar: '#statisticBar'}
            ]],
            done:function(res){
                tableData = res;
            }
        });

        //明细按钮监听
        table.on('tool(statisticTable)', function (obj) {
            debugger;
            var data = obj.data;
            var param = {
                organizationId: data.organizationId,
                year: year,
                quarter: $("#quarter").val()
            };
            if (obj.event === 'detail') {
                $.post('rptresponsibilityreportstatistic/toDetail', param, function (html) {
                    layer.open({
                        type: 1,
                        title: data.organizationName + '-主体责任统计详情',
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            }
        });

        //查询按钮监听
        form.on('submit(queryStatistic)', function (data) {
            debugger;
            year = $("#time").val();
            reloadTable(data.field);//当前容器的全部表单字段，名值对形式：{name: value}
            return false; //阻止表单跳转
        });

        //表格重载
        function reloadTable(param) {
            tableIns.reload({
                where: param //设定异步数据接口的额外参数，任意设
            });
        }

        //导出
        form.on('submit(exportStatistic)', function (data) {
            debugger;
            table.exportFile(tableIns.config.id, tableData.data, 'xlsx');
            return false; //阻止表单跳转
        });
    });
</script>