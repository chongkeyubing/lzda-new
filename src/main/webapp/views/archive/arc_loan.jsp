<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<style>
    h2 {
        font-weight: bold;
    }

    h3 {
        text-indent: 2em;
        float: left;
        line-height: 38px;
        font-weight: bold;
    }

    .addInfo03 {
        width: 1027px;
        overflow: hidden;
        margin-top: 15px;
    }

    .addInfo03 p {
        float: left;
        overflow: hidden;
    }

    .addInfo03 span {
        float: right;
        padding: 5px 10px;
        border: 1px solid #eee;
        color: #4877e8;
        font-size: 18px;
        margin-bottom: 5px;
        cursor: pointer;
    }

    .addInfo03 .guanxi {
        width: 100%;
        overflow: hidden;
        padding-top: 10px;
        box-sizing: border-box;
        margin-bottom: 15px;
        border: 1px solid #eee;
    }

    .addInfo03 .guanxi .layui-form-label {
        margin-bottom: 15px;
    }
</style>


<div style="display: flex; justify-content: center;">
    <form class='layui-form form1' action='arcloan/add' id="archiveForm" method="post">
        <!-- 隐藏表单 -->
        <input type="hidden" name="arcLoan.userId" value="${currentUser.id}">
        <input type="hidden" name="arcLoan.archiveType" value="${archiveType}">
        <input type="hidden" name="arcLoan.organizationId" value="${currentUser.organizationId}">

        <h2>一、基本信息</h2>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcLoan.userName" value="${currentUser.realname}" lay-verify="required"
                           readonly
                           autocomplete="off"
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcLoan.gender" autocomplete="off" value="${currentUser.gender}"
                           lay-verify="required" readonly
                           class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">政治面貌</label>
                <div class="layui-input-inline">
                    <select name="arcLoan.politicFace" lay-verify="required">
                        <option value="">请选择</option>
                        <option value="党员">党员</option>
                        <option value="群众">群众</option>
                    </select>
                </div>
            </div>
        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcLoan.jobPosition" lay-verify="required"
                           value="${currentUser.jobPosition}"
                           readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">所在单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcLoan.organization" lay-verify="required" readonly autocomplete="off"
                           class="layui-input" value="${currentUser.organizationName}">
                </div>
            </div>
        </div>
        <h2>二、参与民间借贷担保情况</h2>
        <div class="addInfo03" id="sctp1">
            <h3>借出</h3>
            <div style="float: right;margin-bottom: 15px;margin-right: 0px;">
                <button id="addLoan" type="button" class="layui-btn layui-btn-normal">添加</button>
                <button id="delLoan" type="button" class="layui-btn layui-btn-danger">删除</button>
            </div>
        </div>
        <div class="addInfo03" id="sctp2">
            <h3>借入</h3>
            <div style="float: right;margin-bottom: 15px;margin-right: 0px;">
                <button id="addBorrow" type="button" class="layui-btn layui-btn-normal">添加</button>
                <button id="delBorrow" type="button" class="layui-btn layui-btn-danger">删除</button>
            </div>
        </div>
        <div class="addInfo03" id="sctp3">
            <h3>担保</h3>
            <div style="float: right;margin-bottom: 15px;margin-right: 0px;">
                <button id="addAssure" type="button" class="layui-btn layui-btn-normal">添加</button>
                <button id="delAssure" type="button" class="layui-btn layui-btn-danger">删除</button>
            </div>
        </div>
        <div class="addInfo03" id="sctp4">
            <h3>经营活动</h3>
            <div style="float: right;margin-bottom: 15px;margin-right: 0px;">
                <button id="addActivity" type="button" class="layui-btn layui-btn-normal">添加</button>
                <button id="delActivity" type="button" class="layui-btn layui-btn-danger">删除</button>
            </div>
        </div>

        <%-- 审核人选择 --%>
        <%@ include file="../approve/approver_select.jsp" %>

        <%-- 提交 --%>
        <%@ include file="./common/archive_submit.jsp" %>
    </form>
</div>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;

        form.render();

        //借出添加
        var loanIndex = 0;
        $("#addLoan").click(function () {
            var tempStr = "";
            tempStr += "<div style='display:block;' class='guanxi' id='loan" + loanIndex + "'>";

            //隐藏表单，借贷类型
            tempStr += "<input type='hidden' name='loans[" + loanIndex + "].type' value='1' autocomplete='off' class='layui-input'>"
            tempStr += "<div class='layui-form-item'>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>债务人</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='loans[" + loanIndex + "].cbligor' lay-verify='required' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>金额</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='loans[" + loanIndex + "].amount' lay-verify='required|number' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>约定期限</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' id='loanTimeLimit" + loanIndex + "' name='loans[" + loanIndex + "].timeLimit' lay-verify='required|date' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-form-item'>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>约定年利率(%)</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='loans[" + loanIndex + "].interest' lay-verify='required|number' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>资金来源</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='loans[" + loanIndex + "].fundSource' lay-verify='required' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-form-item layui-form-text'>"
            tempStr += "	<label class='layui-form-label'>整改纠正情况</label>"
            tempStr += "	<div class='layui-input-inline'>"
            tempStr += "<textarea placeholder='请输入内容' name='loans[" + loanIndex + "].rectifyInfo' class='layui-textarea txtArea'></textarea>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "</div>"
            $("#sctp1").append(tempStr);

            //渲染约定期限日期表单
            laydate.render({
                elem: '#loanTimeLimit' + loanIndex,
                trigger: 'click'
            });

            loanIndex++;

        })

        $("#delLoan").click(function () {
            debugger;
            if (loanIndex > 0) {
                loanIndex--;
                $("#loan" + loanIndex).remove();
            }
        });

        //借入
        var borrowIndex = 0;
        $("#addBorrow").click(function () {
            var tempStr = "";
            tempStr += "<div style='display:block;' class='guanxi' id='borrow" + borrowIndex + "'>";
            //隐藏表单，借贷类型
            tempStr += "<input type='hidden' name='borrows[" + borrowIndex + "].type' value='2' autocomplete='off' class='layui-input'>"
            tempStr += "<div class='layui-form-item'>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>债权人</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='borrows[" + borrowIndex + "].creditor' lay-verify='required' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>金额</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='borrows[" + borrowIndex + "].amount' lay-verify='required|number' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>约定期限</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text'  id='borrowTimeLimit" + borrowIndex + "' name='borrows[" + borrowIndex + "].timeLimit' lay-verify='required|date' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-form-item'>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>约定年利率(%)</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='borrows[" + borrowIndex + "].interest' autocomplete='off' lay-verify='required|number' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-form-item layui-form-text'>"
            tempStr += "	<label class='layui-form-label'>整改纠正情况</label>"
            tempStr += "	<div class='layui-input-inline'>"
            tempStr += "<textarea placeholder='请输入内容' name='borrows[" + borrowIndex + "].rectifyInfo' class='layui-textarea txtArea'></textarea>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "</div>"

            $("#sctp2").append(tempStr);

            //渲染约定期限日期表单
            laydate.render({
                elem: '#borrowTimeLimit' + borrowIndex,
                trigger: 'click'
            });

            borrowIndex++;
        })
        $("#delBorrow").click(function () {
            debugger;
            if (borrowIndex > 0) {
                borrowIndex--;
                $("#borrow" + borrowIndex).remove();
            }
        });

        //  担保
        var assureIndex = 0;
        $("#addAssure").click(function () {
            var tempStr = "";
            tempStr += "<div style='display:block;' class='guanxi' id='assure" + assureIndex + "'>";
            //隐藏表单，借贷类型
            tempStr += "<input type='hidden' name='assures[" + assureIndex + "].type' value='3' autocomplete='off' class='layui-input'>"
            tempStr += "<div class='layui-form-item'>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>债权人</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='assures[" + assureIndex + "].creditor' lay-verify='required' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>债务人</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='assures[" + assureIndex + "].cbligor' lay-verify='required' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>金额</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='assures[" + assureIndex + "].amount' lay-verify='required|number' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-form-item'>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>约定期限</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text'  id='assureTimeLimit" + assureIndex + "' name='assures[" + assureIndex + "].timeLimit' lay-verify='required|date' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>约定年利率(%)</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='assures[" + assureIndex + "].interest' lay-verify='required|number' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-form-item layui-form-text'>"
            tempStr += "	<label class='layui-form-label'>整改纠正情况</label>"
            tempStr += "	<div class='layui-input-inline'>"
            tempStr += "<textarea placeholder='请输入内容' name='assures[" + assureIndex + "].rectifyInfo' class='layui-textarea txtArea'></textarea>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "</div>"

            $("#sctp3").append(tempStr);

            //渲染约定期限日期表单
            laydate.render({
                elem: '#assureTimeLimit' + assureIndex,
                trigger: 'click'
            });

            assureIndex++;

        })
        $("#delAssure").click(function () {
            debugger;
            if (assureIndex > 0) {
                assureIndex--;
                $("#assure" + assureIndex).remove();
            }
        });

        //经营活动
        var activityIndex = 0;
        $("#addActivity").click(function () {
            var tempStr = "";
            tempStr += "<div style='display:block;' class='guanxi' id='activity" + activityIndex + "'>";
            //隐藏表单，借贷类型
            tempStr += "<input type='hidden' name='activitys[" + activityIndex + "].type' value='4' autocomplete='off' class='layui-input'>"
            tempStr += "<div class='layui-form-item'>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>企业名称</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='activitys[" + activityIndex + "].enterpriseName' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"

            tempStr +="<div class='layui-inline'>"
            tempStr +="<label class='layui-form-label'>企业类型</label>"
            tempStr +="<div class='layui-input-inline'>"
            tempStr += "<select name='activitys[" + activityIndex + "].enterpriseType' lay-verify='required'>"
            tempStr +="<option value=''>请选择</option>"
            tempStr +="<option value='独资'>独资</option>"
            tempStr +="<option value='合伙'>合伙</option>"
            tempStr +="</select>"
            tempStr +="</div>"
            tempStr +="</div>"


            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>投入金额</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='activitys[" + activityIndex + "].amount' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "<div class='layui-form-item'>"
            tempStr += "<div class='layui-inline'>"
            tempStr += "<label class='layui-form-label'>资金来源</label>"
            tempStr += "<div class='layui-input-inline'>"
            tempStr += "<input type='text' name='activitys[" + activityIndex + "].fundSource' autocomplete='off' class='layui-input'>"
            tempStr += "</div>"
            tempStr += "</div>"

            tempStr +="<div class='layui-form-item layui-form-text'>"
            tempStr +="  <label class='layui-form-label'>营利情况</label>"
            tempStr +="  <div class='layui-input-inline'>"
            tempStr +="<textarea placeholder='请输入内容' class='layui-textarea txtArea'  name='activitys[" + activityIndex + "].profit'></textarea>"
            tempStr +="</div>"
            tempStr +="</div>"

            tempStr += "<div class='layui-form-item layui-form-text'>"
            tempStr += "	<label class='layui-form-label'>整改纠正情况</label>"
            tempStr += "	<div class='layui-input-inline'>"
            tempStr += "<textarea placeholder='请输入内容' name='activitys[" + activityIndex + "].rectifyInfo' class='layui-textarea txtArea'></textarea>"
            tempStr += "</div>"
            tempStr += "</div>"
            tempStr += "</div>"
            $("#sctp4").append(tempStr);
            activityIndex++;
            form.render();
        })

        $("#delActivity").click(function () {
            debugger;
            if (activityIndex > 0) {
                activityIndex--;
                $("#activity" + activityIndex).remove();
            }
        });

    });
</script>

