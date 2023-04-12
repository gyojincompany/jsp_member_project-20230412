<%@page import="com.gyojincompany.test.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 성공</title>
</head>
<body>
	<%
		String mid = request.getParameter("id");
		String mpw = request.getParameter("pass");
		
		MemberDAO dao = new MemberDAO();
		
		int dbFlag = dao.loginCheck(mid, mpw);//로그인 성공시 1 반환, 실패시 0 반환
		
		if(dbFlag == 1) {
			session.setAttribute("sessionId", mid);
	%>
		<script type="text/javascript">
			alert('로그인 성공!');
		</script>
	<%
		} else {
	%>
		<script type="text/javascript">
			alert('로그인 실패!아이디 또는 비밀번호가 일치하지 않습니다.');
			history.back();
		</script>
	<%			
		}
	%>	
</body>
</html>