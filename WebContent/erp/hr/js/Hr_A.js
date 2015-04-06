function formCheck() {
			if(confirm('글을 저장 하시겠습니까?'))
				document.hr.submit();
		}

/*학력사항 추가 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
		$(function() {
			 $("#EDBGAddRow").on("click",function() {
				 // clone
				 $.trClone = $("#EDBG tr:last").clone().html();
				 $.newTr = $("<tr align=center>"+$.trClone+"</tr>");
				 // append
				 $("#EDBG").append($.newTr);
				 // delete Button 추가
				 $.btnDelete = $(document.createElement("input"));
				 $.btnDelete.attr({
					 name : "btnRemove",
					 type : "image" ,
					 src : "img/icon_x.png",
					 width : "10px"
					 });
				 $("#EDBG tr:last td:last").html("");
				 $("#EDBG tr:last td:last").append($.btnDelete);
				 // 버튼에 클릭 이벤트 추가
				 $("#EDBG tr>td:last>input[type='image']").on('click', function(){
					 $(this).parent().parent().remove();
					 });
				 });
			 
			 // 초기화
			 $("#tableReset").on("click",function(){
				 $("#frmTest").each(function(){ this.reset(); });
				 $("input[name='btnRemove']").each(function () {
					 $(this).trigger('click');
					 });
				 });
			 });
		/*주요활동 및 사회경험 추가 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
		$(function() {
			 $("#expAddRow").on("click",function() {
				 // clone
				 $.trClone1 = $("#expTable tr#expInfo").clone().html();
				 $.trClone2 = $("#expTable tr:last").clone().html();
				 $.newTr1 = $("<tr align=center class=test>"+$.trClone1+"</tr>");
				 $.newTr2 = $("<tr align=center>"+$.trClone2+"</tr>");
				 // append
				 $("#expTable").append($.newTr1, $.newTr2);
				 // delete Button 추가
				 $.btnDelete = $(document.createElement("input"));
				 $.btnDelete.attr({
					 name : "btnRemove",
					 type : "image" ,
					 src : "img/icon_x.png",
					 width : "10px"
					 });
				
				 $("#expTable tr.test td:last").html("");
				 $("#expTable tr.test td:last").append($.btnDelete);
				 // 버튼에 클릭 이벤트 추가
				 $("#expTable tr.test>td:last>input[type='image']").on('click', function(){
					 $("#expTable tr.test td:last").parent().remove();
					 $("#expTable tr:last td:last").parent().remove();
					 });
				 });
			 
			 // 초기화
			 $("#expReset").on("click",function(){
				 $("#frmTest").each(function(){ this.reset(); });
				 $("input[name='btnRemove']").each(function () {
					 $(this).trigger('click');
					 });
				 });
			 });
		/*해외연수 및 해회경험 추가 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
		$(function() {
			 $("#fexpAddRow").on("click",function() {
				 // clone
				 $.trClone1 = $("#fexpTable tr#fexpTr").clone().html();
				 $.trClone2 = $("#fexpTable tr:last").clone().html();
				 $.newTr1 = $("<tr align=center class=fexpTrN>"+$.trClone1+"</tr>");
				 $.newTr2 = $("<tr align=center>"+$.trClone2+"</tr>");
				 // append
				 $("#fexpTable").append($.newTr1, $.newTr2);
				 // delete Button 추가
				 $.btnDelete = $(document.createElement("input"));
				 $.btnDelete.attr({
					 name : "btnRemove",
					 type : "image" ,
					 src : "img/icon_x.png",
					 width : "10px"
					 });
				
				 $("#fexpTable tr.fexpTrN td:last").html("");
				 $("#fexpTable tr.fexpTrN td:last").append($.btnDelete);
				 // 버튼에 클릭 이벤트 추가
				 $("#fexpTable tr.fexpTrN>td:last>input[type='image']").on('click', function(){
					 $("#fexpTable tr.fexpTrN td:last").parent().remove();
					 $("#fexpTable tr:last td:last").parent().remove();
					 });
				 });
			 
			 // 초기화
			 $("#fexpReset").on("click",function(){
				 $("#frmTest").each(function(){ this.reset(); });
				 $("input[name='btnRemove']").each(function () {
					 $(this).trigger('click');
					 });
				 });
			 });
		/*교육이수내역 추가 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
		$(function() {
			 $("#eduAddRow").on("click",function() {
				 // clone
				 $.trClone1 = $("#eduTable tr#eduTr").clone().html();
				 $.trClone2 = $("#eduTable tr:last").clone().html();
				 $.newTr1 = $("<tr align=center class=eduTrN>"+$.trClone1+"</tr>");
				 $.newTr2 = $("<tr align=center>"+$.trClone2+"</tr>");
				 // append
				 $("#eduTable").append($.newTr1, $.newTr2);
				 // delete Button 추가
				 $.btnDelete = $(document.createElement("input"));
				 $.btnDelete.attr({
					 name : "btnRemove",
					 type : "image" ,
					 src : "img/icon_x.png",
					 width : "10px"
					 });
				
				 $("#eduTable tr.eduTrN td:last").html("");
				 $("#eduTable tr.eduTrN td:last").append($.btnDelete);
				 // 버튼에 클릭 이벤트 추가
				 $("#eduTable tr.eduTrN>td:last>input[type='image']").on('click', function(){
					 $("#eduTable tr.eduTrN td:last").parent().remove();
					 $("#eduTable tr:last td:last").parent().remove();
					 });
				 });
			 
			 // 초기화
			 $("#eduReset").on("click",function(){
				 $("#frmTest").each(function(){ this.reset(); });
				 $("input[name='btnRemove']").each(function () {
					 $(this).trigger('click');
					 });
				 });
			 });
		/*자격증/면허증 추가 스크립트!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
		$(function() {
			 $("#licenseAddRow").on("click",function() {
				 // clone
				 $.trClone = $("#licenseTable tr:last").clone().html();
				 $.newTr = $("<tr align=center>"+$.trClone+"</tr>");
				 // append
				 $("#licenseTable").append($.newTr);
				 // delete Button 추가
				 $.btnDelete = $(document.createElement("input"));
				 $.btnDelete.attr({
					 name : "btnRemove",
					 type : "image" ,
					 src : "img/icon_x.png",
					 width : "10px"
					 });
				 $("#licenseTable tr:last td:last").html("");
				 $("#licenseTable tr:last td:last").append($.btnDelete);
				 // 버튼에 클릭 이벤트 추가
				 $("#licenseTable tr>td:last>input[type='image']").on('click', function(){
					 $(this).parent().parent().remove();
					 });
				 });
			 
			 // 초기화
			 $("#licensetableReset").on("click",function(){
				 $("#frmTest").each(function(){ this.reset(); });
				 $("input[name='btnRemove']").each(function () {
					 $(this).trigger('click');
					 });
				 });
			 });