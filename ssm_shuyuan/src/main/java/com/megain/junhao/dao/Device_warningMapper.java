package com.megain.junhao.dao;

import com.megain.junhao.pojo.Device_warning;

public interface Device_warningMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Device_warning record);

    int insertSelective(Device_warning record);

    Device_warning selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Device_warning record);

    int updateByPrimaryKey(Device_warning record);
}