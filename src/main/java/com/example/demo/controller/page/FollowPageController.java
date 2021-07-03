package com.example.demo.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/follow")
public class FollowPageController {
    @RequestMapping(value="followStatus", method = RequestMethod.GET)
    public String followStatus(){return "/jsp/follow_status";}
}
