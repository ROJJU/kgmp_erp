<%@ page language="java" contentType="text/html; charset=UTF-8"    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Message, java.util.Map, java.util.List" %>
<jsp:useBean id="msg_dao" class="kgmp.common.dao.Message_dao" scope="session"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//설정
	request.setCharacterEncoding("utf-8");
	String linkURL = "MessageView_tap3.jsp";
	String send0=(String)session.getAttribute("member_id");
	String writer=(String)session.getAttribute("member_name");
	/*---------------------------------------받은쪽지------------------------------------------- */
	//현재페이지 설정
		int g_currentPage = 1;
		if(request.getParameter("currentPage") != null)
			g_currentPage = Integer.parseInt(request.getParameter("currentPage"));
	//페이징과 리스트 가져오기
		Map<String, Object> g_pageAll = msg_dao.saveMsgList(g_currentPage, linkURL, send0);
		String g_pageList = (String)g_pageAll.get("pageList");
		List<Message> g_list = (List<Message>)g_pageAll.get("list");
	//페이지속성 추가
		pageContext.setAttribute("g_list", g_list);
		pageContext.setAttribute("g_pageList", g_pageList);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="css/Msg.css"/>
<title>Message</title>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
	<script type="text/javascript">
		//채크박스 모두 선택 해제 
		$(document).ready(function(){
			$('#all').click(function(){
				if ($("#all").is(":checked")) { 
				$('input:checkbox[id^=solo]:not(checked)').attr("checked", true); 
				} else { 
				$('input:checkbox[id^=solo]:checked').attr("checked", false); 
				} 
					
			}); 
		});
		function popupRead(msg_seq, state){
			window.open("/kgmp/erp/main/MessageRead.jsp?msg_seq="+msg_seq+"&state="+state,"Read","width=450px, height=450px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");
		}
		
		function goTrash(msg_seq){
			alert('영구삭제 됩니다.');
			location.href='Message_del2_proc.jsp?msg_seq='+msg_seq;
		}
	</script>
	</head>
	<body>
		<div class="container">
<!--탭 START!!-->
			<hr/><h1>Simple Message</h1><hr/>
		    <ul class="tabs">
		        <li><a href="MessageView.jsp" >받은쪽지</a></li>
		        <li><a href="MessageView_tap2.jsp">보낸쪽지</a></li>
		        <li class="active"><a href="MessageView_tap3.jsp">보관함</a></li>
		        <li><a href="MessageView_tap4.jsp">휴지통</a></li>
		    </ul>
<!--탭 END!!-->	
		    <div class="tab_container">
<!--보관함 START!!-->
		        <div id="tab3" class="tab_content">
		            <center>${g_pageList}</center><br/>
					<table>
						<tr>
							<th><input type="checkbox" id="all"></th>
							<th>보낸사람</th>
							<th>내용</th>
							<th>보낸날짜</th>
							<th>상태</th>
							<th>관리</th>
						</tr>
					<c:forEach var="a" items="${g_list}">
						<tr>
							<td align="center"><input type="checkbox" id="solo"/></td>
							<td align="center" >${a.writer}</td>
							<td onClick="popupRead(${a.msg_seq}, 0)"  title="${a.content}"><div class="getMsg">&nbsp; ${a.content}</div></td>
							<td align="center">${a.add_date}</td>
							<td align="center">
								<c:if test="${a.msg_state==0}"><b style="color:red;">미확인</b></c:if>
								<c:if test="${a.msg_state==1}">${a.chk_date}(${a.chk_time})</c:if>
							</td>
							<td align="center"><a href=# onclick="goTrash(${a.msg_seq})" style="color:red;">영구삭제</a></td>
						</tr>
					</c:forEach>
					</table><br/>
					<hr style="border-color:#F6F6F6;"/>
		        </div>
<!--보관함 END!!-->
		    </div>
		</div>
		<div style="clear: both; display: block; padding: 10px 0; text-align:center;"><img src="/kgmp/erp/main/images/total_delIcon.gif" width="8px"/> 1주일이 지는 쪽지는 자동 삭제됩니다. 필요시 <a style="color:#F15F5F">보관함</a>을 이용하기 바랍니다.</div>
		<div id="footer" align="right">
			<div id="buttons" style="padding:8px;">
				<input type="image" src="/kgmp/erp/main/images/select_save.png" width="59px"/>
				<input type="image" src="/kgmp/erp/main/images/select_del.png" width="59px"/>
			</div>
		</div>
	</body>
</html>