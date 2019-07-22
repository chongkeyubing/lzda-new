<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div style="width:100%; display: flex; justify-content: center;margin-left: -200px">
    <form class="layui-form form1">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="realname" lay-verify="required" autocomplete="off" class="layui-input"
                           readonly
                           value="${user.realname}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">警号</label>
                <div class="layui-input-inline">
                    <input type="text" name="policeCode" lay-verify="required" autocomplete="off" class="layui-input"
                           readonly value="${user.policeCode}">
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="policeCode" lay-verify="required" autocomplete="off" class="layui-input"
                           readonly value="${user.organizationName}">
                </div>
            </div>

            <div class="layui-inline">
                <label class="layui-form-label">角色</label>
                <div class="layui-input-inline">
                    <input type="text" name="policeCode" lay-verify="required" autocomplete="off" class="layui-input"
                           readonly value="${user.role}">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <input type="text" name="policeCode" lay-verify="required" autocomplete="off" class="layui-input"
                           readonly value="${user.gender}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">出生日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="birthday" id="birthday" lay-verify="required" autocomplete="off"
                           class="layui-input" readonly
                           value="${user.birthday}" />

                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="jobPosition" autocomplete="off" lay-verify="required" class="layui-input"
                           readonly value="${user.jobPosition}">

                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">身份证</label>
                <div class="layui-input-inline">
                    <input type="text" name="identityNumber" autocomplete="off" lay-verify="required|identity"
                           class="layui-input" readonly value="${user.identityNumber}">
                </div>
            </div>
        </div>
    </form>
</div>

