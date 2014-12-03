var mnu       ='peminjaman'; // edit by epiii
var mnu2      ='lokasi'; // edit by epiii
var dir       ='models/m_'+mnu+'.php'; //edit by epiii
var dir2      ='models/m_'+mnu2+'.php'; //edit by epiii
var contentFR ='';


// main function ---
    $(document).ready(function(){
        contentFR 
                += '<form data-role="scrollbox" data-scroll="both" onsubmit="simpan();return false;" autocomplete="off" Xclass="span4">' 
                // += '<form data-role="scrollbox" data-scroll="both" autocomplete="off" Xclass="span4" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                    +'<div class="grid span10">'
                        +'<div class="row">'
                            +'<div class="span4">'
                                +'<div>'
                                    +'<legend>Pilih Barang</legend>'
                                    +'<table class="table hovered bordered striped">'
                                        +'<thead>'
                                           
                                            +'<tr id="cariTR" class="selected">'
                                                +'<th class="text-left"><input keydown="viewTB2();return false;" placeholder="Nama Barang" id="namaS" name="namaS"></th>'
                                            +'</tr>'
                                            +'<tr style="color:white;"class="info">'
                                                +'<th class="text-center">Kode Barang</th>'
                                                +'<th class="text-center">Nama Barang</th>'
                                                +'<th class="text-center">Aksi</th>'
                                            +'</tr>'
                                        +'</thead>'

                                        +'<tbody id="barangtbody">'
                                           
                                        +'</tbody>'
                                        +'<tfoot>'
                                            
                                        +'</tfoot>'
                                    +'</table>'
                                +'</div>'
                                +'<div>'
                                    +'<legend>Barang Yang Akan Dipinjam</legend>'
                                    +'<table class="table hovered bordered striped">'
                                        +'<thead>'
                                            +'<tr id="cariTR" class="selected">'
                                                +'<th style="display:none" class="text-left"><input placeholder="Nama Barang" ><button onclick="return viewTB2();" class="btn-date">Cari</button></th>'
                                            +'</tr>'
                                            +'<tr style="color:white;"class="info">'
                                                +'<th class="text-center">Kode Barang</th>'
                                                +'<th class="text-center">Nama Barang</th>'
                                                +'<th class="text-center">Aksi</th>'
                                            +'</tr>'
                                        +'</thead>'
                                        +'<tbody id="dftptbody">'
                                        +'</tbody>'
                                        +'<tfoot>'
                                        +'</tfoot>'
                                            
                                    +'</table>'
                                +'</div>'
                                    
                            +'</div>'
                        
                            +'<div  class="span4">'
                            +'<legend>Informasi Peminjam</legend>'
                                    +'<input id="idformH" type="hidden">' 
                                    +'<label>Lokasi</label>'

                                    +'<div class="input-control text">'
                                        +'<input  type="hidden" name="lokasiH" id="lokasiH" class="span4">'
                                        // +'<input enabled="enabled" name="lokasiTB" id="lokasiTB" class="span4">'
                                        +'<input disabled="disabled" name="lokasiTB" id="lokasiTB" class="span4">'
                                        +'<button class="btn-clear"></button>'
                                    +'</div>'
                                    
                                    +'<label>Peminjam</label>'
                                    +'<div class="input-control text">'
                                        +'<input placeholder="Nama Peminjam"  class="span4" required type="text" name="peminjamTB" id="peminjamTB">'
                                        +'<button class="btn-clear"></button>'
                                    +'</div>'

                                    // +'<label>Tempat</label>'
                                    // +'<div class="input-control text">'
                                    //     +'<input class="span4"  placeholder="Tempat" required type="text" name="tempatTB" id="tempatTB">'
                                    //     +'<button class="btn-clear"></button>'
                                    // +'</div>'

                                    +'<label>Tanggal Peminjaman</label>'
                                    +'<div class="input-control text" data-role="datepicker"'
                                        +'data-date="2014-10-23"'
                                        +'data-format="yyyy-mm-dd"'
                                        +'data-effect="slide">'
                                        +'<input class="span4" id="tanggal1TB" name="tanggal1TB" type="text">'
                                        +'<button class="btn-date"></button>'
                                    +'</div>'

                                    +'<label>Tanggal Pengembalian</label>'
                                    +'<div class="input-control text" data-role="datepicker"'
                                        +'data-date="2014-10-23"'
                                        +'data-format="yyyy-mm-dd"'
                                        +'data-effect="slide">'
                                        +'<input class="span4   " id="tanggal2TB" name="tanggal2TB" type="text">'
                                        +'<button class="btn-date"></button>'
                                    +'</div>'

                                    +'<label>Keterangan</label>'
                                    +'<div class="input-control textarea">'
                                        +'<textarea class="span4" placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                                    +'</div>'
                            +'</div>'
                        
                        +'</div>'
                    +'</div>'
                    +'<div class="form-actions">' 
                        +'<button class="button primary">simpan</button>&nbsp;'
                        +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                    +'</div>'
                +'</form>';
                        

        /*
        load pertama kali (pilihn salah satu) :
        cmblokasi : bila ada combo box
        viewTB : jika tanpa combo box
        */

        //combo lokasi
        cmblokasi();
        
        //load table // edit by epiii
        // viewTB();

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
        // $('#keteranganS').on('keydown',function (e){ // keydown : textbox
        //     if(e.keyCode == 13)
        //         // viewTB($('#keteranganS').val());
        //         viewTB($('#lokasiS').val());
        // });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            // $('#lokasiS').val('');
            $('#peminjamS').val('');
            // $('#keteranganS').val('');
        });
        // $('#input2').on('click',function(){
        //     $('#cariTR').toggle('slow');
        //     // $('#lokasiS').val('');
        //     $('#peminjamS').val('');
        //     // $('#keteranganS').val('');
        // });
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
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
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
    // function pagination(page,aksix,menux){ // edit by epiii
    //     var datax = 'starting='+page+'&aksi='+aksix+'&menu='+menux;
    //     var cari ='&lokasiS='+$('#lokasiS').val()
    //                 // +'&kodeS='+$('#kodeS').val()
    //                 +'&peminjamS='+$('#peminjamS').val();
    //                 // +'&keteranganS='+$('#keteranganS').val();
    //     $.ajax({
    //         url:dir,
    //         type:"post",
    //         data: datax+cari,
    //         beforeSend:function(){
    //             $('#tbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
    //         },success:function(dt){
    //             setTimeout(function(){
    //                 $('#tbody').html(dt).fadeIn();
    //             },1000);
    //         }
    //     });
    // }   
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
