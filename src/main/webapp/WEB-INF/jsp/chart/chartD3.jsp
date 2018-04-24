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
                <h3>Chart D3 <small>D3 force chart</small></h3>
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
                <p id="xxx" style="background-color: yellow">
                </p>
            </div>
        </div>

    </div>
</div>
<!-- page content -->

<%@ include file="../include/footer.jsp" %>

<script>

    $( document ).ready(function() {
        drawSample();
        //drawForceLayoutSample1();
    });

    function drawSample() {

        //Width and height
        var w = 1200;
        var h = 800;

        //Original data
        var dataset = {
            nodes: [
                { name: "Adam" },
                { name: "Bob" },
                { name: "Carrie" },
                { name: "Donovan" },
                { name: "Edward" },
                { name: "Felicity" },
                { name: "George" },
                { name: "Hannah" },
                { name: "Iris" },
                { name: "Jerry" }
            ],
            edges: [
                { source: 0, target: 1 },
                { source: 0, target: 2 },
                { source: 0, target: 3 },
                { source: 0, target: 4 },
                { source: 1, target: 5 },
                { source: 2, target: 5 },
                { source: 2, target: 5 },
                { source: 3, target: 4 },
                { source: 5, target: 8 },
                { source: 5, target: 9 },
                { source: 6, target: 7 },
                { source: 7, target: 8 },
                { source: 8, target: 9 }
            ]
        };

        var colors = d3.scale.category10();

        //Create SVG element
        var svg = d3.select("p")
                .append("svg")
                .attr("width", w)
                .attr("height", h);

        //Create nodes as circles
        var nodes = svg.append("rect")
                .attr("x", 100)
                .attr("y", 100)
                .attr("width", 100)
                .attr("height", 100)
                .style("fill", function(d, i) {
                    return colors[i+1];
                })
                .on("click", function(d, i) { alert(this + ", d : " + d + ", i : " + i); });

        //Every time the simulation "ticks", this will be called
        nodes.on("tick", function() {
            //alert('tick');

            nodes.attr("x", function(d) { return d.x; })
                    .attr("y", function(d) { return d.y; });

        });

    }

    function drawForceLayoutSample1() {

        //alert('1');
        //alert(d3.select("xxx"));

        //Width and height
        var w = 1200;
        var h = 800;

        //Original data
        var dataset = {
            nodes: [
                { name: "Adam" },
                { name: "Bob" },
                { name: "Carrie" },
                { name: "Donovan" },
                { name: "Edward" },
                { name: "Felicity" },
                { name: "George" },
                { name: "Hannah" },
                { name: "Iris" },
                { name: "Jerry" }
            ],
            edges: [
                { source: 0, target: 1 },
                { source: 0, target: 2 },
                { source: 0, target: 3 },
                { source: 0, target: 4 },
                { source: 1, target: 5 },
                { source: 2, target: 5 },
                { source: 2, target: 5 },
                { source: 3, target: 4 },
                { source: 5, target: 8 },
                { source: 5, target: 9 },
                { source: 6, target: 7 },
                { source: 7, target: 8 },
                { source: 8, target: 9 }
            ]
        };

        //Initialize a default force layout, using the nodes and edges in dataset
        var force = d3.layout.force()
                .nodes(dataset.nodes)
                .links(dataset.edges)
                .size([w, h])
                .linkDistance([200])
                .charge([-500])
                .gravity([0.05])
                .start();

        var colors = d3.scale.category10();

        //Create SVG element
        var svg = d3.select("p")
                .append("svg")
                .attr("width", w)
                .attr("height", h);

        //Create edges as lines
        var edges = svg.selectAll("line")
                .data(dataset.edges)
                .enter()
                .append("line")
                .style("stroke", "#ccc")
                .style("stroke-width", 1);

        //Create nodes as circles
//        var nodes = svg.selectAll("circle")
//                .data(dataset.nodes)
//                .enter()
//                .append("circle")
//                .attr("r", 10)
//                .style("fill", function(d, i) {
//                    return colors(i);
//                })
//                .call(force.drag);

        //Create nodes as circles
        var nodes = svg.selectAll("rect")
                .data(dataset.nodes)
                .enter()
                .append("rect")
                .attr("x", 100)
                .attr("y", 100)
                .attr("width", 50)
                .attr("height", 50)
                .style("fill", function(d, i) {
                    return colors(i);
                })
                .call(force.drag);

        //Every time the simulation "ticks", this will be called
        force.on("tick", function() {
            //alert('tick');

            edges.attr("x1", function(d) { return d.source.x; })
                    .attr("y1", function(d) { return d.source.y; })
                    .attr("x2", function(d) { return d.target.x; })
                    .attr("y2", function(d) { return d.target.y; });

            nodes.attr("x", function(d) { return d.x; })
                    .attr("y", function(d) { return d.y; });

        });

    }


</script>

</body>
</html>