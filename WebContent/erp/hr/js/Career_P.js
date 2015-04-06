var win=null;
		  function printIt(printThis)  {
		    win = window.open('','offprint','width=755 height=526');
		    self.focus();
		    win.document.open();
		    win.document.write('<'+'html'+'><'+'head'+'><'+'style'+'>');
		    win.document.write('body, td { font-family: Verdana; font-size: 10pt;}');
		    win.document.write('table{width:800px; border-collapse:collapse;}table th, td{ border:1px solid black;}table td{height:30px;}table th{background-color:#D5D5D5;}');
		    win.document.write('<'+'/'+'style'+'><'+'/'+'head'+'><'+'body'+'>');
		    win.document.write('<br/><hr style="border: solid 1px grey;"/><br/><br/><br/>');
		    win.document.write(printThis);
		    win.document.write('<br/><br/><br/><hr style="border: solid 1px grey;"/>');
		    win.document.write('<'+'/'+'body'+'><'+'/'+'html'+'>');
		    win.document.close();
		    win.print();
		    win.close();
		  }