/**
 * 
 */
$(document).ready(function(){
	//validation
	
	$("#user>form").submit(function(){
	
		//check ID repeatness
		if(!isUidok){
			alert("This ID isn't available. Please try another.");
			return false;
		}
		
		//check ID composition 
		if(!isUidEngOk){
			alert("You can use lower cases only for ID. Please try another.");
			return false;
		}
		
		//confirm pw
		if(!isPasswordOk){
			alert("Your password is not confirmed. \nPlease try again.");
			return false;
		}
		
		//check name if korean
		if(!isNameOk){
			alert("You can enter Korean only for name.");
			return false;
		}
		//check nickname repeatness
		return true;
	})
})