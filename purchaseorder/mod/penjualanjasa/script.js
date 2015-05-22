// autocomplet : this function will be executed every time we change the text
function autocomplet() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#country_id').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/penjualanjasa/customer_refresh.php',
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

// jasa
function autocomplet2() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#jasa_id').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/penjualanjasa/jasa_refresh.php',
			type: 'POST',
			data: {keyword:keyword},
			success:function(data){
				$('#jasa_list_id').show();
				$('#jasa_list_id').html(data);
			}
		});
	} else {
		$('#jasa_list_id').hide();
	}
}

function set_item2(item) {
	// change input value
	$('#jasa_id').val(item);
	// hide proposition list
	$('#jasa_list_id').hide();
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
	

// FAKTURjasa
function autocompletfakturjasa() {
	var min_length = 0; // min caracters to display the autocomplete
	var keyword = $('#faktur_id').val();
	if (keyword.length >= min_length) {
		$.ajax({
			url: 'mod/penjualanjasa/fakturjasa_refresh.php',
			type: 'POST',
			data: {keyword:keyword},
			success:function(data){
				$('#fakturjasa_list_id').show();
				$('#fakturjasa_list_id').html(data);
			}
		});
	} else {
		$('#fakturjasa_list_id').hide();
	}
}
// set_item : this function will be executed when we select an item
function set_itemfakturjasa(item) {
	// change input value
	$('#fakturjasa_id').val(item);
	// hide proposition list
	$('#fakturjasa_list_id').hide();
}