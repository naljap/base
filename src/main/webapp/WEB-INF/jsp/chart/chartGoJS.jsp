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
                <h3>Chart GoJS <small>GoJS chart - 이런 유료네...쩝..</small></h3>
                <p>"file:///Users/1002173/C/ade/workspace/GitHub/GoJS/GoJS-master/samples/index.html" 가이드</p>
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
                <div id="myDiagramDiv" style="border: solid 1px black; width:400px; height:400px"></div>
            </div>
        </div>

    </div>
</div>
<!-- page content -->

<%@ include file="../include/footer.jsp" %>

<script>

    $( document ).ready(function() {
        drawChart();
    });

    function drawChart() {

        if (window.goSamples) goSamples();  // init for these samples -- you don't need to call this

        var $ = go.GraphObject.make;  // for conciseness in defining templates

        myDiagram = $(go.Diagram, "myDiagramDiv",  // create a Diagram for the DIV HTML element
                {
                    initialContentAlignment: go.Spot.Center,  // center the content
                    "undoManager.isEnabled": true  // enable undo & redo
                });

        // define a simple Node template
        myDiagram.nodeTemplate =
                $(go.Node, "Auto",  // the Shape will go around the TextBlock
                        $(go.Shape, "RoundedRectangle", { strokeWidth: 0},
                                // Shape.fill is bound to Node.data.color
                                new go.Binding("fill", "color")),
                        $(go.TextBlock,
                                { margin: 8 },  // some room around the text
                                // TextBlock.text is bound to Node.data.key
                                new go.Binding("text", "key"))
                );

        // but use the default Link template, by not setting Diagram.linkTemplate

        // create the model data that will be represented by Nodes and Links
        myDiagram.model = new go.GraphLinksModel(
                [
                    { key: "Alpha", color: "lightblue" },
                    { key: "Beta", color: "orange" },
                    { key: "Gamma", color: "lightgreen" },
                    { key: "Delta", color: "pink" }
                ],
                [
                    { from: "Alpha", to: "Beta" },
                    { from: "Alpha", to: "Gamma" },
                    { from: "Beta", to: "Beta" },
                    { from: "Gamma", to: "Delta" },
                    { from: "Delta", to: "Alpha" }
                ]);

    }


</script>

</body>
</html>