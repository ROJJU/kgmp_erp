<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import="kgmp.common.beans.Message" %>
<jsp:useBean id="msg_dao" class="kgmp.common.dao.Message_dao"  scope="session"></jsp:useBean>
<%
int msg_seq=Integer.parseInt(request.getParameter("msg_seq"));
int state=Integer.parseInt(request.getParameter("state"));
pageContext.setAttribute("m", msg_dao.selectMsg(msg_seq));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Message</title>
<style type="text/css">
	#header{position:relatice; background-color:#1380D3; height:35px; color:#ffffff; }
	body{margin:0 auto; background-color:#F6F6F6; font-family:맑은 돋움; font-size:12px;}
	table{margin:0 auto; width:440px;}
</style>
<script type="text/javascript">
function popupAdd(writer_id){
	window.open("/kgmp/erp/main/MessageAdd.jsp?id="+writer_id,"Add","width=450px, height=470px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");
	window.close();
}
</script>
</head>
<body>
	<table>
		<tr id="header"><td>&nbsp;&nbsp;<input type="image" src="images/memo_icon2.gif">ㅣ<b>쪽지 내용 보기<%if(state==0){%>_받은쪽지<%}else if(state==1){%>_보낸쪽지<%} %></b></td></tr>
		<tr height="40px;" ><td style="border-bottom:dotted 1px grey;"><b>⊙ 보낸사람 : ${m.writer}</b></td></tr>
		<tr height="40px;"><td><b>⊙ 보낸시간 : ${m.add_date} ${m.add_time}</b></td></tr>
		<tr><td align="center"><textarea rows="17" cols="50">${m.content}</textarea></td></tr>
		<tr height="30px;">
			<td align="right">
				<%if(state==0){%><input type="button" value="확인처리" onclick="javaScript:location.href='Message_readCheck_proc.jsp?msg_seq=${m.msg_seq}'"><%}%>
				<input type="image" src="images/save.png" width="40px"/>
				<%if(state==0){%><input type="image" src="images/send.png" width="40px" onclick="popupAdd('${m.writer_id}')"/><%}%>
				<%if(state==0){%><input type="image" src="images/exit.png" width="40px" onclick="javaScript:window.close();"/><%}%>
				<%if(state==1){%><input type="image" src="images/del.png" width="40px" onclick="javaScript:location.href='Message_del_proc.jsp?msg_seq=${m.msg_seq}'"/><%}%>
			</td>
		</tr>
	</table>
</body>
</html>