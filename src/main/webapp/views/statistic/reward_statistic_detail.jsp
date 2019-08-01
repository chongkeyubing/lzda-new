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

        var tableIns = table.render({
            elem: '#arcListTable',
            url: 'reward/list1',
            page: true, //开启分页
            limit: 10,
            method: 'post',
            cols: [[ //表头
                {field: 'userName', title: '姓名'},
                {field: 'organization', title: '单位'},
                {field: 'rewardType', title: '表彰类型'},
                {field: 'rewardTime', title: '表彰时间'},
                {field: 'operate', align: 'center', title: '操作', toolbar: '#arcListBar'}
            ]],
            where: {
                organizationId:'${organizationId}',
                time:'${time}',
                rewardType:'${rewardType}'
            }
        });

        //明细按钮监听
        table.on('tool(arcListTable)', function (obj) {
            debugger;
            var data = obj.data;
            if (obj.event === 'detail') {
                $.get('reward/toRewardDetail?id=' + data.id, function (html) {
                    layer.open({
                        type: 1,
                        title: data.rewardType + '-' +  data.userName,
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            }
        });
    });
</script>