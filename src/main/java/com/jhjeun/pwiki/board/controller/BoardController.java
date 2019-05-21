package com.jhjeun.pwiki.board.controller;

import java.util.List;

import com.jhjeun.pwiki.board.model.BoardModel;
import com.jhjeun.pwiki.board.service.BoardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/board/*")
public class BoardController {
    
    @Autowired
    private BoardService service;

    @RequestMapping(value="/list_view", method=RequestMethod.GET)
    public String list_view() {
        return "board/list";
    }

    @RequestMapping(value="/detail_view", method=RequestMethod.GET)
    public String detail_view() {
        return "board/detail";
    }

    @RequestMapping(value="/form", method=RequestMethod.GET)
    public String form() {
        return "board/form";
    }
    
    @RequestMapping(value="/api/list_view", method=RequestMethod.GET)
    @ResponseBody
    public List<BoardModel> list(){
        List<BoardModel> list = service.listAll();
        return list;
    }

    @RequestMapping(value="/api/detail_view_{id}", method=RequestMethod.GET)
    public List<BoardModel> detail_view(@PathVariable int id, @RequestParam String deleteYn, Model model) {
        List<BoardModel> list = service.selectOne(id);
        
        return list;
    }

    @RequestMapping(value="/api/create", method=RequestMethod.POST)
    @ResponseBody
    public void form(@RequestBody BoardModel model) {
        model.setDeleteYn("N");
        service.create(model);
    }
}