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
                    <th colspan="7">淮安市公安局淮安分局民警基本情况登记表</th>
                </tr>
                <tr class="fix1 fix">
                    <td>姓　　名</td>
                    <td>${archive.userName}</td>
                    <td>性　　别</td>
                    <td>${archive.gender}</td>
                    <td>民　　族</td>
                    <td>${archive.nation}</td>
                    <td rowspan="4"><img src="${archive.avatarUrl}" class="imgShow" style="max-width: 100%;"/></td>
                    </td>

                </tr>
                <tr class="fix2 fix">
                    <td>籍　　贯</td>
                    <td>${archive.nativePlace}</td>
                    <td>婚姻状况</td>
                    <td>${archive.maritalStatus}</td>
                    <td>出生日期</td>
                    <td><fmt:formatDate value="${archive.birthday}" pattern="yyyy-MM-dd"/></td>
                </tr>
                <tr class="fix3 fix">
                    <td>政治面貌</td>
                    <td>${archive.politicFace}</td>
                    <td>入党时间</td>
                    <td><fmt:formatDate value="${archive.partyJoinTime}" pattern="yyyy-MM-dd"/></td>
                    <td>学　　历</td>
                    <td>${archive.education}</td>
                </tr>
                <tr class="fix4 fix">
                    <td>手机号码</td>
                    <td colspan="2">${archive.phone}</td>
                    <td>办公电话</td>
                    <td colspan="2">${archive.officePhone}</td>
                </tr>
                <tr>
                    <td>身份证号</td>
                    <td colspan="6">${archive.identityNumber}</td>
                </tr>
                <tr>
                    <td>家庭地址</td>
                    <td colspan="6">${archive.homeAddress}</td>
                </tr>
                <tr>
                    <td>工作单位</td>
                    <td colspan="6">${archive.organization}</td>
                </tr>
                <tr>
                    <td>现任职务</td>
                    <td colspan="2">${archive.jobPosition}</td>
                    <td>职 级</td>
                    <td>${archive.jobPositionLevel}</td>
                    <td>任现职务时间</td>
                    <td><fmt:formatDate value="${archive.jobPositionTime}" pattern="yyyy-MM-dd"/></td>
                </tr>
                <tr>
                    <td>分管工作</td>
                    <td colspan="6">${archive.responsibility}</td>
                </tr>
                <tr>
                    <td>个<br/>人<br/>工<br/>作<br/>简<br/>历</td>
                    <td colspan="6">${archive.workExperience}</td>
                </tr>


                <c:if test="${not empty arcFamilySocietyRelaList}">
                <tr>
                    <td rowspan="${arcFamilySocietyRelaListSize}">家庭<br/>主要<br/>成员<br/>及重<br/>要社<br/>会关<br/>系</td>
                    <td>称　谓</td>
                    <td>姓　名</td>
                    <td>出生年月</td>
                    <td>政治面貌</td>
                    <td style="width: 10%;">工作单位</td>
                    <td>职务</td>
                </tr>

                <c:forEach var="arcFamilySocietyRela" items="${arcFamilySocietyRelaList}">
                    <tr>
                        <td>${arcFamilySocietyRela.appellation}</td>
                        <td>${arcFamilySocietyRela.name}</td>
                        <td><fmt:formatDate value="${arcFamilySocietyRela.birthday}" pattern="yyyy-MM-dd"/></td>
                        <td>${arcFamilySocietyRela.politicFace}</td>
                        <td>${arcFamilySocietyRela.organization}</td>
                        <td>${arcFamilySocietyRela.jobPosition}</td>
                    </tr>
                </c:forEach>
                </c:if>

                <tr>
                    <td>其<br/>他<br/>需<br/>要<br/>说<br/>明<br/>的<br/>情<br/>况</td>
                    <td colspan="6">${archive.otherInfo}</td>
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
<script>
    $(function(){
        var $fix1=$(".fix1").height()
        var $fix1_b=$(".fix1 td").css('border')
        var $fix1_n=parseInt($fix1_b,10)*2
        var $fix1H=$fix1+$fix1_n


        var $fix2=$(".fix2").height()
        var $fix2_b=$(".fix2 td").css('border')
        var $fix2_n=parseInt($fix2_b,10)*2
        var $fix2H=$fix2+$fix2_n

        var $fix3=$(".fix3").height()
        var $fix3_b=$(".fix3 td").css('border')
        var $fix3_n=parseInt($fix3_b,10)*2
        var $fix3H=$fix3+$fix3_n

        var $fix4=$(".fix4").height()
        var $fix4_b=$(".fix4 td").css('border')
        var $fix4_n=parseInt($fix4_b,10)*2
        var $fix4H=$fix4+$fix4_n


        var imgHeight=$fix1H+$fix2H+$fix3H+$fix4H
        console.log(imgHeight)
        $(".tableHonor table .imgShow").css('maxHeight',imgHeight)

    })
</script>
<%@ include file = "./common/back.jsp" %>