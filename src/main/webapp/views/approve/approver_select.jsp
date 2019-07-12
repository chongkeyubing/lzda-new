<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<shiro:hasAnyRoles name="普通民警,单位负责人,局领导,政治处领导">
    <div class="layui-form-item" style="padding-top: 25px;border-top: 1px solid #f6f6f6">
        <label class="layui-form-label">档案审核人</label>
        <div class="layui-input-inline">
            <input type="text" name="approverName" readonly autocomplete="off" class="layui-input"
                   lay-verify="required" id="approverName">
            <input type="hidden" name="approverId" id="approverId">
        </div>
        <div class="layui-input-inline">
            <button class="layui-btn layui-btn-normal" id="approverSelect" type="button">选择</button>
        </div>
    </div>
    <script>
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
    </script>
</shiro:hasAnyRoles>