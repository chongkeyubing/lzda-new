<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

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
            <label class="layui-form-label">违惩类型</label>
            <div class="layui-input-inline">
                <select name="punishType" class="punishTypeView" lay-search>
                    <option value="">请选择</option>
                    <option value="1">一般干部违纪情况登记表</option>
                   <%-- <option value="2">一般干部问责情况登记表</option>--%>
                    <option value="3">一般干部收受礼品（金）上缴情况登记表</option>
                   <%-- <option value="4">一般干部廉政谈话情况登记表</option>
                    <option value="5">一般干部被通报情况登记表</option>--%>
                    <option value="6">一般干部被群众信访举报情况登记表</option>
                </select>
            </div>
        </div>
        <div class="layui-inline">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryPunish" id="queryPunish">查询
            </button>
            <button class="layui-btn layui-btn-warm" type="reset" id="resetQueryPunish">清空</button>
        </div>
    </div>

    <%--<div class="layui-form-item">--%>
        <%--<div class="layui-input-block">--%>
            <%--<button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryPunish" id="queryPunish">查询--%>
            <%--</button>--%>
            <%--<button class="layui-btn layui-btn-warm" type="reset" id="resetQueryPunish">清空</button>--%>
        <%--</div>--%>
    <%--</div>--%>
</form>

<form class="layui-form">
    <div class="layui-form-item" style="padding-top: 15px; border-top: 1px solid #f6f6f6;">
        <div class="layui-input-block" style="float: right;margin-right: 110px;">
            <div class="layui-input-inline">
                <select name="punishType" class="punishTypeView" lay-search>
                    <option value="">请选择</option>
                    <option value="1">一般干部违纪情况登记表</option>
                   <%-- <option value="2">一般干部问责情况登记表</option>--%>
                    <option value="3">一般干部收受礼品（金）上缴情况登记表</option>
                    <%--<option value="4">一般干部廉政谈话情况登记表</option>
                    <option value="5">一般干部被通报情况登记表</option>--%>
                    <option value="6">一般干部被群众信访举报情况登记表</option>
                </select>
            </div>
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="addPunish">新增</button>
        </div>
    </div>
</form>

<table id="punishs" lay-filter="punishs"></table>

<script type="text/html" id="punishsBar">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="detail">明细</a>
    <a class="layui-btn layui-btn-sm layui-btn-warm" lay-event="update">修改</a>
    <a class="layui-btn layui-btn-sm layui-btn-danger" lay-event="del">删除</a>
</script>

<script>
    var PUNISH_TYPE = {
        1: '一般干部违纪情况登记表',
       /* 2: '一般干部问责情况登记表',*/
        3: '一般干部收受礼品（金）上缴情况登记表',
       /* 4: '一般干部廉政谈话情况登记表',
        5: '一般干部被通报情况登记表',*/
        6: '一般干部被群众信访举报情况登记表'
    };
</script>

<script>
    layui.use(['form', 'table', 'layer', 'laytpl'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var laytpl = layui.laytpl;
        var form = layui.form;
        form.render();

        var tableIns = table.render({
            elem: '#punishs',
            url: 'punish/list',
            page: true, //开启分页
            method: 'post',
            cols: [[ //表头
                {field: 'userName', title: '姓名'},
                {field: 'policeCode', title: '警号'},
                {field: 'organizationName', title: '单位'},
                {
                    field: 'punishType', title: '违惩类型', templet: function (data) {
                        return PUNISH_TYPE[data.punishType];
                    }
                },
                {field: 'operator', title: '违惩填写人'},
                {
                    field: 'createTime',
                    title: '填表时间',
                    templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"  //时间戳格式化
                },
                {field: 'operate', align: 'center', title: '操作', toolbar: '#punishsBar', minWidth: 200}
            ]]
        });

        //表格操作按钮监听
        table.on('tool(punishs)', function (obj) {
            debugger;
            var data = obj.data;

            var param = '?punishId=' + data.punishId + '&punishType=' + data.punishType;
            if (obj.event === 'detail') {
                $.get('punish/toPunishDetail' + param, function (html) {
                    layer.open({
                        type: 1,
                        title: PUNISH_TYPE[data.punishType] + "-" + data.userName,
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            } else if (obj.event === 'update') {
                $.get('punish/toPunishUpdate' + param, function (html) {
                    layer.open({
                        type: 1,
                        title: '修改' + PUNISH_TYPE[data.punishType] + "-" + data.userName,
                        area: ['100%', '100%'],
                        content: html
                    });
                });
            } else if (obj.event === 'del') {
                debugger;
                layer.confirm('确定删除？', function (index) {
                    $.get('punish/delete' + param, function (data) {
                        layer.close(index);
                        if (data.success) {
                            layer.msg("删除成功");
                            $("#queryPunish").click();
                        } else {
                            layer.msg("删除失败");
                        }
                    });
                });
            }

        });

        //查询按钮监听
        form.on('submit(queryPunish)', function (data) {
            reloadTable(data.field);
            return false; //阻止表单跳转
        });

        //表格重载
        function reloadTable(param) {
            tableIns.reload({
                where: param //设定异步数据接口的额外参数，任意设
            });
        }

        //新增违惩弹窗
        form.on('submit(addPunish)', function (data) {
            debugger;
            if (data.field.punishType == '') {
                layer.msg("请选择违惩表类型")
                return false;
            }

            $.get('punish/toAddPunish?punishType=' + data.field.punishType, function (html) {
                layer.open({
                    type: 1,
                    title: PUNISH_TYPE[data.field.punishType],
                    area: ['100%', '100%'],
                    content: html
                });
            });
            return false; //阻止表单跳转
        });

    });
</script>

