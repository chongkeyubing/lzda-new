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

        <div class="layui-inline">
            <label class="layui-form-label">档案类型</label>
            <div class="layui-input-inline">
                <select name="archiveType" class="archiveTypeView" lay-search>
                    <option value="">请选择或搜索档案类型</option>
                </select>
            </div>
        </div>

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
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryArchive" id="queryArchive">查询
            </button>
            <button class="layui-btn layui-btn-warm" type="reset" id="resetQueryArchive">清空</button>
        </div>
    </div>

</form>

<form class="layui-form">
    <div class="layui-form-item" style="padding-top: 15px; border-top: 1px solid #f6f6f6;">
        <div class="layui-input-block" style="float: right;margin-right: 110px;">
            <div class="layui-input-inline">
                <select name="archiveType" class="archiveTypeView" lay-search>
                    <option value="">请选择或搜索档案类型</option>
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

<!-- 档案类型下拉模板 -->
<script id="archiveTypeTpl" type="text/html">
    {{#  layui.each(d, function(index, item){ }}
    <option value="{{item.type}}">{{item.name}}</option>
    {{#  }); }}
</script>

<script>
    var ARCHIVE_TYPE = [
        {type: 1, name: '个人基本情况报备'},
        {type: 2, name: '本人持有港澳情况登记表'},
        {type: 3, name: '本人持有护照情况登记表'},
        {type: 4, name: '本人婚姻情况'},
        {type: 5, name: '参加单位组织生活会情况登记表'},
        {type: 6, name: '操办宴席申请表'},
        {type: 7, name: '出国（境）情况登记表'},
        {type: 8, name: '可能影响公正执行职务报备表'},
        {type: 9, name: '离职交接情况登记表'},
        {type: 21, name: '涉警报备表'},
        {type: 22, name: '收入情况登记表'},
        {type: 23, name: '收受礼品登记表'},
        {type: 24, name: '在企业、中介组织和社会团体兼职'},
        {type: 25, name: '住房情况登记表'},
        {type: 10, name: '配偶、子女及其配偶从业情况登记表'},
        {type: 11, name: '配偶、子女移居国（境）外的情况'},
        {type: 12, name: '配偶、子女连续在国（境）外工作、生活一年以上的情况'},
        {type: 13, name: '配偶、子女及其配偶被司法机关追究刑事责任的情况'},
        {type: 14, name: '本人、配偶、共同生活的子女持有股票的情况'},
        {type: 15, name: '本人、配偶、共同生活的子女持有基金的情况'},
        {type: 16, name: '本人、配偶、共同生活的子女持有投资型保险的情况'},
        {type: 17, name: '本人、配偶、共同生活的子女在国（境）外的存款情况'},
        {type: 18, name: '本人、配偶、共同生活的子女在国（境）外的投资情况'},
        {type: 20, name: '子女与港澳以及台湾居民通婚的情况'},
        {type: 26, name: '子女与外国人、无国籍人通婚的情况'},
        {type: 19, name: '个人认为需要报告的其他事项'},
    ];

    var APPROVE_STATUS = {
        1: "<span class='layui-badge layui-bg-orange'>待单位负责人审核</span>",
        2: "<span class='layui-badge layui-bg-green'>单位负责人通过</span>",
        3: "<span class='layui-badge'>单位负责人驳回</span>",
        4: "<span class='layui-badge layui-bg-orange'>单位负责人通过,待纪委审核</span>",
        5: "<span class='layui-badge layui-bg-green'>纪委通过</span>",
        6: "<span class='layui-badge'>纪委驳回</span>"
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
            elem: '#archives',
            url: 'archive/list',
            page: true, //开启分页
            method: 'post',
            cols: [[ //表头
                {field: 'userName', title: '姓名'},
                {field: 'policeCode', title: '警号'},
                {field: 'organizationName', title: '单位'},
                {
                    field: 'archiveType', title: '档案类型',templet: function (data) {
                        for (var i = 0; i < ARCHIVE_TYPE.length; i++) {
                            if (data.archiveType == ARCHIVE_TYPE[i].type) {
                                return ARCHIVE_TYPE[i].name;
                            }
                        }
                    }
                },
                {
                    field: 'approveStatus', title: '审核状态', templet: function (data) {
                        return APPROVE_STATUS[data.approveStatus]
                    }
                },
                {
                    field: 'createTime',
                    title: '填表时间',
                    templet: "<div>{{layui.util.toDateString(d.createTime, 'yyyy-MM-dd HH:mm:ss')}}</div>"  //时间戳格式化
                },
                {field: 'operate', align: 'center', title: '操作', toolbar: '#archivesBar', fixed: 'right'}
            ]]
        });

        //明细按钮监听
        table.on('tool(archives)', function (obj) {
            debugger;
            var data = obj.data;

            //获取档案名称
            var archiveName;
            for (var i = 0; i < ARCHIVE_TYPE.length; i++) {
                if (data.archiveType == ARCHIVE_TYPE[i].type) {
                    archiveName = ARCHIVE_TYPE[i].name;
                    break;
                }
            }
            if (obj.event === 'detail') {
                $.post('archive/toArchive', {
                    archiveId: data.archiveId,
                    archiveType: data.archiveType,
                    approveRecord: true,
                    userId: data.userId,
                    userName: data.userName
                }, function (html) {
                    layer.open({
                        type: 1,
                        title: archiveName + "-" + data.userName,
                        area: ['100%', '100%'],
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
            debugger;
            if (data.field.archiveType == '') {
                layer.msg("请选择档案类型")
                return false;
            }

            //获取档案名称
            var archiveName;
            for (var i = 0; i < ARCHIVE_TYPE.length; i++) {
                if (data.field.archiveType == ARCHIVE_TYPE[i].type) {
                    archiveName = ARCHIVE_TYPE[i].name;
                    break;
                }
            }

            $.get('archive/toAddArchive?archiveType=' + data.field.archiveType, function (html) {
                layer.open({
                    type: 1,
                    title: archiveName,
                    area: ['100%', '100%'],
                    content: html
                });
            });
            return false; //阻止表单跳转
        });

        //渲染档案类型下拉
        var archiveTypeTpl = $("#archiveTypeTpl").html();
        laytpl(archiveTypeTpl).render(ARCHIVE_TYPE, function (html) {
            $('.archiveTypeView').append(html);
            form.render();
        });
    });
</script>

