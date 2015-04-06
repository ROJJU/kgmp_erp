<%@ page language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="example_access_user" class="java.util.ArrayList" scope="application" />
<%
String msg = request.getParameter("msg") == null ? "" : (String)request.getParameter("msg");
System.out.println(msg);
if(msg.equals("브라우저종료")){
	//접속자삭제
	int remove_no = -1;
	for(int i=0;i<example_access_user.size();i++){
		Map map = (Map)example_access_user.get(i);
		String session_id = map.get("session_id")+"";
		if(session_id.equals(session.getId())) remove_no = i;
	}
	example_access_user.remove(remove_no);//제거

	if(session != null){
		session.invalidate();
	}
}else if(msg.equals("페이지이동")){
}else if(msg.equals("새로고침")){
}else{
}
%>
