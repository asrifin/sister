// autocomplet : this function will be executed every time we change the text
function autocomplet() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#country_id2').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/po/supplier_refresh.php',
			type: 'POST',
			data: {keyword:keyword},
			success:function(data){
				$('#country_list_id').show();
				$('#country_list_id').html(data);
			}
		});
	} else {
		$('#country_list_id').hide();
	}
}

// set_item : this function will be executed when we select an item
function set_item(item,item2) {
	// change input value
	$('#country_id').val(item);
	$('#country_id2').val(item2);
	// hide proposition list
	$('#country_list_id').hide();
}
// Barang
function autocomplet2() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#barang_id2').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/po/barang_refresh.php',
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
function set_item2(item,item2) {
	// change input value
	$('#barang_id').val(item);
	$('#barang_id2').val(item2);
	// hide proposition list
	$('#barang_list_id').hide();
}
// PO
function autocompletpo() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#po_id').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/po/po_refresh.php',
			type: 'POST',
			data: {keyword:keyword},
			success:function(data){
				$('#po_list_id').show();
				$('#po_list_id').html(data);
			}
		});
	} else {
		$('#po_list_id').hide();
	}
}
// set_item : this function will be executed when we select an item
function set_itempo(item) {
	// change input value
	$('#po_id').val(item);
	// hide proposition list
	$('#po_list_id').hide();
}
$(document).ready(function() {
$('#bayar').keyup(function(){
var bayar=parseInt($('#bayar').val());
var total=parseInt($('#total').val());	
var discount=parseInt($('#discount').val());	
var nilaidiscount;
if(discount<=100){
nilaidiscount = parseInt((total*discount)/100);
}else{
nilaidiscount = discount;
}
var total_bayar=bayar-(total-nilaidiscount);
$('#Tbayar').show();
$('#Tbayar').html("Kembali : Rp."+total_bayar);
			});
$('#discount').keyup(function(){
var bayar=parseInt($('#bayar').val());
var total=parseInt($('#total').val());	
var discount=parseInt($('#discount').val());		
var nilaidiscount;
if(discount<=100){
nilaidiscount = parseInt((total*discount)/100);
}else{
nilaidiscount = discount;
}
var total_bayar=(total-nilaidiscount);
$('#bayar').val(total_bayar);
$('#Tbayar').html("Total : Rp."+total_bayar);
		});

})	
	
