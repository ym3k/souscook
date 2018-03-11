function searchCookpad(){
	var str ="";
	var ingredients = document.getElementsByName("ingredient");

	for (var i = 0; i < ingredients.length; i++){
		if(ingredients[i].checked) //(color2[i].checked === true)と同じ
			str = str + ingredients[i].value + " ";
	}

	document.getElementById("result2").innerHTML = str;
}
