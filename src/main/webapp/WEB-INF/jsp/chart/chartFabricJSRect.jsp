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
                <h3>Chart FabricJSRect <small>FabricJSRect chart</small></h3>
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
                <canvas id="c" width="1200" height="800" style="border: dotted"></canvas>
            </div>
        </div>

    </div>
</div>
<!-- page content -->

<%@ include file="../include/footer.jsp" %>

<script>

    $( document ).ready(function() {
        drawSample();
    });

    function drawSample() {

        // fabric canvas ready
        var canvas = this.__canvas = new fabric.Canvas('c', {
            selection: false
        });
        fabric.Object.prototype.originX = fabric.Object.prototype.originY = 'center';

        // data (lable, left, top, width, height)
        var rectData = [
            [ '1', 100, 100, 60, 40 ],
            [ '2', 300, 100, 60, 40 ],
            [ '3', 500, 100, 60, 40 ]
        ];

        var lineData = [
            ['1', '2'],
            ['2', '3']
        ];

        // map 저장
        var rectPointMap = newMap();
        $.each(rectData, function(key, val) {
            rectPointMap.put(val[0], new fabric.Point(val[1], val[2]));
        });

        var lineMap = newMap();
        $.each(lineData, function(key, val) {
            lineMap.put(val[0], val[1]);
        });

        //alert('rectPointMap 1 : ' + rectPointMap.get('1'));
        //alert('lineMap 1 : ' + lineMap.get('1'));

        // make line (map에서 rectPoint를 get해서 처리함)
        var line = [];
        $.each(lineData, function(key, val) {
            var fromRectPoint = rectPointMap.get(val[0]);
            var toRectPoint = rectPointMap.get(val[1]);
            var coords = [fromRectPoint.x, fromRectPoint.y, toRectPoint.x, toRectPoint.y];

            line[key] = makeLine(canvas, coords);
        });

        // line object map 저장
        var lineObjectMap = newMap();
        $.each(lineData, function(key, val) {
            lineObjectMap.put(val[0], line[key]);
        });

        // make rect
        var rect = [];
        $.each(rectData, function(key, val) {

            // line mapping
            var inboundLine = new Array();
            var outboundLine = new Array();

            $.each(lineMap.value, function(fromRectKey, toRectVal) {
                //alert('lineMap.value key : ' + fromRectKey);
                //alert('lineMap.value val : ' + toRectVal);

                // rect key가 line의 to와 같으면 inbound line이지..
                if (val[0] == toRectVal) {
                    inboundLine.push(fromRectKey);
                }

                // rect key가 line의 from와 같으면 outbound line이지..
                if (val[0] == fromRectKey) {
                    outboundLine.push(fromRectKey);
                }
            });

            rect[key] = makeRect(canvas, val[0], val[1], val[2], val[3], val[4], inboundLine, outboundLine);
        });


//        var point = new fabric.Point(100, 100);
//        alert(point);
//        alert(point.x);
//
//        alert('a');
//        var rectDataMap = new Map();
//        rectDataMap.put("a", 'aaa');
//
//        alert(rectDataMap);
//
//        $.each(rectDataMap, function(key, val) {
//            alert(key + ', ' + val);
//        });


        canvas.on('object:moving', function(e) {
            var p = e.target;

            if ( p.myInboundLine ) {
                $.each(p.myInboundLine, function(key, val) {
                    var line = lineObjectMap.get(val);
                    //console.log("lineObject : " + line);
                    line.set({ 'x2': p.left, 'y2': p.top });
                });
            }

            if ( p.myOutboundLine ) {
                $.each(p.myOutboundLine, function(key, val) {
                    var line = lineObjectMap.get(val);
                    //console.log("lineObject : " + line);
                    line.set({ 'x1': p.left, 'y1': p.top });
                });
            }

            p.myLabel && p.myLabel.set({ left: p.left, top: p.top });

            canvas.renderAll();
        });
    }

    function makeRect(canvas, label, left, top, width, height, inboundLine, outboundLine) {

        //alert("rect key : " + label + ", inboundLine : " + inboundLine + ", outboundLine : " + outboundLine);

        // make label
        var label = makeText(left, top, label);

        var rect = new fabric.Rect({
            left: left,
            top: top,
            width: width,
            height: height,
            fill: 'skyblue',
            opacity: 0.7,
            hasControls: true,
            hasBorders: true
        });

        rect.myInboundLine = inboundLine;
        rect.myOutboundLine = outboundLine;

        rect.myLabel = label;

        canvas.add(rect);
        canvas.add(label);

        return rect;
    }

    function makeLine(canvas, coords) {
        var line = new fabric.Line(coords, {
            fill: 'red',
            stroke: 'red',
            strokeWidth: 2,
            selectable: false
        });

        canvas.add(line);

        return line;
    }

    function makeText(left, top, text) {
        return new fabric.Text(text, {
            left: left,
            top: top,
            fontSize: 20
        });
    }

    // map 기능 함수
    function newMap() {
        var map = {};
        map.value = {};
        map.getKey = function(id) {
            return id;
        };
        map.put = function(id, value) {
            var key = map.getKey(id);
            map.value[key] = value;
        };
        map.contains = function(id) {
            var key = map.getKey(id);
            if(map.value[key]) {
                return true;
            } else {
                return false;
            }
        };
        map.get = function(id) {
            var key = map.getKey(id);
            if(map.value[key]) {
                return map.value[key];
            }
            return null;
        };
        map.remove = function(id) {
            var key = map.getKey(id);
            if(map.contains(id)){
                map.value[key] = undefined;
            }
        };

        return map;
    }

</script>

</body>
</html>