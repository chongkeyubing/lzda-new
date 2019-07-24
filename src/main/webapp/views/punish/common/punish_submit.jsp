<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="layui-form-item">
    <div class="layui-input-block reset">
        <button class="layui-btn layui-btn-normal layui-btn-lg" lay-submit lay-filter="submitPunish">
            提交
        </button>
        <button class="layui-btn layui-btn-warm layui-btn-lg" type="button" id="closeAdd">
            返回
        </button>
    </div>
</div>
<script>
    layui.use(['form', 'layedit'], function () {
        var form = layui.form,
            layer = layui.layer;

        //点击提交
        form.on('submit(submitPunish)', function () {
            debugger;
            var index = layer.load(2);
            $("#punishForm").ajaxSubmit({
                success: function (data) {
                    if (data.success) {
                        //关闭当前弹窗
                        layer.closeAll();
                        layer.msg("提交成功");

                        //重载查询页面表格
                        // $("#resetQueryPunish").click();
                        $("#queryPunish").click();
                    } else {
                        layer.close(index);
                        layer.msg("提交失败，请重新尝试或联系管理员");
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