package com.jhjeun.pwiki.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import com.jhjeun.pwiki.board.mapper.BoardMapper;
import com.jhjeun.pwiki.board.model.BoardModel;

@Service
public class BoardService {
    @Autowired
    private BoardMapper mapper;

    public List<BoardModel> listAll() {
        List<BoardModel> listAll = mapper.listAll();
        return listAll;
    }

    public List<BoardModel> selectOne(int id) {
        List<BoardModel> selectOne = mapper.selectOne(id);
        return selectOne;
    }

    public int countRows() {
        int rows;
        rows = mapper.countRows();
        return rows;
    }

    public void create(BoardModel model) {
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