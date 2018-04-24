package com.psh.chart.repository;

import com.psh.chart.domain.DataDay;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository
public interface ChartMapper {

    public List<DataDay> findAll();

}