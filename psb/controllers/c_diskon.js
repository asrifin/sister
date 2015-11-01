var mnu  = 'diskon';
var mnu2 = 'departemen';
var mnu3 = 'biaya';

var dir  = 'models/m_'+mnu+'.php';
var dir2 = '../akademik/models/m_'+mnu2+'.php';
var dir3 = '../keuangan/models/m_'+mnu3+'.php';

var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" xstyle="overflow:scroll;height:560px;" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 

                        // departemen
                        +'<label>Departemen</label>'
                        +'<div class="input-control select">'
                            +'<select id="departemenTB" name="departemenTB"></select>'
                        +'</div>'
                        
                        // biaya
                        +'<label>Biaya</label>'
                        +'<div class="input-control select">'
                            +'<select id="biayaTB" name="biayaTB"></select>'
                        +'</div>'
                        
                        // diskon tunai
                        +'<label>Nama Diskon</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="diskon tunai" required name="diskonTB" id="diskonTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        // keterangan
                        +'<label>Keterngan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" required name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'

                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';

        cmbdepartemen('filter','');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });
        $("#departemenS").on('change', function(){cmbbiaya('filter','')});
        $("#biayaS").on('change', function(){viewTB();});

        //search action
        $('#keteranganS,#diskonS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB();
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#subtingkatS').val('');
        });
    }); 
// end of save process ---

// combo departemen ---
    function cmbdepartemen(typ,dep){
        var u = dir2;
        var d ='aksi=cmb'+mnu2;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.departemen, function(id,item){
                    out+='<option '+(dep!='' && dep==item.replid?'selected':'')+' value="'+item.replid+'">'+item.nama+'</option>';
                });
            }
            if(typ=='filter'){
                $('#departemenS').html(out);
                cmbbiaya('filter','');
            }else{
                $('#departemenTB').html(out);
            }
        });
    }
// combo biaya ---
    function cmbbiaya(typ,bya){
        var u = dir3;
        var d ='aksi=cmb'+mnu3+'&isDiskon=';
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.biaya, function(id,item){
                    out+='<option '+(bya!='' && bya==item.replid?'selected':'')+' value="'+item.replid+'">'+item.biaya+'</option>';
                });
            }
            if(typ=='filter'){
                $('#biayaS').html(out);
                viewTB();
            }else{
                $('#biayaTB').html(out);
            }
        });
    }

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
                    ajax(u,d).done(function (dt){
                        $('#idformH').val(id);
                        $('#diskonTB').val(dt.diskon);
                        $('#keteranganTB').val(dt.keterangan);
                        cmbdepartemen('form',dt.departemen);
                        cmbbiaya('form',dt.biaya);
                    });
                }else{ // form mode : add  
                    cmbdepartemen('form','');
                    cmbbiaya('form','');
                    titl='Tambah '+mnu;
                }
                $.Dialog.title(titl);
                $.Dialog.content(contentFR);
                $('#diskonTB').focus();
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