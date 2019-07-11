<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<body style="padding: 0px 10px;">
<form class="layui-form form1">
    <div class="layui-form-item">

        <div class="layui-inline">
            <label class="layui-form-label">上报人姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="committerName" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-inline">
            <label class="layui-form-label">填表人姓名</label>
            <div class="layui-input-inline">
                <input type="text" name="applicantName" autocomplete="off" class="layui-input">
            </div>
        </div>


        <div class="layui-inline">
            <label class="layui-form-label">审核状态</label>
            <div class="layui-input-inline">
                <select name="status">
                    <%--<option value="">请选择审核状态</option>--%>
                    <%--<option value="1">待单位负责人审核</option>--%>
                    <%--<option value="2">单位负责人审核通过</option>--%>
                    <%--<option value="3">单位负责人驳回</option>--%>
                    <%--<option value="4">待纪委审核</option>--%>
                    <%--<option value="5">纪委审核通过</option>--%>
                    <%--<option value="6">纪委审核驳回</option>--%>

                    <shiro:hasRole name="单位负责人">
                        <option selected value="1">待审核</option>
                        <option value="2">审核通过</option>
                        <option value="3">驳回</option>
                    </shiro:hasRole>
                    <shiro:hasAnyRoles name="纪委,督察大队">
                        <option selected value="4">待审核</option>
                        <option value="5">审核通过</option>
                        <option value="6">驳回</option>
                    </shiro:hasAnyRoles>
                </select>
            </div>
        </div>


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
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryApprove" id="queryApprove">查询</button>
            <button class="layui-btn layui-btn-warm" type="reset">清空</button>
        </div>
    </div>

</form>
<table id="approveTable" lay-filter="approveTable"></table>

<script type="text/html" id="approveTableBar">
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
        1: "待审核",
        2: "审核通过",
        3: "驳回",
        4: "待审核",
        5: "审核通过",
        6: "驳回"
    };
</script>

<script>
    layui.use(['form', 'table', 'layer'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        form.render();

        var tableIns = table.render({
            elem: '#approveTable',
            url: 'approve/list',
            page: true, //开启分页
            method: 'post',
            cols: [[ //表头
                {field: 'committerName', title: '上报人姓名'},
                {field: 'applicantName', title: '填表人姓名'},
                {
                    field: 'archiveType', title: '档案类型', templet: function (data) {
                        return archiveType[data.archiveType]
                    }
                },
                {
                    field: 'status', title: '审核状态', templet: function (data) {
                        return approveStatus[data.status]
                    }
                },
                {
                    field: 'createTime',
                    title: '填表时间',
                    templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"  //时间戳格式化
                },
                {field: 'operate', align: 'center', title: '操作', toolbar: '#approveTableBar'}
            ]]
        });

        //明细按钮监听
        table.on('tool(approveTable)', function (obj) {
            debugger;
            var data = obj.data;
            if (obj.event === 'detail') {
                var url = '/archive/toArchive?archiveId=' + data.archiveId + '&archiveType=' + data.archiveType + '&approveOperate=true';
                $.get(url, function (html) {
                    layer.open({
                        type: 1,
                        title: archiveType[data.archiveType] + "-" + data.applicantName,
                        area: ['1400px', '800px'],
                        content: html
                    });
                });
            }
        });

        //查询按钮监听
        form.on('submit(queryApprove)', function (data) {
            debugger;
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

    });
</script>

