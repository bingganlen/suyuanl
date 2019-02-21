package com.megain.junhao.service.impl;

import com.megain.junhao.common.ServerResponse;
import com.megain.junhao.dao.Device_record_hisMapper;
import com.megain.junhao.dao.Device_userMapper;
import com.megain.junhao.pojo.Device_record_his;
import com.megain.junhao.service.Device_RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huangjunhao on 2019/2/20.
 */
@Service
public class Device_RecordServiceImpl implements Device_RecordService {

    @Autowired
    private Device_record_hisMapper device_record_hisMapper;
    @Autowired
    private Device_userMapper deviceUserMapper;

    /**\
     * 更新设备记录
     * 返回的记录数错误  而不是插入一条就返回1
     -2147482646
     * @param device_record_his
     * @return
     */
    @Override
    public ServerResponse<String> saveDevice(Device_record_his device_record_his) {
        if(device_record_his != null)
        {
            if(device_record_his.getId() != null){ // device_record_his.getDevId() != null         ID为空就是新增   因为有多个设备id相同的不同时间段的记录
                int rowCount = device_record_hisMapper.updateByPrimaryKey(device_record_his);//更新整个产品
              /*  if(rowCount > 0){
                    return ServerResponse.createBySuccess("更新设备记录成功");
                }

                return ServerResponse.createBySuccess("更新设备记录失败");*/
                return ServerResponse.createBySuccess("更新设备记录成功");
            }else{
                int rowCount = device_record_hisMapper.insert(device_record_his);
               /* if(rowCount > 0){
                    return ServerResponse.createBySuccess("新增设备记录成功");
                }
                System.out.println(rowCount);
                return ServerResponse.createBySuccess("新增设备记录失败");*/
                return ServerResponse.createBySuccess("新增设备记录成功");
            }
        }
        return ServerResponse.createByErrorMessage("新增或更新设备记录参数不正确");
    }


    //图表的参数   上一个星期
    @Override
    //public Map<Object, Object> echartWeekByRecord_his(Integer devId) {
    public  List<Map<String, Object>> echartWeekByRecord_his(Integer devId) {
        //devId = deviceUserMapper.selectDeviceIDByUserId()
        //return device_record_hisMapper.selectByDeviceWeek(devId);
        List<Map<String, Object>> listMap = new ArrayList<Map<String, Object>>();
        Map<String, Object> map = new HashMap<String, Object>();
        listMap = device_record_hisMapper.selectByDeviceWeek(devId);
        /*for(int i=0;i<listMap.size();i++) {
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("a", i);
            map.put("b", i);
            listMap .add(map);
        }*/
        for(Object obj : listMap){
            map.put("name", obj.getName());
            map.put("data", obj.getData());
            mapList.add(map);
        }
        return listMap;
    }


}
