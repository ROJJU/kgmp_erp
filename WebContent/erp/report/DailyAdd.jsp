<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<link type="text/css" rel="stylesheet" href="../notice/css/Editor.css">
		<link rel="stylesheet" type="text/css" href="../main/css/Side.css"/>
		<link type="text/css" href="../main/css/BasicBody.css" rel="stylesheet" />
		<link type="text/css" rel="stylesheet" href="../notice/css/jquery-te-1.4.0.css">
		<link type="text/css" rel="stylesheet" href="css/Daily_A.css">
		<script type="text/javascript" src="http://code.jquery.com/jquery.min.js" charset="utf-8"></script>
		<script type="text/javascript" src="../notice/js/jquery-te-1.4.0.min.js" charset="utf-8"></script>
		<script type="text/javascript">
		function sendCheck(){
			var sending = document.daily.sending.value;
			var setting ="전달자 미 선택 시 본인만 열람 가능";
			if(sending==setting){
				alert('전달자를 먼저 선택해 주시기 바랍니다');
				document.daily.title.value="";
			}
		}
		 function fCheck(){
			var title = document.daily.title.value;
			var content = document.daily.content.value;
			if(title==null || title=="") {
				alert('제목을 입력하세요');
				return false;
			}else if(content==null || content=="") {
				alert('내용을 입력하세요');
				return false;
			}else{
				if(confirm('글을 저장 하시겠습니까?'))
					document.daily.submit();
			}
		}
		function popupSearch(){
			window.open("/kgmp/erp/main/MessageSearch.jsp","Search","width=450px, height=470px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");
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
					<div id ="pageTitle"><h1>DailyReport</h1></div>
				</div>
				<div id = "bodyTable">
					<center>
					<form action="Daily_add_proc.jsp" method="post" name="daily" enctype="multipart/form-data">
						<table>
							<tr>
								<td colspan="4" align="right">
									<a style="vertical-align:middle;">* 작성자 :</a>
									<input type="text" name="writer" style="border:none; width:40px; background:none; font-size:11px; " value="${member_name}"  readonly>
								</td>
							</tr>
							<tr>
								<th>제 목</th><td colspan="3"><input type="text" class="box" name="title" placeholder="&nbsp;서류명_작성일자_작성자" maxlength="33" onkeyup="javaScript:sendCheck()"></td>
							</tr>
							<tr>
								<th>첨 부</th><td><input type="file" name="file"></td>
								<th>구 분</th>
								<td align="center">
									<select name="type">
										<option value="1">내부업무</option>
										<option value="2">외부업무</option>
									</select>
								</td>
							</tr>
							<tr>
								<th>전달</th>
								<td colspan="3">
									<input type="hidden" name="id" value="${member_id}">
									<input type="button" width="20px" onClick="popupSearch()" value="?">
									<%
										if(request.getParameterValues("check")!=null){
											String [] chkbox=request.getParameterValues("check");
											for(int i=0; i<chkbox.length; i++){
												%>
												<input type="text" class="input" name="send<%=i%>" value="<%=chkbox[i]%>">|
												<%
											}
										}else{
											%>
											<input type="text" class="input" name="sending" style="width:300px; color:red;" value="전달자 미 선택 시 본인만 열람 가능">|
											<%
										}
									%>
								</td>
							</tr>
							<tr>
								<th>내 용</th>
								<td colspan="3"><textarea name="content" class="jqte-test"></textarea></td>
							</tr>
						</table>
						</form>
						<div id="bottonPlace">
							<div id="bottons">
								<input type="image" src="../notice/img/list.png" width="50px" onClick="goUrl('DailyView.jsp')">
								<input type="image" src="img/report.png" width="50px" onClick="fCheck()">
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