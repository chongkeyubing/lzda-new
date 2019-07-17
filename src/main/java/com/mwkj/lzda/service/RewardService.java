package com.mwkj.lzda.service;
import com.mwkj.lzda.model.Reward;
import com.mwkj.lzda.core.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.List;


/**
 * Created by CodeGenerator on 2019-07-15 13:57.
 */
public interface RewardService extends Service<Reward> {
    List<Reward> findRewardsByCondition(Reward reward);
    void add(Reward reward, HttpServletRequest request);
    void update(Reward reward,HttpServletRequest request);
}
