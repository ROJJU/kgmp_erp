		function isSpend_img(spend_img){
			var pattern = new RegExp(/^[^ㄱ-ㅣ가-힣]+$/);
			return pattern.test(spend_img);
		}

		function formCheck() {
			var title = document.spending.title.value;
			var summary = document.spending.summary.value;
			var money = document.spending.money.value;
			var money_kor = document.spending.money_kor.value;
			var how = document.spending.how.value;
			var spend_date = document.spending.spend_date.value;
			var spend_img=document.spending.spend_img.value;
			if(spend_img==null||spend_img==""){
				spend_img="null";
			}
			if(!isSpend_img(spend_img)){
				alert('파일명에 한글이 포함될 수 없습니다.');
				return false;
			}
			if(title==null || title=="") {
				alert('결제명을 입력하세요');
				return false;
			}
			if(summary==null || summary=="") {
				alert('적요를 입력하세요');
				return false;
			}
			if(money==null || money=="") {
				alert('금액(숫자)을 입력하세요');
				return false;
			}
			if(money_kor==null || money_kor=="") {
				alert('금액(국문)을 입력하세요');
				return false;
			}
			if(how==null || how=="") {
				alert('결제방법을 입력하세요');
				return false;
			}
			if(spend_date==null || spend_date=="") {
				alert('결제일을 입력하세요');
				return false;
			}
			if(confirm('글을 저장 하시겠습니까?'))
				document.spending.submit();
		}