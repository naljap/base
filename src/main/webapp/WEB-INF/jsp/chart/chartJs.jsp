<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="../include/header.jsp" %>

</head>
<body class="nav-md">
<%@ include file="../include/menu.jsp" %>

<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Chart Js <small>Some examples to get you started</small></h3>
            </div>

            <div class="title_right">
                <div class="col-md-5 col-sm-5 col-xs-12 form-group pull-right top_search">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Search for...">
                    <span class="input-group-btn">
                      <button class="btn btn-default" type="button">Go!</button>
                    </span>
                    </div>
                </div>
            </div>
        </div>

        <div class="clearfix"></div>

        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Line graph<small>Sessions</small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <canvas id="lineChart"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Bar graph <small>Sessions</small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <canvas id="barChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Radar <small>Sessions</small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <canvas id="radarChart"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Donut Graph <small>Sessions</small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <canvas id="doughnutChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearfix"></div>
        <div class="row">
            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Pie Graph Chart <small>Sessions</small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <canvas id="pieChart"></canvas>
                    </div>
                </div>
            </div>

            <div class="col-md-6 col-sm-6 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2>Polar Area Graph <small>Sessions</small></h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li><a class="collapse-link"><i class="fa fa-chevron-up"></i></a>
                            </li>
                            <li class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false"><i class="fa fa-wrench"></i></a>
                                <ul class="dropdown-menu" role="menu">
                                    <li><a href="#">Settings 1</a>
                                    </li>
                                    <li><a href="#">Settings 2</a>
                                    </li>
                                </ul>
                            </li>
                            <li><a class="close-link"><i class="fa fa-close"></i></a>
                            </li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <canvas id="polarAreaChart"></canvas>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- page content -->

<%@ include file="../include/footer.jsp" %>

<script>

    $( document ).ready(function() {
        drawChart();
        //drawSampleChart();
    });

    function drawChart() {

        $.ajax({
            type: "GET",
            dataType: "json",
            contentType: "application/json",
            url: "/api/chart_data",
            success: function(data) {

                var labels = data.labels;
                var datas = data.datas;

                drawLineChart(labels, datas);
                drawBarChart(labels, datas);
                drawRadarChart(labels, datas);
                drawDoughnutChart(labels, datas);
                drawPieChart(labels, datas);
                drawPolarAreaChart(labels, datas);

            },
            error: function(data) {
                console.log(data);
            }
        });

    }

    function drawPolarAreaChart(labels, datas) {

        var data = {
            labels: labels,
            datasets: [
                {
                    label: "polarAreaChart-dataset1",
                    fill: true,
                    lineTension: 0.1,
                    backgroundColor: getRandomColorList(labels.length),
                    borderColor: "rgba(75,192,192,1)",
                    data: datas,
                }
            ]
        };

        var ctx = document.getElementById('polarAreaChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'polarArea',
            data: data,
            options: {}
        });

    }

    function drawPieChart(labels, datas) {

        var data = {
            labels: labels,
            datasets: [
                {
                    label: "pieChart-dataset1",
                    fill: true,
                    lineTension: 0.1,
                    backgroundColor: getRandomColorList(labels.length),
                    borderColor: "rgba(75,192,192,1)",
                    data: datas,
                }
            ]
        };

        var ctx = document.getElementById('pieChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'pie',
            data: data,
            options: {}
        });

    }

    function drawDoughnutChart(labels, datas) {

        var data = {
            labels: labels,
            datasets: [
                {
                    label: "doughnutChart-dataset1",
                    fill: true,
                    lineTension: 0.1,
                    backgroundColor: getRandomColorList(labels.length),
                    borderColor: "rgba(75,192,192,1)",
                    data: datas,
                }
            ]
        };

        var ctx = document.getElementById('doughnutChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: data,
            options: {}
        });

    }

    function drawRadarChart(labels, datas) {

        var data = {
            labels: labels,
            datasets: [
                {
                    label: "radarChart-dataset1",
                    fill: true,
                    lineTension: 0.1,
                    backgroundColor: "rgba(75,192,192,1)",
                    borderColor: "rgba(75,192,192,1)",
                    data: datas,
                }
            ]
        };

        var ctx = document.getElementById('radarChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'radar',
            data: data,
            options: {}
        });

    }

    function drawBarChart(labels, datas) {

        var data = {
            labels: labels,
            datasets: [
                {
                    label: "barChart-dataset1",
                    fill: true,
                    lineTension: 0.1,
                    backgroundColor: "rgba(75,192,192,0.4)",
                    borderColor: "rgba(75,192,192,1)",
                    data: datas,
                }
            ]
        };

        var ctx = document.getElementById('barChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: data,
            options: {}
        });

    }

    function drawLineChart(labels, datas) {

        var data = {
            labels: labels,
            datasets: [
                {
                    label: "lineChart-dataset1",
                    fill: true,
                    lineTension: 0.1,
                    backgroundColor: "rgba(75,192,192,0.4)",
                    borderColor: "rgba(75,192,192,1)",
                    data: datas,
                }
            ]
        };

        var ctx = document.getElementById('lineChart').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'line',
            data: data,
            options: {}
        });

    }

    function getRandomColorList(count) {

        var colorList = new Array();
        for ( var i=0; i<count; i++ ) {
            colorList[i] = getRandomColor();
        }
        return colorList;
    }

    function getRandomColor() {

        var letters = '0123456789ABCDEF';
        var color = '#';
        for (var i = 0; i < 6; i++) {
            color += letters[Math.floor(Math.random() * 16)];
        }
        return color;
    }

    function drawSampleChart() {

        var data = {
            labels: ["January", "February", "March", "April", "May", "June", "July"],
            datasets: [
                {
                    label: "dataset1",
                    fill: false,
                    lineTension: 0.1,
                    backgroundColor: "rgba(75,192,192,0.4)",
                    borderColor: "rgba(75,192,192,1)",
                    data: [65, 59, 80, 81, 56, 55, 40],
                },
                {
                    label: "dataset2",
                    fill: true,
                    lineTension: 0.5,
                    backgroundColor: "rgba(192,192,192,0.4)",
                    borderColor: "rgba(192,192,192,1)",
                    data: [35, 39, 80, 81, 56, 55, 40],
                }
            ]
        };

        var ctx = document.getElementById('lineChart').getContext('2d');

        var myLineChart = new Chart(ctx, {
            type: 'line',
            data: data,
            options: {}
        });

    }


</script>

</body>
</html>