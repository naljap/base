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
                <h3>Pattern1</h3>
            </div>
        </div>

        <div class="clearfix"></div>
        <!--main row -->
	    <div class="row">
	        <div class="col-md-12">
	            <div class="x_panel">
	                <div class="x_title">
	                    <h2>Pattern1 - Restful CRUD, 로깅 </h2>
	                    <ul class="nav navbar-right panel_toolbox">
	                        <li class="li-float-right"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
	                    </ul>
	                    <div class="clearfix"></div>
	                </div>
	                
	                <div class="x_content">

                        <table id="sampleTable" class="table table-striped table-bordered dt-responsive nowrap text-center" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>id</th>
                                    <th>strcol1</th>
                                    <th>strcol2</th>
                                    <th>strcol3</th>
                                    <th>strcol4</th>
                                    <th>strcol5</th>
                                    <th>CONTROL</th>
                                </tr>
                            </thead>
                        </table>
	                </div>
	            </div>
	        </div>
        </div>
        <!--/main row -->
    </div>
</div>
<!-- /page content -->

<div id="editModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">권한 변경</h4>
            </div>
            <div class="modal-body">

                <form id="sampleForm" class="form-horizontal form-label-left">

                    <p>변경 대상 유저 아이디 : <span id="editId" class="text-danger"></span></p>

                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">strcol1</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                            <input id="strcol1" type="text" class="form-control" data-inputmask="'max': '999-999'">
                            <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-md-3 col-sm-3 col-xs-3">strcol2 (저장안됨)</label>
                        <div class="col-md-9 col-sm-9 col-xs-9">
                            <input id="strcol2" type="text" class="form-control" data-inputmask="'mask' : '(999) 999-9999'">
                            <span class="fa fa-user form-control-feedback right" aria-hidden="true"></span>
                        </div>
                    </div>

                </form>

            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-primary" onclick="editUser()">Save changes</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<div id="deleteModal" class="modal fade" role="dialog">
    <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">유저 삭제</h4>
            </div>
            <div class="modal-body">
                <p>삭제 대상 유저 아이디 : <span id="deleteId" class="text-danger"></span></p>
                <div class="alert alert-warning" role="alert">유저를 삭제합니다!</div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                <button type="button" class="btn btn-danger" onclick="deleteUser()">Delete User</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<%@ include file="../include/footer.jsp" %>

<script>

function editUserModal(id) {
    $("#editId").html(id);
    $("#editModal").modal("show");
}

function editUser() {

    $.ajax({
        type: "PUT",
        dataType: "json",
        contentType: "application/json",
        url: "/api/pattern1/" + $("#editId").html(),
        data: JSON.stringify({
            strcol1 : $("#strcol1").val(),
            strcol2 : $("#strcol2").val()
        }),
        success: function(data) {
        	location.href = "/pattern/pattern1";
        },
        error: function(data) {
            console.log(data);
        }
    });
}

function deleteUserModal(id) {
	$("#deleteId").html(id);
    $("#deleteModal").modal("show");
}

function deleteUser() {
    $.ajax({
        type: "DELETE",
        url: "/api/pattern1/" + $("#deleteId").html(),
        success: function(data) {
        	location.href = "/pattern/pattern1";
        },
        error: function(data) {
            console.log(data);
        }
    });
}

$( document ).ready(function() {
    var table = $('#sampleTable').DataTable({
        lengthMenu: [ 5, 10, 100 ],
        processing: true,
        ajax: {
            url: "/api/pattern1",
            dataSrc: ""
        },
        columns: [
            { "data": "id" },
            { "data": "strcol1" },
            { "data": "strcol2" },
            { "data": "strcol3" },
            { "data": "strcol4" },
            { "data": "strcol5" },
            {
                "data": "id",
                "render": function ( data, type, full, meta ) {
                    return '<button type="button" class="btn btn-info btn-xs" onclick="editUserModal(' + data + ')"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></button>&nbsp;' +
                    '<button type="button" class="btn btn-danger btn-xs" onclick="deleteUserModal(' + data + ')"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button>';
                }
            }
        ]
    });
});
</script>
</body>
</html>