package com.mwkj.lzda.dao;

import com.mwkj.lzda.core.Mapper;
import com.mwkj.lzda.model.Reward;

import java.util.List;

public interface RewardMapper extends Mapper<Reward> {
    List<Reward> findRewardsByCondition(Reward reward);
}