<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Notice" %>
<jsp:useBean id="notice_dao" class="kgmp.common.dao.Notice_dao" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//print select
int notice_seq = Integer.parseInt(request.getParameter("notice_seq"));
pageContext.setAttribute("n", notice_dao.getNotice(notice_seq));
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	    <link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
	    <link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
	    <link rel="stylesheet" type="text/css" href="css/Notice_R.css"/>
	    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="noticeTitle"><h1 style="font-size:33px;margin:15px 0;font-family:Verdana, Arial, sans-serif">Notice</h1></div>
				</div>
				<div id = "tablePlace2">
						<table width="700px">
							<tr>
								<th width="50px">제 목</th><td width="340px"><img src="../main/images/icon_n.png" width="25px">&nbsp;&nbsp;${n.title}</td>
								<th>작성자</th>	<td>${n.writer}</td>
								<th>조회수</th>	<td>${n.hit}</td>
							</tr>
							<tr>
								<th>첨 부</th>
								<td>
									<form action="Download_n.jsp" method="post" name="down">
										<a href="javaScript:document.down.submit();">${n.n_file}</a>
										<c:if test="${n.n_file==null}"><a style="color:red;">첨부된 파일이 없습니다.</a></c:if>
										<input type="hidden" name="n_file" value="${n.n_file}">
									</form>
								</td>
							</tr>
							<tr>
								<th height="330px">내 용</th><td colspan="5" style="background-color:#FFFFFF;"><div style="overflow:scroll; height:325px; width:625px;">${n.content}</div></td>
							</tr>
						</table>
					<center>
						<div id="bottonPlace">
							<div id="bottons">
								<input type="image" src="img/list.png" width="50px" onclick="goUrl('NoticeView.jsp')">
								<input type="image" src="img/modify.png" width="50px" onclick="goUrl('NoticeModify.jsp?notice_seq=${n.notice_seq}')">
								<input type="image" src="img/del.png" width="50px" onclick="goUrl('Notice_del_proc.jsp?notice_seq=${n.notice_seq}&file=${n.n_file}')">
							</div>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>