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
            <label class="layui-form-label">预警类型</label>
            <div class="layui-input-inline">
                <select name="archiveType" class="archiveTypeView" lay-search>
                    <option value="">请选择</option>
                </select>
            </div>
        </div>

        <div class="layui-inline">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryArchive" id="queryArchive">查询
            </button>
            <button class="layui-btn layui-btn-warm" type="reset" id="resetQueryArchive">清空</button>
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
        {type: 4, name: '本人婚姻情况'},
        {type: 6, name: '操办宴席申请表'},
        {type: 8, name: '可能影响公正执行职务报备表'},
        {type: 21, name: '涉警报备表'},
        {type: 23, name: '收受礼品登记表'},
        {type: 27, name: '借贷（担保）登记表'}
    ];
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
            url: 'archive/warningList',
            page: true, //开启分页
            method: 'post',
            cols: [[ //表头
                {field: 'userName', title: '姓名'},
                {field: 'policeCode', title: '警号'},
                {field: 'organizationName', title: '单位'},
                {
                    field: 'archiveType', title: '档案类型', templet: function (data) {
                        for (var i = 0; i < ARCHIVE_TYPE.length; i++) {
                            if (data.archiveType == ARCHIVE_TYPE[i].type) {
                                return ARCHIVE_TYPE[i].name;
                            }
                        }
                    }
                },
                // {
                //     field: 'approveStatus', title: '审核状态', templet: function (data) {
                //         return APPROVE_STATUS[data.approveStatus]
                //     }
                // },
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

        //渲染档案类型下拉
        var archiveTypeTpl = $("#archiveTypeTpl").html();
        laytpl(archiveTypeTpl).render(ARCHIVE_TYPE, function (html) {
            $('.archiveTypeView').append(html);
            form.render();
        });
    });
</script>

