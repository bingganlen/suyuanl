package com.megain.junhao.controller;

import com.megain.junhao.pojo.Device_user;
import com.megain.junhao.service.DerviceService;
import com.megain.junhao.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * Created by huangjunhao on 2019/2/15.
 */
@Controller
@RequestMapping("/device/")
public class DeviceController {
    @Autowired
    private DerviceService derviceService;
    @Autowired
    private HttpServletRequest request;
    @Autowired
    private IUserService iUserService;

    @RequestMapping(value = "findId.do",method = RequestMethod.POST)
    @ResponseBody
    public List<Device_user> findId(){//HttpSession session
        //controller获取userid
        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        //System.out.println(username);
        Integer userId = iUserService.selectUserId(username);
        session.setAttribute("DeviceId", derviceService.getDeviceId(userId));
        return derviceService.getDeviceId(userId);
    }



}
