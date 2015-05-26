
var dir  = 'models/m_koleksi.php';
var dir2  = 'models/m_buku.php';
var dir3  = 'models/m_katalog.php';
var dir4  = 'models/m_penerbit.php';
var dir5  = 'models/m_pengarang.php';
var dir6   = 'models/m_lokasi.php';
var dir7  = 'models/m_jenisbuku.php';
var dir8  = 'models/m_tingkatbuku.php';

var koleksi_contentFR ='';

// main function ---
    $(document).ready(function(){
        koleksi_contentFR += '<form autocomplete="off" onsubmit="koleksiSV(this);return false;" id="kolekFR">' 
                        +'<input  id="koleksiH" type="hidden">'
                            +'<tr>'
                                +'<td>Judul</td>'
                                +'<td>: <span id="judulTD"></span></td>'
                            +'</tr>'

                        // +'<label>Judul</label>' 
                        // +'<div class="input-control text size2">'
                        //     +'<input required type="text" name="judulTB" id="judulTB">'
                        //     +'<button class="btn-clear"></button>'
                        // +'</div>'
                        +'<label>Jumlah Koleksi Baru</label>' 
                        +'<div class="input-control text size2">'
                            +'<input required type="text" name="jml_koleksiTB" id="jml_koleksiTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>ID Buku</label>' 
                        +'<div class="input-control text">'
                            +'<input disabled="disabled" required type="text" name="idbukuTB" id="idbukuTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Barcode</label>'
                        +'<div class="input-control text size3">'
                            +'<input disabled="disabled" required type="text" name="barcodeTB" id="barcodeTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                                        +'<label>Sumber</label>'
                                        +'<div>'
                                            +'<div class="input-control radio margin3" >'
                                                +'<label>'
                                                    +'<input value="0" required type="radio" name="sumberTB" id="sumberTB"/>'
                                                    +'<span class="check"></span>'
                                                    +'Beli'
                                                +'</label>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div>'
                                            +'<div class="input-control radio margin3" >'
                                                +'<label>'
                                                    +'<input  value="1" required type="radio" name="sumberTB"/>'
                                                    +'<span class="check"></span>'
                                                    +'Pemberian'
                                                +'</label>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div>'
                        +'<label>Harga</label>'
                        +'<div class="input-control text size3">'
                            +'<input disabled="disabled" required type="text" name="hargaTB" id="hargaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Tanggal Diperoleh</label>'
                        +'<div class="input-control text size2" data-role="datepicker"'
                            +'data-format="yyyy-mm-dd"'
                            +'data-effect="slide">'
                            +'<input id="tglTB" name="tglTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                        +'<label>Alokasi Lokasi</label>' 
                        +'<label>Lokasi</label>' 
                        +'<div class="input-control select size4">'
                            +'<select id="lokasiTB" name="lokasiTB">'
                              +'</select>'
                        +'</div>'
                        +'<label>Tingkat</label>' 
                        +'<div class="input-control select size4">'
                            +'<select id="tingkatTB" name="tingkatTB">'
                              +'</select>'
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
            cmbtingkatbuku($(this).val());
        });$('#tingkatbukuS').on('change',function (){
            viewTB();
        });

        $('#barkodeS').on('keydown',function (e){ // keydown : textbox
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

    function cmblokasi(lok){
        $.ajax({
            url:dir6,
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
   // function cmbjenisbuku(lok,hun,idhun){
   //      // console.log(dep+','+hun+','+idhun);
   //      // return false;
   //      var select='',tb;
   //      // if(hun){// form
   //      //     tb='#jenisbukuTB';
   //      // }
   //      if(!hun){// search
   //          tb='#jenisbukuS';
   //          select+='<option value="">---------- Semua ----------</option>';
   //          // if ($('#jenisbukuS').val()!='') {
   //          //     tl=''
   //          // };
   //      }
   //      $.ajax({
   //          url:dir7,
   //          data:'aksi=cmbjenisbuku&lokasi='+lok,
   //          dataType:'json',
   //          type:'post',
   //          success:function(dt){
   //              var out='';
   //              if(dt.status!='sukses'){
   //                  out+='<option value="">'+dt.status+'</option>';
   //              }else{
   //                  $.each(dt.jenisbuku, function(id,item){
   //                      if(idhun==item.replid)
   //                          out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
   //                      else
   //                          out+='<option value="'+item.replid+'">'+item.nama+'</option>';
   //                  });
   //              }$(tb).html((dt.jenisbuku==null?'':select)+out);
   //              if(!hun) viewTB();
   //          }
   //      });
   //  }

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
                    $.each(dt.jenisbuku, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+' (aktif)</option>';
                            // out+='<option selected="selected" value="'+item.replid+'">'+item.jenisbuku+' (aktif)</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                            // out+='<option value="'+item.replid+'">'+item.jenisbuku+'</option>';
                        }
                    });
                }$('#jenisbukuS').html(out);
                cmbtingkatbuku(dt.jenisbuku[0].replid);
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
                    $.each(dt.tingkatbuku, function(id,item){
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
                    +'&jenisbukuS='+$('#jenisbukuS').val()
                    +'&tingkatbukuS='+$('#tingkatbukuS').val()
                    +'&barkodeS='+$('#barkodeS').val()
                    +'&idbukuS='+$('#idbukuS').val()
                    +'&judulS='+$('#judulS').val()
                    +'&callnumberS='+$('#callnumberS').val()
                    +'&klasifikasiS='+$('#klasifikasiS').val()
                    +'&pengarangS='+$('#pengarangS').val()
                    +'&penerbitS='+$('#penerbitS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="9"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---

// form ---
    function koleksiFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                if(id==''){  //add mode
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    $.ajax({
                        url:dir,
                        data:'aksi=replid',
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            cmblokasi('');
                        }
                    });

                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Tambah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#koleksiH').val(id);
                            $('#judulTD').html(dt.judul);
                            $('#jml_koleksiTB').val(dt.jum);
                            $('#idbukuTB').val(dt.kode);
                            $('#barcodeTB').val(dt.barkode);
                                    $.each($('input[name="sumberTB"]'),function(){
                                        if(dt.sumber==$(this).val())
                                            $(this).attr('checked',true);
                                    });                            
                            // $('#sumberTB').val(dt.sumber);
                            $('#hargaTB').val(dt.harga);
                            $('#tglTB').val(dt.tanggal);
                            $('#lokasiTB').val(dt.lokasi);
                            $('#tingkatTB').val(dt.tingkatbuku);
                            
                            cmblokasi(dt.lokasi);
                            cmbtingkatbuku(dt.tingkatbuku);

                        }
                    });
                }$.Dialog.title(titlex+' Koleksi');
                $.Dialog.content(koleksi_contentFR);
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
                $(el2).html('<tr><td align="center" colspan="9"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
    
//del process ---
    function del(id){
        if(confirm('melanjutkan untuk menghapus data?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=hapus&replid='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    viewTB($('#lokasiS').val());
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                }
                notif(cont,clr);
            }
        });
    }
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
