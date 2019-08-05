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
        var $ = layui.$;

        form.render();

        var time = '';
        //日期
        laydate.render({
            elem: '#time',
            range: '~'
        });

        var tableIns = table.render({
            elem: '#statisticTable',
            url: 'punViolationStatistic/list',
            page: false, //开启分页
            limit: 10,
            method: 'post',
            cols: [[ //表头
                {field: 'dwmc', title: '单位', align: 'center', width:100,rowspan: 2},
                {title: '政务处分', align: 'center',colspan: 7},
                {title: '党纪处分', align: 'center',colspan: 6},
                {title: '问责', align: 'center',colspan: 8},
                {title: '违规', align: 'center',colspan: 5},
                {title: '违法', align: 'center',colspan: 3}
                /*,{field: 'operate', align: 'center', title: '操作', width:90,rowspan: 2, toolbar: '#statisticBar'}*/
            ],
                [
                    {field: 'jgCount', title: '政务警告人数', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='政务处分' data-violationtype='政务警告' data-orgid='" + v.orgId + "'>" + v.jgCount + "</a>";
                     }},
                    {field: 'jguoCount', title: '记过人数', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='政务处分' data-violationtype='记过' data-orgid='" + v.orgId + "'>" + v.jguoCount + "</a>";
                    }},
                    {field: 'jdgCount', title: '记大过人数', width:100,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='政务处分' data-violationtype='记大过' data-orgid='" + v.orgId + "'>" + v.jdgCount + "</a>";
                    }},
                    {field: 'jjCount', title: '降级人数', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='政务处分' data-violationtype='降级' data-orgid='" + v.orgId + "'>" + v.jjCount + "</a>";
                    }},
                    {field: 'czCount', title: '撤职人数', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='政务处分' data-violationtype='撤职' data-orgid='" + v.orgId + "'>" + v.czCount + "</a>";
                    }},
                    {field: 'kcCount', title: '开除人数', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='政务处分' data-violationtype='开除' data-orgid='" + v.orgId + "'>" + v.kcCount + "</a>";
                    }},
                    {field: 'zwcfCount', title: '总计', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='政务处分' data-orgid='" + v.orgId + "'>" + v.zwcfCount + "</a>";
                    }},
                    {field: 'djcfJgCount', title: '警告人数', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='党纪处分' data-violationtype='警告' data-orgid='" + v.orgId + "'>" + v.djcfJgCount + "</a>";
                    }},
                    {field: 'yzjgCount', title: '严重警告人数', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='党纪处分' data-violationtype='严重警告' data-orgid='" + v.orgId + "'>" + v.yzjgCount + "</a>";
                    }},
                    {field: 'cxdnzwCount', title: '撤销党内职务人数', width:150,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='党纪处分' data-violationtype='撤销党内职务' data-orgid='" + v.orgId + "'>" + v.cxdnzwCount + "</a>";
                    }},
                    {field: 'ldckCount', title: '留党察看人数', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='党纪处分' data-violationtype='留党察看' data-orgid='" + v.orgId + "'>" + v.ldckCount + "</a>";
                    }},
                    {field: 'kcdjCount', title: '开除党籍人数', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='党纪处分' data-violationtype='开除党籍' data-orgid='" + v.orgId + "'>" + v.kcdjCount + "</a>";
                    }},
                    {field: 'djcfCount', title: '总计', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='党纪处分' data-orgid='" + v.orgId + "'>" + v.djcfCount + "</a>";
                    }},
                    {field: 'tbCount', title: '通报人数', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='问责' data-violationtype='通报' data-orgid='" + v.orgId + "'>" + v.tbCount + "</a>";
                    }},
                    {field: 'jmthCount', title: '诫勉谈话人数', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='问责' data-violationtype='诫勉谈话' data-orgid='" + v.orgId + "'>" + v.jmthCount + "</a>";
                    }},
                    {field: 'tzjcCount', title: '停职检查人数', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='问责' data-violationtype='停职检查' data-orgid='" + v.orgId + "'>" + v.tzjcCount + "</a>";
                    }},
                    {field: 'tzzwCount', title: '调整职务人数', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='问责' data-violationtype='调整职务' data-orgid='" + v.orgId + "'>" + v.tzzwCount + "</a>";
                    }},
                    {field: 'zlczCount', title: '责令辞职人数', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='问责' data-violationtype='责令辞职' data-orgid='" + v.orgId + "'>" + v.zlczCount + "</a>";
                    }},
                    {field: 'jzCount', title: '降职人数', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='问责' data-violationtype='降职' data-orgid='" + v.orgId + "'>" + v.jzCount + "</a>";
                    }},
                    {field: 'mzCount', title: '免职人数', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='问责' data-violationtype='免职' data-orgid='" + v.orgId + "'>" + v.mzCount + "</a>";
                    }},
                    {field: 'wzCount', title: '总计', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='问责' data-orgid='" + v.orgId + "'>" + v.wzCount + "</a>";
                    }}
                    ,{field: 'fjtbCount', title: '分局通报人数', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='违规' data-violationtype='分局通报' data-orgid='" + v.orgId + "'>" + v.fjtbCount + "</a>";
                    }}
                    ,{field: 'txthCount', title: '提醒谈话人数', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='违规' data-violationtype='提醒谈话' data-orgid='" + v.orgId + "'>" + v.txthCount + "</a>";
                    }}
                    ,{field: 'smjcCount', title: '书面检查人数', width:120,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='违规' data-violationtype='书面检查' data-orgid='" + v.orgId + "'>" + v.smjcCount + "</a>";
                    }}
                    ,{field: 'kfCount', title: '扣分人数', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='违规' data-violationtype='扣分' data-orgid='" + v.orgId + "'>" + v.kfCount + "</a>";
                    }}
                    ,{field: 'wgCount', title: '总计', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='违规' data-orgid='" + v.orgId + "'>" + v.wgCount + "</a>";
                    }}
                    ,{field: 'yjsfjgCount', title: '移交司法机关人数', width:150,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='违法' data-violationtype='移交司法机关' data-orgid='" + v.orgId + "'>" + v.yjsfjgCount + "</a>";
                    }}
                    ,{field: 'wyjsfjgCount', title: '未移交司法机关人数', width:160,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='违法' data-violationtype='未移交司法机关' data-orgid='" + v.orgId + "'>" + v.wyjsfjgCount + "</a>";
                    }}
                    ,{field: 'wfCount', title: '总计', width:90,templet: function (v) {
                        return "<a href='javascript:void(0);' class='detail' data-violationlevel='违法' data-orgid='" + v.orgId + "'>" + v.wfCount + "</a>";
                    }}
        ]],
        done: function (res) {

        // 点击数字展示具体数据
        $(".detail").click(function () {
            if ($(this).text() === '0') {
            return;
            }

            var violationType = $(this).data("violationtype");
            var violationLevel = $(this).data("violationlevel");
            var orgId = $(this).data("orgid");

            var param = {
                orgId: orgId,
                violationLevel: violationLevel,
                violationType: violationType,
                time: time
            };

            if ('总计' !== violationType) {
                param.violationType = violationType
            }

            $.post("punViolationStatistic/toDetail", param, function (html) {
                layer.open({
                    type: 1,
                    title: (violationLevel==undefined?'':violationLevel) + (violationType==undefined?'':violationType) + '详情',
                    area: ['100%', '100%'],
                    content: html
                });
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
            window.location.href = "punViolationStatistic/list/export?orgId="+$("#orgId").val()+"&time=" + $("#time").val();
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