package com.psh.chart.service;

import com.psh.chart.domain.DataDay;
import com.psh.chart.repository.ChartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional
public class ChartService {

    @Autowired
    ChartMapper chartMapper;

    public List<DataDay> findAll() {
        return chartMapper.findAll();
    }

}