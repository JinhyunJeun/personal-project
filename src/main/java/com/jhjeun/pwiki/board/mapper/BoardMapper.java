package com.jhjeun.pwiki.board.mapper;

import java.util.List;
import com.jhjeun.pwiki.board.model.BoardModel;

import org.apache.ibatis.annotations.Param;

public interface BoardMapper {
    List<BoardModel> listAll();
    List<BoardModel> selectOne(
        @Param("id") int id
    );
    int countRows();
    void create(BoardModel model);
    void deleteOne(
        @Param("id") int id
    );
    void updateOne(
        @Param("id") int id
    );
    void updateDelete(
        @Param("id") int id
    );
}