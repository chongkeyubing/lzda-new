<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="imgBox">
    <p>照片</p>
    <div class="article">
        <c:forEach items="${attachments}" var="attachment">
            <div class="items">
                <img class="addImg" onclick="clickImg(this);" src="static/images/addImg.png"
                     style="display: none;"/>
                <input name="url" type="file" class="upload_input" onchange="change(this)" accept="image/*"
                       capture="camera"/>
                <div class="preBlock">
                    <img class="preview" alt="" name="pic" src="${attachment.url}"/>
                </div>
                <img class="delete deleteImg" src="static/images/delete.png"
                     style="display: block;" data-id="${attachment.id}"/>
            </div>
        </c:forEach>

        <div class="items">
            <img class="addImg" onclick="clickImg(this);" src="static/images/addImg.png"/>
            <input name="url" type="file" class="upload_input" onchange="change(this)" accept="image/*"
                   capture="camera"/>
            <div class="preBlock">
                <img class="preview" alt="" name="pic"/>
            </div>
            <img class="delete" onclick="deleteImg(this)" src="static/images/delete.png"/>
        </div>
    </div>
</div>

<div id="template" style="display: none;">
    <div class="items">
        <img class="addImg" onclick="clickImg(this);" src="static/images/addImg.png"/>
        <input name="url{ID}" type="file" class="upload_input" onchange="change(this)" accept="image/*"
               capture="camera"/>
        <div class="preBlock">
            <img class="preview" alt="" name="pic"/>
        </div>
        <img class="delete" onclick="deleteImg(this)" src="static/images/delete.png"/>
    </div>
</div>

<script src="static/js/initDom.js"></script>
<script src="static/js/imgUp1.js"></script>

<script>
    layui.use(['form', 'laydate'], function () {
        var layer = layui.layer;

        //图片删除
        $(".deleteImg").click(function () {
            debugger;
            var _this = this;
            layer.confirm('确定删除原图片？', function (index) {
                $.get("attachment/delete?id= " + $(_this).data("id"), function (data) {
                    layer.close(index); //关闭确定删除弹窗
                    if (data.success) {
                        layer.msg("删除成功");
                        deleteImg(_this);
                    } else {
                        layer.msg("删除失败");
                    }
                });
            });
        });

    });
</script>