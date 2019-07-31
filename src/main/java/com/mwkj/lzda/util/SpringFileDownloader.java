package com.mwkj.lzda.util;

import org.apache.commons.io.FileUtils;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;

import java.io.File;
import java.net.URLEncoder;

/**
 * @Author: libaogang
 * @Date: 2019-07-30 18:13
 * @Description spring文件下载
 */
public class SpringFileDownloader {
    public static ResponseEntity<byte[]> download(File file) throws Exception{
        HttpHeaders headers = new HttpHeaders();
        headers.setContentDispositionFormData("attachment;filename=", URLEncoder.encode(file.getName(), "utf-8"));
        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
        return new ResponseEntity<>(FileUtils.readFileToByteArray(file), headers, HttpStatus.CREATED);
    }
}