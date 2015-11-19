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

function logout () {
	$.ajax({
		url:'lib/dblogout.php',
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