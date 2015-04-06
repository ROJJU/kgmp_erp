/*포상&징계 추가 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
		$(function() {
			 $("#conditionAddRow").on("click",function() {
				//countTest
				 var obj = document.getElementById("str");
				    if(obj.value<4){
				    obj.value = parseInt(obj.value)+1;
				    
				 // clone
				 $.trClone = $("#condition tr:last").clone().html();
				 $.newTr = $("<tr align=center><td><input type='date' name='good_date"+obj.value+"' /></td><td><input type='text' size='5px' name='good_type"+obj.value+"'/></td><td><input type='text' size='5px' name='good_institute"+obj.value+"'/></td>	<td><input type='date' name='bad_date"+obj.value+"'/></td><td><input type='text' size='5px' name='bad_type"+obj.value+"'/></td>	<td><input type='text' size='5px' name='bad_institute"+obj.value+"'/></td>	<td width='40px'></td></tr>");
				 // append
				 $("#condition").append($.newTr);
				 // delete Button 추가
				 $.btnDelete = $(document.createElement("input"));
				 $.btnDelete.attr({
					 name : "btnRemove",
					 type : "image" ,
					 src : "../img/icon_x.png",
					 width : "10px"
					 });
				 $("#condition tr:last td:last").html("");
				 $("#condition tr:last td:last").append($.btnDelete);
				 // 버튼에 클릭 이벤트 추가
				 $("#condition tr>td:last>input[type='image']").on('click', function(){
					 $(this).parent().parent().remove();
					 obj.value = parseInt(obj.value)-1;
					 });
				    }
				    if(obj.value==4){
				    alert('더이상 등록 하실수 없습니다.');
				    }
				 });
			 
			 // 초기화
			 $("#tableReset").on("click",function(){
				 $("#frmTest").each(function(){ this.reset(); });
				 $("input[name='btnRemove']").each(function () {
					 $(this).trigger('click');
					 });
				 });
			 });
		/*교육훈련 추가 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
		$(function() {
			 $("#eduAddRow").on("click",function() {
				//countTest
				 var obj = document.getElementById("eduStr");
				    if(obj.value<3){
				    obj.value = parseInt(obj.value)+1;
				    
				 // clone
				  $.trClone = $("#edu tr:last").clone().html();
				  $.newTr = $("<tr align=center>"+$.trClone+"</tr>");
				 // append
				 $("#edu").append($.newTr);
				 // delete Button 추가
				 $.btnDelete = $(document.createElement("input"));
				 $.btnDelete.attr({
					 name : "btnRemove",
					 type : "image" ,
					 src : "../img/icon_x.png",
					 width : "10px"
					 });
				 $("#edu tr:last td:last").html("");
				 $("#edu tr:last td:last").append($.btnDelete);
				 // 버튼에 클릭 이벤트 추가
				 $("#edu tr>td:last>input[type='image']").on('click', function(){
					 $(this).parent().parent().remove();
					 obj.value = parseInt(obj.value)-1;
					 });
				    }
				    if(obj.value==3){
				    alert('더이상 등록 하실수 없습니다.');
				    }
				 });
			 // 초기화
			 $("#eduTableReset").on("click",function(){
				 $("#frmTest1").each(function(){ this.reset(); });
				 $("input[name='btnRemove1']").each(function () {
					 $(this).trigger('click');
					 });
				 });
			 });
		/* FORM 확인 스크립트!!! */
		function formCheck() {
			var why = document.career.why.value;
			var use=document.career.use.value
			
			if(why==null || why==""){
				alert('퇴직사유를 입력하세요');
				return false;
			}
			 if(use==null || use==""){
					alert('용도를 입력하세요');
					return false;
				}
			if(confirm('저장 하시겠습니까?'))
				document.career.submit();
		}