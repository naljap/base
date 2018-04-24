package com.psh.test.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Created by 1002173 on 2017. 2. 24..
 */
@Controller
@RequestMapping("/test")
public class TestController {

    @RequestMapping("/test")
    public String testJsp() {
        return "test";
    }

    @RequestMapping("/hello")
    public @ResponseBody String hello() throws Exception{
        return "Hello World www";
    }

}
