<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<form class="layui-form form1">
    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">单位</label>
            <div class="layui-input-inline">
                <select name="orgId" id="orgId" lay-search>
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
            <button class="layui-btn layui-btn-normal" lay-submit id="exportStatistic" lay-filter="exportStatistic">导出</button>
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

        var time = '';
        //日期
        laydate.render({
            elem: '#time',
            range: '~',
            done: function (value, date, endDate) {
                time = value;
            }
        });

        var tableIns = table.render({
            elem: '#statisticTable',
            url: '/punViolationStatistic/list',
            page: false, //开启分页
            limit: 10,
            method: 'post',
            cols: [[ //表头
                {field: 'dwmc', title: '单位', align: 'center', width:100,rowspan: 2},
                {title: '政务处分', align: 'center',colspan: 7},
                {title: '党纪处分', align: 'center',colspan: 6},
                {title: '党纪处分', align: 'center',colspan: 8},
                {title: '违规', align: 'center',colspan: 5},
                {title: '违法', align: 'center',colspan: 3}
                /*,{field: 'operate', align: 'center', title: '操作', width:90,rowspan: 2, toolbar: '#statisticBar'}*/
            ],
                [
                    {field: 'jgCount', title: '警告人数', width:90},
                    {field: 'jguoCount', title: '记过人数', width:90},
                    {field: 'jdgCount', title: '记大过人数', width:100},
                    {field: 'jjCount', title: '降级人数', width:90},
                    {field: 'czCount', title: '撤职人数', width:90},
                    {field: 'kcCount', title: '开除人数', width:90},
                    {field: 'zwcfCount', title: '政务处分小计', width:120,templet: function (v) {
                            return v.jgCount+ v.jguoCount+v.jdgCount+ v.jjCount+v.czCount+ v.kcCount;
                        }},
                    {field: 'djcfJgCount', title: '警告人数', width:90},
                    {field: 'yzjgCount', title: '严重警告人数', width:120},
                    {field: 'cxdnzwCount', title: '撤销党内职务人数', width:150},
                    {field: 'ldckCount', title: '留党察看人数', width:120},
                    {field: 'kcdjCount', title: '开除党籍人数', width:120},
                    {field: 'djcfCount', title: '党纪处分小计', width:120,templet: function (v) {
                            return v.djcfJgCount+ v.yzjgCount+v.cxdnzwCount+ v.ldckCount+v.kcdjCount;
                        }},
                    {field: 'tbCount', title: '通报人数', width:90},
                    {field: 'jmthCount', title: '诫勉谈话人数', width:120},
                    {field: 'tzjcCount', title: '停职检查人数', width:120},
                    {field: 'tzzwCount', title: '调整职务人数', width:120},
                    {field: 'zlczCount', title: '责令辞职人数', width:120},
                    {field: 'jzCount', title: '降职人数', width:90},
                    {field: 'mzCount', title: '免职人数', width:90},
                    {field: 'wzCount', title: '问责小计', width:90,templet: function (v) {
                            return v.tbCount+ v.jmthCount+v.tzjcCount+ v.tzzwCount+v.zlczCount+v.jzCount+v.mzCount;
                        }}
                    ,{field: 'fjtbCount', title: '分局通报人数', width:120}
                    ,{field: 'txthCount', title: '提醒谈话人数', width:120}
                    ,{field: 'kfCount', title: '书面检查人数', width:120}
                    ,{field: 'smjcCount', title: '扣分人数', width:90}
                    ,{field: 'wgCount', title: '违规小计', width:90,templet: function (v) {
                        return v.fjtbCount+ v.txthCount+v.kfCount+ v.smjcCount;
                    }}
                    ,{field: 'yjsfjgCount', title: '移交司法机关人数', width:150}
                    ,{field: 'wyjsfjgCount', title: '未移交司法机关人数', width:160}
                    ,{field: 'wfCount', title: '违法小计', width:90,templet: function (v) {
                        return v.yjsfjgCount+ v.wyjsfjgCount;
                    }}
        ]]
        });

        //明细按钮监听
        table.on('tool(statisticTable)', function (obj) {
            var data = obj.data;
            var param = '?organizationId=' + data.orgId + '&time=' + time;
            if (obj.event === 'detail') {
                $.get('arcpoliceinvolvestatistic/toDetail' + param, function (html) {
                    layer.open({
                        type: 1,
                        title: data.organizationName + '-涉警报备统计详情',
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            }
        });

        //查询按钮监听
        form.on('submit(queryStatistic)', function (data) {
            reloadTable(data.field);//当前容器的全部表单字段，名值对形式：{name: value}
            return false; //阻止表单跳转
        });

        form.on('submit(exportStatistic)', function (data) {
            window.location.href = "/punViolationStatistic/list/export?orgId="+$("#orgId").val()+"&time=" + $("#time").val();
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