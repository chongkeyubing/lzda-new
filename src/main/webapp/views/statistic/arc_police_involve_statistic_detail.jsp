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

        //查询该单位该时间段
        var param = '?organizationId=${organizationId}&time=${time}';

        var tableIns = table.render({
            elem: '#arcListTable',
            url: 'arcpoliceinvolve/list' + param ,
            page: true, //开启分页
            limit: 10,
            method: 'post',
            cols: [[ //表头
                {field: 'userName', title: '姓名'},
                // {field: 'policeCode', title: '警号'},
                {field: 'organization', title: '单位'},
                {
                    field: 'time',
                    title: '时间',
                   // templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"  //时间戳格式化
                },
                {field: 'operate', align: 'center', title: '操作', toolbar: '#arcListBar'}
            ]]
        });

        //明细按钮监听
        table.on('tool(arcListTable)', function (obj) {
            debugger;
            var data = obj.data;
            if (obj.event === 'detail') {
                $.post('archive/toArchive', {
                    archiveId: data.id,
                    archiveType: data.archiveType,
                    approveRecord: true,
                    userId: data.userId,
                    userName: data.userName
                }, function (html) {
                    layer.open({
                        type: 1,
                        title:  "涉警报备-" + data.userName,
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            }
        });
        //
        // //查询按钮监听
        // form.on('submit(queryStatistic)', function (data) {
        //     debugger;
        //     reloadTable(data.field);//当前容器的全部表单字段，名值对形式：{name: value}
        //     return false; //阻止表单跳转
        // });
        //
        // //表格重载
        // function reloadTable(param) {
        //     tableIns.reload({
        //         where: param //设定异步数据接口的额外参数，任意设
        //     });
        // }
    });
</script>