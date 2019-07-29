package com.mwkj.lzda.web.archive;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.ResultUtil;
import com.mwkj.lzda.dto.ArcLoanDTO;
import com.mwkj.lzda.model.Approve;
import com.mwkj.lzda.model.ArcLoan;
import com.mwkj.lzda.service.ArcLoanService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
* @Author: libaogang
* @Date: 2019-07-24 09:53
* @Description 借贷（担保）登记控制器
*/
@Controller
@RequestMapping("/arcloan")
public class ArcLoanController {
    @Resource
    private ArcLoanService arcLoanService;

    @RequestMapping("/add")
    @ResponseBody
    public Result add(ArcLoanDTO arcLoanDTO, Approve approve, HttpServletRequest request) {
        arcLoanService.add(arcLoanDTO,approve,request);
        return ResultUtil.success();
    }

    @RequestMapping("/delete")
    @ResponseBody
    public Result delete(@RequestParam Integer id) {
        arcLoanService.deleteById(id);
        return ResultUtil.success();
    }

    @RequestMapping("/update")
    @ResponseBody
    public Result update(ArcLoan arcLoan) {
        arcLoanService.update(arcLoan);
        return ResultUtil.success();
    }

    @RequestMapping("/detail")
    @ResponseBody
    public Result detail(@RequestParam Integer id) {
        ArcLoan arcLoan = arcLoanService.findById(id);
        return ResultUtil.success(arcLoan);
    }

    @RequestMapping("/list")
    @ResponseBody
    public Result list(@RequestParam(defaultValue = "0") Integer page,
                       @RequestParam(defaultValue = "0") Integer limit) {
        PageHelper.startPage(page, limit);
        List<ArcLoan> list = arcLoanService.findAll();
        PageInfo<ArcLoan> pageInfo = new PageInfo<>(list);
        return ResultUtil.success(pageInfo);
    }
}
