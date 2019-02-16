package com.megain.junhao.service;

//import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.pojo.Device;
import com.megain.junhao.pojo.Device_user;

import java.util.List;

/**
 * Created by huangjunhao on 2019/2/15.
 */
public interface DerviceService {
    List<Device_user> getDeviceId(Integer id);

    //Device selectByPrimaryKey(Integer id);

}
