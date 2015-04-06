		var win=null;
		  function printIt(printThis)  {
		    win = window.open('','offprint','width=755 height=526');
		    self.focus();
		    win.document.open();
		    win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
		    win.document.write('body, td { font-family: Verdana; font-size: 10pt;}');
		    win.document.write('#titlePlace{position:relative; height:80px;} reportTitle{position:relative; top: 30px; left:50px; width:300px;}#ViewList{position:relative;width:300px;}table{width:800px; border:0; border-collapse:collapse;}table tr{height:30px;}.line{border:1px solid grey;}.underLine{border-bottom:2px solid black;}');
		    win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
		    win.document.write(printThis);
		    win.document.write('<br/><br/><br/><hr/>');
		    win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
		    win.document.close();
		    win.print();
		    win.close();
		  }