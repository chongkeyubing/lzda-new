package com.mwkj.lzda.web;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

/**
 * @Author: libaogang
 * @Date: 2019-07-26 15:21
 * @Description 通用控制器
 */
public class CommonController {

   /**
    * @Author libaogang
    * @Date 2019-07-26 15:42
    * @Param [request]
    * @return org.springframework.http.ResponseEntity<byte[]>
    * @Description 文件下载
    */
    @RequestMapping("/downloadFile")
    public ResponseEntity<byte[]> downloadFile(HttpServletRequest request) throws Exception {
        String source = "D:\\";
        String path = request.getParameter("path");
        String id = request.getParameter("id");

        String diskFile = source + path + id;

        File file = new File(diskFile);
        System.out.println(file.getAbsolutePath());
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment;filename=", URLEncoder.encode(file.getName(), "utf-8"));
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        ResponseEntity resp = new ResponseEntity<>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
        return resp;
    }
}