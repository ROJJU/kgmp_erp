<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<%@ page import=" java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<script type="text/javascript" src="../report/js/jquery-1.9.1.js"></script>
<script type="text/javascript">
function isYear(year){
	var pattern = new RegExp(/^[0-9]{4}/);
	return pattern.test(year);
}
function isMonth(month){
	var pattern = new RegExp(/^[0-9]{2}/);
	return pattern.test(month);
}
function isDay(day){
	var pattern = new RegExp(/^[0-9]{2}/);
	return pattern.test(day);
}
function isHiHour(hi_hour){
	var pattern = new RegExp(/^[0-9]{2}/);
	return pattern.test(hi_hour);
}
function isHiMin(hi_min){
	var pattern = new RegExp(/^[0-9]{2}/);
	return pattern.test(hi_min);
}
function isByeHour(bye_hour){
	var pattern = new RegExp(/^[0-9]{2}/);
	return pattern.test(bye_hour);
}
function isByeMin(bye_min){
	var pattern = new RegExp(/^[0-9]{2}/);
	return pattern.test(bye_min);
}
function formCheck() {
	/*입력 날자*/
	var year = document.getElementById("year").value;
	var month = document.getElementById("month").value;
	var day = document.getElementById("day").value;
	var check = document.getElementById("check_box").value;
	var add_date = year+"/"+month+"/"+day;
	/*출근*/
	var hi_hour = document.getElementById("hi_hour").value;
	var hi_min = document.getElementById("hi_min").value;
	var hi_work_time=hi_hour+":"+hi_min;
	var hi_work_sum =  year+"/"+month+"/"+day+hi_hour+":"+hi_min;
	var hi_sum = new Date(hi_work_sum).getTime();
	/*퇴근*/
	var bye_hour = document.getElementById("bye_hour").value;
	var bye_min = document.getElementById("bye_min").value;
	var bye_work_time=bye_hour+":"+bye_min;
	var bye_work_sum= bye_hour+bye_min;
	/*정규식 확인*/
	if(!isYear(year)){
		alert('입력 년도는 형식에 맞지 않습니다.');
		return false;
	}else if(!isMonth(month)){
		alert('입력 월은 형식에 맞지 않습니다. (입력 예 : 09)');
		return false;
	}else if(!isDay(day)){
		alert('입력 일은 형식에 맞지 않습니다. (입력 예 : 01)');
		return false;
	}else if(!isHiHour(hi_hour)){
		alert('입력 시간은 형식에 맞지 않습니다. (입력 예 : 01)');
		return false;
	}else if(!isHiMin(hi_min)){
		alert('입력 분은 형식에 맞지 않습니다. (입력 예 : 01)');
		return false;
	}else if(!isByeHour(bye_hour)){
		alert('입력 시간은 형식에 맞지 않습니다. (입력 예 : 01)');
		return false;
	}else if(!isByeMin(bye_min)){
		alert('입력 분은 형식에 맞지 않습니다. (입력 예 : 01)');
		return false;
	}else if(check==null||check==""){
		alert('중복 확인을 하셔야 합니다.');
		document.dl.date_chk_btn.focus();
		return false;
	}else if(month>12){
		alert('월 값은 12보다 클 수 없습니다.');
		return false;
	}else if(day>31){
		alert('일 값은 31보다 클 수 없습니다.');
		return false;
	}else if(hi_hour>bye_hour){
		alert('출근시간이 퇴근시간보다 클 수 없습니다.');
		return false;
	}else if(hi_hour>24||bye_hour>24){
		alert('시간 값은 24보다 클 수 없습니다.');
		return false;
	}else if(hi_min>=60||bye_min>=60){
		alert('분 값은 60보다 클 수 없습니다.');
		return false;
	}else{
		if(confirm('제출 하시겠습니까? 최종 제출된 서류는 수정 불가능 합니다.')){
		document.dl.add_date.value=add_date;
		document.dl.hi_work_sum.value=hi_sum;
		document.dl.hi_work_time.value=hi_work_time;
		document.dl.bye_work_sum.value=bye_work_sum;
		document.dl.bye_work_time.value=bye_work_time;
		/*서브밋*/
		document.dl.submit();
		}
	}
}
$(function(){
	$("#date_chk_btn").bind("click",function(){
		$txtYear = $("#year");
		$txtMonth = $("#month");
		$txtDay = $("#day");
		$txtId = $("#id");
		if(!isYear($txtYear.val())){
			alert('입력 년도는 형식에 맞지 않습니다.');
			return false;
		}else if(!isMonth($txtMonth.val())){
			alert('입력 월은 형식에 맞지 않습니다. (입력 예 : 09)');
			return false;
		}else if(!isDay($txtDay.val())){
			alert('입력 일은 형식에 맞지 않습니다. (입력 예 : 01)');
			return false;
		}else{
		window.open("DL_etc_date_check.jsp?id="+$txtId.val()+"&insert_year="+$txtYear.val()+"&insert_month="+$txtMonth.val()+"&insert_day="+$txtDay.val(),"date_check","width=350px, height=150px, left=600, top=370, location=no, toolbar=no, realzable=no");
		}
	});
});
</script>
<style type="text/css">
	#center{width:500px; margin:0 auto; background:#ffffff; padding:2px;}
	body{font-size:11px; background:#f5f6f7; margin:0 auto; height:100%;}
	th{background:#D5D5D5;}
	#footer{position:fixed; bottom:0px; width:100%; background-color:#BDBDBD; border-top:solid 1px grey;}
	select, input, img, input.type-radio{/* border: 0 none; */ vertical-align:middle;}
</style>
</head>
<body><br>
	<div id="center">
		<form action="DL_check_proc.jsp" method="post" name="dl">
		<center><h1>출 근 부</h1></center>
			<div align="right"><b>작성자</b> : ${member_name}&nbsp;</div><hr>
			<table width="500px">
				<tr>
					<th width="100px">날 자</th>
					<td width="300px"><input type="text"  name="insert_year" id="year" style="width:50px;" maxlength="4" placeholder="yyyy">년 <input type="text" name="insert_month" id="month" style="width:35px" maxlength="2" placeholder="mm">월 <input type="text" name="insert_day" id="day" style="width:35px" maxlength="2" placeholder="dd">일
						&nbsp;<input type="button" value="중복확인" style="font-size:11px;" id="date_chk_btn" name="date_chk_btn"><input type="hidden" name="check_box" id="check_box">
					</td>
					<td><a style="color:grey;">* 작성요령 : 2014년09월24일</a></td>
				</tr>
				<tr>
					<th>출 근</th>
					<td><input type="text" name="hi_work_hour" id="hi_hour" style="width:50px;" maxlength="2" placeholder="HH">시 <input type="text" name="hi_work_min" id="hi_min" style="width:50px;" maxlength="2" placeholder="MM">분</td>
					<td><a style="color:grey;">* 작성요령 : 00시 00분</a></td>
				</tr>
				<tr >
					<th>퇴 근</th>
					<td><input type="text" name="bye_work_hour" id="bye_hour" style="width:50px;" maxlength="2" placeholder="HH">시 <input type="text" name="bye_work_min" id="bye_min" style="width:50px;" maxlength="2" placeholder="MM">분</td>
					<td><a style="color:grey;">* 작성요령 : 00시 00분</a></td>
				</tr>
				<tr>
					<th height="25px">분 류</th>
					<td>
						출장 <input type="radio" name="state" value="2"> | 외근 <input type="radio" name="state" value="4"> | 기타 <input type="radio" name="state" value="6">
					</td>
				</tr>
				<tr>
					<th>사 유</th>
					<td colspan="2"><textarea rows="10" cols="60" name="excuse"></textarea></td>
				</tr>
				<tr>
					<td align="center" colspan="3"><a style="color:red; font-size:9px;">작성 내용이 사실이 아닐 경우 회사 방침에 따른 징계가 생길 수 있습니다.</a></td>
				</tr>
			</table><hr><br>
				<input type="hidden"  value ="${member_id}" name="id" id="id">
			 	<input type="hidden" name="add_date">
				<input type="hidden"  name="hi_work_time">
				<input type="hidden"  name="hi_work_sum">
				<input type="hidden"  name="bye_work_time">
				<input type="hidden" name="bye_work_sum">
				<input type="hidden" name="etc" value="1">
				<input type="hidden" name="biz_trip" value="1">
				<input type="hidden" name="total_work_check" value="1">
		</form>
	</div>
	<div id="footer" align="right">
		<input type="button" onclick="formCheck()" value="제출">&nbsp;
	</div>
</body>
</html>