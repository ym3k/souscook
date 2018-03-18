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

document.addEventListener("turbolinks:load", function() {
	$(function() {
		$('form').on('click', '.remove_fields', function(event) {
		  $(this).prev('input[type=hidden]').val('1');
		  $(this).closest('fieldset').hide();
		//   console.log("remove_fieldsss")
		  return event.preventDefault();
		});
		return $('form').on('click', '.add_fields', function(event) {
		  var regexp, time;
		  time = new Date().getTime();
		  regexp = new RegExp($(this).data('id'), 'g');
		  $(this).before($(this).data('fields').replace(regexp, time));
		//   console.log("add_fieldsss")
		  return event.preventDefault();
		});
	});
})
