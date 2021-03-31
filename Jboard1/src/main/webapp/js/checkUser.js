/**
 * check repeatness 
 */

var isUidOk = false;
var isUidEngOk = false;
var isPasswordOk = false;
var isNameOk = false;
	
$(function() {
	//check ID repeatness and composition
	var regUid = /^[a-z]+[a-z0-9]{3,10}$/;
	
	$("input[name=uid]").focusout(function(){
		var uid = $(this).val();
		var jsonData = {'uid':uid};
		
		$.ajax({
			url: '/Jboard1/user/proc/checkUid.jsp',
			type: 'get',
			data: jsonData,
			dataType: 'json',
			success: function(data){
				if(data.result == 0){
					isUidOk = true;
					$(".resultId").css("color","green").text("This username is available.");
					
					if(regUid.test(uid) == true){
						isUidEngOk = true;
					}else{
						isUidEngOk = false;
						$(".resultId").css("color","red").text("You can use lowercase and numbers only.");
					}
					
				}else{
					isUidOk = false;
					$(".resultId").css("color","red").text("This username isn't available. Please try another.");
				}
			}
		});
	});
	
	//confirm pw
	$('input[name=pass2]').focusout(function(){
		var pass1 = $("input[name=pass1]").val();
		var pass2 = $("input[name=pass2]").val();
		
		if(pass1 == pass2){
			isPasswordOk = true;
			$(".resultPass").css("color","green").text("Your password is confirmed.");
		}else{
			isPasswordOk = false;
			$(".resultPass").css("color","red").text("Your password is not matching. Please try again.");
		}
	})

	//check name if korean
	var regName = /^[가-힣]{2,10}$/
	$('input[name=name]').focusout(function(){
		var name = $(this).val();
		if(regName.test(name) == true){
			isNameOk = true;
			$(".resultName").text('');
		}else{
			isNameOk = false;
			$(".resultName").css("color","red").text("You can enter Korean only up to 10 letters. Please try again.");
		}
	})
	
	// check nickname repeatness
   	// check email repeatness
	// check phone repeatness
})
