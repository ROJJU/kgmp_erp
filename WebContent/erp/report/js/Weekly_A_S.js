//부모창 이동 !!!!!!!폼 채크 !!!
function viewReport(){
	if(confirm('글을 저장 하시겠습니까?')){
		document.weekly.submit();
		//opener.location.href = "/kgmp/erp/report/WeeklyRead.jsp"; 
		//self.close();
	}
}
//팝업 !!!!!!!
function popUpwAdds(){
		window.open("WeeklyAdd_f.jsp","wAdd_f","width=450px, height=470px, left=400px, top=100px, location=no, toolbar=no, realzable=no scrollbars = yes");		
	}
/*주간 업무 추가 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
	$(function() {
		 $("#wAddRow").on("click",function() {
			//countTest
			 var obj = document.getElementById("str");
			    obj.value = parseInt(obj.value)+1;
			 // clone
			 //$.trClone = $("#wAdd tr:last").clone().html();
			 $.newTr = $("<tr align=center><td></td><td align='center'><input type='text' placeholder='내부' style='width:30px; text-align:center;' name='group"+obj.value+"'></td><td align='center'><input type='text' placeholder='본사' style='width:50px; text-align:center;' name='company"+obj.value+"'/></td><td align='center'><input type='text' placeholder='성균관대산학협력센터' style='width:130px; text-align:center;' name='work"+obj.value+"'/></td><td align='center'><input type='text' placeholder='업무내용' style='width=130px; text-align:center;' name='content"+obj.value+"'></td><td align='center'>&nbsp;<select name='week"+obj.value+"'><option value='mon'>월요일</option><option value='tue'>화요일</option><option value='wed'>수요일</option><option value='thu'>목요일</option><option value='fir'>금요일</option></select><input type='text' placeholder='yyyy.mm.dd' style='width:80px; text-align:center;' name='date"+obj.value+"'></td><td align='center'><input type='checkbox' name='bz_trip"+obj.value+"'></td><td align='center' ><input type='file'  name='add"+obj.value+"'></td></tr>");
			 // append
			 $("#wAdd").append($.newTr);
			 // delete Button 추가
			 $.btnDelete = $(document.createElement("input"));
			 $.btnDelete.attr({
				 name : "btnRemove",
				 type : "image" ,
				 src : "img/icon_x.png",
				 width : "10px"
				 });
			 $("#wAdd tr:last td:first").html("");
			 $("#wAdd tr:last td:first").append($.btnDelete);
			 // 버튼에 클릭 이벤트 추가
			 $("#wAdd tr:last>td:first>input[type='image']").on('click', function(){
				 $(this).parent().parent().remove();
				 obj.value = parseInt(obj.value)-1;
				 });
			 });
		 /*  
		 // 초기화
		 $("#tableReset").on("click",function(){
			 $("#frmTest").each(function(){ this.reset(); });
			 $("input[name='btnRemove']").each(function () {
				 $(this).trigger('click');
				 });
			 });*/
		 });
/*차주 업무 추가 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
	$(function() {
		 $("#nwAddRow").on("click",function() {
			//countTest
			 var obj = document.getElementById("str2");
			    obj.value = parseInt(obj.value)+1;
			    
			 // clone
			// $.trClone = $("#nwAdd tr:last").clone().html();
			    $.newTr = $("<tr align=center><td></td><td align='center'><input type='text' placeholder='내부' style='width:30px; text-align:center;' name='next_group"+obj.value+"'></td><td align='center'><input type='text' placeholder='본사' style='width:50px; text-align:center;' name='next_company"+obj.value+"'/></td><td align='center'><input type='text' placeholder='성균관대산학협력센터' style='width:130px; text-align:center;' name='next_work"+obj.value+"'/></td><td align='center'><input type='text' placeholder='업무내용' style='width=130px; text-align:center;' name='next_content"+obj.value+"'></td><td align='center'>&nbsp;<select name='next_week"+obj.value+"'><option value='mon'>월요일</option><option value='tue'>화요일</option><option value='wed'>수요일</option><option value='thu'>목요일</option><option value='fir'>금요일</option></select><input type='text' placeholder='yyyy.mm.dd' style='width:80px; text-align:center;' name='next_date"+obj.value+"'></td><td align='center'><input type='checkbox' name='next_bz_trip"+obj.value+"'></td><td align='center' ><input type='file'  name='next_add"+obj.value+"'></td></tr>");
			 // append
			 $("#nwAdd").append($.newTr);
			 // delete Button 추가
			 $.btnDelete = $(document.createElement("input"));
			 $.btnDelete.attr({
				 name : "btnRemove",
				 type : "image" ,
				 src : "img/icon_x.png",
				 width : "10px"
				 });
			 $("#nwAdd tr:last td:first").html("");
			 $("#nwAdd tr:last td:first").append($.btnDelete);
			 // 버튼에 클릭 이벤트 추가
			 $("#nwAdd tr:last>td:first>input[type='image']").on('click', function(){
				 $(this).parent().parent().remove();
				 obj.value = parseInt(obj.value)-1;
				 });
			 });
		 /*  
		 // 초기화
		 $("#tableReset").on("click",function(){
			 $("#frmTest").each(function(){ this.reset(); });
			 $("input[name='btnRemove']").each(function () {
				 $(this).trigger('click');
				 });
			 });*/
		 });