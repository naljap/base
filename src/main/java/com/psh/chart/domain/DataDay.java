package com.psh.chart.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DataDay {

    private String statisticDate;
    private long statistic1;
    private long statistic2;
    private long statistic3;
    private long statistic4;
    private long statistic5;
    private String createdId;
    private Date created;
    private String updatedId;
    private Date updated;

}