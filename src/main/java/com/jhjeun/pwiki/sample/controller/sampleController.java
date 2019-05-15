package com.jhjeun.pwiki.sample.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/sample/*")
public class sampleController {

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "sample/test";
    }

    @RequestMapping(value = "/list_view", method = RequestMethod.GET)
    public String list_view() {
        return "sample/list_view";
    }

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String form() {
        return "sample/form";
    }

    @RequestMapping(value = "/detail_view", method = RequestMethod.GET)
    public String detail_view() {
        return "";
    }
}