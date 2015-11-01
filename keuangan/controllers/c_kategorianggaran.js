var mnu       ='kategorianggaran'; 
var mnu3      ='departemen'; 
var mnu5      ='tingkat'; 

var dir       ='models/m_'+mnu+'.php';
var dir3      ='../akademik/models/m_'+mnu3+'.php';
var dir5      ='../akademik/models/m_'+mnu5+'.php';

var contentFR ='';
    
// main function ---
    $(document).ready(function(){
        // anggaran
        contentFR += '<form style="overflow:scroll;height:500px;" autocomplete="off" onsubmit="simpanSV();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        // Departemen
                        +'<label>Departemen</label>'
                        +'<select data-transform="input-control" onchange="cmbtingkat(\'form\',$(this).val(),\'\');" required type="text" id="departemenTB" name="departemenTB"></select>'

                        // Tingkat 
                        +'<label>Tingkat</label>'
                        +'<select data-transform="input-control" required type="text" name="tingkatTB" id="tingkatTB"><option value="">-Pilih Departemen Dahulu-</option></select>'

                        // nama kategori anggaran
                        +'<label>Kategori Anggaran</label>'
                        +'<input  data-transform="input-control" placeholder="Kategori Anggaran" required type="text" name="kategorianggaranTB" id="kategorianggaranTB">'

                        // detilrekening
                        +'<label>Rekening </label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" required id="detilrekeningH" name="detilrekeningH" />'
                            +'<input onfocus="autoSuggest(\'detilrekening\');" placeholder="cari kode / nama rekening" required type="text" name="detilrekeningTB" id="detilrekeningTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // keterangan
                        +'<label>Tujuan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="tujuan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'

                        // button simpan
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';
        cmbdepartemen('filter','');

        $("#d_tambahBC").on('click', function(){ // katalog
            detilanggaranFR('');
        });

        //print----
        $('#cetakBC').on('click',function(){
            printPDF('anggaran');
        });
        $('#cetak2BC').on('click',function(){
            printPDF('anggaran2');
        });
        // search box
        $('#kategorianggaranS,#keteranganS,#detilrekeningS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB();
        });//combo box
        $('#departemenS').on('change',function (){ // kode grup
            cmbtingkat('filter',$(this).val(),'');
        });$('#tingkatS').on('change',function (){ // kode grup
             viewTB();
        });
    }); 
    
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
                },500);
            }
        });
    }

//kategori anggaran save ---
    function simpanSV(){
        var urlx ='&aksi=simpan&subaksi=anggaran';
        // edit mode
        if($('#idformH').val()!=''){
            urlx += '&replid='+$('#idformH').val();
        }
        var u = dir;
        var d = $('form').serialize()+urlx;
        ajax(u,d).done(function (dt){
            if(dt.status!='sukses'){
                cont = 'Gagal menyimpan data';
                clr  = 'red';
            }else{
                $.Dialog.close();
                viewTB();
                cont = 'Berhasil menyimpan data';
                clr  = 'green';
            }notif(cont,clr);
        });
    }
//end kategori anggaran save  ---

    function del(id){
        if(confirm('melanjutkan untuk menghapus data?'))
        var u = dir;
        var d ='aksi=hapus&subaksi=anggaran&replid='+id;
        ajax(u,d).done(function (dt){
            var cont,clr;
            if(dt.status!='sukses'){
                cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                clr  ='red';
            }else{
                viewTB();
                cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                clr  ='green';
            }notif(cont,clr);
        });
    }
//end of kategori anggaran ---
    
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
                $('#'+el+'TB').val(ui.item.nama+' ( '+ui.item.kode+' )');

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

// load form (all)
    function loadFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '60%',
            padding: 10,
            onShow: function(){
                $.Dialog.title('<i class="fg-white icon-'+(id!=''?'pencil':'plus-2')+'"></i> '+(id!=''?' Ubah ':' Tambah ')+' Anggaran'); 
                $.Dialog.content(contentFR);
            
                if(id==''){ //tambah
                    cmbdepartemen('form','');
                }else{ // edit
                    var u = dir;
                    var d = 'aksi=ambiledit&replid='+id;
                    ajax(u,d).done(function (dt) {
                        $('#idformH').val(id);
                        $('#kategorianggaranTB').val(dt.kategorianggaran);
                        $('#detilrekeningTB').val(dt.detilrekening);
                        $('#detilrekeningH').val(dt.iddetilrekening);
                        $('#keteranganTB').val(dt.keterangan);
                        cmbdepartemen('form',dt.departemen);
                        cmbtingkat('form',dt.departemen,dt.tingkat);
                    });
                }
            }
        });
    }

// ajax
    function ajax(u,d){
        return $.ajax({
            url:u,
            data:d,
            dataType:'json',
            type:'post'
        });
    }
// departemen ---
    function cmbdepartemen(typ,dep){
        var u = dir3;
        var d = 'aksi=cmb'+mnu3;
        ajax(u,d).done(function(dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.departemen, function(id,item){
                	out+='<option '+((dep!='' && dep==item.replid)?'selected':'')+' value="'+item.replid+'">'+item.nama+'</option>';
                });
            }
            if(typ=='form'){ //form 
            	$('#departemenTB').html('<option value="">-Pilih Departemen-</option>'+out);
            }else{ // filter
                $('#departemenS').html(out);
                cmbtingkat('filter',dt.departemen[0].replid,'');
            }
        });
    }

// combo tingkat ---
    function cmbtingkat(typ,dep,ting){
        u =dir5;
        d ='aksi=cmb'+mnu5+'&departemen='+dep;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.tingkat.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.tingkat, function(id,item){
                        out+='<option '+(ting!='' && ting==item.replid?'selected':'')+' value="'+item.replid+'">'+item.tingkat+' </option>';
                    });
                }
            }
            if(typ=='filter'){ // filter
                $('#tingkatS').html(out);
                viewTB();
            }else{ // form 
                $('#tingkatTB').html('<option value="">-Pilih Tingkat-</option>'+out);
            }
        });
    }

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

//end of  print to PDF -------
    function printPDF(mn){
        var par='',tok='',p,v;
        $('.'+(mn=='anggaran' || mn=='anggaran2'?'anggaran':mn)+'_cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });var x  = $('#id_loginS').val();
        var token = encode64(x+tok);
        console.log('para = '+par);
        console.log('tok = '+x+tok);
        console.log('token = '+token);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }