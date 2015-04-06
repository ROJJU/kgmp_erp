<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
 	<script type="text/javascript" src="js/jquery.tip_cards.js"></script>
  <style>
  @import url("css/Recommendations.css");
  @import url("css/tip_cards.css");
  @import url("../main/css/BasicBody.css");
  </style>
	<script>
	  $(document).ready( function(){
	    $(document).ready( function(){
  	    $(".tips").tip_cards();
  	  });
	  });
	  function popupComent(){
			window.open("CoAdd.jsp","Co","width=450px, height=172px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");
		}
	</script>
</head>
<body>
<jsp:include page="../main/Header.jsp"/>
  <div id="container">
  <jsp:include page="../main/QuickMenu.jsp"/>
  	  <br>
	  <div class="main">
      <div class="page-container">
        <ul class="tips">
          <li>
            <div class="tc_front">
            	<a href="#tip1">건의사항 1: See What videos your friends are posting and adjust friendships accordingly.</a>
            </div>
            <div class="tc_back"></div>

            <div id="tip1" class="tip">
              <div class="tc_front">
                <h1>1. See What videos your friends are posting</h1>
                <p>Whether you're browsing youtube.com or its mobile app, when you're signed in with your Google Account, you can see videos recommended for you.</p>
              </div>
              <div class="tc_back">
                <p>건의사항 1: See What videos your friends are posting and adjust friendships accordingly.</p>
              </div>
            </div>
          </li>
          <li>
            <div class="tc_front">
            	<a href="#tip2">건의사항 2: See What videos your friends are posting and adjust friendships accordingly.</a>
            </div>
            <div class="tc_back"></div>

            <div id="tip2" class="tip">
              <div class="tc_front">
                <h1>2. See What videos your friends are posting</h1>
                <p>Whether you're browsing youtube.com or its mobile app, when you're signed in with your Google Account, you can see videos recommended for you.</p>
              </div>
              <div class="tc_back">
                <p>건의사항 2: See What videos your friends are posting and adjust friendships accordingly.</p>
              </div>
            </div>
          </li>
          <li>
            <div class="tc_front">
            	<a href="#tip3">건의사항 3: See What videos your friends are posting and adjust friendships accordingly.</a>
            </div>
            <div class="tc_back"></div>

            <div id="tip3" class="tip">
              <div class="tc_front">
                <h1>3. See What videos your friends are posting</h1>
                <p>Whether you're browsing youtube.com or its mobile app, when you're signed in with your Google Account, you can see videos recommended for you.</p>
              </div>
              <div class="tc_back">
                <p>건의사항 3: See What videos your friends are posting and adjust friendships accordingly.</p>
              </div>
            </div>
          </li>
          <li>
            <div class="tc_front">
            	<a href="#tip4">건의사항 4: See What videos your friends are posting and adjust friendships accordingly.</a>
            </div>
            <div class="tc_back"></div>

            <div id="tip4" class="tip">
              <div class="tc_front">
                <h1>4. See What videos your friends are posting</h1>
                <p>Whether you're browsing youtube.com or its mobile app, when you're signed in with your Google Account, you can see videos recommended for you.</p>
              </div>
              <div class="tc_back">
                <p>건의사항 4: See What videos your friends are posting and adjust friendships accordingly.</p>
              </div>
            </div>
          </li>
          <li>
            <div class="tc_front">
            	<a href="#tip5">건의사항 5: See What videos your friends are posting and adjust friendships accordingly.</a>
            </div>
            <div class="tc_back"></div>

            <div id="tip5" class="tip">
              <div class="tc_front">
                <h1>5. See What videos your friends are posting</h1>
                <p>Whether you're browsing youtube.com or its mobile app, when you're signed in with your Google Account, you can see videos recommended for you.</p>
              </div>
              <div class="tc_back">
                <p>건의사항 5: See What videos your friends are posting and adjust friendships accordingly.</p>
              </div>
            </div>
          </li>
          <li>
            <div class="tc_front">
            	<a href="#tip6">건의사항 6: See What videos your friends are posting and adjust friendships accordingly.</a>
            </div>
            <div class="tc_back"></div>

            <div id="tip6" class="tip">
              <div class="tc_front">
                <h1>6. See What videos your friends are posting</h1>
                <p>Whether you're browsing youtube.com or its mobile app, when you're signed in with your Google Account, you can see videos recommended for you.</p>
              </div>
              <div class="tc_back">
                <p>건의사항 6: See What videos your friends are posting and adjust friendships accordingly.</p>
              </div>
            </div>
          </li>
          <li>
            <div class="tc_front">
            	<a href="#tip7">건의사항 7: See What videos your friends are posting and adjust friendships accordingly.</a>
            </div>
            <div class="tc_back"></div>

            <div id="tip7" class="tip">
              <div class="tc_front">
                <h1>7. See What videos your friends are posting</h1>
                <p>Whether you're browsing youtube.com or its mobile app, when you're signed in with your Google Account, you can see videos recommended for you.</p>
              </div>
              <div class="tc_back">
                <p>건의사항 7: See What videos your friends are posting and adjust friendships accordingly.</p>
              </div>
            </div>
          </li>
          <li>
            <div class="tc_front">
            	<a href="#tip8">건의사항 8: See What videos your friends are posting and adjust friendships accordingly.</a>
            </div>
            <div class="tc_back"></div>

            <div id="tip8" class="tip">
              <div class="tc_front">
                <h1>8. See What videos your friends are posting</h1>
                <p>Whether you're browsing youtube.com or its mobile app, when you're signed in with your Google Account, you can see videos recommended for you.</p>
              </div>
              <div class="tc_back">
                <p>건의사항 8: See What videos your friends are posting and adjust friendships accordingly.</p>
              </div>
            </div>
          </li>
          <li>
            <div class="tc_front">
            	<a href="#tip9">건의사항 9:title</a>
            </div>
            <div class="tc_back"></div>

            <div id="tip9" class="tip">
              <div class="tc_front">
                <h1>9. See What videos your friends are posting</h1>
                <p>Whether you're browsing youtube.com or its mobile app, when you're signed in with your Google Account, you can see videos recommended for you.</p>
              </div>
              <div class="tc_back">
                <p>건의사항 9: See What videos your friends are posting and adjust friendships accordingly.</p>
              </div>
            </div>
          </li>
          <li>
            <div class="tc_front">
            	<a href="#tip10">건의사항 10: See What videos your friends are posting and adjust friendships accordingly.</a>
            </div>
            <div class="tc_back"></div>

            <div id="tip10" class="tip">
              <div class="tc_front">
                <h1>10. See What videos your friends are posting</h1>
                <p>Whether you're browsing youtube.com or its mobile app, when you're signed in with your Google Account, you can see videos recommended for you.</p>
              </div>
              <div class="tc_back">
                <p>건의사항 10: See What videos your friends are posting and adjust friendships accordingly.</p>
              </div>
            </div>
          </li>
        </ul>
      </div>
    </div>
    <img style="position: absolute; top: 0; left: 0; border: 0; z-index: 15;" src="img/com.png" width="149px">
  </div>
  <br><br>
  <center>
  <div style="width:80px;font-size:12px; background-color:grey; color:#ffffff; padding:10px; cursor:hand; cursor:pointer;" onclick="popupComent()">건의하기</div><br>
  <a style="font-size:12px; font-family:맑은 고딕; color:red;">주의 : 건의 사항은 10개 이상 등록 하실 수 없습니다</a>
  </center><br>
  <hr>
</body>
</html>