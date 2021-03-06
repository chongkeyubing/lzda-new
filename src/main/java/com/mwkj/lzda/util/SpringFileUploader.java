package com.mwkj.lzda.util;

import com.mwkj.lzda.constant.SystemConstant;
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

                    String rootRealPath = request.getSession().getServletContext().getRealPath(SystemConstant.IMG_UPLOAD_ROOT_PATH);
                    File file1 = new File(rootRealPath);
                    if (!file1.exists()) {
                        file1.mkdirs();
                    }

                    //过滤非法文件类型
                    for (int i = 0; i < SystemConstant.ALLOW_IMG_TYPES.length; i++) {
                        if (fileType.equalsIgnoreCase(SystemConstant.ALLOW_IMG_TYPES[i])) {
                            String uuid = IDGenerator.getUUID();
                            String fileName = uuid + fileType;
                            String savePath = SystemConstant.IMG_UPLOAD_ROOT_PATH + "/" + fileName;
                            String realSavePath = rootRealPath + "/" + fileName;

                            //向硬盘写文件
                            file.transferTo(new File(realSavePath));

                            //返回上传的图片文件名
                            fileUrls.add(savePath);
                        }
                    }
                }
            }
        }
        return fileUrls;
    }
}