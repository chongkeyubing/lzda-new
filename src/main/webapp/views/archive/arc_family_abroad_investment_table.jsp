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
                    <th colspan="7">本人、配偶、共同生活的子女在国（境）外的投资情况</th>
                </tr>
                <tr>
                    <td>投资人姓名</td>
                    <td>称谓</td>
                    <td>投资的国家（地区）及城市</td>
                    <td>投资情况</td>
                    <td>币种</td>
                    <td>投资金额（万）</td>
                    <td>备注</td>
                </tr>
                <tr>
                    <td>${archive.familyName}</td>
                    <td>${archive.familyAppellation}</td>
                    <td>${archive.address}</td>
                    <td>${archive.investmentInfo}</td>
                    <td>${archive.currency}</td>
                    <td>${archive.amount}</td>
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
