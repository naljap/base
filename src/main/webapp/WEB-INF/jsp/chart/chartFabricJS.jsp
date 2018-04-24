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
                <h3>Chart FabricJS <small>FabricJS chart</small></h3>
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

        // data
        var data1 = [ 250, 125, 250, 175 ],
            data2 = [ 250, 175, 250, 250 ],
            data3 = [ 250, 250, 300, 350 ],
            data4 = [ 250, 250, 200, 350 ],
            data5 = [ 250, 175, 175, 225 ],
            data6 = [ 250, 175, 325, 225 ];

        //alert(data1[0]);

        // make line
        var line1 = makeLine(canvas, data1),
            line2 = makeLine(canvas, data2),
            line3 = makeLine(canvas, data3),
            line4 = makeLine(canvas, data4),
            line5 = makeLine(canvas, data5),
            line6 = makeLine(canvas, data6);

        // make label
        var label = ['1', '2', '3', '4', '5', '6', '7'];

        // make circle
        var circle1 = makeCircle(canvas, label[0], line1.get('x1'), line1.get('y1'), null, line1),
            circle2 = makeCircle(canvas, label[1], line1.get('x2'), line1.get('y2'), line1, line2, line5, line6),
            circle3 = makeCircle(canvas, label[2], line2.get('x2'), line2.get('y2'), line2, line3, line4),
            circle4 = makeCircle(canvas, label[3], line3.get('x2'), line3.get('y2'), line3),
            circle5 = makeCircle(canvas, label[4], line4.get('x2'), line4.get('y2'), line4),
            circle6 = makeCircle(canvas, label[5], line5.get('x2'), line5.get('y2'), line5),
            circle7 = makeCircle(canvas, label[6], line6.get('x2'), line6.get('y2'), line6);

        canvas.on('object:moving', function(e) {
            var p = e.target;

            p.line1 && p.line1.set({ 'x2': p.left, 'y2': p.top });
            p.line2 && p.line2.set({ 'x1': p.left, 'y1': p.top });
            p.line3 && p.line3.set({ 'x1': p.left, 'y1': p.top });
            p.line4 && p.line4.set({ 'x1': p.left, 'y1': p.top });

            p.myLabel && p.myLabel.set({ left: p.left, top: p.top });

            canvas.renderAll();
        });
    }

    function makeCircle(canvas, label, left, top, line1, line2, line3, line4) {

        // make label
        var label = makeText(left, top, label);

        var c = new fabric.Circle({
            left: left,
            top: top,
            strokeWidth: 5,
            radius: 20,
            fill: '#fff',
            stroke: '#666'
        });
        c.hasControls = c.hasBorders = false;

        c.line1 = line1;
        c.line2 = line2;
        c.line3 = line3;
        c.line4 = line4;
        c.myLabel = label;

        canvas.add(c);
        canvas.add(label);

        return c;
    }

    function makeLine(canvas, coords) {
        var line = new fabric.Line(coords, {
            fill: 'red',
            stroke: 'red',
            strokeWidth: 5,
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



</script>

</body>
</html>