var mnu       ='grup'; 
var mnu2      ='lokasi'; 
var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<label>Lokasi</label>'
                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="lokasiH" id="lokasiH" class="span2">'
                            +'<input disabled="disabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Kode</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="kode" name="g_kodeTB" id="g_kodeTB" class="span2">'
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

        //combo lokasi
        cmblokasi();
        
        //load table // edit by epiii
        // vwGrup();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action // edit by epiii
        $('#lokasiS').on('change',function (e){ // change : combo box
                vwGrup($('#lokasiS').val());
        });
        $('#g_kodeS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                vwGrup($('#lokasiS').val());
        });
        $('#g_namaS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                vwGrup($('#lokasiS').val());
        });
        $('#g_keteranganS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                vwGrup($('#lokasiS').val());
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#g_kodeS').val('');
            $('#g_namaS').val('');
            $('#g_utotalS').val('');
            $('#g_utersediaS').val('');
            $('#g_udipinjamS').val('');
            $('#g_keteranganS').val('');
        });

        // switch panel
        switchPN(1);
        $('.cl').on('click',function(){
            switchPN($(this).text());
        });
    }); 
// end of main function ---


// view table ---
    function vwGrup(lok){ //edit by epiii 
        var aksi ='aksi=tampil&subaksi=grup';
        var cari ='&lokasiS='+lok
                +'&g_kodeS='+$('#g_kodeS').val()
                +'&g_namaS='+$('#g_namaS').val()
                +'&g_utotalS='+$('#g_utotalS').val()
                +'&g_utersediaS='+$('#g_utersediaS').val()
                +'&g_udipinjamS='+$('#g_utersediaS').val()
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

//paging ---
    // function pagination(page,aksix,menux){ 
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
                    +'&g_utotalS='+$('#g_utotalS').val()
                    +'&g_utersediaS='+$('#g_utersediaS').val()
                    +'&g_udipinjamS='+$('#g_utersediaS').val()
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

// view barang
    function vwBarang(id) {
        var aksi ='aksi=tampil&subaksi=katalog&grup='+id;
        // alert(aksi);return false;
        // var cari ='&lokasiS='+lok
        //         +'&k_kodeS='+$('#k_kodeS').val()
        //         +'&k_namaS='+$('#k_namaS').val()
        //         +'&k_jenisS='+$('#k_jenisS').val()
        //         +'&k_S='+$('#k_S').val()
        //         +'&k_udipinjamS='+$('#k_utersediaS').val()
        //         +'&k_keteranganS='+$('#k_keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi,
            // data: aksi+cari,
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
        // var cari ='&lokasiS='+lok
        //         +'&k_kodeS='+$('#k_kodeS').val()
        //         +'&k_namaS='+$('#k_namaS').val()
        //         +'&k_jenisS='+$('#k_jenisS').val()
        //         +'&k_S='+$('#k_S').val()
        //         +'&k_udipinjamS='+$('#k_utersediaS').val()
        //         +'&k_keteranganS='+$('#k_keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi,
            // data: aksi+cari,
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
//end of view katalog barang

// switch panel
    function switchPN (e) {
        $.each($('.panel'),function(id,item){
            var ke = id+1;
            if(ke==e)
                $('#panel'+ke).removeAttr('style');
            else
                $('#panel'+ke).attr('style','display:none;');
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
                }$('#lokasiS').html(out);
            }
        });
    }
//end of combo departemen ---

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
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
                    vwGrup($('#lokasiS').val());
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

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
                    vwGrup($('#lokasiS').val());
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
    function kosongkan(){
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
