<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>K-GMP</title>
	<link rel="shortcut icon" type="image/x-icon" href="http://www.k-gmp.co.kr/favicon.ico"/>
    <meta http-equiv="content-type" content="text/html;charset=utf-8" />
    <link type="text/css" href="/kgmp/erp/main/css/Header.css" rel="stylesheet" />
    <script type="text/javascript">
    function goUrl(url){
    	location.href=url;
    } 
    </script>
</head>
<body>
<jsp:include page="../member/Login_Check_proc.jsp"/><!--session check -->
<div id ="header">
	<div id="hr" style="position:relative; height:3px; background-color:grey; width:100%;"></div>
	<div id="menu">
		<div id="mlap">
				<div id="logo"><input type ="image" src="/kgmp/erp/main/images/logo.gif" width="120px" onclick="goUrl('/kgmp/erp/main/MainPage.jsp')"></div>
				<div id="info" style="font-family:맑은 고딕; font-size:11px; color:grey;"><b>[${member_level}]</b> ${member_name} &nbsp;|&nbsp;&nbsp;<b style="cursor:hand; cursor:pointer;"onclick="goUrl('/kgmp/erp/member/Logout_proc.jsp');">LOGOUT</b>
					<%if(session.getAttribute("member_id").equals("k-gmp")){%>
					 &nbsp;|&nbsp;&nbsp;<b style="cursor:hand; cursor:pointer;"onclick="goUrl('/kgmp/erp/admin/adminVacation.jsp');">ADMIN</b>
					 <%}%>
				</div>
	    <ul id="con" class="menu">
	        <li><a href="/kgmp/erp/main/MainPage.jsp" class="parent"><span>Home</span></a></li>
	        <li><a href="/kgmp/erp/notice/NoticeView.jsp" class="parent"><span>사내 공지사항</span></a></li>
	        <li><a href="/kgmp/erp/hr/HrView.jsp" class="parent"><span>인 사</span></a>
	            <div><ul>
	                <li><a href="/kgmp/erp/hr/HrView.jsp" class="parent"><span>인사카드 관리</span></a>
	                    <div><ul>
	                        <li><a href="/kgmp/erp/hr/HrAdd.jsp"><span>개인 서명 관리</span></a></li>
	                        <li><a href="/kgmp/erp/hr/HrView.jsp"><span>인사 관리</span></a></li>
	                    </ul></div>
	                </li>
	                <li><a href="/kgmp/erp/hr/DLCheck.jsp" class="parent"><span>근태 관리</span></a>
	               		<div><ul>
	                        <li><a href="/kgmp/erp/hr/DLCheck.jsp"><span>출/퇴근 등록</span></a></li>
	                        <li><a href="/kgmp/erp/hr/DLselectView.jsp"><span>출/퇴근 조회</span></a></li>
	                        <li><a href="/kgmp/erp/hr/DLView.jsp"><span>월 통계 조회</span></a></li>
	                    </ul></div>
                    </li>
	                <li><a href="/kgmp/erp/hr/certificates/CertificateList.jsp"><span>증명서 발급</span></a>
	                	<div><ul>
	                        <li><a href="/kgmp/erp/hr/certificates/EmploymentAdd.jsp"><span>재직증명서</span></a></li>
	                        <li><a href="/kgmp/erp/hr/certificates/CareerAdd.jsp"><span>경력증명서</span></a></li>
	                        <li><a href="/kgmp/erp/hr/certificates/RestAdd.jsp"><span>휴직증명서</span></a></li>
	                    </ul></div>
                    </li>
	            </ul></div>
	        </li>
	        <li><a href="/kgmp/erp/management/CDView.jsp"><span>회계/자금/영업</span></a>
	        	<div><ul>
	                <li><a href="/kgmp/erp/management/SpendingView.jsp" class="parent"><span>지출</span></a>
	                    <div><ul>
	                        <li><a href="/kgmp/erp/management/SpendingView.jsp"><span>지출 결의서</span></a></li>
	                    </ul></div>
	                </li>
	                <li><a href="/kgmp/erp/management/CDView.jsp" class="parent"><span>영업</span></a>
	                	<div><ul>
	                		<li><a href="/kgmp/erp/management/CDAdd.jsp"><span>거래처 등록</span></a></li>
	                        <li><a href="/kgmp/erp/management/CDView.jsp"><span>거래처 관리</span></a></li>
	                    </ul></div>
	                </li>
	            </ul></div>
	        </li>
	        <li><a href="/kgmp/erp/report/DailyView.jsp"><span>보 고</span></a>
	        	<div><ul>
	        		<li><a href="/kgmp/erp/report/Telephone_view.jsp" class="parent"><span>통화기록부</span></a></li>
	                <li><a href="/kgmp/erp/report/DailyView.jsp" class="parent"><span>일간 업무</span></a></li>
	                <li><a href="/kgmp/erp/report/WeeklyView.jsp" class="parent"><span>주간 보고</span></a></li>
	                <li><a href="/kgmp/erp/report/MonthlyView.jsp" class="parent"><span>월간 보고</span></a></li>
	                <li><a href="/kgmp/erp/report/YearlyView.jsp" class="parent"><span>연간 보고</span></a></li>
	            </ul></div>
            </li>
            <li><a href="/kgmp/erp/welfare/VacationView.jsp"><span>사내 복지</span></a>
	        	<div><ul>
	                <li><a href="/kgmp/erp/welfare/Recommendations.jsp" class="parent"><span>건의사항</span></a></li>
	                <li><a href="/kgmp/erp/welfare/VacationView.jsp" class="parent"><span>휴가 신청</span></a></li>
	            </ul></div>
            </li>
    	    <li><a href="/kgmp/erp/schedule/ScheduleView.jsp" class="parent"><span style="background: url(/kgmp/erp/main/images/nav_separator.png) top right no-repeat; padding: 18px 10px 16px 0;">&nbsp;&nbsp;&nbsp;&nbsp;Schedule&nbsp;&nbsp;&nbsp;&nbsp;</span></a>
    	    	<div><ul>
	                <li><a href="/kgmp/erp/schedule/ScheduleView.jsp" class="parent"><span>월간일정</span></a></li>
	                <li><a href="/kgmp/erp/schedule/ScheduleView_w.jsp" class="parent"><span>주간일정</span></a></li>
	            </ul></div>
    	    </li>
	    </ul>
	    </div>
	</div>
</div>
</body>
</html>