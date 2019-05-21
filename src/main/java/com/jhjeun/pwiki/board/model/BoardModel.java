package com.jhjeun.pwiki.board.model;

import lombok.Data;

@Data
public class BoardModel {
    private int id;
    private String title;
    private String content;
    private String regUser;
    private String regDt;
    private String icon;
    private String deleteYn;
    private String tags;
    private String updDt;
    private String property;
}