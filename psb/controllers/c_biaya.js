var mnu       = 'biaya';
var mnu2      = 'jenistagihan';
var mnu3      = 'biaya';
var dir       = 'models/m_'+mnu+'.php';
var dir2      = 'models/m_'+mnu2+'.php';
var dir3      = 'models/m_'+mnu3+'.php';
var contentFR = '';
// main function ---
    $(document).ready(function(){
        contentFR += '<form  style="overflow:scroll;height:560px;" autocomplete="off" onsubmit="simpan();return false;">' 
                        +'<input id="idformH" type="hidden">' 
                        // biaya
                        +'<label>Biaya</label>'
                        +'<div class="input-control text">'
                            +'<input type="text" placeholder="biaya" name="biayaTB" id="biayaTB"/>'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        // isangsur
                        +'<label>Cara Bayar</label>'
                        +'<div class="input-control select">'
                            +'<select required  id="isAngsurTB" name="isAngsurTB">'
                                +'<option value="">-Pilih-</option>'
                                +'<option value="0">Tunai</option>'
                                +'<option value="1">Angsur Reguler</option>'
                                +'<option value="2">Angsur Bebas</option>'
                            +'</select>'
                        +'</div>'
                        // isdiskon
                        +'<label>Diskon</label>'
                        +'<div class="input-control select">'
                            +'<select required id="isDiskonTB" name="isDiskonTB">'
                                +'<option value="">-Pilih-</option>'
                                +'<option value="0">Tidak Ada</option>'
                                +'<option value="1">Diskon Reguler</option>'
                                +'<option value="2">Diskon Khsusus</option>'
                                +'<option value="3">Diskon Reguler & Khusus</option>'
                            +'</select>'
                        +'</div>'
                        // jenistagihan
                        +'<label>Jenis Tagihan</label>'
                        +'<div class="input-control select">'
                            +'<select required id="jenistagihanTB" name="jenistagihanTB">'
                            +'</select>'
                        +'</div>'
                        // keterngan
                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'
                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';

        cmbjenistagihan('filter','');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#isAngsurS,#isDiskonS,#jenistagihanS').on('change',function (){
            viewTB();
        });
        $('#biayaS,#keteranganS').on('keydown',function (e){
            if(e.keyCode==13) viewTB();
        });
    }); 
// end of save process ---

// combo tahunajaran ---
    function cmbtahunajaran(typ,thn){
        var u= dir3;
        var d='aksi=cmb'+mnu3;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.tahunajaran.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.tahunajaran, function(id,item){
                        out+='<option '+(thn==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1)+'</option>';
                    });
                }
                if(typ=='filter'){ // filter (search)
                    $('#tahunajaranS').html(out);
                    viewTB();
                }else{ // form (edit & add)
                    var th1 = dt.tahunajaran[0].tahunajaran;
                    var th2 = parseInt(th1)+1;
                    $('#tahunajaranDV').text(': '+th1+' - '+th2);
                }
            }
        });
    }
//end of combo tingkat ---

// combo jenis tagihan ---
    function cmbjenistagihan(typ,tghn){
        var u= dir2;
        var d='aksi=cmb'+mnu2;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.jenistagihan.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.jenistagihan, function(id,item){
                        out+='<option '+(tghn==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.keterangan+'</option>';
                    });
                }
                if(typ=='filter'){ // filter (search)
                    $('#jenistagihanS').html('<option value="">-SEMUA-</option>'+out);
                    viewTB();
                }else{ // form (edit & add)
                    $('#jenistagihanTB').html('<option value="">-Pilih Tagihan-</option>'+out);
                }
            }
        });
    }
//end of combo tingkat ---

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
                    viewTB();
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
                $(el2).html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table

//load  dialog form  ---
    function viewFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titl,cont;
                if(id!=''){ //form mode : edit 
                    titl= 'Ubah '+mnu;
                    var u =dir;
                    var d ='aksi=ambiledit&replid='+id;
                    ajax(u,d).done(function(r){
                        $('#idformH').val(id);
                        $('#biayaTB').val(r.biaya);
                        $('#keteranganTB').val(r.keterangan);
                        $('#isAngsurTB').val(r.isAngsur);
                        $('#isDiskonTB').val(r.isDiskon);
                        cmbjenistagihan('form',r.jenistagihan);
                    });
                }else{ // form mode : add  
                    titl='Tambah '+mnu;
                    cmbjenistagihan('form','');
                }$.Dialog.title(titl);
                $.Dialog.content(contentFR);
                $('#biayaTB').focus();
            }
        });
    }
// end of dialog form ---

// ajax jquery (mode : asyncronous) ---
    function ajax(u,d){
        return $.ajax({
            url:u,
            data:d,
            type:'post',
            dataType:'json'
        });
    }

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
                    viewTB();
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
        $('#'+mnu+'TB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

//aktifkan process ---
    function aktifkan(id){
        var th  = $('#'+mnu+'TD_'+id).html();
        var dep = $('#'+mnu2+'S').val();
        //alert('d '+dep);
        //return false;
        if(confirm(' mengaktifkan "'+th+'"" ?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=aktifkan&replid='+id+'&departemen='+dep,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Mengaktifkan '+th+' ..';
                    clr  ='red';
                }else{
                    viewTB($('#departemenS').val());
                    cont = '..Berhasil Mengaktifkan '+th+' ..';
                    clr  ='green';
                }notif(cont,clr);
            }
        });
    }
// test git doang