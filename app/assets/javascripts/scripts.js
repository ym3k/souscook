function searchCookpad(action){
	var str =　"";
	var ingredients = document.getElementsByName("ingredient");
	var keyword = document.getElementById("keyword");
	var form = $('#dishes-form');
	if(keyword.value) {
		str = str + keyword.value + " " 
	}
 
    for (var i = 0; i < ingredients.length; i++){
        if(ingredients[i].checked)
            str = str + ingredients[i].value + " ";
    }
	if (str === "") {
		document.getElementById("search_error").innerHTML = "チェックボックスにチェックを入れるか、キーワードを入力してください";
		document.getElementById("result").innerHTML = "";
	}else{
		document.getElementById("search_error").innerHTML = "";
		$('<input>').attr({
			'type': 'hidden',
			'name': 'ingredients',
			'value': str
		}).appendTo(form);
		form.submit();
		document.getElementById("result").innerHTML = str + "で検索";
	}
}
