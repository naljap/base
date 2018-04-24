package com.psh.common.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BaseController {

    /**
     * Base URL
     */
    @RequestMapping("/")
    public String index() {
        return "index_bak";
    }

    @RequestMapping("login")
    String login(Model model) {
        return "login/login";
    }

    /**
     * Admin URL
     */
    @RequestMapping("root/user")
    String rootUser(Model model) {
        return "root/user";
    }

    /**
     * Pattern
     */
    @RequestMapping("pattern/pattern1")
    String pattern1(Model model) {
        return "pattern/pattern1";
    }

    /**
     * CHART
     */
    @RequestMapping("chart/chartJs")
    String chartJs(Model model) {
        return "chart/chartJs";
    }

    @RequestMapping("chart/chartD3")
    String chartD3(Model model) {
        return "chart/chartD3";
    }

    @RequestMapping("chart/chartGoJS")
    String chartGoJS(Model model) {
        return "chart/chartGoJS";
    }

    @RequestMapping("chart/chartFabricJS")
    String chartFabricJS(Model model) {
        return "chart/chartFabricJS";
    }

    @RequestMapping("chart/chartFabricJSRect")
    String chartFabricJSRect(Model model) {
        return "chart/chartFabricJSRect";
    }

    @RequestMapping("chart/chartC3")
    String chartC3(Model model) {
        return "chart/chartC3";
    }
}