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
                    <th colspan="4">队伍思想状况${report.time}月份析报告</th>
                </tr>
                <tr>
                    <td>填报单位</td>
                    <td>${report.organizationName}</td>
                    <td>月份</td>
                    <td>${report.time}</td>
                </tr>
                <tr>
                    <td>基本情况</td>
                    <td colspan="3">民警${report.ploiceNumber}人，其中党员${report.partyNumber}人。
                    </td>
                </tr>
                <tr>
                    <td>遵纪情况</td>
                    <td colspan="3">${report.obeyInfo}</td>
                </tr>
                <tr>
                    <td>队伍思想状况</td>
                    <td colspan="3">${report.teamThinkingInfo}</td>
                </tr>
                <tr>
                    <td>队伍特色亮点<br/>及存在问题</td>
                    <td colspan="3">${report.teamAdvantageProblem}</td>
                </tr>
                <tr>
                    <td>采取主<br/>要措施</td>
                    <td colspan="3">${report.mainMeasure}</td>
                </tr>
                <tr>
                    <td>其它<br/>情况</td>
                    <td colspan="3">${report.otherInfo}</td>
                </tr>
            </table>
        </div>
    </div>
</div>

<%@ include file="../common/back.jsp" %>
