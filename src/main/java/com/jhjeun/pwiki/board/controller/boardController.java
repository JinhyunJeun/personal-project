package com.jhjeun.pwiki.board.controller;

import java.util.List;

import com.jhjeun.pwiki.board.model.BoardModel;
import com.jhjeun.pwiki.board.service.BoardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    public Model list_view(Model model){
        List<BoardModel> list = service.listAll();
        model.addAttribute("list", list);
        return model;
    }

    @RequestMapping(value="/api/detail_view_{id}", method=RequestMethod.GET)
    public Model detail_view(@PathVariable int id, @RequestParam String deleteYn, Model model) {
        List<BoardModel> list = service.selectOne(id);
        model.addAttribute("list", list);
        return model;
    }

    @RequestMapping(value="/api/create", method=RequestMethod.GET)
    public void form(BoardModel model, Model md) {
        service.create(model);
    }
}