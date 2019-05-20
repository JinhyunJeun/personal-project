package com.jhjeun.pwiki.sample.model;

import lombok.Data;

@Data
public class SampleModel {
    private int id;
    private String title;
    private String regUser;
    private String tags;
    private String regDt;
    private String deleteYn;
}