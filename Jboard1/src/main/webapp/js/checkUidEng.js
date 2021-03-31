/**
 * 
 */
var isUidEngOk = false;

$(function(){
	//expression
	
	var regUid = /^[a-z0-9]{4,10}$/
	
	$("input[name=uid]").focusout(function(){
		var uid = $(this).val();
		
		if(regUid.test(uid) == true){
			isUidEngOk = true;
		}else{
			isUidEngOk = false;
		}
		return true;
	})
})