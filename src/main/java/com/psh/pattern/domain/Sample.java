package com.psh.pattern.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Sample {

    private long id;
    private String strcol1;
    private String strcol2;
    private String strcol3;
    private String strcol4;
    private String strcol5;
    private int intcol1;
    private int intcol2;
    private Date datecol1;
    private Date datetimecol1;
    private String createdid;
    private Date created;
    private String updatedid;
    private Date updated;

}