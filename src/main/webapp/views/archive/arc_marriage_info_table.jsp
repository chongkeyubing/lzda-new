<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<div class="wrapper">
    <div class="contentBox">
        <div class="tableHonor">
            <table>
                <tr>
                    <th colspan="4">婚姻情况登记表</th>
                </tr>
                <tr>
                    <td>婚姻现状</td>
                    <td colspan="3">${archive.marriageStatus}</td>
                </tr>
                <tr>
                    <td>婚姻变化情况</td>
                    <td colspan="3">${archive.changeSituation}</td>
                </tr>
                <tr>
                    <td rowspan="2">有变化</td>
                    <td rowspan="2">${archive.changeStatus}</td>
                    <td>变化时间</td>
                    <td>${archive.changeDate}</td>
                </tr>
                <tr>
                    <td>变化原因</td>
                    <td>${archive.changeReason}</td>
                </tr>

            </table>
            <c:if test="${approveOperate}">
                <%@ include file = "../approve/approve_operate.jsp" %>
            </c:if>

            <c:if test="${approveRecord}">
                <%@ include file = "../approve/approve_record.jsp" %>
            </c:if>
        </div>
    </div>
</div>
<%@ include file = "../common/back.jsp" %>

