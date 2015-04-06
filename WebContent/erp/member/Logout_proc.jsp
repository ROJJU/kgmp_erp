<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:useBean id="example_access_user" class="java.util.ArrayList" scope="application" />
<%
//접속자삭제
int remove_no = -1;
for(int i=0;i<example_access_user.size();i++){
	Map map = (Map)example_access_user.get(i);
	String session_id = map.get("session_id")+"";
	if(session_id.equals(session.getId())) remove_no = i;
}
example_access_user.remove(remove_no);//제거

session.invalidate();//세션 종료
out.println("<script>alert('로그아웃 되셨습니다.')</script>");
%>
<script>
	location.href='Login.jsp';
</script>