package com.mwkj.lzda.model;

import java.util.Date;
import javax.persistence.*;

public class Approve {
    /**
     * 主键
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    /**
     * 审核人id，关联user表id
     */
    @Column(name = "approver_id")
    private Integer approverId;

    /**
     * 审核人姓名
     */
    @Column(name = "approver_name")
    private String approverName;

    /**
     * 申请提交人id，关联user表id
     */
    @Column(name = "committer_id")
    private Integer committerId;

    /**
     * 申请人姓名
     */
    @Column(name = "committer_name")
    private String committerName;

    /**
     * 填表人id，关联user表id
     */
    @Column(name = "applicant_id")
    private Integer applicantId;

    /**
     * 填表人姓名
     */
    @Column(name = "applicant_name")
    private String applicantName;

    /**
     * 档案审核状态:
1待单位负责人审核
2单位负责人审核通过
3单位负责人驳回
4待纪委审核
5纪委审核通过
6纪委审核驳回
     */
    private Integer status;

    /**
     * 档案类型：
1个人基本情况报备
2本人持有港澳通行证情况登记表
3本人持有护照情况登记表
4本人婚姻情况
5参加单位组织生活会情况登记表
6操办宴席申请表
7出国（境）情况登记表
8可能影响公正执行职务报备表
9离职交接情况登记表
10配偶、子女及其配偶从业情况登记表
11家人移居国（境）外的情况
12家人连续在国（境）外工作、生活一年以上的情况
13家人被司法机关追究刑事责任的情况
14持有股票的情况
15持有基金的情况
16持有投资型保险的情况
17在国（境）外的存款情况
18在国（境）外的投资情况
19个人认为需要报告的其他事项
20子女与港澳以及台湾居民通婚的情况
21涉警报备表
22收入情况登记表
23收受礼品登记表
24在企业、中介组织和社会团体兼职
25住房情况登记表
26子女与外国人、无国籍人通婚的情况
     */
    @Column(name = "archive_type")
    private Integer archiveType;

    /**
     * 档案id，关联对应档案表的id
     */
    @Column(name = "archive_id")
    private Integer archiveId;

    /**
     * 创建时间
     */
    @Column(name = "create_time")
    private Date createTime;

    /**
     * 是否审核的最后一步：1是0否
     */
    @Column(name = "last_step")
    private Integer lastStep;

    /**
     * 审核意见
     */
    private String comments;

    /**
     * 获取主键
     *
     * @return id - 主键
     */
    public Integer getId() {
        return id;
    }

    /**
     * 设置主键
     *
     * @param id 主键
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * 获取审核人id，关联user表id
     *
     * @return approver_id - 审核人id，关联user表id
     */
    public Integer getApproverId() {
        return approverId;
    }

    /**
     * 设置审核人id，关联user表id
     *
     * @param approverId 审核人id，关联user表id
     */
    public void setApproverId(Integer approverId) {
        this.approverId = approverId;
    }

    /**
     * 获取审核人姓名
     *
     * @return approver_name - 审核人姓名
     */
    public String getApproverName() {
        return approverName;
    }

    /**
     * 设置审核人姓名
     *
     * @param approverName 审核人姓名
     */
    public void setApproverName(String approverName) {
        this.approverName = approverName;
    }

    /**
     * 获取申请提交人id，关联user表id
     *
     * @return committer_id - 申请提交人id，关联user表id
     */
    public Integer getCommitterId() {
        return committerId;
    }

    /**
     * 设置申请提交人id，关联user表id
     *
     * @param committerId 申请提交人id，关联user表id
     */
    public void setCommitterId(Integer committerId) {
        this.committerId = committerId;
    }

    /**
     * 获取申请人姓名
     *
     * @return committer_name - 申请人姓名
     */
    public String getCommitterName() {
        return committerName;
    }

    /**
     * 设置申请人姓名
     *
     * @param committerName 申请人姓名
     */
    public void setCommitterName(String committerName) {
        this.committerName = committerName;
    }

    /**
     * 获取填表人id，关联user表id
     *
     * @return applicant_id - 填表人id，关联user表id
     */
    public Integer getApplicantId() {
        return applicantId;
    }

    /**
     * 设置填表人id，关联user表id
     *
     * @param applicantId 填表人id，关联user表id
     */
    public void setApplicantId(Integer applicantId) {
        this.applicantId = applicantId;
    }

    /**
     * 获取填表人姓名
     *
     * @return applicant_name - 填表人姓名
     */
    public String getApplicantName() {
        return applicantName;
    }

    /**
     * 设置填表人姓名
     *
     * @param applicantName 填表人姓名
     */
    public void setApplicantName(String applicantName) {
        this.applicantName = applicantName;
    }

    /**
     * 获取档案审核状态:
1待单位负责人审核
2单位负责人审核通过
3单位负责人驳回
4待纪委审核
5纪委审核通过
6纪委审核驳回
     *
     * @return status - 档案审核状态:
1待单位负责人审核
2单位负责人审核通过
3单位负责人驳回
4待纪委审核
5纪委审核通过
6纪委审核驳回
     */
    public Integer getStatus() {
        return status;
    }

    /**
     * 设置档案审核状态:
1待单位负责人审核
2单位负责人审核通过
3单位负责人驳回
4待纪委审核
5纪委审核通过
6纪委审核驳回
     *
     * @param status 档案审核状态:
1待单位负责人审核
2单位负责人审核通过
3单位负责人驳回
4待纪委审核
5纪委审核通过
6纪委审核驳回
     */
    public void setStatus(Integer status) {
        this.status = status;
    }

    /**
     * 获取档案类型：
1个人基本情况报备
2本人持有港澳通行证情况登记表
3本人持有护照情况登记表
4本人婚姻情况
5参加单位组织生活会情况登记表
6操办宴席申请表
7出国（境）情况登记表
8可能影响公正执行职务报备表
9离职交接情况登记表
10配偶、子女及其配偶从业情况登记表
11家人移居国（境）外的情况
12家人连续在国（境）外工作、生活一年以上的情况
13家人被司法机关追究刑事责任的情况
14持有股票的情况
15持有基金的情况
16持有投资型保险的情况
17在国（境）外的存款情况
18在国（境）外的投资情况
19个人认为需要报告的其他事项
20子女与港澳以及台湾居民通婚的情况
21涉警报备表
22收入情况登记表
23收受礼品登记表
24在企业、中介组织和社会团体兼职
25住房情况登记表
26子女与外国人、无国籍人通婚的情况
     *
     * @return archive_type - 档案类型：
1个人基本情况报备
2本人持有港澳通行证情况登记表
3本人持有护照情况登记表
4本人婚姻情况
5参加单位组织生活会情况登记表
6操办宴席申请表
7出国（境）情况登记表
8可能影响公正执行职务报备表
9离职交接情况登记表
10配偶、子女及其配偶从业情况登记表
11家人移居国（境）外的情况
12家人连续在国（境）外工作、生活一年以上的情况
13家人被司法机关追究刑事责任的情况
14持有股票的情况
15持有基金的情况
16持有投资型保险的情况
17在国（境）外的存款情况
18在国（境）外的投资情况
19个人认为需要报告的其他事项
20子女与港澳以及台湾居民通婚的情况
21涉警报备表
22收入情况登记表
23收受礼品登记表
24在企业、中介组织和社会团体兼职
25住房情况登记表
26子女与外国人、无国籍人通婚的情况
     */
    public Integer getArchiveType() {
        return archiveType;
    }

    /**
     * 设置档案类型：
1个人基本情况报备
2本人持有港澳通行证情况登记表
3本人持有护照情况登记表
4本人婚姻情况
5参加单位组织生活会情况登记表
6操办宴席申请表
7出国（境）情况登记表
8可能影响公正执行职务报备表
9离职交接情况登记表
10配偶、子女及其配偶从业情况登记表
11家人移居国（境）外的情况
12家人连续在国（境）外工作、生活一年以上的情况
13家人被司法机关追究刑事责任的情况
14持有股票的情况
15持有基金的情况
16持有投资型保险的情况
17在国（境）外的存款情况
18在国（境）外的投资情况
19个人认为需要报告的其他事项
20子女与港澳以及台湾居民通婚的情况
21涉警报备表
22收入情况登记表
23收受礼品登记表
24在企业、中介组织和社会团体兼职
25住房情况登记表
26子女与外国人、无国籍人通婚的情况
     *
     * @param archiveType 档案类型：
1个人基本情况报备
2本人持有港澳通行证情况登记表
3本人持有护照情况登记表
4本人婚姻情况
5参加单位组织生活会情况登记表
6操办宴席申请表
7出国（境）情况登记表
8可能影响公正执行职务报备表
9离职交接情况登记表
10配偶、子女及其配偶从业情况登记表
11家人移居国（境）外的情况
12家人连续在国（境）外工作、生活一年以上的情况
13家人被司法机关追究刑事责任的情况
14持有股票的情况
15持有基金的情况
16持有投资型保险的情况
17在国（境）外的存款情况
18在国（境）外的投资情况
19个人认为需要报告的其他事项
20子女与港澳以及台湾居民通婚的情况
21涉警报备表
22收入情况登记表
23收受礼品登记表
24在企业、中介组织和社会团体兼职
25住房情况登记表
26子女与外国人、无国籍人通婚的情况
     */
    public void setArchiveType(Integer archiveType) {
        this.archiveType = archiveType;
    }

    /**
     * 获取档案id，关联对应档案表的id
     *
     * @return archive_id - 档案id，关联对应档案表的id
     */
    public Integer getArchiveId() {
        return archiveId;
    }

    /**
     * 设置档案id，关联对应档案表的id
     *
     * @param archiveId 档案id，关联对应档案表的id
     */
    public void setArchiveId(Integer archiveId) {
        this.archiveId = archiveId;
    }

    /**
     * 获取创建时间
     *
     * @return create_time - 创建时间
     */
    public Date getCreateTime() {
        return createTime;
    }

    /**
     * 设置创建时间
     *
     * @param createTime 创建时间
     */
    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    /**
     * 获取是否审核的最后一步：1是0否
     *
     * @return last_step - 是否审核的最后一步：1是0否
     */
    public Integer getLastStep() {
        return lastStep;
    }

    /**
     * 设置是否审核的最后一步：1是0否
     *
     * @param lastStep 是否审核的最后一步：1是0否
     */
    public void setLastStep(Integer lastStep) {
        this.lastStep = lastStep;
    }

    /**
     * 获取审核意见
     *
     * @return comments - 审核意见
     */
    public String getComments() {
        return comments;
    }

    /**
     * 设置审核意见
     *
     * @param comments 审核意见
     */
    public void setComments(String comments) {
        this.comments = comments;
    }
}