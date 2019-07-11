<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<form class="layui-form form1">
    <div class="layui-form-item">
        <shiro:lacksPermission name="只能查看自己">
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
        </shiro:lacksPermission>

        <%--<shiro:hasAnyRoles name="普通民警,单位负责人">--%>
        <div class="layui-inline">
            <label class="layui-form-label">审核状态</label>
            <div class="layui-input-inline">
                <select name="approveStatus">
                    <option value="">请选择审核状态</option>
                    <option value="1">待单位负责人审核</option>
                    <%--<option value="2">单位负责人审核通过</option>--%>
                    <option value="4">单位负责人通过，待纪委审核</option>
                    <option value="5">纪委通过</option>
                    <option value="3">单位负责人驳回</option>
                    <option value="6">纪委驳回</option>
                </select>
            </div>
        </div>
        <%--</shiro:hasAnyRoles>--%>

        <div class="layui-inline">
            <label class="layui-form-label">档案类型</label>
            <div class="layui-input-inline">
                <select name="archiveType">
                    <option value="">请选择档案类型</option>
                    <option value="1">个人基本情况报备</option>
                    <option value="2">本人持有港澳情况登记表</option>
                    <option value="3">本人持有护照情况登记表</option>
                    <option value="4">本人婚姻情况</option>
                    <option value="5">参加单位组织生活会情况登记表</option>
                    <option value="6">操办宴席申请表</option>
                    <option value="7">出国（境）情况登记表</option>
                    <option value="8">可能影响公正执行职务报备表</option>
                    <option value="9">离职交接情况登记表</option>
                    <option value="10">配偶、子女及其配偶从业情况登记表</option>
                    <option value="11">家人移居国（境）外的情况</option>
                    <option value="12">家人连续在国（境）外工作、生活一年以上的情况</option>
                    <option value="13">家人被司法机关追究刑事责任的情况</option>
                    <option value="14">持有股票的情况</option>
                    <option value="15">持有基金的情况</option>
                    <option value="16">持有投资型保险的情况</option>
                    <option value="17">在国（境）外的存款情况</option>
                    <option value="18">在国（境）外的投资情况</option>
                    <option value="19">个人认为需要报告的其他事项</option>
                    <option value="20">子女与港澳以及台湾居民通婚的情况</option>
                    <option value="21">涉警报备表</option>
                    <option value="22">收入情况登记表</option>
                    <option value="23">收受礼品登记表</option>
                    <option value="24">在企业、中介组织和社会团体兼职</option>
                    <option value="25">住房情况登记表</option>
                    <option value="26">子女与外国人、无国籍人通婚的情况</option>
                </select>
            </div>
        </div>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryArchive" id="queryArchive">查询</button>
            <button class="layui-btn layui-btn-warm" type="reset" id="resetQueryArchive">清空</button>
        </div>
    </div>

</form>

<form class="layui-form">
    <div class="layui-form-item" style="padding-top: 15px; border-top: 1px solid #f6f6f6;">
        <div class="layui-input-block" style="float: right;margin-right: 76px;">
            <div class="layui-input-inline">
                <select name="archiveType">
                    <option value="">请选择档案类型</option>
                    <option value="1">个人基本情况报备</option>
                    <option value="2">本人持有港澳情况登记表</option>
                    <option value="3">本人持有护照情况登记表</option>
                    <option value="4">本人婚姻情况</option>
                    <option value="5">参加单位组织生活会情况登记表</option>
                    <option value="6">操办宴席申请表</option>
                    <option value="7">出国（境）情况登记表</option>
                    <option value="8">可能影响公正执行职务报备表</option>
                    <option value="9">离职交接情况登记表</option>
                    <option value="10">配偶、子女及其配偶从业情况登记表</option>
                    <option value="11">家人移居国（境）外的情况</option>
                    <option value="12">家人连续在国（境）外工作、生活一年以上的情况</option>
                    <option value="13">家人被司法机关追究刑事责任的情况</option>
                    <option value="14">持有股票的情况</option>
                    <option value="15">持有基金的情况</option>
                    <option value="16">持有投资型保险的情况</option>
                    <option value="17">在国（境）外的存款情况</option>
                    <option value="18">在国（境）外的投资情况</option>
                    <option value="19">个人认为需要报告的其他事项</option>
                    <option value="20">子女与港澳以及台湾居民通婚的情况</option>
                    <option value="21">涉警报备表</option>
                    <option value="22">收入情况登记表</option>
                    <option value="23">收受礼品登记表</option>
                    <option value="24">在企业、中介组织和社会团体兼职</option>
                    <option value="25">住房情况登记表</option>
                    <option value="26">子女与外国人、无国籍人通婚的情况</option>
                </select>
            </div>
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="addArchive">新增</button>
        </div>
    </div>
</form>

<table id="archives" lay-filter="archives"></table>

<script type="text/html" id="archivesBar">
    <a class="layui-btn layui-btn-sm layui-btn-normal" lay-event="detail">明细</a>
</script>

<script>
    var archiveType = {
        1: "个人基本情况报备",
        2: "本人持有港澳情况登记表",
        3: "本人持有护照情况登记表",
        4: "本人婚姻情况",
        5: "参加单位组织生活会情况登记表",
        6: "操办宴席申请表",
        7: "出国（境）情况登记表",
        8: "可能影响公正执行职务报备表",
        9: "离职交接情况登记表",
        10: "配偶、子女及其配偶从业情况登记表",
        11: "家人移居国（境）外的情况",
        12: "家人连续在国（境）外工作、生活一年以上的情况",
        13: "家人被司法机关追究刑事责任的情况",
        14: "持有股票的情况",
        15: "持有基金的情况",
        16: "持有投资型保险的情况",
        17: "在国（境）外的存款情况",
        18: "在国（境）外的投资情况",
        19: "个人认为需要报告的其他事项",
        20: "子女与港澳以及台湾居民通婚的情况",
        21: "涉警报备表",
        22: "收入情况登记表",
        23: "收受礼品登记表",
        24: "在企业、中介组织和社会团体兼职",
        25: "住房情况登记表",
        26: "子女与外国人、无国籍人通婚的情况"
    };
    var approveStatus = {
        1: "待单位负责人审核",
        2: "单位负责人通过",
        3: "单位负责人驳回",
        4: "单位负责人通过，待纪委审核",
        5: "纪委通过",
        6: "纪委驳回"
    };
</script>

<script>
    layui.use(['form', 'table', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        form.render();

        var tableIns = table.render({
            elem: '#archives',
            url: 'archive/list',
            page: true, //开启分页
            method: 'post',
            cols: [[ //表头
                {field: 'policeCode', title: '警号'},
                {field: 'userName', title: '姓名'},
                {field: 'organizationName', title: '单位', width: 360},
                {
                    field: 'archiveType', title: '档案类型', templet: function (data) {
                        return archiveType[data.archiveType]
                    }
                },
                {
                    field: 'approveStatus', title: '审核状态', templet: function (data) {
                        return approveStatus[data.approveStatus]
                    }
                },
                {
                    field: 'createTime',
                    title: '填表时间',
                    templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"  //时间戳格式化
                },
                {field: 'operate', align: 'center', title: '操作', toolbar: '#archivesBar'}
            ]]
        });

        //明细按钮监听
        table.on('tool(archives)', function (obj) {
            debugger;
            var data = obj.data;
            if (obj.event === 'detail') {
                var url = 'archive/toArchive?archiveId=' + data.archiveId + '&archiveType=' + data.archiveType + '&approveRecord=true';
                $.get(url, function (html) {
                    layer.open({
                        type: 1,
                        title: archiveType[data.archiveType] + "-" + data.userName,
                        area: ['1400px', '800px'],
                        content: html
                    });
                });
            }
        });

        //查询按钮监听
        form.on('submit(queryArchive)', function (data) {
            console.log(data.field); //当前容器的全部表单字段，名值对形式：{name: value}
            reloadTable(data.field);
            return false; //阻止表单跳转
        });

        //表格重载
        function reloadTable(param) {
            tableIns.reload({
                where: param //设定异步数据接口的额外参数，任意设
            });
        }

        //新增档案弹窗
        form.on('submit(addArchive)', function (data) {
            if (data.field.archiveType == '') {
                layer.msg("请选择档案类型")
                return false;
            }
            $.get('archive/toAddArchive?archiveType=' + data.field.archiveType, function (html) {
                layer.open({
                    type: 1,
                    title: archiveType[data.field.archiveType],
                    area: ['1200px', '800px'],
                    content: html
                });
            });
            return false; //阻止表单跳转
        });


    });
</script>

