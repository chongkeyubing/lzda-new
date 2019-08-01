<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<form class="layui-form form1" action="incorruptselfsummary/update" id="incorroptForm" method="post">


    <input type="hidden" name="userId" value="${currentUser.id}">

    <div class="layui-form-item">
            <%--<div class="layui-inline">
                <label class="layui-form-label">上报人姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="realname" name="realname" value="${currentUser.realname}">
                </div>
            </div>--%>


        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">廉政小结</label>
            <div class="layui-input-inline" style="width:90%;">
                    <c:forEach items="${map}" var="map">
                        <c:if test="${map.userid == currentUser.id}">
                    <textarea style="width:80%;height: 30%;" placeholder="请输入内容" lay-filter="queryReport" lay-verify="required" name="summary" id="summary"
                     class="layui-textarea txtArea">${map.summary}</textarea>
                        </c:if>
                        <input type="hidden" id="id" name="id" value="${map.id}">
                    </c:forEach>
            </div>
        </div>

            <div class="layui-inline" style="margin-left: 74.3%;">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryReport" id="queryReport">提交
                </button>
            </div>


    </div>
</form>

<script>
    $('#queryReport').click(function(){
        $("#incorroptForm").ajaxSubmit({
        success: function (data) {
            if (data.success) {
                //关闭当前弹窗
                layer.closeAll();
                layer.msg("提交成功");
            } else {
                layer.msg("提交失败，请重新尝试或联系管理员");
            }
        }
    })
        return false;
    });


</script>

