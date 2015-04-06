<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
	    <link type="text/css" href="css/HrBody.css" rel="stylesheet" />
		<link type="text/css" href="css/Hr_A.css" rel="stylesheet" />
		<script src="js/Hr_A.js"></script>
	</head>
	<body>
		<jsp:include page="../main/Header.jsp"></jsp:include>
		<div id="container">
		<jsp:include page="../main/QuickMenu.jsp"/>
			<div id="content">
				<div id = "titlePlace">
					<div id ="HrTitle"><h1 style="font-size:33px;margin:15px 0;font-family:Verdana, Arial, sans-serif">Personnel</h1></div>
				</div>
				<div id = "HrTable">
					<center>
<!--form 시작!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
					<form action="" method="post" onSubmit="return false" name="hr">
						<table>
							<tr>
								<th>보직</th>
								<td width="360px">
									<input type="text">
									<select>
										<option>신입</option>
										<option>경력</option>
									</select>
									<select>
										<option>정규직</option>
										<option>계약직</option>
										<option>인턴직</option>
										<option>파견직</option>
										<option>시간제/일용직</option>
										<option>프리랜서</option>
										<option>병역특례</option>
									</select>
								</td>
								<th>직책</th>
								<td width="40px">
									<select>
										<option>인턴</option>
										<option>수습</option>
										<option>사원</option>
										<option>대리</option>
										<option>팀장</option>
										<option>과장</option>
										<option>부장</option>
										<option>대표</option>
									</select>
								</td>
							</tr>
						</table>
<br/><p align="left"><a style="color:red;">*</a> 기본정보</p>
						<table>
							<tr>
								<td rowspan="5" width="100px" align="center">사진<br/><br/><input type="button" value=" 등록/수정 "></td>
								<th width="80px">이름</th><td colspan="3">한글 <input type="text" size="9px">&nbsp; | 한문 <input type="text" size="9px">&nbsp; | 영문 <input type="text" size="16px"></td>
							</tr>
							<tr>
								<th>주소</th><td colspan="3"><input type="text" size="63px"></td>
							</tr>
							<tr>
								<th>전화번호</th><td ><input type="text"></td>
								<th>휴대폰</th><td><input type="text"></td>
							</tr>
							<tr>
								
							</tr>
							<tr>
								<th>이메일</th><td colspan="3"><input type="text" size="63px"></td>
							</tr>
						</table>
<br/><p align="left"><a style="color:red;">*</a> 학력사항</p>
					<div class ="contBox">
					    <a id="tableReset" class="resetFont"><b>RESET</b></a>&nbsp;&nbsp;
					    <input type="image" src="img/link.png" id="EDBGAddRow" width="12px"/>
					</div>
						<table id="EDBG">
							<tr>
								<th>재학기간</th>
								<th>구분</th>
								<th>학교명</th>
								<th>전공</th>
								<th>학점</th>
								<th>Del</th>
							</tr>
							<tr align=center id="">
								<td><input type="text" size="5px">~<input type="text" size="5px"></td>
								<td>
									<select>
										<option>졸업</option>
										<option>재학중</option>
										<option>휴학중</option>
										<option>수료</option>
										<option>중퇴</option>
										<option>자퇴</option>
										<option>졸업예정</option>
									</select>
								</td>
								<td><input type="text" size="1px"> 고등학교</td>
								<td>
									<select>
										<option>문과계열</option>
										<option>이과계열</option>
										<option>전문(실업)계열</option>
										<option>예체능계</option>
									</select>
								</td>
								<td>-</td>
								<td></td>
							</tr>
							<tr align="center">
								<td><input type="text" size="5px">~<input type="text" size="5px"></td>
								<td>
									<select>
										<option>졸업</option>
										<option>재학중</option>
										<option>휴학중</option>
										<option>수료</option>
										<option>중퇴</option>
										<option>자퇴</option>
										<option>졸업예정</option>
									</select>
								</td>
								<td><input type="text" size="1px"> 
									<select>
										<option>대학(2,3년)</option>
										<option>대학교(4년)</option>
										<option>대학원(석사)</option>
										<option>대학원(박사)</option>
									</select>
								</td>
								<td><input type="text" size="13px"></td>
								<td><input type="text" size="1px">/
									<select>
										<option>4.0</option>
										<option>4.3</option>
										<option>4.5</option>
										<option>5.0</option>
										<option>7.0</option>
										<option>100</option>
									</select>
								</td>
								<td></td>
							</tr>
						</table>
<br/><p align="left"><a style="color:red;">*</a> 주요활동 및 사회경험</p>
					<div class ="contBox">
					    <a id="expReset" class="resetFont"><b>RESET</b></a>&nbsp;&nbsp;
					    <input type="image" src="img/link.png" id="expAddRow" width="12px"/>
					</div>
						<table id="expTable">
							<tr>
								<th width="120px">활동기간</th><th colspan="5">상세활동</th>
							</tr>
							<tr id="expInfo" align="center">
								<td rowspan="2" width="130px" align="center"><input type="text" size="4px">~<input type="text" size="4px"></td>
								<th>구분</th>
								<td>
									<select>
										<option>교내활동</option>
										<option>인턴</option>
										<option>자원봉사</option>
										<option>동아리</option>
										<option>아르바이트</option>
										<option>사회활동</option>
										<option>수행과제</option>
									</select>
								</td>
								<th>활동기관</th><td><input type="text"></td>
								<td></td>
							</tr>
							<tr>
								<th>활동내용</th>
								<td colspan="3" align="center"><textarea cols="50"rows="5"></textarea></td>
								<td></td>
							</tr>
						</table>
<br/><p align="left"><a style="color:red;">*</a> 해외연수 및 해외경험</p>
					<div class ="contBox">
					    <a id="fexpReset" class="resetFont"><b>RESET</b></a>&nbsp;&nbsp;
					    <input type="image" src="img/link.png" id="fexpAddRow" width="12px"/>
					</div>
						<table id="fexpTable">
							<tr>
								<th width="130px">활동기간</th><th colspan="7">상세활동</th>
							</tr>
							<tr id="fexpTr" align="center">
								<td rowspan="2"><input type="text" size="4px">~<input type="text" size="4px"></td>
								<th>국가명</th>
								<td><input type="text" size="9px"/></td>
								<th>기관/단체</th>
								<td><input type="text" size="9px"/></td>
								<th>목적</th>
								<td><input type="text" size="9px"/></td>
								<td></td>
							</tr>
							<tr>
								<th>활동내용</th>
								<td align="center" colspan="5"><textarea cols="50"rows="5"></textarea></td>
								<td></td>
							</tr>
						</table>
<br/><p align="left"><a style="color:red;">*</a> 교육이수내역</p>
					<div class ="contBox">
					    <a id="eduReset" class="resetFont"><b>RESET</b></a>&nbsp;&nbsp;
					    <input type="image" src="img/link.png" id="eduAddRow" width="12px"/>
					</div>
						<table id="eduTable">
							<tr>
								<th width="130px">교육기간</th><th colspan="4">상세활동</th>
							</tr>
							<tr id="eduTr"align="center">
								<td rowspan="2"><input type="text" size="4px">~<input type="text" size="4px"></td>
								<th>교육명</th>	<td><input type="text"></td><th>교육기관</th><td><input type="text"></td>
								<td></td>
							</tr>
							<tr align="center">
								<th>교육내용</th>
								<td colspan="3"><textarea cols="50"rows="5"></textarea></td>
								<td></td>
							</tr>
						</table>
<br/><p align="left"><a style="color:red;">*</a> 어학시험</p>
						<table >
							<tr>
								<th>언어</th>
								<th>어학시험</th>
								<th>시험점수(등급)</th>
								<th>취득일</th>
							</tr>
							<tr align="center">
								<td>
									<select>
										<option>영어</option>
										<option>일본어</option>
										<option>중국어</option>
										<option>독일어</option>
										<option>불어</option>
										<option>스페인어</option>
										<option>러시아어</option>
										<option>이탈리아어</option>
										<option>영어</option>
									</select>
								</td>
								<td><input type="text"></td>
								<td><input type="text"></td>
								<td><input type="text"></td>
							</tr>
						</table>
<br/><p align="left"><a style="color:red;">*</a> 자격증/면허증</p>
					<div class ="contBox">
					    <a id="licenseReset" class="resetFont"><b>RESET</b></a>&nbsp;&nbsp;
					    <input type="image" src="img/link.png" id="licenseAddRow" width="12px"/>
					</div>
						<table id="licenseTable">
							<tr>
								<th>자격증/면허증</th>
								<th>발행처/발행기관</th>
								<th>합격구분</th>
								<th colspan="2">취득일</th>
							</tr>
							<tr align="center">
								<td><input type="text"></td>
								<td><input type="text"></td>
								<td>
									<select>
										<option>1차합격</option>
										<option>2차합격</option>
										<option>필기합격</option>
										<option>실기합격</option>
										<option>최종합격</option>
									</select>
								</td>
								<td><input type="text"></td>
								<td></td>
							</tr>
						</table>
<br/><p align="left"><a style="color:red;">*</a> OA능력</p>
						<table>
							<tr>
								<th>문서작성<br/>(한글/MS-Word)</th>
								<th>스프레드시트<br/>(Excel)</th>
								<th>프리젠테이션<br/>(PowerPoint)</th>
								<th>인터넷<br/>(정보검색/outlook)</th>
							</tr>
							<tr align="center">
								<td>
									<select>
										<option>전문가수준</option>
										<option>업무 바로 가능</option>
										<option>기본 문서작성 가능</option>
										<option>약간의 기능만 가능</option>
									</select>
								</td>
								<td>
									<select>
										<option>전문가수준</option>
										<option>업무 바로 가능</option>
										<option>기본 문서작성 가능</option>
										<option>약간의 기능만 가능</option>
									</select>
								</td>
								<td>
									<select>
										<option>전문가수준</option>
										<option>업무 바로 가능</option>
										<option>기본 문서작성 가능</option>
										<option>약간의 기능만 가능</option>
									</select>
								</td>
								<td>
									<select>
										<option>전문가수준</option>
										<option>업무 바로 가능</option>
										<option>기본 문서작성 가능</option>
										<option>약간의 기능만 가능</option>
									</select>
								</td>
							</tr>
						</table>
<br/><p align="left"><a style="color:red;">*</a> 개인신상정보</p>
						<table>
							<tr align="center">
								<th>결혼여부</th><td><input type="radio">미혼 <input type="radio">기혼 <input type="radio">비공개 </td>
								<th>취미/특기</th><td>취미 <input type="text" size="7px"> 특기 <input type="text" size="7px"></td>
							</tr>
							<tr align="center">
								<th>병역대상</th>
								<td colspan="3">
									<select>
										<option>대상아님</option>
										<option>군필</option>
										<option>미필</option>
										<option>면제</option>
									</select>
									<input type="text" size="4px"> ~ <input type="text" size="4px">
									<select>
										<option>대상아님</option>
										<option>육군</option>
										<option>해군</option>
										<option>공군</option>
										<option>해병</option>
										<option>의경</option>
										<option>전경</option>
										<option>공익</option>
									</select>
									<select>
										<option>대상아님</option>
										<option>이병</option>
										<option>일병</option>
										<option>상병</option>
										<option>병장</option>
										<option>하사</option>
										<option>중사</option>
										<option>상사</option>
										<option>원사</option>
										<option>준위</option>
										<option>소위</option>
										<option>중위</option>
										<option>대위</option>
										<option>소령</option>
										<option>중령</option>
										<option>대령</option>
										<option>준장</option>
										<option>소장</option>
										<option>중장</option>
										<option>대장</option>
									</select>
									<select>
										<option>대상아님</option>
										<option>만기제대</option>
										<option>의가사제대</option>
										<option>의병제대</option>
										<option>소집해제</option>
										<option>불명예제대</option>
										<option>상이제대</option>
									</select>
								</td>	
							</tr>
						</table>
<br/><p align="left"><a style="color:red;">*</a> 특이사항</p>
						<table>
							<tr>
								<th width="80px">특이사항</th>
								<td><textarea cols="70" rows="5"></textarea></td>
							</tr>
						</table>
					</form>
<!--form 끝남!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!-->
						<div id="bottonPlace">
							<div id="bottons">
								<input type="image" src="img/list.png" width="50px" onclick="goUrl('HrView.jsp')">
								<input type="image" src="img/save.png" width="50px" onclick="formCheck()">
							</div>
						</div>
					</center>
				</div>
			</div>		
		</div>
		<jsp:include page="../main/Footer.html"></jsp:include>
	</body>
</html>