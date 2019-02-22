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
import java.util.ArrayList;
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
    @RequestMapping(value = "echartWeek.do", method = RequestMethod.GET)
    @ResponseBody
    public List<Map<String, Object>> echarts(Integer devId, ModelMap map) {//HttpSession session
        List<Map<String, Object >> resultMap = recordService.echartWeekByRecord_his(devId);
        int size = resultMap.size();
        List lights = new ArrayList<>();
        Map<String,Object> listMap = new HashMap<String,Object>();
        for (int i = 0; i < size; i++) {//7
            Map mapItem = resultMap.get(i);
            System.out.println(mapItem);
            lights.add(mapItem.get("light"));

        }
        for (int i = 0; i < 7; i++) {
            System.out.println(lights.get(i));   //有输出   正确
        }
        map.put("lights",lights);
        map.put("weeklist", resultMap);

       /* Gson gson = new Gson();
        ObjectMapper objectMapper = new ObjectMapper();
        List<Map<String,Object>> newMap=objectMapper.readValue(gson.toJson(listData), List.class);
        System.out.println(newMap);*/
        //return resultMap;
        return resultMap;
    }

   /* @Test
    public void test(){

    }*/

}
