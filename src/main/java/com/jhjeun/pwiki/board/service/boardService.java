package com.jhjeun.pwiki.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import com.jhjeun.pwiki.board.mapper.boardMapper;
import com.jhjeun.pwiki.board.model.boardModel;

@Service
public class boardService {
    @Autowired
    private boardMapper mapper;

    public List<boardModel> listAll() {
        List<boardModel> listAll = mapper.listAll();
        return listAll;
    }

    public List<boardModel> selectOne(int id) {
        List<boardModel> selectOne = mapper.selectOne(id);
        return selectOne;
    }

    public int countRows() {
        int rows;
        rows = mapper.countRows();
        return rows;
    }

    public void create(boardModel model) {
        mapper.create(model);
    }

    public void deleteOne(int id) {
        mapper.deleteOne(id);
    }

    public void updateOne(int id) {
        mapper.updateOne(id);
    }

    public void updateDelete(int id) {
        mapper.updateDelete(id);
    }
}