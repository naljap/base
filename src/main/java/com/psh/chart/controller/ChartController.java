package com.psh.chart.controller;

import com.psh.chart.domain.DataDay;
import com.psh.chart.service.ChartService;
import com.psh.chart.vo.ChartVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
public class ChartController {

    private static final Logger logger = LoggerFactory.getLogger(ChartController.class);

    @Autowired
    ChartService chartService;
    
    @RequestMapping(value = "api/chart", method = RequestMethod.GET)
    List<DataDay> getChart() {

        // [TASK] 로그 테스트
        logger.debug("debug : " + "getChart");

        // Get Data
        List<DataDay> chartList = chartService.findAll();

        return chartList;
    }

    @RequestMapping(value = "api/chart_data", method = RequestMethod.GET)
    ChartVO getChartData() {

        // [TASK] 로그 테스트
        logger.debug("debug : " + "getChartData");

        // Get Data
        List<DataDay> chartList = chartService.findAll();

        // VO Mapping
        ChartVO chartVO = new ChartVO();
        String[] tempLables = new String[chartList.size()];
        Long[] datas = new Long[chartList.size()];

        // 기본 for 문
//        for ( int i=0; i<chartList.size(); i++ )  {
//            tempLables[i] = chartList.get(i).getStatisticDate();
//            datas[i] = chartList.get(i).getStatistic1();
//        }

        // for-each 문
        int index = 0;
        for ( DataDay tempDataDay : chartList )  {
            tempLables[index] = tempDataDay.getStatisticDate();
            datas[index] = tempDataDay.getStatistic1();
            index++;
        }

        chartVO.setLabels(tempLables);
        chartVO.setDatas(datas);

        return chartVO;
    }
}