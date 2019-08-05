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
                    <th colspan="6">一般干部违纪情况登记表</th>
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
                    <td>性 别</td>
                    <td>${punish.gender}</td>
                    <td>出生年月</td>
                    <td>${punish.birthday}</td>
                    <td>违纪级别</td>
                    <td>${punish.violationLevel}&nbsp;${punish.violationType}</td>
                </tr>
                <tr>
                    <td>主<br/>要<br/>错<br/>误<br/>事<br/>实</td>
                    <td colspan="5">${punish.mistakeFact}</td>
                </tr>
                <tr>
                    <td>处<br/>理<br/>依<br/>据</td>
                    <td colspan="5">${punish.handleBasis}</td>
                </tr>

               <%-- <tr>
                    <td>处理情况</td>
                    <td colspan="3">${punish.handleInfo}</td>
                    <td>是否移交<br/>司法机关</td>
                    <td>${punish.transfer}</td>
                </tr>--%>
                <tr>
                    <td>查处单位</td>
                    <td colspan="3">${punish.violationOrg}</td>
                    <td>处理时间</td>
                    <td>${punish.handleTime}</td>
                </tr>
                <tr>
                    <%--<td>审批人</td>--%>
                    <%--<td colspan="3">${punish.userName}</td>--%>
                    <td >填表人</td>
                    <td colspan="5">${punish.operator}</td>
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
<script>

    // function list(index) {
    //     var pb1 = $.photoBrowser({
    //         items: [
    //             "./images/addImg.png",
    //             "./images/addImg.png",
    //             "./images/delete.png",
    //         ],
    //         initIndex: index
    //     });
    //     pb1.open();
    //
    // }
</script>
		
		
