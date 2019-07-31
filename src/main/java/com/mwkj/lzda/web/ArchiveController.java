package com.mwkj.lzda.web;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mwkj.lzda.core.AppException;
import com.mwkj.lzda.core.Result;
import com.mwkj.lzda.core.layui.LayuiTableResultUtil;
import com.mwkj.lzda.dto.ArchiveDTO;
import com.mwkj.lzda.model.User;
import com.mwkj.lzda.service.ApproveService;
import com.mwkj.lzda.service.ArcBasicInfoService;
import com.mwkj.lzda.service.ArcFamilySocietyRelaService;
import com.mwkj.lzda.service.ArchiveService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * @Author: libaogang
 * @Date: 2019-07-02 11:21
 * @Description 档案管理
 */
@Controller
@RequestMapping("/archive")
public class ArchiveController {
    @Resource
    ArchiveService archiveService;

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-02 13:23
     * @Param []
     * @Description 跳转
     */
    @RequestMapping("/toArchiveList")
    public String toArchiveManage() {
        return "/views/archive/common/archive_list";
    }

    /**
     * @return com.mwkj.lzda.core.Result
     * @Author libaogang
     * @Date 2019-07-02 13:22
     * @Param [archive, page, size]
     * @Description 分页条件查询26种档案
     */
    @RequestMapping("/list")
    @ResponseBody
    public Result findAllArchives(ArchiveDTO archive, HttpSession session,
                                  @RequestParam(defaultValue = "0") int page,
                                  @RequestParam(defaultValue = "0") int limit) {

        User currentuser = (User) session.getAttribute("currentUser");
        Subject subject = SecurityUtils.getSubject();
        if (subject.isPermitted("能查看本单位")) {
            archive.setOrganizationId(currentuser.getOrganizationId());
        } else if (subject.isPermitted("只能查看自己")) {
            archive.setUserId(currentuser.getId());
        }

        //开启分页查询
        PageHelper.startPage(page, limit);

        //默认查询所有人
        List<ArchiveDTO> archives = archiveService.findAllArchivesByConditions(archive);

        //long count = archiveService.findAllArchivesCounts(archive);

        PageInfo<ArchiveDTO> pageInfo = new PageInfo<>(archives);

        return LayuiTableResultUtil.success(archives, pageInfo.getTotal());
    }


    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-02 15:40
     * @Param [archive]
     * @Description 根据档案类型跳转到对应档案新增页面
     */
    @RequestMapping("/toAddArchive")
    public String toAddArchive(ArchiveDTO archive, ModelMap map) {
        map.put("archiveType", archive.getArchiveType());
        String page = archiveService.toAddArchive(archive);
        if (page == null) {
            throw new AppException("档案类型不存在");
        }
        return page;
    }

    /**
     * @return java.lang.String
     * @Author libaogang
     * @Date 2019-07-05 21:37
     * @Param [archive, map]
     * @Description 根据档案类型和档案id查询档案详情
     */
    @RequestMapping("/toArchive")
    public String toArchive(ArchiveDTO archive, ModelMap map, boolean approveRecord, boolean approveOperate) {
        String page = archiveService.toArchiveDetail(archive, map, approveRecord, approveOperate);
        if (page == null) {
            throw new AppException("该档案类型的表格不存在");
        }
        return page;
    }

    /**
     * @Author libaogang
     * @Date 2019-07-25 14:46
     * @Param [archive, session, page, limit]
     * @return com.mwkj.lzda.core.Result
     * @Description 6种预警档案分页条件查询
     */
    @RequestMapping("/warningList")
    @ResponseBody
    public Result findAllWarnings(ArchiveDTO archive, HttpSession session,
                                  @RequestParam(defaultValue = "0") int page,
                                  @RequestParam(defaultValue = "0") int limit) {

        //开启分页查询
        PageHelper.startPage(page, limit);

        //默认查询所有人
        List<ArchiveDTO> archives = archiveService.findAllWarningsByConditions(archive);

        //long count = archiveService.findAllArchivesCounts(archive);

        PageInfo<ArchiveDTO> pageInfo = new PageInfo<>(archives);

        return LayuiTableResultUtil.success(archives, pageInfo.getTotal());
    }


}