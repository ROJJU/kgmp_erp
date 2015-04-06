<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<jsp:useBean id="msg_dao" class="kgmp.common.dao.Message_dao"  scope="session"></jsp:useBean>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
/*이름 받아오기*/
String writer = (String)session.getAttribute("member_id");
pageContext.setAttribute("m", msg_dao.newMsg(writer));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>K-GMP</title>
<script type="text/javascript">
function popupMsgAdd(msg_seq, writer_id){
	window.open("/kgmp/erp/main/MessageAdd.jsp?id="+writer_id,"MsgAdd","width=450px, height=470px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");
	location.href="/kgmp/erp/main/Message_off_proc.jsp?msg_seq="+msg_seq;
	window.close();
}
function popupMenu(msg_seq){
	window.open("/kgmp/erp/main/MessageView.jsp","msg","width=650px, height=650px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
	location.href="/kgmp/erp/main/Message_off_proc.jsp?msg_seq="+msg_seq;
	window.close();
}
function popupOff(msg_seq){
	alert('알림이 종료되며 창은 유지됩니다.');
	window.open("/kgmp/erp/main/Message_off_proc.jsp?msg_seq="+msg_seq,"msg_off","width=1px, height=1px, left=0px, top=0px, location=no, toolbar=no, realzable=no scrollbars = yes");
}
function popupClose(msg_seq){
	alert('알림이 종료되며 창이 닫힙니다.');
	location.href="/kgmp/erp/main/Message_off_proc.jsp?msg_seq="+msg_seq;
}
</script>
<style type="text/css">
	body{background-color:#EAEAEA; margin:0 auto;}
	table{border-collapse:collapse;}
	#header{position: relative; background-color:grey; width:100%; height:20px;}
	#container{position: relative;}
	#contents{border:1px solid grey; margin:0 auto; width:280px; padding:10px;}
	#footer{position: relative; background-color:grey; width:100%; height:20px;}
	.font{font-family:맑은 고딕; font-size:11px;padding:5px;}
	.font2{font-family:맑은 고딕; font-size:12px; color:#ffffff;}
</style>
</head>
<body>
	<div id="header" class="font2">&nbsp;도착한 메세지가 있습니다_${m.add_date}_${m.add_time}&nbsp;<img src="/kgmp/erp/main/images/icon_new.gif"></div><br>
	<div id="container">
		<div id="contents">
			<table>
				<tr style="border-bottom:#EAEAEA 3px solid;" align="center">
					<td class="font" style="background-color:#ffffff; border-right:1px grey solid;">작성자</td>
					<td style="background-color:#ffffff;" width="175px"><input type="text" style="border:none; font-family:맑은 고딕; font-size:11px; width:160px" value="${m.writer}" readonly></td>
					<td rowspan="3" style="background-color:#5D5D5D; border-left:4px solid #EAEAEA; cursor:pointer; cursor:hand;" class="font2" width="50px" align="center" onclick="popupMsgAdd(${m.msg_seq},'${m.writer_id}')">답장</td>
				</tr>
				<tr>
					<td class="font" style="background-color:#ffffff; border-right:1px grey solid;">내용</td>
					<td style="background-color:#ffffff;">&nbsp;<textarea style="border:none; font-family:맑은 고딕; font-size:11px; width:160px; height:100px;" readonly>${m.content}</textarea></td>
				</tr>
			</table><br>
			<table align="center">
				<tr>
					<td><input type="button" value="메세지함 확인" onclick="popupMenu(${m.msg_seq});">&nbsp;&nbsp;&nbsp;<input type="button" value="알림 끄기" onclick="popupOff(${m.msg_seq});">&nbsp;&nbsp;&nbsp;<input type="button" value="닫기" onclick="popupClose(${m.msg_seq});"></td>
				</tr>
			</table>
		</div>
	</div>
	<br><div id="footer" class="font2" align="right">K-GMP&nbsp;</div>
</body>
</html>