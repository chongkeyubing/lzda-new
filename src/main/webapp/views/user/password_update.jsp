<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div style="width:100%; display: flex; justify-content: center;margin-left: -200px">
<form class="layui-form form1" id="passwordForm" action="user/updatePassword">
    <input type="hidden" name="id" lay-verify="required" autocomplete="off" class="layui-input" value="${currentUser.id}">

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">原始密码</label>
            <div class="layui-input-inline">
                <input type="password" name="password" lay-verify="required" autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">新密码</label>
            <div class="layui-input-inline">
                <input type="password" name="newPassword" id="newPassword" lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item">
        <div class="layui-inline">
            <label class="layui-form-label">确认新密码</label>
            <div class="layui-input-inline">
                <input type="password" id="confirm" lay-verify="required"  autocomplete="off" class="layui-input">
            </div>
        </div>
    </div>

    <div class="layui-form-item" style="text-align: center">
        <div class="layui-inline">
            <button class="layui-btn layui-btn-normal" lay-submit lay-filter="passwordSubmit" id="passwordSubmit">提交</button>
        </div>
    </div>

</form>
</div>
<script>
    layui.use(['form', 'table', 'layer', 'laytpl'], function () {
        var layer = layui.layer;
        var form = layui.form;

        form.render();

        //点击提交
        form.on('submit(passwordSubmit)', function () {
            debugger;
            var newPassword = $("#newPassword").val().trim();
            if(newPassword != $("#confirm").val().trim()){
                layer.msg("两次输入密码不一致");
                return false;
            }
            if(newPassword.length < 6 || newPassword.length >18){
                layer.msg("密码长度请保持在6-18位");
                return false;
            }
            layer.load(2);
            $("#passwordForm").ajaxSubmit({
                success: function (data) {
                    layer.closeAll();
                    if (data.success) {
                        layer.confirm('密码修改成功，请重新登陆',{btn:['重新登陆'],closeBtn:0},function(){
                             window.location.href = "index.jsp";
                        });

                    } else {
                        layer.msg(data.message);
                    }
                }
            });
            return false;//阻止表单跳转
        });

    });
</script>

