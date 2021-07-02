package com.example.demo.controller.page;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value="/customer")
public class CustomerPageController {
    @RequestMapping(value = "/myProfile",method = RequestMethod.GET)
    public String myProfile(){
        return "/jsp/my_profile";
    }

    @RequestMapping(value = "/signIn", method = RequestMethod.GET)
    public String login(){
        return "/jsp/login";
    }

    @RequestMapping(value = "/findCustomerId", method = RequestMethod.GET)
    public String findCustomerId(){
        return "/jsp/find_id";
    }

    @RequestMapping(value = "/findCustomerIdResult", method = RequestMethod.GET)
    public String findCustomerIdResult(){
        return "/jsp/find_id_result";
    }

    @RequestMapping(value = "/findCustomerPassword", method = RequestMethod.GET)
    public String findCustomerPassword(){
        return "/jsp/find_pw";
    }

    @RequestMapping(value = "/findCustomerPasswordResult", method = RequestMethod.GET)
    public String findCustomerPasswordResult(){
        return "/jsp/find_pw_result";
    }

    @RequestMapping(value = "/signUp", method = RequestMethod.GET)
    public String member_join() {
        return "/jsp/member_join";         // 실제 호출될 /WEB-INF/jsp/views/viewtest.jsp

    }
}
