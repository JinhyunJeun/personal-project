package com.jhjeun.pwiki.board.mapper;

import java.util.List;
import com.jhjeun.pwiki.board.model.boardModel;

import org.apache.ibatis.annotations.Param;

public interface boardMapper {
    List<boardModel> listAll();
    List<boardModel> selectOne(
        @Param("id") int id
    );
    int countRows();
    void create(boardModel model);
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