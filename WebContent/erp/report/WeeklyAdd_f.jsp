<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/Weekly_A_F.css"/>
<title>K-GMP</title>
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
	function popup_wAdd_s(){
		opener.alert("추가 완료 되었습니다.");
		window.close();
	}
	</script>
</head>
	<body>
		<div id="wrap">
			<div id="body"  ><br/>
				<table align="center">
					<tr><th>일간업무 내용 적용시 (근무 업체/근무지)는 기본 값이 적용 됩니다.</th></tr>
					<tr><td align="center" style="background-color:#EAEAEA;"><input type="text">&nbsp;&nbsp;<input type="image" src="../hr/img/serch.png" width="44px"></td></tr>
				</table><br/>
				<table align="center">
					<tr>
						<th><input type="checkbox" id="all"/></th>
						<th width="40px">분류</th>
						<th>업무내용</th>
						<th width="30px">첨부</th>
						<th width="150px">일자</th>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
					<tr>
						<td align="center"><input type="checkbox" id="solo"/></td>
						<td align="center">내부</td>
						<td ><div class="ellipsis"  title="[CD] 디자인 개발 완료 및 일부 수정">&nbsp; [CD] 디자인 개발 완료ㅁㄴㅇㅁㄴㅇㄴㅁㅇ</div></td>
						<td align="center"><input type="image" src="img/icon_attach.gif"></td>
						<td>&nbsp; <select><option>월요일</option></select>&nbsp;2014.08.22</td>
					</tr>
				</table>
				<div id=box></div>
			</div>
			<div id="footer" align="right">
				<div id=buttons style="padding:7px;">
					<input type="image" src="../hr/img/add.png" width="40px" onclick="popup_wAdd_s();"/>
					<input type="image" src="../main/images/exit.png" width="40px"/>
				</div>
			</div>
		</div>
	</body>
</html>