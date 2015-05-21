// autocomplet : this function will be executed every time we change the text
function autocomplet() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#country_id').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/penjualan/customer_refresh.php',
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
function set_item(item) {
	// change input value
	$('#country_id').val(item);
	// hide proposition list
	$('#country_list_id').hide();
}

// Barang
function autocomplet2() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#barang_id').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/penjualan/barang_refresh.php',
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
$(document).ready(function() {
$('#bayar').keyup(function(){
var bayar=parseInt($('#bayar').val());
var total=parseInt($('#total').val());	
/*
var discount=parseInt($('#discount').val());	
var nilaidiscount;
if(discount<=100){
nilaidiscount = parseInt((total*discount)/100);
}else{
nilaidiscount = discount;
}
var grand_total=(total-nilaidiscount);
*/
var total_bayar=bayar - (total);
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
var grand_total=(total-nilaidiscount);
var total_bayar=bayar - (grand_total);
$('#netto').val(grand_total);
$('#bayar').val(grand_total);
$('#Tbayar').html("Total : Rp."+total_bayar);
		});

})	
	

// FAKTUR
function autocompletfaktur() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#faktur_id').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/penjualan/faktur_refresh.php',
			type: 'POST',
			data: {keyword:keyword},
			success:function(data){
				$('#faktur_list_id').show();
				$('#faktur_list_id').html(data);
			}
		});
	} else {
		$('#faktur_list_id').hide();
	}
}
// set_item : this function will be executed when we select an item
function set_itemfaktur(item) {
	// change input value
	$('#faktur_id').val(item);
	// hide proposition list
	$('#faktur_list_id').hide();
}