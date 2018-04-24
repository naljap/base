<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    <div class="container body">
        <div class="main_container">
            <div class="col-md-3 left_col">
                <div class="left_col scroll-view">
                    <div class="navbar nav_title">
                        <a href="/" class="site_title"><span>BASE PROJECT</span></a>
                    <!-- 
                        <a href="/" class="site_title"><i class="fa fa-thumbs-o-up"></i> <span> OSINFRA</span></a>
                         -->
                    </div>
                    <div class="clearfix"></div>
                    <br>
                    <!-- sidebar menu -->
                    <div id="sidebar-menu" class="main_menu_side hidden-print main_menu">
                        <!-- General -->
                        <div class="menu_section">
                            <h3>General</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-home"></i> Home <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="/">Dashboard</a></li>
                                    </ul>
                                </li>

                                <li><a><i class="fa fa-smile-o"></i> Pattern <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="/pattern/pattern1">Pattern1 Base CRUD</a></li>
                                    </ul>
                                </li>

                                <li><a><i class="fa fa-smile-o"></i> Chart <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="/chart/chartJs">ChartJs</a></li>
                                        <li><a href="/chart/chartD3">ChartD3</a></li>
                                        <li><a href="/chart/chartGoJS">ChartGoJS - 유료</a></li>
                                        <li><a href="/chart/chartFabricJS">FabricJS</a></li>
                                        <li><a href="/chart/chartFabricJSRect">FabricJSRect</a></li>
                                        <li><a href="/chart/chartC3">ChartC3</a></li>
                                    </ul>
                                </li>

                                <!--

                                <li><a><i class="fa fa-money"></i> Asset <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <sec:authorize access="hasAnyRole('ADMIN', 'ROOT')">
                                        <li><a href="/admin/asset/host/register">서버 자산 등록</a></li>
                                        <li><a href="/admin/asset/storage/register">스토리지 자산 등록</a></li>
                                        <li><a href="/admin/asset/ntwk/register">네트워크 자산 등록</a></li>
                                        </sec:authorize>
                                        <li><a href="/asset/assets">자산 리스트</a></li>
                                    </ul>
                                </li>
                                <li id="host_li"><a><i class="fa fa-desktop"></i> Host <span class="fa fa-chevron-down"></span></a>
                                    <ul id="host_ul" class="nav child_menu">
                                        <sec:authorize access="hasAnyRole('ADMIN', 'ROOT')">
                                        <li><a href="/admin/host/registing">등록 미완료 리스트</a></li>
                                        </sec:authorize>
                                        <li><a href="/host/hosts">호스트 리스트</a></li>
                                        <sec:authorize access="hasAnyRole('ADMIN', 'ROOT')">
                                        <li><a href="/admin/host/rack">랙 구성도</a></li>
                                        <li><a href="/admin/host/anonymous">미아 보호소</a></li>
                                        </sec:authorize>
                                    </ul>
                                </li>
                                <li id="strg_li"><a><i class="fa fa-hdd-o"></i> Storage <span class="fa fa-chevron-down"></span></a>
                                    <ul id="strg_ul" class="nav child_menu">
                                        <li><a href="/storage/storages">스토리지 리스트</a></li>
                                    </ul>
                                </li>
                                <li id="ntwk_li"><a><i class="fa fa-signal"></i> Network <span class="fa fa-chevron-down"></span></a>
                                    <ul id="ntwk_ul" class="nav child_menu">
                                        <li><a href="/ntwk/ntwks">네트워크 장비 리스트</a></li>
                                        <li><a href="/ntwk/search">네트워크 통합 검색</a></li>
                                    </ul>
                                </li>

                                -->

                            </ul>
                        </div>


                        <!-- ADMIN -->
                        <sec:authorize access="hasAnyRole('ADMIN', 'ROOT')">
                        <div class="menu_section">
                            <h3>ADMIN</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-barcode"></i> CODE <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="/admin/admincode">ADMIN 코드 관리</a></li>
                                        <li><a href="/admin/servicecode">서비스 코드 관리</a></li>
                                        <li><a href="/admin/modelunit">모델별 유닛 관리</a></li>
                                        <li><a href="/admin/shortcut">바로가기 관리</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        </sec:authorize>
                        <!-- ROOT -->
                        <sec:authorize access="hasRole('ROOT')">
                        <div class="menu_section">
                            <h3>ROOT</h3>
                            <ul class="nav side-menu">
                                <li><a><i class="fa fa-user"></i> Users <span class="fa fa-chevron-down"></span></a>
                                    <ul class="nav child_menu">
                                        <li><a href="/root/user">user management</a></li>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        </sec:authorize>
                    </div>
                    <!-- /sidebar menu -->

                    <!-- menu footer buttons -->
                    <!-- 
                    <div class="sidebar-footer hidden-small">
                        <a data-toggle="tooltip" data-placement="top" title="Settings">
                            <span class="glyphicon glyphicon-cog" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="FullScreen">
                            <span class="glyphicon glyphicon-fullscreen" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Logout">
                            <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                        </a>
                        <a data-toggle="tooltip" data-placement="top" title="Logout">
                            <span class="glyphicon glyphicon-off" aria-hidden="true"></span>
                        </a>
                    </div>
                    -->
                    <!-- /menu footer buttons -->
                </div>
            </div>
            
            <!-- top navigation -->
            <div class="top_nav">
                <div class="nav_menu">
                    <nav class="" role="navigation">
                        <div class="nav toggle">
                            <a id="menu_toggle"><i class="fa fa-bars"></i></a>
                        </div>
                        <ul class="nav navbar-nav navbar-right">
                            <li class="">
                                <a href="javascript:;" class="user-profile dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
                                    <span id="navbar-right-icon" class="fa fa-user"></span>
                                    <span id="navbar-right-name"><sec:authentication property="principal.displayname"/></span>
                                    <span class="fa fa-angle-down"></span>
                                </a>
                                <ul class="dropdown-menu dropdown-usermenu pull-right">
                                    <li><a href="/logout"><i class="fa fa-sign-out pull-right"></i> Log Out</a></li>
                                </ul>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
            <!-- /top navigation -->