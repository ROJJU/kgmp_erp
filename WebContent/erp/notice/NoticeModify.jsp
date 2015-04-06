<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="kgmp.common.beans.Notice, java.util.Map, java.util.*" %>
<jsp:useBean id="notice_dao" class="kgmp.common.dao.Notice_dao" scope="session"></jsp:useBean>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//선택 출력
int notice_seq = Integer.parseInt(request.getParameter("notice_seq"));
pageContext.setAttribute("n", notice_dao.getNotice(notice_seq));
%>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link type="text/css" rel="stylesheet" href="css/Editor.css">
		<link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
		<link type="text/css" rel="stylesheet" href="css/Notice_A.css">
		<link type="text/css" rel="stylesheet" href="css/jquery-te-1.4.0.css">
		<link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
		<script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
		<script type="text/javascript" src="js/jquery-te-1.4.0.min.js" charset="utf-8"></script>
		<script type="text/javascript">
		function formCheck() {
			var title = document.modify.title.value;
			var content = document.modify.content.value;
			
			if(title==null || title=="") {
				alert('제목을 입력하세요');
				return false;
			}
			if(content==null || content=="") {
				alert('내용을 입력하세요');
				return false;
			}
			if(confirm('글을 저장 하시겠습니까?'))
				document.modify.submit();
		}
		</script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"/>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
		<jsp:include page="../main/SideMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="noticeTitle"><h1>Notice</h1></div>
				</div>
				<div id = "noticeTable">
					<center>
					<form action="Notice_modify_proc.jsp" method="post" name="modify" enctype="multipart/form-data">
						<table>
							<tr>
								<th>제 목</th>
								<td><input type="text" class="box" value="${n.title}" name="title"></td>
							</tr>
							<tr>
								<th>첨 부</th>
								<td>
									<input type="file" name="n_file">
									 | 현재 등록 파일 : <b><font color="red">${n.n_file}</font> <a style="font-size:8px;">[파일 신규 선택 시 예전 파일은 삭제 됩니다.]</a></b>
									 <input type="hidden" name="old_file" value="${n.n_file}">
								</td>
							</tr>
							<tr>
								<th>내 용</th>
								<td>
									<textarea name="content" class="jqte-test">${n.content}</textarea>
									<input type="hidden" name="writer" value="${member_name}">
									<input type="hidden" name="notice_seq" value="${n.notice_seq}">
								</td>
							</tr>
						</table>
					</form>
						<div id="bottonPlace">
							<div id="bottons">
								<input type="image" src="img/list.png" width="50px" onClick="goUrl('NoticeView.jsp')">
								<input type="image" src="img/modify.png" width="50px" onClick="formCheck()">
							</div>
						</div>
					</center>
				</div>
			</div>
		</div>
		<jsp:include page="../main/Footer.html"/>
		<script>
			$('.jqte-test').jqte();
			// settings of status
			var jqteStatus = true;
			$(".status").click(function()
			{
				jqteStatus = jqteStatus ? false : true;
				$('.jqte-test').jqte({"status" : jqteStatus})
			});
		</script>
	</body>
</html>