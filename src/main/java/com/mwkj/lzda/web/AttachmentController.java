package com.mwkj.lzda.web;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.model.Attachment;
import com.mwkj.lzda.service.AttachmentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.List;

/**
* Created by CodeGenerator on 2019-07-17 11:13.
*/
@Controller
@RequestMapping("/attachment")
public class AttachmentController {
    @Resource
    private AttachmentService attachmentService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(Attachment attachment) {
        attachmentService.save(attachment);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        attachmentService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(Attachment attachment) {
        attachmentService.update(attachment);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        Attachment attachment = attachmentService.findById(id);
        return ResultUtil.success(attachment);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer size) {
        PageHelper.startPage(page, size);
        List<Attachment> list = attachmentService.findAll();
        PageInfo<Attachment> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
