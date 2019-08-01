<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>


<link rel="stylesheet" type="text/css" href="static/css/imgUp.css"/>
<link rel="stylesheet" type="text/css" href="static/css/demos.css"/>
<link rel="stylesheet" type="text/css" href="static/css/jquery-weui.css"/>
<link rel="stylesheet" type="text/css" href="static/css/weui.min.css"/>

<div class="wrapper">
    <div class="contentBox">
        <div class="tableHonor">
            <table>
                <tr>
                    <th colspan="6">一般干部被群众信访举报情况登记表</th>
                </tr>
                <tr>
                    <td>姓 名</td>
                    <td>${punish.userName}</td>
                    <td>单 位</td>
                    <td>${punish.organization}</td>
                    <td>职 务</td>
                    <td>${punish.jobPosition}</td>
                </tr>
                <tr>
                    <td>举报形式</td>
                    <td>${punish.type}</td>
                    <td>举报时间</td>
                    <td>${punish.time}</td>
                    <td>受理部门</td>
                    <td>${punish.handleOrg}</td>
                </tr>
                <tr>
                    <td>举报人</td>
                    <td>${punish.reportPersonName}</td>
                    <td>联系方式</td>
                    <td>${punish.contact}</td>
                    <td>核实结束时间</td>
                    <td>${punish.endTime}</td>
                </tr>
                <tr>
                    <td>反<br/>映<br/>主<br/>要<br/>问<br/>题</td>
                    <td colspan="5">${punish.problem}</td>
                </tr>
                <tr>
                    <td>核<br/>实<br/>结<br/>果</td>
                    <td colspan="5">${punish.result}</td>
                </tr>
                <tr>
                    <td>处<br/>理<br/>结<br/>果</td>
                    <td colspan="5">${punish.hanldeResult}</td>
                </tr>
                <tr>
                    <td>负责人</td>
                    <td>${punish.chargePerson}</td>
                    <td>填表科室</td>
                    <td>${punish.handleDep}</td>
                    <td>填表人</td>
                    <td>${punish.operator}</td>
                </tr>

                <tr>
                    <td>备注</td>
                    <td colspan="5">${punish.remark}</td>
                </tr>
                <c:if test="${not empty attachments}">
                    <tr class="imgDisplay">
                        <td>附件</td>
                        <td colspan="5">
                            <ul>
                                <c:forEach items="${attachments}" var="attachment" varStatus="statu">
                                    <li>
                                        <a href="${attachment.url}" target="_blank">
                                                <%--<img src="${attachment.url}" onclick="list(${statu.index})"/>--%>
                                            <img src="${attachment.url}"/>
                                        </a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </td>
                    </tr>
                </c:if>

            </table>

        </div>
    </div>

</div>
<%@ include file = "../common/backone.jsp" %>
<script src="static/js/imgUp1.js"></script>
<script src="static/js/initDom.js"></script>
<script src="static/js/jquery-weui.js"></script>
<script src="static/js/swiper.js"></script>