package com.mwkj.lzda.util;

import com.mwkj.lzda.constant.FileUploadPath;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-04 17:58
 * @Description spring提供的文件上传
 */
public class SpringFileUploader {

    //允许上传的文件类型
    private static String[] typeArr = {".jpg", ".jpeg", ".png", ".gif", ".bmp"};

    public static List<String> uploadImgs(HttpServletRequest request) throws IOException {
        //将当前上下文初始化为  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());

        List<String> fileUrls = new ArrayList<>();

        //检查form中是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;

            //获取multiRequest 中所有的文件名
            Iterator iter = multiRequest.getFileNames();

            while (iter.hasNext()) {
                //一次遍历所有文件
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    //获取文件类型
                    String fileType = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

                    //过滤非法文件类型
                    for (int i = 0; i < typeArr.length; i++) {
                        if (fileType.equalsIgnoreCase(typeArr[i])) {
                            String uuid = IDGenerator.getUUID();
                            String rootRealPath = request.getSession().getServletContext().getRealPath(FileUploadPath.IMG_UPLOAD_ROOT_PATH);
                            String fileName = uuid + fileType;
                            String savePath = FileUploadPath.IMG_UPLOAD_ROOT_PATH + "/" + fileName;
                            String realSavePath = rootRealPath + "/" + fileName;
                            file.transferTo(new File(realSavePath));

                            //返回上传图片的访问路径
                            fileUrls.add(savePath);
                            break;
                        }
                    }
                }

            }
        }
        return fileUrls;
    }

    public static String uploadImg(HttpServletRequest request) throws IOException {
        //将当前上下文初始化为  CommonsMutipartResolver （多部分解析器）
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());

        String savePath = null;

        //检查form中是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            //将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;

            //获取multiRequest 中所有的文件名
            Iterator iter = multiRequest.getFileNames();

            while (iter.hasNext()) {
                //一次遍历所有文件
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    //获取文件类型
                    String fileType = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

                    //过滤非法文件类型
                    for (int i = 0; i < typeArr.length; i++) {
                        if (fileType.equalsIgnoreCase(typeArr[i])) {
                            String uuid = IDGenerator.getUUID();
                            String rootRealPath = request.getSession().getServletContext().getRealPath(FileUploadPath.IMG_UPLOAD_ROOT_PATH);
                            String fileName = uuid + fileType;
                            savePath = FileUploadPath.IMG_UPLOAD_ROOT_PATH + "/" + fileName;
                            String realSavePath = rootRealPath + "/" + fileName;
                            file.transferTo(new File(realSavePath));
                            break;
                        }
                    }
                }

            }
        }
        return savePath;
    }
}