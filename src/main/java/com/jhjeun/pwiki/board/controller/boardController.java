package com.jhjeun.pwiki.board.controller;

import java.util.List;

import com.jhjeun.pwiki.board.model.boardModel;
import com.jhjeun.pwiki.board.service.boardService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/board/*")
public class boardController {
    
    @Autowired
    private boardService service;

    @RequestMapping(value="/api/list_view", method=RequestMethod.GET)
    public Model list_view(Model model){
        List<boardModel> list = service.listAll();
        model.addAttribute("list", list);
        return model;
    }

    @RequestMapping(value="/api/detail_view{id}", method=RequestMethod.GET)
    public Model detail_view(@PathVariable int id, @RequestParam String deleteYn, Model model) {
        List<boardModel> list = service.selectOne(id);
        model.addAttribute("list", list);
        return model;
    }

    @RequestMapping(value="/api/create", method=RequestMethod.GET)
    public void form(boardModel model, Model md) {
        service.create(model);
    }

    @RequestMapping(value="/api/list_view", method=RequestMethod.POST)
    public void list_View() {

    }
}