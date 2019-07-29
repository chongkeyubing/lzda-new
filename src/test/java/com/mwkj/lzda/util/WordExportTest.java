package com.mwkj.lzda.util;

import cn.afterturn.easypoi.word.WordExportUtil;
import com.mwkj.lzda.model.User;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.junit.Test;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: libaogang
 * @Date: 2019-07-28 17:05
 * @Description word导出测试
 */
public class WordExportTest {
    @Test
    public void SimpleWordExport() {
        Map<String, Object> paramMap = new HashMap<>();

        //基本情况
        User user = new User();
        user.setRealname("李宝刚");
        user.setGender("男");

        paramMap.put("user", user);
        paramMap.put("name", user.getRealname());
        paramMap.put("gender", user.getGender());

        List<User> list = new ArrayList<>();
        user = new User();
        user.setRealname("士大夫");
        user.setGender("sdf");
        list.add(user);

        user = new User();
        user.setRealname("士大夫");
        user.setGender("sdf");
        list.add(user);

        paramMap.put("userList",list);

//        List<Map<String, Object>> mapList = new ArrayList<Map<String, Object>>();
//        for (int i = 0; i < 3; i++) {
//            Map<String, Object> tempMap = new HashMap<String, Object>();
//            tempMap.put("realname", "李宝刚");
//            tempMap.put("gender", "男");
//            mapList.add(tempMap);
//        }
//        paramMap.put("userList", mapList);

        try {
            XWPFDocument doc = WordExportUtil.exportWord07(
                    "templet/廉政报告.docx", paramMap);
            FileOutputStream fos = new FileOutputStream("D:/excel/廉政报告.docx");
            doc.write(fos);
            fos.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}