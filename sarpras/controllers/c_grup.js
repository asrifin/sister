var mnu       ='grup'; 
var mnu2      ='lokasi'; 
var mnu3      ='katalog'; 
var mnu4      ='jenis'; 
var mnu5      ='barang'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';
var dir3      ='models/m_'+mnu3+'.php';
var dir4      ='models/m_'+mnu4+'.php';
var dir5      ='models/m_'+mnu5+'.php';

var g_contentFR = k_contentFR = b_contentFR ='';

// main function ---
    $(document).ready(function(){
        //form content
            // grup
            g_contentFR += '<form autocomplete="off" onsubmit="grupSV(); return false;" id="'+mnu+'FR">' 
                            +'<input id="idformH" type="hidden">' 
                            
                            +'<label>Lokasi</label>'
                            +'<div class="input-control text">'
                                +'<input  type="hidden" name="g_lokasiH" id="g_lokasiH" class="span2">'
                                +'<input disabled="disabled" name="g_lokasiTB" id="g_lokasiTB" class="span2">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'
                            
                            +'<label>Kode</label>'
                            +'<div class="input-control text">'
                                +'<input required maxlength="3" placeholder="kode" name="g_kodeTB" id="g_kodeTB" class="span1">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'
                            
                            +'<label>Nama</label>'
                            +'<div class="input-control text">'
                                +'<input  placeholder="nama"  required type="text" name="g_namaTB" id="g_namaTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'

                            +'<label>Keterangan</label>'
                            +'<div class="input-control textarea">'
                                +'<textarea placeholder="keterangan" name="g_keteranganTB" id="g_keteranganTB"></textarea>'
                            +'</div>'
                            
                            +'<div class="form-actions">' 
                                +'<button class="button primary">simpan</button>&nbsp;'
                                +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                            +'</div>'
                        +'</form>';
            //katalog
            k_contentFR +=' <div class="grid">'
                                +'<form class="span10" autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                                    +'<input id="idformH" type="hidden">' 

                                    +'<div class="row">'
                                        +'<div class="span5"> '
                                            +'<label>Lokasi</label>'
                                            +'<div class="input-control text">'
                                                +'<input  type="hidden" name="lokasiH" id="lokasiH" >'
                                                +'<input disabled="disabled" name="k_lokasiTB" id="k_lokasiTB" class="span5">'
                                                +'<button class="btn-clear"></button>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div class="span5">'
                                            +'<label>Grup</label>'
                                            +'<div class="input-control text">'
                                                +'<input disabled placeholder="kode" name="k_grupTB" id="k_grupTB">'
                                                +'<button class="btn-clear"></button>'
                                            +'</div>'
                                        +'</div>'
                                    +'</div>'
                                    
                                    +'<div class="row">'
                                        +'<div class="span5"> '
                                            +'<label>Nama</label>'
                                            +'<div class="input-control text">'
                                                +'<input  placeholder="nama"  required type="text" name="k_namaTB" id="k_namaTB">'
                                                +'<button class="btn-clear"></button>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div class="span5">'
                                            +'<label>Jenis</label>'
                                            +'<div class="input-control text">'
                                                +'<input  placeholder="jenis"  required type="text" name="k_jenisTB" id="k_jenisTB">'
                                                +'<button class="btn-clear"></button>'
                                            +'</div>'
                                        +'</div>'
                                    +'</div>'

                                    +'<div class="row">'
                                        +'<div class="span5"> '
                                            +'<label>Penyusutan</label>'
                                            +'<div class="input-control text">'
                                                +'<input class="span1" placeholder="susut"  required type="text" name="k_susutTB" id="k_susutTB">'
                                                +'<button class="btn-clear"></button> % per tahun'
                                            +'</div>'
                                        +'</div>'
                                        +'<div class="span5">'
                                            +'<label>Keterangan</label>'
                                            +'<div class="input-control textarea">'
                                                +'<textarea placeholder="keterangan" name="g_keteranganTB" id="g_keteranganTB"></textarea>'
                                            +'</div>'
                                        +'</div>'
                                    +'</div>'

                                    +'<div class="row">'
                                        +'<div class="span5"> '
                                            +'<label>Gambar Barang</label>'
                                            +'<div class="input-control file info-state" data-role="input-control">'
                                                +'<input id="k_photoTB" name="k_photoTB" type="file">'
                                                +'<button class="btn-file"></button>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div class="span5">'
                                            +'<label>Gambar Barang</label>'
                                            +'<div class="input-control file info-state" data-role="input-control">'
                                                +'<input id="k_photoTB" name="k_photoTB" type="file">'
                                                +'<button class="btn-file"></button>'
                                            +'</div>'
                                        +'</div>'
                                    +'</div>'

                                    +'<div class="row">'
                                        +'<div class="span5"> '
                                            +'<div class="form-actions">' 
                                                +'<button class="button primary">simpan</button>&nbsp;'
                                                +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                                            +'</div>'
                                        +'</div>'
                                    +'</div>'

                                +'</form>'
                        +'</div>';
            // barang
            b_contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                            +'<input id="idformH" type="hidden">' 

                            +'<label>Lokasi</label>'
                            +'<div class="input-control text">'
                                +'<input  type="hidden" name="lokasiH" id="lokasiH" class="span5">'
                                +'<input disabled="disabled" name="k_lokasiTB" id="k_lokasiTB" class="span2">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'
                            
                            +'<label>Grup</label>'
                            +'<div class="input-control text">'
                                +'<input placeholder="kode" name="k_grupTB" id="k_grupTB" class="span2">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'
                            
                            +'<label>Nama</label>'
                            +'<div class="input-control text">'
                                +'<input  placeholder="nama"  required type="text" name="k_namaTB" id="k_namaTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'

                            +'<label>Jenis</label>'
                            +'<div class="input-control text">'
                                +'<input  placeholder="jenis"  required type="text" name="k_jenisTB" id="k_jenisTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'

                            +'<label>Susut</label>'
                            +'<div class="input-control text">'
                                +'<input  placeholder="jenis"  required type="text" name="k_susutTB" id="k_susutTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'

                            +'<label>Keterangan</label>'
                            +'<div class="input-control textarea">'
                                +'<textarea placeholder="keterangan" name="g_keteranganTB" id="g_keteranganTB"></textarea>'
                            +'</div>'

                            +'<div class="input-control file info-state" data-role="input-control">'
                                +'<input id="k_photoTB" name="k_photoTB" type="file">'
                                +'<button class="btn-file"></button>'
                            +'</div>'

                            +'<div class="form-actions">' 
                                +'<button class="button primary">simpan</button>&nbsp;'
                                +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                            +'</div>'
                        +'</form>';

        //combo lokasi
            cmblokasi();

        //add form
            $("#g_tambahBC").on('click', function(){ // grup form 
                grupFR('');
            });$("#k_tambahBC").on('click', function(){ // katalog
                katalogFR('');
            });$("#b_tambahBC").on('click', function(){ // barang
                barangFR('');
            });

        //search action 
            // grup barang
            $('#g_lokasiS').on('change',function (e){ // lokasi
                vwGrup($('#g_lokasiS').val());
            });$('#g_kodeS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_namaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_utotalS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_utersediaS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_udipinjamS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_totasetS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_keteranganS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });

            // katalog barang
            $('#k_kodeS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13)
                    vwKatalog($('#g_lokasiS').val());
            });$('#k_namaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwKatalog($('#g_lokasiS').val());
            });$('#k_keteranganS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwKatalog($('#g_lokasiS').val());
            });

        // search button
            //grup
            $('#g_cariBC').on('click',function(){
                $('#g_cariTR').toggle('slow');
                $('#g_kodeS').val('');
                $('#g_namaS').val('');
                $('#g_utotalS').val('');
                $('#g_utersediaS').val('');
                $('#g_udipinjamS').val('');
                $('#g_keteranganS').val('');
            });
            //katalog
            $('#k_cariBC').on('click',function(){
                $('#k_cariTR').toggle('slow');
                $('#k_kodeS').val('');
                $('#k_namaS').val('');
                $('#k_keteranganS').val('');
            });

        // switch panel
            switchPN(1);
            $('#k_grupBC').on('click',function(){
                cmblokasi();
                switchPN(1);
            });
    }); 
// end of main function ---

//paging ---
    function pagination(page,aksix,subaksi){ 
        // var aksi ='aksi=tampil&subaksi=grup';
        var aksi ='aksi=tampil&subaksi='+subaksi;
        if(typeOf(subaksi)==undefined){
            subaksi='grup';
        }

        // var datax = 'starting='+page+'&aksi='+aksix+'&subaksi=grup';
        var datax   = 'starting='+page+'&aksi='+aksix+'&subaksi='+subaksi;
        var cari    ='&lokasiS='+lok
                    +'&g_kodeS='+$('#g_kodeS').val()
                    +'&g_namaS='+$('#g_namaS').val()
                    +'&g_keteranganS='+$('#g_keteranganS').val();
        $.ajax({
            // url:dir,
            url:'m_'+subaksi+'.php',
            type:"post",
            data: datax+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
//end of paging ---

// view table ---
    function vwGrup(lok){ //edit by epiii 
        var aksi ='aksi=tampil&subaksi=grup';
        var cari ='&lokasiS='+lok
                +'&g_kodeS='+$('#g_kodeS').val()
                +'&g_namaS='+$('#g_namaS').val()
                +'&g_keteranganS='+$('#g_keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#g_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#g_tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---

// view barang
    function vwBarang(id) {
        var aksi ='aksi=tampil&subaksi=katalog&grup='+id;
        // alert(aksi);return false;
        var cari ='&lokasiS='+lok
                +'&k_kodeS='+$('#k_kodeS').val()
                +'&k_namaS='+$('#k_namaS').val()
                +'&k_keteranganS='+$('#k_keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            // data: aksi,
            data: aksi+cari,
            beforeSend:function(){
                $('#k_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                switchPN(2);
                setTimeout(function(){
                    $('#k_tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }   
//end of view barang

// view katalog barang
    function vwKatalog(id) {
        var aksi ='aksi=tampil&subaksi=katalog&grup='+id;
        // alert(aksi);return false;
        var cari ='&k_kodeS='+$('#k_kodeS').val()
                +'&k_namaS='+$('#k_namaS').val()
                +'&k_keteranganS='+$('#k_keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#k_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                $('#k_grupH').val(id);
                switchPN(2);
                vwHeadKatalog(id);
                setTimeout(function(){
                    $('#k_tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }   
//end of view katalog barang

// headinfo katalog
    function vwHeadKatalog (id) {
        $.ajax({
            url:dir,
            type:'post',
            dataType:'json',
            data:'aksi=headinfo&subaksi=katalog&grup='+id,
            success:function (dt) {
                if (dt.status!='sukses') {
                    alert(dt.status+' memuat data header');
                }else{
                    $('#k_grupDV').html(': '+dt.grup);
                    $('#k_lokasiDV').html(': '+dt.lokasi);
                    $('#k_totasetDV').html(': Rp. '+dt.totaset+',-');
                }
            },
        });
    }
//end of  headinfo katalog

// switch panel
    function switchPN (e) {
        $.each($('.panelx'),function(id,item){
            var ke = id+1;
            if(ke==e){
                $('#panel'+ke).removeAttr('style');
                $('h4').html($(this).attr('title'));
            }else{
                $('#panel'+ke).attr('style','display:none;');
            }
        });
    }
//end of  switch panel

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
                    //panggil fungsi vwGrup() ==> tampilkan tabel 
                    vwGrup(dt.lokasi[0].replid); 
                }
                // alert(out);
                $('#g_lokasiS').html(out);
            }
        });
    }
//end of combo departemen ---

//save process ---
    function grupSV(){
        var urlx ='&aksi=simpan&subaksi=grup';
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
                    gkosongkan();
                    vwGrup($('#g_lokasiS').val());
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// form grup ---
    function grupFR(id){
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
                    // cmb jenis -------------------------------------
                    $.ajax({
                        url:dir2,
                        dataType:'json',
                        type:'post',
                        data:'aksi=cmblokasi&replid='+$('#g_lokasiS').val(),
                        success:function(dt){
                            $('#g_lokasiTB').val('['+dt.lokasi[0].kode+'] '+dt.lokasi[0].nama);
                            $('#g_lokasiH').val($('#g_lokasiS').val());
                        }
                    });
                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    // cmb jenis -------------------------------------
                    $.ajax({
                        url:dir2,
                        dataType:'json',
                        type:'post',
                        data:'aksi=cmblokasi&replid='+$('#g_lokasiS').val(),
                        success:function(dt){
                            // data grup---------------------------------
                            $.ajax({
                                url:dir,
                                data:'aksi=ambiledit&subaksi=grup&replid='+id,
                                type:'post',
                                dataType:'json',
                                success:function(dt2){
                                    $('#idformH').val(id);
                                    $('#g_lokasiH').val($('#g_lokasiS').val()); 
                                    $('#g_lokasiTB').val('['+dt.lokasi[0].kode+'] '+dt.lokasi[0].nama); 
                                    $('#g_kodeTB').val(dt2.kode);
                                    $('#g_namaTB').val(dt2.nama);
                                    $('#g_keteranganTB').val(dt2.keterangan);
                                }
                            });//end of  data grup--------------------------
                        }
                    });//end of cmb jenis ----------------------------------
                }$.Dialog.title(titlex+' '+mnu); // edit by epiii
                $.Dialog.content(g_contentFR);
            }
        });
    }
// end of form grup ---

// form katalog---
    function katalogFR(id){
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
                        url:dir2,
                        data:'aksi=cmblokasi&replid='+$('#g_lokasiS').val(),
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#lokasiTB').val(dt.lokasi[0].nama);
                            $('#lokasiH').val($('#g_lokasiS').val());
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
                            $('#lokasiH').val($('#g_lokasiS').val()); // edit by epii
                            $('#kodeTB').val(dt.kode);
                            $('#namaTB').val(dt.nama);
                            $('#keteranganTB').val(dt.keterangan);
                        }
                    });
                }$.Dialog.title(titlex+' '+mnu); // edit by epiii
                $.Dialog.content(k_contentFR);
            }
        });
    }
// end of form katalog---

//del process ---
    function grupDel(id){
        if(confirm('melanjutkan untuk menghapus data?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=hapus&subaksi=grup&replid='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    vwGrup($('#g_lokasiS').val());
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                }notif(cont,clr);
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
    function gkosongkan(){
        $('#idformTB').val('');
        $('#g_kodeTB').val('');
        $('#g_namaTB').val('');
        $('#g_utotalTB').val('');
        $('#g_utersediaTB').val('');
        $('#g_udipinjamTB').val('');
        $('#g_keteranganTB').val('');
    }
//end of reset form ---


    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
