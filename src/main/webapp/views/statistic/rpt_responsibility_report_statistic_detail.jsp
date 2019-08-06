<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div style="padding: 20px">
<table id="arcListTable" lay-filter="arcListTable"></table>
</div>
<script type="text/html" id="arcListBar">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="detail">明细</a>
</script>
<%@ include file="../common/back.jsp" %>
<script>
    layui.use(['form', 'table', 'layer', 'laydate'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laydate = layui.laydate;

        form.render();

        var param = {
            organizationId:'${organizationId}',
            year:'${year}',
            quarter: '${quarter}'
        };

        var tableIns = table.render({
            elem: '#arcListTable',
            url: 'rptresponsibilityreport/list' ,
            where: param,  //查询参数
            page: true, //开启分页
            limit: 10,
            method: 'post',
            cols: [[ //表头
                {field: 'committerName', title: '提交人姓名'},
                {field: 'organizationName', title: '单位'},
                {field: 'year', title: '年份'},
                {field: 'quarter', title: '季度'},
                {
                    field: 'createTime',
                    title: '填表时间',
                    templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"  //时间戳格式化
                },
                {field: 'operate', align: 'center', title: '操作', toolbar: '#arcListBar'}
            ]]
        });

        //明细按钮监听
        table.on('tool(arcListTable)', function (obj) {
            debugger;
            var data = obj.data;
            if (obj.event === 'detail') {
                $.get('rptresponsibilityreport/toDetail?id=' + data.id, function (html) {
                    layer.open({
                        type: 1,
                        title: '主体责任详情',
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            }
        });

    });
</script>