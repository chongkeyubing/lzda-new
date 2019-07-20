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
                    <th colspan="8">配偶、子女移居国（境）外的情况</th>
                </tr>
                <tr>
                    <td>姓名</td>
                    <td>称谓</td>
                    <td>移居国家（地区）</td>
                    <td>现居住城市</td>
                    <td>移居证件号码</td>
                    <td>移居类别</td>
                    <td>移居时间</td>
                    <td>备注</td>
                </tr>
                <tr>
                    <td>${archive.familyName}</td>
                    <td>${archive.familyAppellation}</td>
                    <td>${archive.toCountry}</td>
                    <td>${archive.toCity}</td>
                    <td>${archive.identificationNumber}</td>
                    <td>${archive.type}</td>
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
<%@ include file = "../common/back.jsp" %>