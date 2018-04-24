package com.psh.common.domain;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import javax.persistence.*;
import java.util.Date;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "user")
public class User {

    @GeneratedValue
    @Column(updatable=false)
    private Integer id;

    @Id
    @Column(unique = true)
    private String userid;
    private String name;
    private String displayname;
    private String firstname;
    private String lastname;
    private String email;
    
    @Column(insertable=false, updatable=true)
    private String role;

    @Column(insertable=false, updatable=false)
    private String createdid;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(insertable=false, updatable=false)
    private Date created;

    @Column(insertable=false, updatable=true)
    private String updatedid;

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm", timezone = "Asia/Seoul")
    @Temporal(TemporalType.TIMESTAMP)
    @Column(insertable=false, updatable=true)
    private Date updated;
    
    @PrePersist
    protected void onCreate() {
      created = new Date();
    }
    
    @PreUpdate
    protected void onUpdate() {
      updated = new Date();
    }
}