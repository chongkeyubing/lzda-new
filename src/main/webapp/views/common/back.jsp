<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>


<div style="margin-left: 0; text-align: center;;margin-bottom: 20px">
    <button class="layui-btn layui-btn-normal layui-btn-lg" type="button" id="close">
        返回
    </button>
</div>

<script>
    layui.use(['layer'], function () {
        $("#close").click(function () {
            layui.layer.closeAll();
        });
    });
</script>
