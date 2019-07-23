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
                    <th colspan="6">操办宴席申请表</th>
                </tr>
                <tr>
                    <td>申报人<br/>姓 名</td>
                    <td colspan="2">${archive.userName}</td>
                    <td>单位及<br/>职 务</td>
                    <td colspan="2">${archive.organization}&nbsp;${archive.jobPosition}</td>
                </tr>
                <tr>
                    <td>申报事由</td>
                    <td colspan="5">${archive.reason}</td>
                </tr>
                <tr>
                    <td rowspan="3">宴 请<br/>规 模</td>
                    <td>亲 属</td>
                    <td>${archive.relativesNumber}人</td>
                    <td rowspan="3">宴 请<br/>总<br/>桌 数</td>
                    <td>宴席标准</td>
                    <td>${archive.totalLevel}元</td>
                </tr>
                <tr>
                    <td>好 友</td>
                    <td>${archive.friendNumber}人</td>
                    <td>酒水标准</td>
                    <td>${archive.wineLevel}元</td>
                </tr>
                <tr>
                    <td>其 他</td>
                    <td>${archive.otherNumber}人</td>
                    <td>香烟和<br/>礼品标准</td>
                    <td>${archive.cigaretteGiftLevel}元</td>
                </tr>

                <tr>
                    <td rowspan="2">用 车<br/>情 况</td>
                    <td>车辆来源</td>
                    <td colspan="4">${archive.vehicleSource}</td>
                </tr>
                <tr>

                    <td>车辆号码</td>
                    <td colspan="4">${archive.vehicleNumber}</td>
                </tr>
                <tr>
                    <td>活动时间</td>
                    <td colspan="2">${archive.activityTime}</td>
                    <td>活动地点</td>
                    <td colspan="2">${archive.activityPosition}</td>
                </tr>
                <tr>
                    <td>其他需要<br/>申报和说<br/>明的情况</td>
                    <td colspan="5">${archive.otherInfo}</td>
                </tr>
                <tr>
                    <td>个人申请</td>
                    <td colspan="5">${archive.personalApply}</td>
                </tr>
                <%--<tr>--%>
                <%--<td>单位意见</td>--%>
                <%--<td colspan="5"></td>--%>
                <%--</tr>--%>
                <%--<tr>--%>
                <%--<td>审批单位<br/>意    见</td>--%>
                <%--<td colspan="5"></td>--%>
                <%--</tr>--%>

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
<%@ include file="../common/back.jsp" %>