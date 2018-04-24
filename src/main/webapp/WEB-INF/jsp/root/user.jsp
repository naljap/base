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
                <h3>Users</h3>
            </div>
        </div>

        <div class="clearfix"></div>
        <!--main row -->
	    <div class="row">
	        <div class="col-md-12">
	            <div class="x_panel">
	                <div class="x_title">
	                    <h2>Users <small>유저 리스트 확인 및 권한 설정</small></h2>
	                    <ul class="nav navbar-right panel_toolbox">
	                        <li class="li-float-right"><a class="collapse-link"><i class="fa fa-chevron-up"></i></a></li>
	                    </ul>
	                    <div class="clearfix"></div>
	                </div>
	                
	                <div class="x_content">

                        <table id="userTable" class="table table-striped table-bordered dt-responsive nowrap text-center" cellspacing="0" width="100%">
                            <thead>
                                <tr>
                                    <th>userid</th>
                                    <th>name</th>
                                    <th>firstname</th>
                                    <th>lastname</th>
                                    <th>displayname</th>
                                    <th>email</th>
                                    <th>role</th>
                                    <th>created</th>
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
                <p>변경 대상 유저 아이디 : <span id="editUserid" class="text-danger"></span></p>
                <select id="editSelectRole" class="form-control" name="role">
                    <option value="ROLE_USER">ROLE_USER</option>
                    <option value="ROLE_ADMIN">ROLE_ADMIN</option>
                    <option value="ROLE_ROOT">ROLE_ROOT</option>
                </select>
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
                <p>삭제 대상 유저 아이디 : <span id="deleteUserid" class="text-danger"></span></p>
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
function editUserModal(userid) {
    $("#editSelectRole").select2({ width: "100%" });
    $("#editUserid").html(userid);
    $("#editModal").modal("show");
}
function editUser() {
    $.ajax({
        type: "PUT",
        url: "/api/root/user/" + $("#editUserid").html() + "/role/" + $("#editSelectRole").val(),
        success: function(data) {
        	location.href = "/root/user";
        },
        error: function(data) {
            console.log(data);
        }
    });
}
function deleteUserModal(userid) {
	$("#deleteUserid").html(userid);
    $("#deleteModal").modal("show");
}
function deleteUser() {
    $.ajax({
        type: "DELETE",
        url: "/api/root/user/" + $("#deleteUserid").html(),
        success: function(data) {
        	location.href = "/root/user";
        },
        error: function(data) {
            console.log(data);
        }
    });
}

$( document ).ready(function() {
    var table = $('#userTable').DataTable({
        lengthMenu: [ 1, 2, 3, 10, 100 ],
        processing: true,
        ajax: {
            url: "/api/user",
            dataSrc: ""
        },
        columns: [
            { "data": "userid" },
            { "data": "name" },
            { "data": "firstname" },
            { "data": "lastname" },
            { "data": "displayname" },
            { "data": "email" },
            { "data": "role" },
            { "data": "created" },
            {
                "data": "userid",
                "render": function ( data, type, full, meta ) {
                    return '<button type="button" class="btn btn-info btn-xs" onclick="editUserModal(\'' + data + '\')"><span class="glyphicon glyphicon-edit" aria-hidden="true"></span></button>&nbsp;' +
                    '<button type="button" class="btn btn-danger btn-xs" onclick="deleteUserModal(\'' + data + '\')"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span></button>';
                }
            }
        ]
    });
});
</script>
</body>
</html>