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
                    <th colspan="6">配偶、子女虽未移居国（境）外，但连续在国（境）外工作、生活一年以上的情况</th>
                </tr>
                <tr>
                    <td>姓 名</td>
                    <td>称谓</td>
                    <td>所在国家（地区）</td>
                    <td>工作、生活城市</td>
                    <td>起始时间</td>
                    <td>备注</td>
                </tr>
                <tr>
                    <td>${archive.familyName}</td>
                    <td>${archive.familyAppellation}</td>
                    <td>${archive.country}</td>
                    <td>${archive.city}</td>
                    <td>${archive.time}</td>
                    <td>${archive.remark}</td>
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
<%@ include file = "./common/back.jsp" %>