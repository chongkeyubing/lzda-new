<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>


<form class="layui-form form1">
    <%----%>
    <input type="text" name="userId" value="${currentUser.id}">

    <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">上报人姓名</label>
                <div class="layui-input-inline">
                    <input type="text" id="realname" name="realname" value="${currentUser.realname}">
                </div>
            </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">廉政小结</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" lay-filter="queryReport" lay-verify="required" name="summary" id="summary"
                     class="layui-textarea txtArea">${map.realname}</textarea>

            </div>
        </div>




            <div class="layui-inline">
                <button class="layui-btn layui-btn-normal" lay-submit lay-filter="queryReport" id="queryReport">查询
                </button>
                <button class="layui-btn layui-btn-warm" type="reset" id="resetQueryReport">清空</button>
            </div>


    </div>
</form>



