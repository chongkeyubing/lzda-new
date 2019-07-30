package com.mwkj.lzda.util;

import cn.afterturn.easypoi.word.WordExportUtil;
import com.mwkj.lzda.model.Reward;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.UserService;
import freemarker.template.Configuration;
import freemarker.template.Template;
import freemarker.template.TemplateExceptionHandler;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.junit.Test;

import javax.annotation.Resource;
import java.io.*;
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

        List<Reward> rewardList = new ArrayList<>();
        Reward reward = new Reward();
        reward.setRewardType("一等功");
        reward.setOrganization("淮安分局");
        reward.setRewardTime("2019-7-29");
        reward.setContent("士大夫时代发生的士大夫时代发生的发售股份返回发豆腐干地方豆腐干地方鬼地方鬼地方地方");
        rewardList.add(reward);

        reward = new Reward();
        reward.setRewardType("二等功");
        reward.setOrganization("淮安分局");
        reward.setRewardTime("2019-7-28");
        reward.setContent("测试测试发生的发售股份返回发豆腐干地方豆腐干地方鬼地方鬼地方地");
        rewardList.add(reward);

        paramMap.put("rewardList", rewardList);
        paramMap.put("rewardListLength", rewardList.size());
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

    @Test
    public void freemarkExport() throws Exception {
        Map<String, Object> paramMap = new HashMap<>();

        //基本情况
        User user = new User();
        user.setRealname("李宝刚");
        user.setGender("男");

        paramMap.put("user", user);

        Configuration cfg = null;

        String templetFolder = "templet";
        File file = new File("/templet");
        String s = file.getAbsolutePath();
        cfg = new Configuration(Configuration.VERSION_2_3_23);
        cfg.setDirectoryForTemplateLoading(new File(templetFolder));
        cfg.setDefaultEncoding("UTF-8");
        cfg.setTemplateExceptionHandler(TemplateExceptionHandler.IGNORE_HANDLER);

        Template template = cfg.getTemplate("廉政报告模板.ftl");
        Writer writer = new OutputStreamWriter(new FileOutputStream("temp/temp.doc"), "utf-8");
        template.process(paramMap, writer);
        writer.close();




    }
}