function searchCookpad(action){
	var str ="";
	var ingredients = document.getElementsByName("ingredient");
	var form = $('#dishes-form');
 
    for (var i = 0; i < ingredients.length; i++){
        if(ingredients[i].checked)
            str = str + ingredients[i].value + " ";
    }

	$('<input>').attr({
		'type': 'hidden',
		'name': 'ingredients',
		'value': str
	}).appendTo(form);
	form.submit();
	document.getElementById("result").innerHTML = str + "で検索";
}

