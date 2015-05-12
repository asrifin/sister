var mnu    ='tempat'; 
var mnu2   ='lokasi'; 
var dir    ='models/m_'+mnu+'.php'; 
var dir2   ='models/m_'+mnu2+'.php'; 
var c_mainFR =c_detailFR='';

// main function ---
    $(document).ready(function(){
        c_mainFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<label>Lokasi</label>'

                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="lokasiH" id="lokasiH" class="span2">'
                            +'<input disabled="disabled" name="lokasiTB" id="lokasiTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Kode Tempat</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="kode tampat"  required type="text" name="kodeTB" id="kodeTB">'
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
        c_detailFR+='<div style="overflow:scroll;height:600px;">'
                    +'<input type="hidden" id="detail_tempatH" class="detail_cari" >'
                    +'<table width="100%" >'
                        +'<tr>'
                            +'<td  width="5%" ><b>Lokasi</b></td><td width="1%">:</td>'
                            +'<td colspan="2" id="lokasiDV"></td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td><b>Tempat</b></td><td  width="1%">:</td>'
                            +'<td colspan="2" id="tempatDV"></td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td><b>Keterangan</b></td><td  width="1%">:</td>'
                            +'<td id="keteranganDV"></td>'
                            +'<td class="place-right"><button data-hint="cetak" onclick="printPDF(\'main\');" class="button"><i class="icon-printer"></i></button></td>'
                        +'</tr>'
                    +'</table>'
                    +'<table class="table hovered bordered striped">'
                        +'<thead>'
                            +'<tr class="info fg-white">'
                                +'<th>Kode</th>'
                                +'<th>Nama</th>'
                                +'<th>Barcode</th>'
                                +'<th>Sumber</th>'
                                +'<th>Harga</th>'
                                +'<th>Kondisi</th>'
                                +'<th>Status</th>'
                                +'<th>Keterangan</th>'
                            +'</tr>'
                            +'<tr id="detail_cariTR" class="info ">'
                                +'<th class="text-center"><div class="input-control"><input onkeyup="viewTB(\'detail\');" placeholder="cari..." id="detail_kodeS"  class="detail_cari"></th>'
                                +'<th class="text-center"><div class="input-control"><input onkeyup="viewTB(\'detail\');" placeholder="cari..." id="detail_namaS"  class="detail_cari"></th>'
                                +'<th class="text-center"><div class="input-control"><input onkeyup="viewTB(\'detail\');" placeholder="cari..." id="detail_barkodeS"  class="detail_cari"></th>'
                                +'<th class="text-center"><div class="input-control"><input onkeyup="viewTB(\'detail\');" placeholder="cari..." id="detail_sumberS"  class="detail_cari"></th>'
                                +'<th class="text-center"><div class="input-control"><input onkeyup="viewTB(\'detail\');" placeholder="cari..." id="detail_hargaS"  class="detail_cari"></th>'
                                +'<th class="text-center"><div class="input-control"><input onkeyup="viewTB(\'detail\');" placeholder="cari..." id="detail_kondisiS"  class="detail_cari"></th>'
                                +'<th class="text-center"><div class="input-control"><input onkeyup="viewTB(\'detail\');" placeholder="cari..." id="detail_statusS"  class="detail_cari"></th>'
                                +'<th class="text-center"><div class="input-control"><input onkeyup="viewTB(\'detail\');" placeholder="cari..." id="detail_keteranganS"  class="detail_cari"></th>'
                            +'</tr>'
                        +'</thead>'
                        +'<tbody id="detail_tbody"></tbody>'
                    +'</table>'
                    +'</div>';

        cmblokasi('filter','');
        
        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action // edit by epiii
        $('#lokasiS').on('change',function (e){ // change : combo box
            viewTB('main');
        });
        $('#main_tempatS,#main_keteranganS,#main_kodeS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB('main');
        });
        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#main_kodeS').val('');
            $('#main_tempatS').val('');
            $('#main_keteranganS').val('');
        });
    }); 
// end of main function ---

// combo departemen ---
    function cmblokasi(typ,lok){
        $.ajax({
            url:dir2,
            data:'aksi=cmblokasi'+(lok!=''?'&replid='+lok:''),
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
                }
                if(typ=='form')//filter
                    $('#lokasiTB').val('['+dt.lokasi[0].kode+']'+dt.lokasi[0].nama);
                else{ // filter
                    $('#lokasiS').html(out);
                    viewTB('main'); 
                }
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
                    viewTB('main');
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(subaksi){
        var aksi ='aksi=tampil';
        if(typeof subaksi!=='undefined'){
            aksi+='&subaksi='+subaksi;
        }
        var cari ='';
        var el,el2;

        if(typeof subaksi!=='undefined'){ // multi paging
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
            url : dir,
            type: 'post',
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
// end of view table


// view table ---
    function viewTBx(lok){  
        var aksi ='aksi=tampil';
        var cari ='&lokasiS='+lok
                    +'&kodeS='+$('#kodeS').val()
                    +'&tempatS='+$('#tempatS').val()
                    +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---

// detail pop up---
    function detailFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 850,
            padding: 10,
            onShow: function(){
                var titlex;
                var data = 'aksi=ambiledit&replid='+id;
                $.Dialog.title('Detail Tempat & Barang '+mnu); // edit by epiii
                $.Dialog.content(c_detailFR);
                ajax(dir,data).done(function(dt){
                    $('#detail_tempatH').val(id);
                    $('#lokasiDV').html(dt.lokasi);
                    $('#tempatDV').html('['+dt.kode+']'+dt.nama);
                    $('#keteranganDV').html(dt.keterangan);
                    viewTB('detail');
                });
            }
        });
    }

// form add/edit ---
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
                    cmblokasi('form',$('#lokasiS').val());
                    setTimeout(function(){
                        $('#lokasiH').val($('#lokasiS').val());
                    },500);
                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    var data='aksi=ambiledit&replid='+id;
                    ajax(dir,data).done(function(dt){
                        $('#idformH').val(id);
                        $('#lokasiH').val($('#lokasiS').val());
                        $('#lokasiTB').val('['+dt.kode+'] '+dt.lokasi);
                        $('#kodeTB').val(dt.kode);
                        $('#namaTB').val(dt.nama);
                        $('#keteranganTB').val(dt.keterangan);
                    });
                }$.Dialog.title(titlex+' '+mnu); // edit by epiii
                $.Dialog.content(c_mainFR);
            }
        });
    }

//paging ---

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
//end of paging ---

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
        $('#namaTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

	function xx () {
		alert(arguments[0]); // baca argument tanpa harus tulis d fungsi
	}

// fungsi AJAX : asyncronous
    function ajax(u,d) {
        return $.ajax({
            url:u,
            type:'post',
            dataType:'json',
            data:d
        });
    }

    function printPDF(mn){
        var par='',tok='',p,v;
        $('.'+mn+'_cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });var x  = $('#id_loginS').val();
        var token = encode64(x+tok);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }
    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
