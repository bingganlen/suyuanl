package com.megain.junhao.controller;

import com.megain.junhao.pojo.Device_record_his;
import com.megain.junhao.service.DerviceService;
import com.megain.junhao.service.Device_RecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by huangjunhao on 2019/2/21.
 */
@Controller
@RequestMapping("/echart/")
public class Device_record_hisController {

    @Autowired
    private Device_RecordService recordService;
    @Autowired
    private DerviceService derviceService;

    //echart 图表 main.jsp  一星期
    @RequestMapping(value = "echartWeek.do",method = RequestMethod.GET)
    @ResponseBody
    public Device_record_his echarts(Integer devId,ModelMap map){//HttpSession session
        //int userId = (int) session.getAttribute("userid");
        //devId = derviceService.getDeviceId(userId);
        //获取点击的那个devId   不是这里定死了永远那个devId
        List<Map<String, Object>> device_record_his = recordService.echartWeekByRecord_his(devId);
        map.put("weeklist",list);
        return list;
    }




}
