<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<style>
    h2 {
        font-weight: bold;
    }

    h3 {
        text-indent: 2em;
        float: left;
        line-height: 38px;
        font-weight: bold;
    }

    .addInfo03 {
        width: 1027px;
        overflow: hidden;
        margin-top: 15px;
    }

    .addInfo03 p {
        float: left;
        overflow: hidden;
    }

    .addInfo03 span {
        float: right;
        padding: 5px 10px;
        border: 1px solid #eee;
        color: #4877e8;
        font-size: 18px;
        margin-bottom: 5px;
        cursor: pointer;
    }

    .addInfo03 .guanxi {
        width: 100%;
        overflow: hidden;
        padding-top: 10px;
        box-sizing: border-box;
        margin-bottom: 15px;
        border: 1px solid #eee;
    }

    .addInfo03 .guanxi .layui-form-label {
        margin-bottom: 15px;
    }
</style>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action='rptresponsibilityreport/add' id="reportForm" method="post">
        <%--隐藏表单--%>
        <input type="hidden" name="report.committerId" value="${currentUser.id}">
        <input type="hidden" name="report.committerName" value="${currentUser.realname}">
        <input type="hidden" name="report.organizationId" value="${currentUser.organizationId}">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">单位名称</label>
                <div class="layui-input-inline">
                    <input type="text" name="report.organizationName" autocomplete="off" class="layui-input"
                           lay-verify="required" value="${currentUser.organizationName}" readonly>

                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">年份</label>
                <div class="layui-input-inline">
                    <input type="text" name="report.year" id="year1" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">季度</label>
                <div class="layui-input-inline">
                    <select name="report.quarter" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="第一季度">第一季度</option>
                        <option value="第二季度">第二季度</option>
                        <option value="第三季度">第三季度</option>
                        <option value="第四季度">第四季度</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="addInfo03" id="sctp">
            <h3>工单</h3>
            <div style="float: right;margin-bottom: 15px;margin-right: 0px;">
                <button id="addTask" type="button" class="layui-btn layui-btn-normal">添加</button>
                <button id="delTask" type="button" class="layui-btn layui-btn-danger">删除</button>
            </div>
        </div>

        <%--<div class="layui-form-item">--%>
        <%--<div class="layui-inline">--%>
        <%--<label class="layui-form-label">工单类别</label>--%>
        <%--<div class="layui-input-inline">--%>
        <%--<select name="type" lay-verify="required">--%>
        <%--<option value="">请选择</option>--%>
        <%--<option value="主体责任季度工单">主体责任季度工单</option>--%>
        <%--<option value='"第一责任人"责任季度工单'>"第一责任人"责任季度工单</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--</div>--%>

        <%--<div class="layui-inline">--%>
        <%--<label class="layui-form-label">任务序号</label>--%>
        <%--<div class="layui-input-inline">--%>
        <%--<input type="text" name="taskOrder" autocomplete="off" class="layui-input"--%>
        <%--lay-verify="required">--%>
        <%--</div>--%>
        <%--</div>--%>

        <%--<div class="layui-inline">--%>
        <%--<label class="layui-form-label">是否完成</label>--%>
        <%--<div class="layui-input-inline">--%>
        <%--<select name="complete" lay-verify="required">--%>
        <%--<option value="">请选择</option>--%>
        <%--<option value="是">是</option>--%>
        <%--<option value="否">否</option>--%>
        <%--</select>--%>
        <%--</div>--%>
        <%--</div>--%>
        <%--</div>--%>

        <%--<div class="layui-form-item layui-form-text">--%>
        <%--<label class="layui-form-label">具体落实情况</label>--%>
        <%--<div class="layui-input-inline">--%>
        <%--<textarea placeholder="请输入内容" class="layui-textarea txtArea" lay-verify="required"--%>
        <%--name="completeInfo"></textarea>--%>
        <%--</div>--%>
        <%--</div>--%>

        <div class="layui-inline" style="margin-bottom: 20px;margin-left: 100px">
            <div class="layui-input-inline">
                <p class="remark">注：1、“任务序号”指本季度工单对应任务，对照任务序号逐一填写任务落实情况；</p>
                <p class="remark" style="text-indent: 2em;">2、填写内容要求实事求是，简要描述工作完成情况；</p>
                <p class="remark" style="text-indent: 2em;">3、本表请于每季度末月25前填报</p>
            </div>
        </div>

        <%--添加图片--%>
        <%@ include file="./common/img_add.jsp" %>

        <%-- 提交 --%>
        <%@ include file="./common/report_submit.jsp" %>
    </form>

</div>

<script>
    layui.use(['form', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            laydate = layui.laydate;

        form.render();

        //日期
        laydate.render({
            elem: '#year1',
            type: 'year'
        });

        //动态新增
        var index = 0;
        $("#addTask").click(function () {
            var tempStr = "";
            tempStr += "<div style='display:block;' class='guanxi' id='task" + index + "'>";

            tempStr += "<div class=\"layui-form-item\">";
            tempStr += "<div class=\"layui-inline\">";
            tempStr += "<label class=\"layui-form-label\">工单类别</label>";
            tempStr += "<div class=\"layui-input-inline\">";
            tempStr += "<select name=\"tasks[" + index + "].type\" lay-verify=\"required\">";
            tempStr += "<option value=\"\">请选择</option>";
            tempStr += "<option value='0'>主体责任季度工单</option>";
            tempStr += "<option value='1'>第一责任人责任季度工单</option>";
            tempStr += "</select>";
            tempStr += "</div>";
            tempStr += "</div>";

            tempStr += "<div class=\"layui-inline\">";
            tempStr += "<label class=\"layui-form-label\">任务序号</label>";
            tempStr += "<div class=\"layui-input-inline\">";
            tempStr += "<input type=\"text\" name=\"tasks[" + index + "].taskOrder\" autocomplete=\"off\" class=\"layui-input\"\n" +
                "                           lay-verify=\"required\">";
            tempStr += "</div>";
            tempStr += "</div>";

            tempStr += "<div class=\"layui-inline\">";
            tempStr += "<label class=\"layui-form-label\">是否完成</label>";
            tempStr += "<div class=\"layui-input-inline\">";
            tempStr += "<select name=\"tasks[" + index + "].complete\" lay-verify=\"required\">";
            tempStr += "<option value=\"\">请选择</option>";
            tempStr += "<option value=\"是\">是</option>";
            tempStr += "<option value=\"否\">否</option>";
            tempStr += "</select>";
            tempStr += "</div>";
            tempStr += "</div>";
            tempStr += "</div>";

            tempStr += "<div class=\"layui-form-item layui-form-text\">";
            tempStr += "<label class=\"layui-form-label\">具体落实情况</label>";
            tempStr += "<div class=\"layui-input-inline\">";
            tempStr += "<textarea placeholder=\"请输入内容\" class=\"layui-textarea txtArea\" lay-verify=\"required\"\n" +
                "                          name=\"tasks[" + index + "].completeInfo\"></textarea>";
            tempStr += "</div>";
            tempStr += "</div>";

            tempStr += "</div>";

            $("#sctp").append(tempStr);

            form.render();

            index++;
        });

        $("#delTask").click(function () {
            debugger;
            if (index > 0) {
                index--;
                $("#task" + index).remove();
            }
        });

    });
</script>

