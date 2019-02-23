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

    //List lights,rain,air_temp,air_humi,soil_electric,soil_temp,soil_humi,soil_salt = new ArrayList<>();

    //echart 图表 main.jsp  一星期
    @RequestMapping(value = "echartWeek.do", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> echarts(Integer devId, ModelMap map) {//HttpSession session   List<Map<String, Object>>      List<Integer> 返回lights
        List<Map<String, Object >> resultMap = recordService.echartWeekByRecord_his(devId);
        int size = resultMap.size();
        List lights= new ArrayList<>();
        List rain = new ArrayList();
        List air_temp = new ArrayList();
        List air_humi = new ArrayList();
        List soil_electric = new ArrayList();
        List soil_temp = new ArrayList();
        List soil_humi = new ArrayList();
        List soil_salt = new ArrayList();
        Map<String,Object> listMap = new HashMap<String,Object>();
        for (int i = 0; i < size; i++) {//7
            Map mapItem = resultMap.get(i);
            //System.out.println(mapItem);   //获取成功
            if (mapItem != null) {
                lights.add(mapItem.get("light"));
                rain.add(mapItem.get("rain"));
                air_temp.add(mapItem.get("air_temp"));
                air_humi.add(mapItem.get("air_humi"));
                soil_electric.add(mapItem.get("soil_electric"));
                soil_temp.add(mapItem.get("soil_temp"));
                soil_humi.add(mapItem.get("soil_humi"));
                soil_salt.add(mapItem.get("soil_salt"));
            }
        }
        for (int i = 0; i < lights.size(); i++) {
            System.out.println(lights.get(i));
        }
        listMap.put("light",lights);map.put("lights",lights);
        listMap.put("rain",rain);
        listMap.put("air_temp",air_temp);
        listMap.put("air_humi",air_humi);
        listMap.put("soil_electric",soil_electric);
        listMap.put("soil_temp",soil_temp);
        listMap.put("soil_humi",soil_humi);
        listMap.put("soil_salt",soil_salt);
        //map.put("weeklist", resultMap);
       /* Gson gson = new Gson();
        ObjectMapper objectMapper = new ObjectMapper();
        List<Map<String,Object>> newMap=objectMapper.readValue(gson.toJson(listData), List.class);
        System.out.println(newMap);*/
        //return resultMap;
        return listMap;
    }

   /* @Test
    public void test(){

    }*/

}
