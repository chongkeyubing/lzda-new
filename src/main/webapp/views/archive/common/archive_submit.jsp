<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="layui-form-item">
    <div class="layui-input-block reset">
        <button class="layui-btn layui-btn-normal layui-btn-lg" lay-submit lay-filter="submitArchive">
            提交
        </button>
        <button class="layui-btn layui-btn-warm layui-btn-lg" type="button" id="closeAdd">
            返回
        </button>
    </div>
</div>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer;

        //点击提交
        form.on('submit(submitArchive)', function () {
            debugger;
            var index = layer.load(2);
            $("#archiveForm").ajaxSubmit({
                success: function (data) {
                    if (data.success) {
                        //关闭当前弹窗
                        layer.closeAll();
                        layer.msg("提交成功");

                        //重载查询页面表格
                        // $("#resetQueryArchive").click();
                        $("#queryArchive").click();
                    } else {
                        layer.close(index);
                        layer.msg(data.message);
                    }
                }
            });
            return false;//阻止表单跳转
        });
        $("#closeAdd").click(function () {
            layer.closeAll();
        });
    });
</script>