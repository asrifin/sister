var mnu  = 'rekeningbiaya';
var mnu2 = 'jenistagihan';
var mnu3 = 'biaya';
var mnu4 = 'departemen';
var mnu5 = 'tahunajaran';

var dir  = 'models/m_'+mnu+'.php';
var dir2 = 'models/m_'+mnu2+'.php';
var dir3 = 'models/m_'+mnu3+'.php';
var dir4 = '../akademik/models/m_'+mnu4+'.php';
var dir5 = '../akademik/models/m_'+mnu5+'.php';
var contentFR = '';
// main function ---
    $(document).ready(function(){
        cmbdepartemen('filter','');
        contentFR += '<form  style="overflow:scroll;height:560px;" autocomplete="off" onsubmit="simpan();return false;">' 
                        +'<input id="idformH" type="hidden">' 

                        +'<table class="table">'
                            +'<tr>'
                                +'<td>Departemen</td>'
                                +'<td id="departemenTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Tahun Ajaran</td>'
                                +'<td id="tahunajaranTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Biaya</td>'
                                +'<td id="biayaTD"></td>'
                            +'</tr>'
                        +'</table>'

                        // rekening
                        +'<label>Rekening (COA)</label>'
                        +'<input type="hidden" id="detilrekeningH" name="detilrekeningH" />'
                        +'<input onfocus="autoSuggest(\'detilrekening\');" data-transform="input-control" required type="text" placeholder="Rekening (COA)" name="detilrekeningTB" id="detilrekeningTB"/>'

                        // button
                        +'<div class="form-actions">' 
                            +'<button id="simpanBC" class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';

        //search action
        $('#departemenS,#tahunajaranS').on('change',function (){
            viewTB();
        });
        $('#biayaS,#detilrekeningS').on('keydown',function (e){
            if(e.keyCode==13) viewTB();
        });
    }); 
// end of save process ---

// combo tahunajaran ---
    function cmbtahunajaran(typ,thn){
        var u= dir5;
        var d='aksi=cmb'+mnu5+(thn!=''?'&replid='+thn:'');
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
                    $('#tahunajaranTD').text(': '+th1+' - '+th2);
                }
            }
        });
    }

// combo departmen ---
    function cmbdepartemen(typ,thn){
        var u= dir4;
        var d='aksi=cmb'+mnu4;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.departemen.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.departemen, function(id,item){
                        out+='<option  value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }
                if(typ=='filter'){ // filter (search)
                    $('#departemenS').html(out);
                    cmbtahunajaran('filter','');
                }else{ // form (edit & add)
                    $('#departemenTD').html(': '+dt.departemen[0].nama);
                }
            }
        });
    }

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
        // edit mode
        if($('#idformH').val()!='') urlx += '&replid='+$('#idformH').val();

        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$('form').serialize()+urlx,
            beforeSend:function(){
                $('#simpanBC').html('<img src="img/w8loader.gif">');
            },success:function(dt){
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
                        cmbdepartemen('form',r.departemen);
                        cmbtahunajaran('form',r.tahunajaran);
                        $('#biayaTD').html(': '+r.biaya);
                        $('#detilrekeningTB').val(r.detilrekening);
                        $('#detilrekeningH').val(r.iddetilrekening);
                    });
                }
                $.Dialog.title(titl);
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

// autosuggest
    function autoSuggest(el){
        var urlx= '?aksi=autocomp';
        var col = [{
                'align':'left',
                'columnName':'kode',
                'hide':true,
                'width':'10',
                'label':'Kode'
            },{   
                'align':'left',
                'columnName':'nama',
                'width':'90',
                'label':'detilRekening'
        }];

        urly = dir+urlx;
        $('#'+el+'TB').combogrid({
            debug:true,
            width:'900px',
            colModel: col ,
            url: urly,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                $('#'+el+'TB').val(ui.item.kode+' - '+ui.item.nama);

                // validasi input (tidak sesuai data dr server)
                    $('#'+el+'TB').on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+el+'H').val()!=''){
                                $('#'+el+'H').val('');
                                $('#'+el+'TB').val('');
                            }
                        }
                    });

                    $('#'+el+'TB').on('blur,change',function(){
                        if($('#'+el+'H').val()=='') {
                            $('#'+el+'TB').val(''); // :: all 
                        }
                    });
                return false;
            }
        });
    }