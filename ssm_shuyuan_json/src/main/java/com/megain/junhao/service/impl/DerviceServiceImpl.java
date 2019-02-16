package com.megain.junhao.service.impl;

import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.dao.Device_userMapper;
import com.megain.junhao.dao.DeviceMapper;
import com.megain.junhao.pojo.Device_user;
import com.megain.junhao.service.DerviceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by huangjunhao on 2019/2/15.
 */
@Service
public class DerviceServiceImpl implements DerviceService{

    @Autowired
    private Device_userMapper device_userMapper;

    @Autowired
    private  DeviceMapper deviceMapper;

    @Override
    public List<Device_user> getDeviceId(Integer id) {

        return device_userMapper.selectDeviceIDByUserId(id);
    }
}
