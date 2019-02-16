package com.megain.junhao.dao;

import com.megain.junhao.pojo.Device_record_his;

public interface Device_record_hisMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Device_record_his record);

    int insertSelective(Device_record_his record);

    Device_record_his selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Device_record_his record);

    int updateByPrimaryKey(Device_record_his record);
}