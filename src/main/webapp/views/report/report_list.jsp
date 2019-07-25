<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<%--<form class="layui-form form1">
    <div class="layui-form-item">
       &lt;%&ndash; <div class="layui-inline">
            <label class="layui-form-label">姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="userName" autocomplete="off" class="layui-input">
            </div>
        </div>&ndash;%&gt;

       &lt;%&ndash; <div class="layui-inline">
            <label class="layui-form-label">上报单位</label>
            <div class="layui-input-inline">
                <input type="text" name="policeCode" autocomplete="off" class="layui-input">
            </div>
        </div>&ndash;%&gt;
           <div class="layui-inline">
               <label class="layui-form-label">上报单位</label>
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
            <button class="layui-btn layui-btn-normal" lay-filter="queryReport" id="queryReport">查询
            </button>
            <button class="layui-btn layui-btn-warm" type="reset" id="resetQueryReport">清空</button>
        </div>

        <div class="layui-inline" style="float:right">
            <button class="layui-btn layui-btn-normal" type="button" id="addReport">新增上报</button>
        </div>

    </div>
</form>--%>


<form class="layui-form form1">
    <div class="layui-form-item">
        <shiro:hasPermission name="查看所有人">
            <div class="layui-inline">
                <label class="layui-form-label">上报单位</label>
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
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryReport" id="queryReport">查询
                </button>
                <button class="layui-btn layui-btn-warm" type="reset" id="resetQueryReport">清空</button>
            </div>
        </shiro:hasPermission>

        <div class="layui-inline" style="float:right">
            <shiro:hasPermission name="上报管理新增">
                <button class="layui-btn layui-btn-normal" type="button" id="addReport">新增</button>
            </shiro:hasPermission>
        </div>

    </div>
</form>

<table id="reportTable" lay-filter="reportTable"></table>

<script type="text/html" id="reportTableBar">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="detail">明细</a>
    <shiro:hasPermission name="上报管理修改">
        <a class="layui-btn layui-btn-sm layui-btn-warm" lay-event="update">修改</a>
    </shiro:hasPermission>
    <shiro:hasPermission name="上报管理删除">
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
            elem: '#reportTable',
            url: 'rptincorrupt/list',
            page: true, //开启分页
            limit: 10,
            method: 'post',
            cols: [[ //表头

                {
                    field: 'organizationName',
                    title: '上报单位',
                    width: 480
                },
                {
                    field: 'committerName',
                    title: '上报人姓名',
                    width: 200
                },
                {
                    field: 'title',
                    title: '标题'
                    //width:320
                },
                /*{
                    field: 'content',
                    title: '类容'
                },
                {
                 field: 'createTime',
                 title: '创建时间'
                 },*/
                {
                    field: 'operate',
                    align: 'center',
                    title: '操作',
                    toolbar: '#reportTableBar',
                    width: 350
                }
            ]]
        });

        //明细按钮监听
        table.on('tool(reportTable)', function (obj) {
            debugger;
            var data = obj.data;
            if (obj.event === 'detail') {
                $.get('rptincorrupt/toReportDetail?id=' + data.id, function (html) {
                    layer.open({
                        type: 1,
                        title: '廉政信息详情',
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            } else if (obj.event === 'update') {
                $.get('rptincorrupt/toReportUpdate?id=' + data.id, function (html) {
                    layer.open({
                        type: 1,
                        title: '廉政信息修改',
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            } else if (obj.event === 'del') {
                debugger;
                layer.confirm('确定删除？', function (index) {
                    $.get('rptincorrupt/delete?id=' + data.id, function (data) {
                        layer.close(index);
                        if (data.success) {
                            layer.msg("删除成功");
                            $("#queryReport").click();
                        } else {
                            layer.msg("删除失败");
                        }
                    });
                });
            }
        });

        //查询按钮监听
        form.on('submit(queryReport)', function (data) {
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

        $("#addReport").click(function () {
            $.get('rptincorrupt/toAddReport', function (html) {
                layer.open({
                    type: 1,
                    title: '廉政信息上报',
                    area: ['100%', '100%'],
                    content: html
                });
            });
        });
    });
</script>

