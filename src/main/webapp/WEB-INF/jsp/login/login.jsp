<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" href="/images/favicon.ico">
<title>OSINFRA</title>
<link rel="stylesheet" href="/webjars/gentelella/1.3.0/vendors/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet" href="/webjars/gentelella/1.3.0/vendors/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="/webjars/gentelella/1.3.0/build/css/custom.min.css">
</head>
<body class="login">
    <div>
        <c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
            <div class="alert alert-danger text-center" role="alert">
                <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}"/>
            </div>
        </c:if>
        <div class="login_wrapper">
            <div class="animate form login_form">
                <section class="login_content">
                    <form action="/login" method="POST">
                        <h1>Login Form</h1>
                        <div>
                            <input type="text" id="userid" name="userid" class="form-control" placeholder="AD ID" value="root" required autofocus>
                        </div>
                        <div>
                            <input type="password" id="password" name="password" class="form-control" placeholder="Password" value="root" required>
                        </div>
                        <div>
                            <button type="submit" id="login_submit" class="btn btn-block btn-default">Sign in</button>
                        </div>

	                    <div class="clearfix"></div>
	                    <div class="separator">
	                        <p class="change_link">원스토어 AD 계정으로 로그인 하세요.</p>
	                        <div class="clearfix"></div>
	                        <br>
	                        <div>
	                            <h1><i class="fa fa-thumbs-o-up"></i> ONE store INFRA</h1>
	                            <p>©Team. IT Infra.</p>
	                        </div>
	                    </div>
                    </form>
                </section>
            </div>
        </div>
    </div>
<script>
/*
	$( document ).ready(function() {
		//
	});
*/
</script>
</body>
</html>