<%@ page language="java" contentType="text/html;charset=euc-kr" %>
<%@ page import="java.util.*" %>

<jsp:useBean id="example_access_user" class="java.util.ArrayList" scope="application" />
<%  
//立加磊昏力
int remove_no = -1;
for(int i=0;i<example_access_user.size();i++){
	Map map = (Map)example_access_user.get(i);
	String session_id = map.get("session_id")+"";
	if(session_id.equals(session.getId())) remove_no = i;
}
example_access_user.remove(remove_no);//力芭

if(session != null){
	session.invalidate();
}
response.sendRedirect("access_user.jsp");
%>
