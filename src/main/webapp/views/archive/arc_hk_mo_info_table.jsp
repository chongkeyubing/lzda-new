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
                    <th colspan="5">持有港澳通行证（往来台湾）情况登记表</th>
                </tr>
                <tr>
                    <td>证件名称</td>
                    <td>证件号码</td>
                    <td>有效期</td>
                    <td>保管单位</td>
                    <td>备注</td>
                </tr>

                <tr>
                    <td>${archive.certificateName}</td>
                    <td>${archive.certificateNumber}</td>
                    <td><fmt:formatDate value="${archive.expiryDate}" pattern="yyyy-MM-dd"/></td>
                    <td>${archive.storekeeper}</td>
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
