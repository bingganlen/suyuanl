package com.megain.junhao.dao;

import com.megain.junhao.pojo.Device_record_his;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface Device_record_hisMapper {
    Device_record_his selectByDevice( @Param("devId") Integer devId);

    //最近一星期的记录
    List<Map<String, Object>> selectByDeviceWeek(@Param("devId") Integer devId);

    //最近一个月的记录
    List<Map<String, Object>> selectByDeviceMonth( @Param("devId") Integer devId);
    //上一个月   上一个季度   本年


    int deleteByPrimaryKey(Integer id);

    int insert(Device_record_his record);

    int insertSelective(Device_record_his record);

    Device_record_his selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Device_record_his record);

    int updateByPrimaryKey(Device_record_his record);
}