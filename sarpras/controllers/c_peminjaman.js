var mnu       ='peminjaman'; // edit by epiii
var mnu2      ='lokasi'; // edit by epiii
var dir       ='models/m_'+mnu+'.php'; //edit by epiii
var dir2      ='models/m_'+mnu2+'.php'; //edit by epiii
var contentFR ='';

 
// main function ---
    // contentFR+='<div class="grid show-grid">'
    //                 +'<div class="row">'
    //                     +'<div class="span12">'
    //                         +'level 1 column'
    //                         +'<div class="row">'
    //                         +'<div class="span6" >level 1.1 </div>'
    //                         +'<div class="span3" >level 1.2 </div>'
    //                         +'<div class="span4" >level 1.3 </div>'
    //                     +'</div>'
    //                 +'</div>'
    //             +'</div>';
                
    $(document).ready(function(){
        // contentFR+='<div class="form grid show-grid" xstyle="overflow-y:auto;height:300px;">'
        contentFR+='<div style="overflow:scroll;height:500px;"  class="">'
                   +'<legend>Data Barang</legend>'
                        +'<div class="input-control text">'
                            // +'<input placeholder="kode/nama barang" xkeydown="nosubmit(this);"  type="text" id="barangTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">Kode</th>'
                                    +'<th class="text-center">Barang</th>'
                                    +'<th class="text-center">Aksi</th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="barangTBL">'
                            +'</tbody>'
                            +'<tfoot>'
                            +'</tfoot>'
                        +'</table>'

                    +'<legend>Data Peminjaman</legend>'
                    +'<form onsubmit="simpan();return false;" autocomplete="off"><input id="idformH" type="hidden">' 
                        +'<label>Lokasi</label>'
                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="lokasiH" id="lokasiH" >'
                            // +'<input enabled="enabled" name="lokasiTB" id="lokasiTB" '
                            +'<input disabled="disabled" name="lokasiTB" id="lokasiTB" >'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Peminjam</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="Nama Peminjam"  required type="text" name="peminjamTB" id="peminjamTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Tanggal Peminjaman</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-date="2014-10-23"'
                            +'data-format="yyyy-mm-dd"'
                            +'data-effect="slide">'
                            +'<input id="tanggal1TB" name="tanggal1TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        +'<label>Tanggal Pengembalian</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-date="2014-10-23"'
                            +'data-format="yyyy-mm-dd"'
                            +'data-effect="slide">'
                            +'<input id="tanggal2TB" name="tanggal2TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'



                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'

                    +'</form>'

                +'</div>'                
                ;

        $( "#barangTB" ).combogrid({
            debug:true,
            colModel: [{
                    'columnName':'kode',
                    'hide':true,
                    'width':'8',
                    'label':'kode'
                }, {
                    'columnName':'nama',
                    'width':'48',
                    'label':'Barang'
                }],
            // url: 'pAjax.php?aksi=autoCom&menu=transJasa',
            url: dir+'?aksi=autocomp',
            select: function( event, ui ) {
                alert(ui.item.kode+' '+ui.item.nama);
                // $( "#txtKodeJasa" ).val( ui.item.kd_jasa);
                // $( "#txtJasa" ).val( ui.item.nama_jasa);
                // $( "#txtKodeBBaku" ).val( ui.item.kd_bahan);
                // $( "#txtNamaBBaku" ).val( ui.item.nm_bahan);
                return false;
            }
        });

        //combo lokasi
        cmblokasi();
        
        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action // edit by epiii
        $('#lokasiS').on('change',function (e){ // change : combo box
                viewTB($('#lokasiS').val());
        });
        $('#peminjamS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB($('#lokasiS').val());
        });
        $('#namaS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB2($('').val());
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            // $('#lokasiS').val('');
            $('#peminjamS').val('');
            // $('#keteranganS').val('');
        });
        
    }); 
// end of main function ---

// combo departemen ---
    function cmblokasi(){
        $.ajax({
            url:dir2,
            data:'aksi=cmblokasi',
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.lokasi, function(id,item){
                        out+='<option value="'+item.replid+'">['+item.kode+'] '+item.nama+'</option>';
                    });
                    //panggil fungsi viewTB() ==> tampilkan tabel 
                    viewTB(dt.lokasi[0].replid); 
                }$('#lokasiS').html(out);
            }
        });
    }
//end of combo departemen ---

function simpan(){
        var urlx ='&aksi=simpanall';
        // edit mode
        if($('#idformH').val()!=''){
            urlx += '&replid='+$('#idformH').val();
        }
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$('form').serialize()+urlx,
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    kosongkan();
                    viewTB($('#lokasiS').val());
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//save process ---
    function pilih(kode){
        var urlx ='&aksi=simpandftp';
        // edit mode
        
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:urlx+'&kode='+kode,
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    // $.Dialog.close();
                    kosongkan();
                    viewTB3($('').val());
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                // notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(lok){ //edit by epiii 
        var aksi ='aksi=tampil';
        var cari ='&lokasiS='+lok
                    // +'&kodeS='+$('#kodeS').val()
                    +'&peminjamS='+$('#peminjamS').val();
                    // +'&keteranganS='+$('#keteranganS').val()
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#peminjamantbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#peminjamantbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---
// view table 2 ---
    function viewTB2(){ //edit by epiii 
        // alert('salah');
        var aksi ='aksi=tampil2';
        var cari ='&namaS='+$('#namaS').val();
                    // +'&keteranganS='+$('#keteranganS').val()
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#barangtbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#barangtbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table 2 ---
// view table 3 ---
    function viewTB3(){ //edit by epiii 
        var aksi ='aksi=tampil3';
        // var cari ='&namaS='+$('#namaS').val();
                    // +'&keteranganS='+$('#keteranganS').val()
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi,
            beforeSend:function(){
                $('#dftptbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#dftptbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table 3 ---

// form ---
    function viewFR(id){
        // $.Dialog.autoResize;

        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            // width: 'auto',
            height: 'auto',
            width: '30%',
            // width: 500,
            padding: 20,
            // padding: 10,
            onShow: function(){
                var titlex;
                if(id==''){  //add mode
                    // alert('halooo');
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    $.ajax({
                        url:dir2,
                        data:'aksi=cmblokasi&replid='+$('#lokasiS').val(),
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#lokasiTB').val(dt.lokasi[0].nama);
                            $('#lokasiH').val($('#lokasiS').val());
                        }
                    });
                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            $('#lokasiH').val($('#lokasiS').val()); // edit by epii
                            $('#lokasiTB').val(dt.lokasi);
                            $('#peminjamTB').val(dt.peminjam);
                            $('#tanggal1TB').val(dt.tanggal1);
                            $('#tanggal2TB').val(dt.tanggal2);
                            $('#keteranganTB').val(dt.keterangan);
                            // $('#statusTB').val(dt.status);
                        }
                    });
                }$.Dialog.title(titlex+' '+mnu); // edit by epiii
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

//paging ---
function pagination(page,aksix,subaksi){ 
        var aksi ='aksi='+aksix+'&subaksi='+subaksi+'&starting='+page;
        var cari ='';
        $('.'+subaksi+'_cari').each(function(){
            var p = $(this).attr('id');
            var v = $(this).val();
            cari+='&'+p+'='+v;
        });
        $.ajax({
            url:dir,
            type:"post",
            data: aksi+cari,
            beforeSend:function(){
                $('#'+subaksi+'tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#'+subaksi+'tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
    
//end of paging ---
    
//del process ---
    function deldftp(id){
        if(confirm('melanjutkan untuk menghapus data?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=hapusdftp&replid='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    viewTB3($('').val());
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                }
                notif(cont,clr);
            }
        });
    }
//end of del process ---

// notifikasi
function notif(cont,clr) {
    var not = $.Notify({
        caption : "<b>Notifikasi</b>",
        content : cont,
        timeout : 3000,
        style :{
            background: clr,
            color:'white'
        },
    });
}
// end of notifikasi

//reset form ---
    function kosongkan(){
        $('#idformTB').val('');
        $('#peminjamTB').val('');
        $('#tempatTB').val('');
        $('#tanggal1TB').val('');
        $('#tanggal2TB').val('');
        // $('#statusTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
