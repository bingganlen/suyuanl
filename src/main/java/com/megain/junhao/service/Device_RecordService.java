package com.megain.junhao.service;

import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.pojo.Device_record_his;

import java.util.List;
import java.util.Map;

/**
 * Created by huangjunhao on 2019/2/20.
 */
public interface Device_RecordService {
    /**\
     *
     * @param device_record_his
     * @return
     */
    ServerResponse<String> saveDevice(Device_record_his device_record_his);

    List<Map<String,Object>> echartWeekByRecord_his(Integer devId);
    //Map<Object, Object> echartWeekByRecord_his(Integer devId);



}
