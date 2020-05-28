/**

 * 

 */

var filterValue = "<c:out value='${filterValue}'/>";
var matchCount = "<c:out value='${ms}'/>";
	
	
	
	for (var i=0; i<matchCount; i++) {
		if(filterValue[i]=='seoul'){
			$(".div_title").hide();
		}else {
			$(".div_title").show();
		}
		
	}
	