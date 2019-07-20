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
                    <th colspan="6">配偶、子女及其配偶被司法机关追究刑事责任的情况</th>
                </tr>
                <tr>
                    <td>姓 名</td>
                    <td>称 谓</td>
                    <td>被追究时间</td>
                    <td>被追究原因</td>
                    <td>处理阶段</td>
                    <td>处理结果</td>
                </tr>
                <tr>
                    <td>${archive.familyName}</td>
                    <td>${archive.familyAppellation}</td>
                    <td>${archive.time}</td>
                    <td>${archive.reason}</td>
                    <td>${archive.period}</td>
                    <td>${archive.result}</td>

                </tr>
            </table>

            <c:if test="${approveOperate}">
                <%@ include file="../approve/approve_operate.jsp" %>
            </c:if>

            <c:if test="${approveRecord}">
                <%@ include file="../approve/approve_record.jsp" %>
            </c:if>
        </div>
    </div>
</div>
<%@ include file = "../common/back.jsp" %>