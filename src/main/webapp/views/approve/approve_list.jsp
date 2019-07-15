<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

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
            <label class="layui-form-label">档案类型</label>
            <div class="layui-input-inline" >
                <select name="archiveType" class="archiveTypeView" lay-search>
                    <option value="">请选择或搜索档案类型</option>
                </select>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">审核状态</label>
                <div class="layui-input-inline">
                    <select name="status">
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

        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-input-block">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryApprove" id="queryApprove">查询
            </button>
            <button class="layui-btn layui-btn-warm" type="reset">清空</button>
        </div>
    </div>

</form>
<table id="approveTable" lay-filter="approveTable"></table>

<script type="text/html" id="approveTableBar">
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
        {type:1,name:'个人基本情况报备'},
        {type:2,name:'本人持有港澳情况登记表'},
        {type:3,name:'本人持有护照情况登记表'},
        {type:4,name:'本人婚姻情况'},
        {type:5,name:'参加单位组织生活会情况登记表'},
        {type:6,name:'操办宴席申请表'},
        {type:7,name:'出国（境）情况登记表'},
        {type:8,name:'可能影响公正执行职务报备表'},
        {type:9,name:'离职交接情况登记表'},
        {type:21,name:'涉警报备表'},
        {type:22,name:'收入情况登记表'},
        {type:23,name:'收受礼品登记表'},
        {type:24,name:'在企业、中介组织和社会团体兼职'},
        {type:25,name:'住房情况登记表'},
        {type:10,name:'配偶、子女及其配偶从业情况登记表'},
        {type:11,name:'配偶、子女移居国（境）外的情况'},
        {type:12,name:'配偶、子女连续在国（境）外工作、生活一年以上的情况'},
        {type:13,name:'配偶、子女及其配偶被司法机关追究刑事责任的情况'},
        {type:14,name:'本人、配偶、共同生活的子女持有股票的情况'},
        {type:15,name:'本人、配偶、共同生活的子女持有基金的情况'},
        {type:16,name:'本人、配偶、共同生活的子女持有投资型保险的情况'},
        {type:17,name:'本人、配偶、共同生活的子女在国（境）外的存款情况'},
        {type:18,name:'本人、配偶、共同生活的子女在国（境）外的投资情况'},
        {type:20,name:'子女与港澳以及台湾居民通婚的情况'},
        {type:26,name:'子女与外国人、无国籍人通婚的情况'},
        {type:19,name:'个人认为需要报告的其他事项'},
    ];

    var APPROVE_STATUS = {
        1: "<span class='layui-badge layui-bg-orange'>待审核</span>",
        2: "<span class='layui-badge layui-bg-green'>审核通过</span>",
        3: "<span class='layui-badge'>驳回</span>",
        4: "<span class='layui-badge layui-bg-orange'>待审核</span>",
        5: "<span class='layui-badge layui-bg-green'>审核通过</span>",
        6: "<span class='layui-badge'>驳回</span>",
    };
</script>

<script>
    layui.use(['form', 'table', 'layer', 'laytpl'], function () {
        var table = layui.table;
        var layer = layui.layer;
        var form = layui.form;
        var laytpl = layui.laytpl;

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
                    field: 'archiveType', title: '档案类型', width: 340, templet: function (data) {
                        for(var i = 0;i< ARCHIVE_TYPE.length;i++){
                            if(data.archiveType == ARCHIVE_TYPE[i].type){
                                return ARCHIVE_TYPE[i].name;
                            }
                        }
                    }
                },
                {
                    field: 'status', title: '审核状态', width: 200, templet: function (data) {
                        return APPROVE_STATUS[data.status]
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
            var archiveName;
            for(var i = 0;i< ARCHIVE_TYPE.length;i++){
                if(data.archiveType == ARCHIVE_TYPE[i].type){
                    archiveName = ARCHIVE_TYPE[i].name;
                    break;
                }
            }
            if (obj.event === 'detail') {
                // var url = '/archive/toArchive?archiveId=' + data.archiveId + '&archiveType=' + data.archiveType + '&approveOperate=true';
                // $.get(url, function (html) {
                //     layer.open({
                //         type: 1,
                //         title: archiveName + "-" + data.applicantName,
                //         area: ['1400px', '800px'],
                //         content: html
                //     });
                // });

                $.post('archive/toArchive', {
                    archiveId: data.archiveId,
                    archiveType: data.archiveType,
                    approveOperate: true,
                    userId: data.applicantId,
                    userName: data.applicantName

                }, function (html) {
                    layer.open({
                        type: 1,
                        title: archiveName + "-" + data.applicantName,
                        area: ['1200px', '700px'],
                        content: html
                    });
                });
            }
        });

        //查询按钮监听
        form.on('submit(queryApprove)', function (data) {
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

        //渲染档案类型下拉
        var archiveTypeTpl = $("#archiveTypeTpl").html();
        laytpl(archiveTypeTpl).render(ARCHIVE_TYPE, function (html) {
            $('.archiveTypeView').append(html);
            form.render();
        });
    });
</script>

