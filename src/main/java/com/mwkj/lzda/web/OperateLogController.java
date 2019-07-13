package com.mwkj.lzda.web;

import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.OperateLogDTO;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.OperateLog;
import com.mwkj.lzda.service.OperateLogService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.SecurityUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;
import tk.mybatis.mapper.entity.Condition;
import tk.mybatis.mapper.entity.Example;

import javax.annotation.Resource;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-10 17:14
 * @Description 日志管理
 */
@Controller
@RequestMapping("/operatelog")
public class OperateLogController {
    @Resource
    private OperateLogService operateLogService;

    @RequestMapping("/list")
    @ResponseBody
    public Result list(OperateLogDTO operateLogDTO,
                       @RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {

        PageHelper.startPage(page, limit);

        List<OperateLogDTO> list = operateLogService.findAllLogsByConditions(operateLogDTO);

        long count = operateLogService.findAllLogsCountByConditions(operateLogDTO);

        return LayuiTableResultUtil.success(list, count);
    }
}
