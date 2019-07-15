<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div style="display: flex;justify-content: center;">
    <form class="layui-form form1" action="reward/add" method="post" id="rewardForm">
        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">被表彰人姓名</label>
                <div class="layui-input-inline">
                    <input type="text" name="userName" readonly autocomplete="off" class="layui-input" placeholder="点击选择被表彰人">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">单位</label>
                <div class="layui-input-inline">
                    <input type="text" name="organization" readonly autocomplete="off" class="layui-input">
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">职 务</label>
                <div class="layui-input-inline">
                    <input type="text" name="jobPosition" readonly autocomplete="off" class="layui-input">
                </div>
            </div>

        </div>

        <div class="layui-form-item">
            <div class="layui-inline">
                <label class="layui-form-label">表彰类型</label>
                <div class="layui-input-inline">
                    <select name="rewardType">
                        <option value="">请选择</option>
                        <option value="通报表扬">通报表扬</option>
                        <option value="嘉奖">嘉奖</option>
                        <option value="三等功">三等功</option>
                        <option value="二等功">二等功</option>
                        <option value="一等功">一等功</option>
                        <option value="其他">其他</option>
                    </select>
                </div>
            </div>
            <div class="layui-inline">
                <label class="layui-form-label">表彰时间</label>
                <div class="layui-input-inline">
                    <input type="text" name="rewardTime" id="rewardTime" autocomplete="off" class="layui-input">
                </div>
            </div>
        </div>
        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">表彰单位</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" name="rewardOrganization" class="layui-textarea txtArea"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">表彰内容</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" class="layui-textarea txtArea" name="content"></textarea>
            </div>
        </div>

        <div class="layui-form-item layui-form-text">
            <label class="layui-form-label">备 注</label>
            <div class="layui-input-inline">
                <textarea placeholder="请输入内容" name="remark" class="layui-textarea txtArea"></textarea>
            </div>
        </div>

        <div class="imgBox">
            <p>照片</p>
            <div class="article">
                <div class="items">
                    <img class="addImg" onclick="clickImg(this);" src="static/images/addImg.png"/>
                    <input name="url" type="file" class="upload_input" onchange="change(this)" accept="image/*"
                           capture="camera"/>
                    <div class="preBlock">
                        <img class="preview" id="preview" alt="" name="pic"/>
                    </div>
                    <img class="delete" onclick="deleteImg(this)" src="static/images/delete.png"/>
                </div>
            </div>
        </div>
        <div class="layui-form-item">
            <div class="layui-input-block reset">
                <button class="layui-btn layui-btn-normal layui-btn-lg" lay-submit lay-filter="submitReward">
                    提交
                </button>
                <button class="layui-btn layui-btn-danger layui-btn-lg" type="button" id="closeAdd">
                    返回
                </button>
            </div>
        </div>
    </form>
    <div id="template" style="display: none;">

        <div class="items">

            <img class="addImg" onclick="clickImg(this);" src="static/images/addImg.png"/>

            <input name="url{ID}" type="file" class="upload_input" onchange="change(this)" accept="image/*"
                   capture="camera"/>

            <div class="preBlock">
                <img class="preview" id="preview" alt="" name="pic"/>
            </div>

            <img class="delete" onclick="deleteImg(this)" src="static/images/delete.png"/>

        </div>

    </div>
</div>
<script src="static/js/imgUp.js"></script>
<script>
    layui.use(['form', 'layedit', 'laydate'], function () {
        var form = layui.form,
            layer = layui.layer,
            layedit = layui.layedit,
            laydate = layui.laydate;
        form.render();

        //日期
        laydate.render({
            elem: '#rewardTime'
        });

        //点击提交
        form.on('submit(submitReward)', function () {
            debugger;
            $("#rewardForm").ajaxSubmit({
                success: function (data) {
                    if (data.success) {
                        //关闭当前弹窗
                        layer.closeAll();
                        layer.msg("提交成功");

                        //重载查询页面表格
                        $("#resetQueryReward").click();
                        $("#queryReward").click();
                    } else {
                        layer.msg("提交失败，请重新尝试或联系管理员");
                    }
                }
            });
            return false;//阻止表单跳转
        });

        $("#closeAdd").click(function () {
            layer.closeAll();
        });
    });


</script>
