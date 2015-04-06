<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
		<link type="text/css" rel="stylesheet" href="css/Editor.css">
		<link type="text/css" rel="stylesheet" href="css/Notice_A.css">
		<link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
		<link type="text/css" rel="stylesheet" href="css/jquery-te-1.4.0.css">
		<script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
		<script type="text/javascript" src="js/jquery-te-1.4.0.min.js" charset="utf-8"></script>
		<script type="text/javascript">
		function formCheck(){
			var title = document.notice.title.value;
			var content = document.notice.content.value;
			
			if(title==null || title=="") {
				alert('제목을 입력하세요');
				return false;
			}
			if(content==null || content==""){
				alert('내용을 입력하세요');
				return false;
			}
			if(confirm('글을 저장 하시겠습니까?'))
				document.notice.submit();
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
					<form action="Notice_add_proc.jsp" method="post" name="notice" enctype="multipart/form-data">
						<table>
							<tr>
								<th>제 목</th><td><input type="text" class="box" name="title"><input type="hidden" value="${member_name}" name="writer"></td>
							</tr>
							<tr>
								<th>첨 부</th><td><input type="file" name="n_file"></td>
							</tr>
							<tr>
								<th>내 용</th>
								<td><textarea name="content" class="jqte-test"></textarea></td>
							</tr>
						</table>
					</form>
						<div id="bottonPlace">
							<div id="bottons">
								<input type="image" src="img/list.png" width="50px" onclick="goUrl('NoticeView.jsp')">
								<input type="image" src="img/Write.png" width="50px" onclick="formCheck()">
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