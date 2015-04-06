<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/Weekly_A_S.js"></script>
<link rel="stylesheet" type="text/css" href="css/Weekly_A_S.css"/>
</head>
	<body>
		<div id="wrap">
			<div id="body"><br/>
			<form action="WeeklyRead.jsp" method="get" onSubmit="return false" name="weekly">
<!--주간업무 start!!-->
				<table align="center" id="wAdd">
					<tr><td style="border:none;" colspan="7" >[ <input type="text" placeholder="07월02 " style="border:0; background-color:#f5f6f7; width:40px;"> ] 주차</td></tr>
					<tr>
						<td colspan="8" style="border:none;">
							<b style="font-size:20px;">주간 업무 추가</b>
							<input type="text" id="str" name="str" value="0" style="border:0; width:20px; text-align:center;" readonly >&nbsp;
			   				<input type="image" src="img/link.png" id="wAddRow" width="12px" onclick="clicked()" style="padding:0px 560px 0px 0px;"/>
							<a style="color:red;">*&nbsp;</a>정보를 입력하지 않을 경우 기본값이 적용 됩니다.
						</td>
					</tr>
					<tr>
						<th>삭제</th>
						<th width="40px">분류</th>
						<th>파견근무업체</th>
						<th>파견근무지</th>
						<th>업무내용</th>
						<th width="180px">일자</th>
						<th>외부업무</th>
						<th>첨부</th>
					</tr>
					<tr>
						<td></td>
						<td align="center"><input type="text"  placeholder="내부" style="width:30px; text-align:center;" name="group0"/></td>
						<td align="center"><input type="text" placeholder="본사" style="width:50px; text-align:center;" name="company0"/></td>
						<td align="center"><input type="text" placeholder="성균관대산학협력센터" style="width:130px; text-align:center;" name="work0"/></td>
						<td align="center"><input type="text" placeholder="업무내용" style="width=130px; text-align:center;" name="content0"></td>
						<td align="center">&nbsp;
							<select name="week0">
							 	<option value="mon">월요일</option>
							 	<option value="tue">화요일</option>
							 	<option value="wed">수요일</option>
							 	<option value="thu">목요일</option>
							 	<option value="fir">금요일</option>
						 	</select>
						 	<input type="text" placeholder="yyyy.mm.dd" style="width:80px; text-align:center;" name="date0">
					 	</td>
						<td align="center"><input type="checkbox" name="bz_trip0"></td>
						<td align="center" ><input type="file"  name="add0"></td>
					</tr>
				</table><br><br>
<!--주간업무 end!!!-->
<!--차주업무 start!!!-->
				<table align="center" id="nwAdd">
					<tr>
						<td colspan="8" style="border:none;">
							<b style="font-size:20px;">차주 업무 추가</b>
							<input type="text" id="str2" value="1" style="border:0; width:20px; text-align:center;" readonly>&nbsp;
			   				<input type="image" src="img/link.png" id="nwAddRow" width="12px" onClick="clicked()" style="padding:0px 560px 0px 0px;"/>
							<a style="color:red;">*&nbsp;</a>정보를 입력하지 않을 경우 기본값이 적용 됩니다.
						</td>
					</tr>
					<tr>
						<th>삭제</th>
						<th width="40px">분류</th>
						<th>파견근무업체</th>
						<th>파견근무지</th>
						<th>업무내용</th>
						<th width="180px">일자</th>
						<th>외부업무</th>
						<th>첨부</th>
					</tr>
					<tr>
						<td></td>
						<td align="center"><input type="text"  placeholder="내부" style="width:30px; text-align:center;" name="next_group"/></td>
						<td align="center"><input type="text" placeholder="본사" style="width:50px; text-align:center;" name="next_company"/></td>
						<td align="center"><input type="text" placeholder="성균관대산학협력센터" style="width:130px; text-align:center;" name="next_work"/></td>
						<td align="center"><input type="text" placeholder="업무내용" style="width=130px; text-align:center;" name="next_content"></td>
						<td align="center">&nbsp;
							<select name="next_week">
							 	<option value="mon">월요일</option>
							 	<option value="tue">화요일</option>
							 	<option value="wed">수요일</option>
							 	<option value="thu">목요일</option>
							 	<option value="fir">금요일</option>
						 	</select>
						 	<input type="text" placeholder="yyyy.mm.dd" style="width:80px; text-align:center;" name="next_date">
					 	</td>
						<td align="center"><input type="checkbox" name="next_bz_trip"></td>
						<td align="center" ><input type="file"  name="next_add"></td>
					</tr>
				</table>
			</form>
<!--차주업무 end!!!-->
				<div id=box></div>
			</div>
			<div id="footer" align="right">
				<div id=buttons style="padding:7px;">
					<input type="image" src="img/serch.png" width="40px" onclick="popUpwAdds();"/>
					<input type="image" src="../hr/img/add.png" width="40px" onclick="viewReport();"/>
					<input type="image" src="../main/images/exit.png" width="40px"/>
				</div>
			</div>
		</div>
	</body>
</html>