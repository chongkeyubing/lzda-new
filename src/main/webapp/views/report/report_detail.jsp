<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="wrapper">
    <div class="contentBox">
        <div class="tableHonor">
            <table>
                <tr>
                    <th>廉 政 信 息</th>
                </tr>
                <tr>
                    <td style="text-align: left;">标题：<i>${rptIncorrupt.title}</i></td>
                </tr>
                <tr>
                    <td style="text-align: left;">
                        <div class="message" style="width: 100%;overflow: hidden;float: left;">
                            <span>内容：<i>${rptIncorrupt.content}</i></span>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </div>
</div>
<%@ include file = "../common/backone.jsp" %>

