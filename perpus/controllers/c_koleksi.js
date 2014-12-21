
var dir   = 'models/m_lokasi.php';
var dir2  = 'models/m_buku.php';
var dir3  = 'models/m_katalog.php';
var dir4  = 'models/m_penerbit.php';
var dir5  = 'models/m_pengarang.php';
var dir6  = 'models/m_koleksi.php';
var dir7  = 'models/m_jenisbuku.php';
var dir8  = 'models/m_tingkatbuku.php';

var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="koleksiFR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<label>Lokasi</label>'

                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="lokasiH" id="lokasiH" class="span2">'
                            // +'<input enabled="enabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<input disabled="disabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Kode Tempat</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="kode tampat"  class="span2" required type="text" name="kodeTB" id="kodeTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Nama Tempat</label>'
                        +'<div class="input-control text">'
                            +'<input  placeholder="kode" required type="text" name="namaTB" id="namaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
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
        // cmbjenisbuku();
        
        //load table // edit by epiii
        // viewTB();

        //add form
        // $("#tambahBC").on('click', function(){
        //     viewFR('');
        // });

        //search action // edit by epiii
        // $('#lokasiS').on('change',function (e){ // change : combo box
        //         viewTB($('#lokasiS').val());
        // });$('#jenisbukuS').on('change',function (e){ // change : combo box
        //         viewTB($('').val());
        // });$('#tingkatbukuS').on('change',function (e){ // change : combo box
        //         viewTB($('#').val());
        // });
        $('#lokasiS').on('change',function(){
            cmbjenisbuku($(this).val());
        });$('#jenisbukuS').on('change',function (){
            viewTB();
        });$('#tingkatbukuS').on('change',function (){
            viewTB();
        });$('#barkodeS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB($('#lokasiS').val());
        });$('#idbukuS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB();
                // viewTB($('#lokasiS').val());
        });$('#judulS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB();
        });$('#callnumberS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB();
        });$('#klasifikasiS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB();
        });$('#pengarangS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB();
        });$('#penerbitS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB();
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            // $('#lokasiS').val('');
            $('#barkodeS').val('');
            $('#idbukuS').val('');
            $('#judulS').val('');
            $('#callnumberS').val('');
            $('#klasifikasiS').val('');
            $('#penerbitS').val('');
            $('#pengarangS').val('');
        });
    }); 
// end of main function ---

// combo lokasi ---
    // function cmblokasi(lok){
    //     $.ajax({
    //         url:dir,
    //         data:'aksi=cmblokasi',
    //         dataType:'json',
    //         type:'post',
    //         success:function(dt){
    //             var out='';
    //             if(dt.status!='sukses'){
    //                 out+='<option value="">'+dt.status+'</option>';
    //             }else{
    //                 $.each(dt.lokasi, function(id,item){
    //                     out+='<option value="'+item.replid+'">['+item.kode+'] '+item.nama+'</option>';
    //                 });
    //                 //panggil fungsi viewTB() ==> tampilkan tabel 
    //                 viewTB(dt.lokasi[0].replid); 
    //             }$('#lokasiS').html(out);
    //         }
    //     });
    // }
    function cmblokasi(lok){
        $.ajax({
            url:dir,
            data:'aksi=cmblokasi',
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.lokasi, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }
                $('#lokasiS').html(out);
                cmbjenisbuku(dt.lokasi[0].replid);
            }
        });
    }
//end of combo lokasi ---
// combo jenisbuku ---
    
    function cmbjenisbuku(lok){
        $.ajax({
            url:dir7,
            data:'aksi=cmbjenisbuku&lokasi='+lok,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    // $.each(dt.jenisbuku, function(id,item){
                    $.each(dt.nama, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+' (aktif)</option>';
                            // out+='<option selected="selected" value="'+item.replid+'">'+item.jenisbuku+' (aktif)</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                            // out+='<option value="'+item.replid+'">'+item.jenisbuku+'</option>';
                        }
                    });
                }$('#jenisbukuS').html(out);
                cmbtingkatbuku(dt.nama[0].replid);
            }
        });
    }
//end of combo jenisbuku ---


function cmbtingkatbuku(tgt){
        $.ajax({
            url:dir8,
            data:'aksi=cmbtingkatbuku&jenisbuku='+tgt,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                // alert(dt.status);return false;
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.nama, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama       +' (aktif)</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                        }
                    });
                }$('#tingkatbukuS').html(out);
                // cmbtingkatbuku(dt.tingkatbuku[0].replid);
                viewTB(); 
 
            }
        });
    }
//save process ---
    // function simpan(){
    //     var urlx ='&aksi=simpan';
    //     // edit mode
    //     if($('#idformH').val()!=''){
    //         urlx += '&replid='+$('#idformH').val();
    //     }
    //     $.ajax({
    //         url:dir2,
    //         cache:false,
    //         type:'post',
    //         dataType:'json',
    //         data:$('form').serialize()+urlx,
    //         success:function(dt){
    //             if(dt.status!='sukses'){
    //                 cont = 'Gagal menyimpan data';
    //                 clr  = 'red';
    //             }else{
    //                 $.Dialog.close();
    //                 kosongkan();
    //                 viewTB($('#lokasiS').val());
    //                 cont = 'Berhasil menyimpan data';
    //                 clr  = 'green';
    //             }notif(cont,clr);
    //         }
    //     });
    // }
//end of save process ---

// view table ---
    // function viewTB(lok){ //edit by epiii 
    function viewTB(){ //edit by epiii 
        var aksi ='aksi=tampil';
        // var cari ='&lokasiS='+lok
        var cari ='&lokasiS='+$('#lokasiS').val()
                    +'&barkodeS='+$('#barkodeS').val()
                    +'&idbukuS='+$('#idbukuS').val()
                    +'&judulS='+$('#judulS').val()
                    +'&callnumberS='+$('#callnumberS').val()
                    +'&klasifikasiS='+$('#klasifikasiS').val()
                    +'&pengarangS='+$('#pengarangS').val()
                    +'&penerbitS='+$('#penerbitS').val();
        $.ajax({
            url : dir6,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---

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
                        url:dir6,
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
                        url:dir6,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            $('#lokasiH').val($('#lokasiS').val()); // edit by epii
                            $('#lokasiTB').val(dt.lokasi);
                            $('#kodeTB').val(dt.kode);
                            $('#namaTB').val(dt.nama);
                            $('#keteranganTB').val(dt.keterangan);
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
        var el,el2;

        if(subaksi!=''){ // multi paging 
            el  = '.'+subaksi+'_cari';
            el2 = '#'+subaksi+'_tbody';
        }else{ // single paging
            el  = '.cari';
            el2 = '#tbody';
        }

        $(el).each(function(){
            var p = $(this).attr('id');
            var v = $(this).val();
            cari+='&'+p+'='+v;
        });

        $.ajax({
            url:dir,
            type:"post",
            data: aksi+cari,
            beforeSend:function(){
                $(el2).html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
    // function pagination(page,aksix,menux){ 
    //     var datax = 'starting='+page+'&aksi='+aksix+'&menu='+menux;
    //     var cari ='&lokasiS='+lok
    //                 +'&barkodeS='+$('#barkodeS').val()
    //                 +'&idbukuS='+$('#idbukuS').val()
    //                 +'&judulS='+$('#judulS').val()
    //                 +'&callnumberS='+$('#callnumberS').val()
    //                 +'&klasifikasiS='+$('#klasifikasiS').val()
    //                 +'&pengarangS='+$('#pengarangS').val()
    //                 +'&penerbitS='+$('#penerbitS').val();
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
    // function del(id){
    //     if(confirm('melanjutkan untuk menghapus data?'))
    //     $.ajax({
    //         url:dir,
    //         type:'post',
    //         data:'aksi=hapus&replid='+id,
    //         dataType:'json',
    //         success:function(dt){
    //             var cont,clr;
    //             if(dt.status!='sukses'){
    //                 cont = '..Gagal Menghapus '+dt.terhapus+' ..';
    //                 clr  ='red';
    //             }else{
    //                 viewTB($('#lokasiS').val());
    //                 cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
    //                 clr  ='green';
    //             }
    //             notif(cont,clr);
    //         }
    //     });
    // }
//end of del process ---

// notifikasi
// function notif(cont,clr) {
//     var not = $.Notify({
//         caption : "<b>Notifikasi</b>",
//         content : cont,
//         timeout : 3000,
//         style :{
//             background: clr,
//             color:'white'
//         },
//     });
// }
// end of notifikasi

//reset form ---
    // function kosongkan(){
    //     $('#idformTB').val('');
    //     $('#namaTB').val('');
    //     $('#keteranganTB').val('');
    // }
//end of reset form ---

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
