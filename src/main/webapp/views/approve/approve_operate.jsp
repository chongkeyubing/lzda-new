<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<form id="approveForm" method="post" class="layui-form">
    <input type="hidden" name="archiveId" id="archiveId" value="${archive.id}">
    <input type="hidden" name="archiveType" id="archiveType" value="${archive.archiveType}">

    <shiro:hasRole name="单位负责人">
        <div id="nextApprover" class="layui-form-item" style="padding-top: 30px">
            <label class="layui-form-label">选择纪委或督察</label>
            <div class="layui-input-inline">
                <input type="text" name="approverName" readonly autocomplete="off"
                       class="layui-input" id="approverName">
                <input type="hidden" name="approverId" id="approverId">
            </div>
            <div class="layui-input-inline">
                <button class="layui-btn layui-btn-normal" id="approverSelect" type="button">选择</button>
            </div>
        </div>
    </shiro:hasRole>

    <div id="rejectComment" class="layui-form-item layui-form-text" style="display: none;margin-top: 20px;">
        <label class="layui-form-label">驳回意见</label>
        <div class="layui-input-block">
            <textarea placeholder="请输入内容" class="layui-textarea" name="comments" id="rejectText"></textarea>
        </div>
    </div>

    <div class="layui-form-item" style="margin-top: 20px;text-align: center">
        <button id="approvePass" class="layui-btn layui-btn-normal layui-btn-lg" type="button"
                lay-filter="approvePass">
            审核通过
        </button>
        <button id="approveReject" type="button" class="layui-btn layui-btn-normal layui-btn-lg layui-btn-danger"
                lay-filter="approveReject">
            驳回
        </button>
        <button id="rejectBack" type="button" class="layui-btn layui-btn-normal layui-btn-lg"
                lay-filter="rejectBack" style="display: none">
            返回
        </button>
    </div>

</form>
<script>
    layui.use(['form', 'table', 'layer'], function () {
        var layer = layui.layer,
            form = layui.form;

        //选择审核人弹窗
        $("#approverSelect").click(function (e) {
            $.get('user/toApproverSelect', function (html) {
                layer.open({
                    type: 1,
                    title: '选择审核人',
                    area: ['800'],
                    content: html
                });
            });
        });

        //审核通过
        $("#approvePass").click(function () {
            debugger;

            <shiro:hasRole name="单位负责人">
            if ($("#approverName").val().trim() == '') {
                layer.msg("请填写审核人");
                return;
            }
            </shiro:hasRole>

            $("#rejectComment").val('');
            $("#approveForm").attr("action", 'approve/approvePass');
            ajaxSubmit();
        });

        //驳回
        var commit = false;
        $("#approveReject").click(function () {
            debugger;
            if (commit) {
                //提交驳回
                if ($("#rejectText").val().trim() == '') {
                    layer.msg("请填写驳回意见");
                    return;
                }
                $("#approveForm").attr("action", 'approve/reject');
                ajaxSubmit();
                layer.closeAll();
            } else {
                //展示驳回页面
                $("#nextApprover").hide();
                $("#rejectComment").show();

                $("#rejectBack").show();
                $("#approvePass").hide();
                commit = true;
            }
        });

        //驳回返回
        $("#rejectBack").click(function () {
            $(this).hide();
            $("#rejectComment").hide();

            $("#nextApprover").show();
            $("#approvePass").show();
            commit = false;
        });

        function ajaxSubmit() {
            layer.load(2)
            $("#approveForm").ajaxSubmit({
                success: function (data) {
                    if (data.success) {
                        layer.closeAll();
                        layer.msg("提交成功");

                        //重载查询页面表格
                        $("#queryApprove").click();
                    } else {
                        layer.msg("提交失败，请重新尝试或联系管理员");
                    }
                }
            });
        }
    });
</script>




