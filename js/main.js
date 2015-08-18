$(document).ready(function(){
	// $.ajax({
	// 	url:'lib/dblogout.php',
	// 	dataType:'html',
	// 	success:function(data){
	// 		if(data=1){
	// 			document.location.reload();
	// 		}else{
	// 			alert('gagal proses logout');
	// 		}
	// 	}
	// });
});

function logout (par) {
	$.ajax({
		url:(typeof par=='undefined'?'../':'')+'lib/dblogout.php',
		// url:(typeof par==undefined?'../':'')+'lib/dblogout.php',
		dataType:'html',
		success:function(data){
			if(data=1){
				document.location.reload();
			}else{
				alert('gagal proses logout');
			}
		}
	});
}