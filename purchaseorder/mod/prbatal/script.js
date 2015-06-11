// PR
function autocompletpr() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#pr_id').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/prbatal/pr_refresh.php',
			type: 'POST',
			data: {keyword:keyword},
			success:function(data){
				$('#pr_list_id').show();
				$('#pr_list_id').html(data);
			}
		});
	} else {
		$('#pr_list_id').hide();
	}
}
// set_item : this function will be executed when we select an item
function set_itempr(item) {
	// change input value
	$('#pr_id').val(item);
	// hide proposition list
	$('#pr_list_id').hide();
}