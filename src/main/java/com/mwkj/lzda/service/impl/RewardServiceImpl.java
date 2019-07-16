package com.mwkj.lzda.service.impl;

import com.mwkj.lzda.dao.RewardMapper;
import com.mwkj.lzda.model.Reward;
import com.mwkj.lzda.service.RewardService;
import com.mwkj.lzda.core.AbstractService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;


/**
 * Created by CodeGenerator on 2019-07-15 13:57.
 */
@Service
@Transactional
public class RewardServiceImpl extends AbstractService<Reward> implements RewardService {
    @Resource
    private RewardMapper rewardMapper;

}
