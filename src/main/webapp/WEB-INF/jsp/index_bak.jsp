<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <%@ include file="./include/header.jsp" %>
    <link rel="stylesheet" href="/webjars/gentelella/1.3.0/build/css/custom.min.css">
    <link href="/css/common/common.css" rel="stylesheet">
</head>
<body class="nav-md">
<%@ include file="./include/menu.jsp" %>
<!-- page content -->
<div class="right_col" role="main">
    <div class="">
        <div class="page-title">
            <div class="title_left">
                <h3>Dashboard</h3>
            </div>
        </div>

        <div class="clearfix"></div>

        <!--main row -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><i class="fa fa-search"></i> Search</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li class="li-float-right"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">
                        <div class="row">
                            <div class="col-md-6 col-sm-6 col-xs-12 form-group">
                                <h4><i class="fa fa-search"></i> 호스트 상세 정보 <small>Linux 서버만 검색합니다.</small></h4>
                                <div class="round_search">
                                    <input id="inputHostSearch" type="text" class="form-control" placeholder="Hostname or Host IP address">
                                </div>
                            </div>
                            <div class="col-md-6 col-sm-6 col-xs-12 form-group">
                                <h4><i class="fa fa-search"></i> 네트워크 검색 <small>DNS, IP</small></h4>
                                <div class="input-group top_search">
                                    <input type="text" class="form-control" placeholder="DNS, VIP/RIP address" disabled>
                                    <span class="input-group-btn">
                                        <button class="btn btn-default" type="button">Go!</button>
                                    </span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/main row -->

        <!--main row -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><i class="fa fa-dashboard"></i> Dashboard</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li class="li-float-right"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>

                    <div class="x_content">
                        <div class="row">
                            <div>준비 중 (대시보드) ...</div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/main row -->

        <!--main row -->
        <div class="row">
            <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="x_panel">
                    <div class="x_title">
                        <h2><i class="fa fa-external-link"></i> 바로 가기</h2>
                        <ul class="nav navbar-right panel_toolbox">
                            <li class="li-float-right"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
                        </ul>
                        <div class="clearfix"></div>
                    </div>
                    <div class="x_content">
                        <div class="row">
                            <div id="shortcutDiv"></div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/main row -->
    </div>
</div>
<!-- /page content -->

<%@ include file="./include/footer.jsp" %>
<script>
    $( document ).ready(function() {
        var shortcut_url = '/api/shortcut';
        <sec:authorize access="hasAnyRole('ADMIN', 'ROOT')">
        shortcut_url = '/api/admin/shortcut';
        </sec:authorize>

        $.getJSON(shortcut_url, function(data) {
            var html = '';
            var final_div = false;
            $.each(data, function(key, val) {
                if(key%3 == 0) {
                    final_div = false;
                    html += '<div class="row fontawesome-icon-list">'
                }
                html += '<div class="col-md-4 col-sm-4 col-xs-12"><div class="shortcut">';
                html += '<a target="_blank" href="' + val.address + '" class="green"><i class="fa fa-external-link"></i><strong> ' + val.name + '</strong></a>';
                html += '<div>' + val.description + '</div>';
                html += '<div><span class="blue">' + val.login_id + '</span><span class="red"> ' + val.login_pw + '</span></div>';
                html += '</div></div>';
                if(key%3 == 2) {
                    final_div = true;
                    html += '</div>';
                }
            });
            if(!final_div) { html += '</div>'; }
            $("#shortcutDiv").html(html);
        });

        $.getJSON("/api/host/searchdata", function(data) {
            var ARRAY_HOST_SEARCH = [];
            $.each(data, function(key, val) {
                ARRAY_HOST_SEARCH.push({"value": val[1] + ' ' + val[2], "data": val[0]});
            });
            $("#inputHostSearch").autocomplete({
                lookup: ARRAY_HOST_SEARCH,
                onSelect: function (suggestion) {
                    location.href = "/host/" + suggestion.data;
                }
            });
        });
    });

</script>
</body>
</html>