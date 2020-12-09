<%@page import="com.bit.utils.emaillist.dao.EmaillistDaoOrcl"%>
<%@page import="com.bit.utils.emaillist.dao.EmaillistDao"%>
<%@page import="com.bit.utils.emaillist.vo.EmaillistVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 요청 정보로부터 파라미터 추출
String lastName = request.getParameter("ln");
String firstName = request.getParameter("fn");
String email = request.getParameter("email");
// DTO 객체 생성
EmaillistVo vo = new EmaillistVo();
// 필드 세팅
vo.setLastName(lastName);
vo.setFirstName(firstName);
vo.setEmail(email);
// DAO 객체 생성
EmaillistDao dao = new EmaillistDaoOrcl();
dao.insert(vo);
// REDIRECT
// 30x 응답 : 브라우저에게 요청 완료를 위해 새 페이지로 접속해줄 것을 요청
response.sendRedirect(request.getContextPath() + "/emaillist/");
%>
8:24
-
-
-
-
-
-
-
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Cookie Test</h1>
	<h3>Add/Edit Cookie</h3>
	
	<%
	// CookieTestServlet 에서 설정한 attribute "example" 받아오기
	String cookieValue = (String) request.getAttribute("example");
	if (cookieValue == null) cookieValue = "";
	%>
	
	<!-- 서버에 값을 전송하고 example 이라는 이름의 쿠키를 생성 -->
	<form method="POST"
		action="<%= request.getContextPath() %>/cookies">
		<input type="text" name="example" value="<%= cookieValue %>" />
		<input type="submit" value="쿠키 설정" />
	</form>
	
	<h3>Delete Cookie</h3>
	<a href="<%= request.getContextPath() %>/cookies?a=delete">쿠키 삭제</a>
</body>
</html>