<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<div class="imgBox">
    <p>照片</p>
    <div class="article">
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