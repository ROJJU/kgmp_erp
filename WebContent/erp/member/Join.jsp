<%@ page language="java" contentType="text/html; charset=utf-8"   pageEncoding="utf-8"%>
<%@ page import="java.util.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
//setting calendar
Calendar cal =Calendar.getInstance(); 

int nowYear = cal.get(Calendar.YEAR);
int nowMonth = cal.get(Calendar.MONTH)+1; // +1
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" type="text/css" href="../main/css/Table.css"/>
<title>K-GMP</title>
<style type="text/css">
	body{margin:0 auto; font-family:맑은 고딕; font-size:12px; background:#f5f6f7;}
	#footer{position:fixed; bottom:0px; background:grey; width:100%;}
</style>
<script src="../report/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
$(function(){  /* 비밀번호 동일 확인 */
	$("#pw_2").bind("keyup",function(){
		var pw1 = $("#pw_1").val();
		var pw2 = $("#pw_2").val();
		var txt = "";
		if(pw1 == pw2){
			$("#lbl_pw_check").css("color","blue");
			txt = "두 암호가 일치합니다.";
		}else{
			$("#lbl_pw_check").css("color","red");
			txt = "두 암호가 일치하지 않습니다.";
		}
		$("#lbl_pw_check").text(txt);
	});
	$("#pw_1").bind("keyup",function(){
		var pw1 = $("#pw_1").val();
		var pw2 = $("#pw_2").val();
		var txt = "";
		if(pw1 == pw2){
			$("#lbl_pw_check").css("color","blue");
			txt = "두 암호가 일치합니다.";
		}else{
			$("#lbl_pw_check").css("color","red");
			txt = "두 암호가 일치하지 않습니다.";
		}
		$("#lbl_pw_check").text(txt);
	});
	
	$("#id_chk_btn").bind("click",function(){
		$txtid = $("#id");
		if($txtid.val()==null|$txtid.val()==""){
			alert('ID를 입력하세요');
			return false;
		}else{
		window.open("IDCheck.jsp?id=" + $txtid.val(),"id_check","width=350px, height=150px, left=600, top=370, location=no, toolbar=no, realzable=no");
		}
	});
});

function isEmp_pic(emp_pic){
	var pattern = new RegExp(/^[^ㄱ-ㅣ가-힣]+$/);
	return pattern.test(emp_pic);
}

function formCheck() {
	var department = document.forms[0].department.value;
	var kor_name = document.forms[0].kor_name.value;
	var cha_name = document.forms[0].cha_name.value;
	var eng_name = document.forms[0].eng_name.value;
	var address = document.forms[0].address.value;
	var phone1 = document.forms[0].phone1.value;
	var phone2 = document.forms[0].phone2.value;
	var phone3 = document.forms[0].phone3.value;
	var cell_phone1 = document.forms[0].cell_phone1.value;
	var cell_phone2 = document.forms[0].cell_phone2.value;
	var cell_phone3 = document.forms[0].cell_phone3.value;
	var email1 = document.forms[0].email1.value;
	var email2 = document.forms[0].email2.value;
	var emp_pic = document.forms[0].emp_pic.value;
	var id = document.forms[0].id.value;
	var pw1 = document.forms[0].pw_1.value;
	var pw2 = document.forms[0].pw.value;
	var check = document.forms[0].check_pw.value;
	
	if(department==null || department=="") {
		alert('부서명을 입력하세요');
		document.forms[0].department.focus();
		return false;
	}
	if(kor_name==null || kor_name==""){
		alert('국문 성명을 입력하세요');
		document.forms[0].kor_name.focus();
		return false;
	}
	if(cha_name==null || cha_name==""){
		alert('한문 성명을 입력하세요');
		document.forms[0].cha_name.focus();
		return false;
	}
	if(eng_name==null || eng_name==""){
		alert('영문 성명을 입력하세요');
		document.forms[0].eng_name.focus();
		return false;
	}
	if(address==null || address==""){
		alert('주소를 입력하세요');
		document.forms[0].address.focus();
		return false;
	}
	if(phone1==null || phone1==""||phone2==null || phone2==""||phone3==null || phone3==""){
		alert('전화번호를 입력하세요');
		document.forms[0].phone1.focus();
		return false;
	}
	if(cell_phone1==null || cell_phone1==""||cell_phone2==null || cell_phone2==""||cell_phone3==null || cell_phone3==""){
		alert('핸드폰 번호를 입력하세요');
		document.forms[0].cell_phone1.focus();
		return false;
	}
	if(email1==null || email1==""||email2==null || email2==""){
		alert('E-MAIL 주소를 입력하세요');
		document.forms[0].email1.focus();
		return false;
	}
	if(!isEmp_pic(emp_pic)){
		alert('파일명에 한글이 포함될 수 없습니다.');
		return false;
	}
	if(emp_pic==null || emp_pic==""){
		alert('증명사진을 등록 하세요');
		document.forms[0].emp_pic.focus();
		return false;
	}
	if(id==null || id==""){
		alert('ID를 입력하세요');
		document.forms[0].id.focus();
		return false;
	}
	if(pw2==null || pw2==""){
		alert('PW를 입력하세요');
		document.forms[0].pw_2.focus();
		return false;
	}
	if(pw1!=pw2){
		alert('PW가 다릅니다 다시 확인해 주세요');
		document.forms[0].pw_1.focus();
		return false;
	}
	if(check==null || check==""){
		alert('중복확인을 하세요');
		document.forms[0].id_chk_btn.focus();
		return false;
	}
	if(confirm('저장 하시겠습니까?'))
		document.forms[0].submit();
}
</script>
</head>
<body>
	<center>
	<hr><img src="/kgmp/erp/main/images/logo.gif"  width="200px"/><hr>
<br/><p align="left" >&nbsp;&nbsp;&nbsp;<a style="color:red;">*</a> 사원정보</p>
	<form action="Join_proc.jsp" method="post" enctype="multipart/form-data">
		<table width="600px">
			<tr>
				<th width="60px">보 직</th>
				<td width="360px">
					<input type="text" name="department" placeholder="&nbsp;부서명">
					<select name="emp_type">
						<option value="신입">신입</option>
						<option value="경력">경력</option>
					</select>
					<select name="work_type">
						<option value="정규직">정규직</option>
						<option value="계약직">계약직</option>
						<option value="인턴직">인턴직</option>
						<option value="파견직">파견직</option>
						<option value="시간제/일용직">시간제/일용직</option>
						<option value="프리랜서">프리랜서</option>
						<option value="병역특례">병역특례</option>
					</select>
				</td>
				<th width="60px">직 책</th>
				<td width="40px">
					<select name="w_level">
						<option value="인턴">인턴</option>
						<option value="수습">수습</option>
						<option value="사원">사원</option>
						<option value="대리">대리</option>
						<option value="팀장">팀장</option>
						<option value="과장">과장</option>
						<option value="부장">부장</option>
						<option value="대표">대표</option>
					</select>
				</td>
			</tr>
		</table>
	<br/><p align="left">&nbsp;&nbsp;&nbsp;<a style="color:red;">*</a> 기본정보</p>
		<table width="600px">
				<tr>
					<th width="60px">이 름</th><td>한글 <input type="text" size="9px" name="kor_name">&nbsp; | 한문 <input type="text" size="9px" name="cha_name">&nbsp; | 영문 <input type="text" size="9px" name="eng_name"></td>
				</tr>
				<tr>
					<th>주 소</th><td ><input type="text" size="63px" name="address"></td>
				</tr>
				<tr>
					<th>전화번호</th><td ><input type="text" style="width:30px;" name="phone1"> - <input type="text" style="width:30px;" name="phone2"> - <input type="text" style="width:30px;" name="phone3"></td>
				</tr>
				<tr><th>휴대폰</th><td><select name="cell_phone1"><option value="010">010</option><option value="017">017</option><option value="018">018</option></select> - <input type="text" style="width:30px;" name="cell_phone2"> - <input type="text" style="width:30px;" name="cell_phone3"></td></tr>
				<tr>
				</tr>
				<tr>
					<th>이메일</th><td><input type="text" style="width:50px;" name="email1"> @ <input type="text" style="width:100px;" name="email2"></td>
				</tr>
				<tr>
					<th>사 진</th><td><input type="file" name="emp_pic"><a style="color:red;"> * 파일명은 영문,숫자만 업로드 가능합니다!!! * </a></td>
				</tr>
		</table>
<br/><p align="left">&nbsp;&nbsp;&nbsp;<a style="color:red;">*</a> 회원정보</p>
		<table width="600px">
				<tr>
					<th width="60px">아이디</th><td><input type="text" name="id" id="id"></td><td align="left" width=400px><input type="button" value="중복확인" id="id_chk_btn"><input type="hidden" id="check_pw"></td>
				</tr>
				<tr>
					<th width="60px">비밀번호</th><td><input type="password" id="pw_1"></td><td id="check" width="400px" align="left"></td>
				</tr>
				<tr>
					<th width="60px">비밀번호<br>확 &nbsp;&nbsp;&nbsp;&nbsp;인</th>
					<td><input type="password" id="pw_2" onkeypress="pwCheck()" name="pw"></td>
					<td width="400px" align="left">
						<label id="lbl_pw_check" ></label>
						<input type="hidden" value="<%=nowYear%>" name="vacation_year">
						<input type="hidden" value="<%=nowMonth%>" name="vacation_month">
					</td>
				</tr>
		</table>
	</form>
	</center>
	<div id="box" style="height:80px;"></div>
	<div id="footer" align="right"><input type="button" value="save" onclick="formCheck();" style="cursor:hand; cursor:pointer; margin:5px;"></div>
</body>
</html>