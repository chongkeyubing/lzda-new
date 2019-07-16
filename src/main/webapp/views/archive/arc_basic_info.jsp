<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>

<style type="text/css">
    .layui-textarea.txtArea {
        width: 818px;
        height: 120px;
    }

    .layui-input-block.reset {
        margin-left: 0;
        text-align: center;
    }

    .layui-input-block.inputBox {
        margin-left: 130px;
        width: 45%;
    }

    form.form1 {
        margin-top: 15px;
        position: relative;
    }

    .infoImg {
        position: absolute;
        top: 0;
        right: 129px;
    }

    .item {
        width: 150px;
        height: 150px;
    }

    .addInfo03 {
        width: 1008px;
        margin-top: 15px;
        margin-bottom: 20px;
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

    .addInfo03 .rela {
        width: 95%;
        border: 1px solid #dcdcdc;
        padding-top: 20px;
        box-sizing: border-box;
        margin-bottom: 15px;
    }


</style>


<div style="display: flex; justify-content: center;">
    <form class="layui-form form1" method="post" action="arcbasicinfo/add" enctype="multipart/form-data"
          id="archiveForm">
        <!-- 隐藏表单 -->
        <input type="hidden" name="arcBasicInfo.userId" value="${currentUser.id}">
        <input type="hidden" name="arcBasicInfo.archiveType" value="${archiveType}">
        <input type="hidden" name="arcBasicInfo.organizationId" value="${currentUser.organizationId}">

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.userName" readonly autocomplete="off" class="layui-input"
                           value="${currentUser.realname}">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">性别</label>
                <div class="layui-input-inline">
                    <select name="arcBasicInfo.gender">
                        <option
                                <c:if test="${currentUser.gender == '男'}">selected</c:if> value="女">男
                        </option>
                        <option
                                <c:if test="${currentUser.gender == '女'}">selected</c:if> value="女">女
                        </option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">民族</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.nation" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">婚姻状态</label>
                <div class="layui-input-inline">
                    <select name="arcBasicInfo.maritalStatus" lay-verify="required">
                        <option value="">请选择婚姻状态</option>
                        <option value="未婚">未婚</option>
                        <option value="已婚">已婚</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">出生日期</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.birthday" readonly autocomplete="off" class="layui-input"
                           value='<fmt:formatDate value="${currentUser.birthday}"  pattern="yyyy-MM-dd"/>'
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">政治面貌</label>
                <div class="layui-input-inline">
                    <select name="arcBasicInfo.politicFace" lay-verify="required">
                        <option value="">请选政治面貌</option>
                        <option value="党员">党员</option>
                        <option value="群众">群众</option>
                    </select>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">学历</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.education" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">手机号码</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.phone" autocomplete="off" class="layui-input"
                           lay-verify="required|phone">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">办公电话</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.officePhone" lay-verify="number" autocomplete="off"
                           class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">现任职务</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.jobPosition" autocomplete="off" class="layui-input" readonly
                           value="${currentUser.jobPosition}" lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">职级</label>
                <div class="layui-input-inline">
                    <select name="arcBasicInfo.jobPositionLevel" lay-verify="required">
                        <option value="">请选职级</option>
                        <option value="办事员">办事员</option>
                        <option value="科员">科员</option>
                        <option value="副科级">副科级</option>
                        <option value="副科职">副科职</option>
                        <option value="正科级">正科级</option>
                        <option value="正科职务">正科职务</option>
                        <option value="副处职">副处职</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">现任职务时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.jobPositionTime" id="joboPsitionTime" lay-verify="date"
                           placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input" lay-verify="required">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">籍贯</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.nativePlace" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">身份证号码</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.identityNumber" readonly autocomplete="off"
                           class="layui-input"
                           value="${currentUser.identityNumber}" lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">入党时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.partyJoinTime" id="partyJoinTime" lay-verify="date"
                           placeholder="yyyy-MM-dd" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">家庭地址</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.homeAddress" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">分管工作</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.responsibility" autocomplete="off" class="layui-input"
                           lay-verify="required">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">工作单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="arcBasicInfo.organization" class="layui-input" lay-verify="required"
                           readonly
                           value='${currentUser.organizationName}'>
                </div>
            </div>
        </div>

        <!--上传照片-->
        <div class="infoImg">
            <div class="item">
                <img class="addImg" onclick="clickImg(this);" src="static/images/addImg.png"/>
                <input type="file" name="file" class="upload_input" onchange="change(this)" accept="image/*"/>
                <div class="preBlock">
                    <img class="preview" id="preview" alt="" name="pic"/>
                </div>
                <img class="delete" onclick="deleteImg(this)" src="static/images/delete.png"/>
            </div>

        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">个人工作简历</label>
            <div class="layui-input-block" style="margin-left: 100px;">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="arcBasicInfo.workExperience"
                          lay-verify="required"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">其他需要说明的情况</label>
            <div class="layui-input-block" style="margin-left: 100px;">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="arcBasicInfo.otherInfo"></textarea>
            </div>
        </div>
        <div class="addInfo03" id="sctp">
            <div style="height: 50px">
                <p>家庭主要成员及重要社会关系：</p>
                <%--<label class="layui-form-label">家庭主要成员及重要社会关系</label>--%>
                <div style="float: right;margin-bottom: 15px;    margin-right: 96px;">
                    <button id="addRela" type="button" class="layui-btn layui-btn-normal">添加</button>
                    <button id="delRela" type="button" class="layui-btn layui-btn-normal">删除</button>
                </div>
            </div>

        </div>

        <%-- 审核人选择 --%>
        <%@ include file="../approve/approver_select.jsp" %>

        <%-- 隐藏表单 --%>
        <%@ include file="./common/hidden_form.jsp" %>

        <%-- 提交 --%>
        <%@ include file="./common/archive_submit.jsp" %>
    </form>
</div>

<script src="static/js/imgUp.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate', 'table'], function () {
        var form = layui.form,
            layer = layui.layer,
            laydate = layui.laydate;
        table = layui.table;

        //渲染日期表单
        laydate.render({
            elem: '#joboPsitionTime'
        });
        laydate.render({
            elem: '#partyJoinTime'
        });
        form.render();


        //动态新增删除家庭和社会重要关系
        var index = 0;
        $("#addRela").click(function () {
            var tempStr = "";
            tempStr += "<div style='display:block;' class='rela' id='rela" + index + "'>";

            tempStr += "<div class='layui-form-item'>";

            tempStr += "<div class='layui-inline'>";
            tempStr += "<label class='layui-form-label'>姓名</label>";
            tempStr += "<div class='layui-input-inline'>";
            tempStr += "<input type='text' name='arcs[" + index + "].name' lay-verify='required' autocomplete='off' class='layui-input'>";
            tempStr += "</div>";
            tempStr += "</div>";

            tempStr += "<div class='layui-inline'>";
            tempStr += "<label class='layui-form-label'>称谓</label>";
            tempStr += "<div class='layui-input-inline'>";
            tempStr += "<input type='text' name='arcs[" + index + "].appellation' lay-verify='required' autocomplete='off' class='layui-input'>";
            tempStr += "</div>";
            tempStr += "</div>";

            tempStr += "<div class='layui-inline'>";
            tempStr += "<label class='layui-form-label'>政治面貌</label>";
            tempStr += "<div class='layui-input-inline'>";
            // tempStr += "<input type='text' name='' autocomplete='off' class='layui-input'>";

            tempStr += "<select name='arcs[" + index + "].politicFace'>";
            tempStr += "<option value=''>请选政治面貌</option>";
            tempStr += "<option value='群众'>群众</option>";
            tempStr += "<option value='党员'>党员</option>";
            tempStr += "</select>";
            tempStr += "</div>";
            tempStr += "</div>";

            tempStr += "</div>";

            tempStr += "<div class='layui-form-item'>";

            tempStr += "<div class='layui-inline'>";
            tempStr += "<label class='layui-form-label'>出生年月</label>";
            tempStr += "<div class='layui-input-inline'>";
            tempStr += "<input type='text' name='arcs[" + index + "].birthday' autocomplete='off' class='layui-input' lay-verify='date'  id='relaBirthday" + index + "'>";
            tempStr += "</div>";
            tempStr += "</div>";

            tempStr += "<div class='layui-inline'>";
            tempStr += "<label class='layui-form-label'>工作单位</label>";
            tempStr += "<div class='layui-input-inline'>";
            tempStr += "<input type='text' name='arcs[" + index + "].organization' autocomplete='off' class='layui-input'>";
            tempStr += "</div>";
            tempStr += "</div>";

            tempStr += "<div class='layui-inline'>";
            tempStr += "<label class='layui-form-label'>职务</label>";
            tempStr += "<div class='layui-input-inline'>";
            tempStr += "<input type='text' name='arcs[" + index + "].jobPosition' autocomplete='off' class='layui-input'>";
            tempStr += "</div>";

            tempStr += "</div>";

            tempStr += "</div>";

            $("#sctp").append(tempStr);

            //渲染关系日期表单
            laydate.render({
                elem: '#relaBirthday' + index,
                trigger: 'click'
            });
            form.render();

            //滚动到最底部
            $(".layui-layer-content").scrollTop($(".layui-layer-content").height());

            index++;
        });

        $("#delRela").click(function () {
            debugger;
            if (index > 0) {
                index--;
                $("#rela" + index).remove();
            }
        });

    });
</script>
