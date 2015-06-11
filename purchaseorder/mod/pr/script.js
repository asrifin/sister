
// Barang
function autocomplet2() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#barang_id').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/pr/barang_refresh.php',
			type: 'POST',
			data: {keyword:keyword},
			success:function(data){
				$('#barang_list_id').show();
				$('#barang_list_id').html(data);
			}
		});
	} else {
		$('#barang_list_id').hide();
	}
}

function set_item2(item) {
	// change input value
	$('#barang_id').val(item);
	// hide proposition list
	$('#barang_list_id').hide();
}
// PR
function autocompletpr() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#pr_id').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/pr/pr_refresh.php',
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
	
