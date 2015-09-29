
var mnu  ='detilanggaran'; 
var mnu2 ='kategorianggaran'; 
var mnu3 ='departemen'; 
var mnu5 ='tingkat'; 

var dir  ='models/m_'+mnu+'.php';
var dir2 ='models/m_'+mnu2+'.php';
var dir3 ='../akademik/models/m_'+mnu3+'.php';
var dir5 ='../akademik/models/m_'+mnu5+'.php';

var contentFR ='';
    
// main function ---
    $(document).ready(function(){
        // anggaran
        contentFR += '<form style="overflow:scroll;height:500px;" autocomplete="off" onsubmit="simpanSV();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<input name="kategorianggaranH" id="kategorianggaranH" type="hidden">' 
                         // header 
                        +'<table class="table xbordered">'
                            +'<tr>'
                                +'<td class="size2">Departemen</td>'
                                +'<td id="departemenTD"></td>'
                            +'</tr><tr>'
                                +'<td>Tingkat</td>'
                                +'<td id="tingkatTD"></td>'
                            +'</tr><tr>'
                                +'<td>Kategori Anggaran </td>'
                                +'<td id="kategorianggaranTD"></td>'
                            +'</tr>'
                        +'</table>'

                        // detail anggaran 
                        +'<label>Detail Anggaran </label>'
                        +'<input data-transform="input-control"  placeholder="detail anggaran " required type="text" name="detilanggaranTB" id="detilanggaranTB">'

                        // keterangan
                        +'<label>Tujuan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan " name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'

                        // button simpan
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';
        cmbdepartemen('filter','');

        //print----
        $('#cetakBC').on('click',function(){
            printPDF('anggaran');
        });
        $('#cetak2BC').on('click',function(){
            printPDF('anggaran2');
        });$('#k_cetakBC').on('click',function(){
            printPDF('detilanggaran');
        });
        // search box
        $('#kategorianggaranS,#keteranganS,#detilanggaranS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB();
        });//combo box
        $('#kategorianggaranS').on('change',function (){ // kode grup
            viewTB();
        });
        $('#departemenS,#tingkatS').on('change',function (){ // kode grup
             cmbkategorianggaran('filter','');
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

    // load form 
    function viewFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '40%',
            padding: 10,
            onShow: function(){
                $.Dialog.title('<i class="fg-white icon-'+(id!=''?'pencil':'plus-2')+'"></i> '+(id!=''?' Ubah ':' Tambah ')+' Anggaran'); 
                $.Dialog.content(contentFR);
            
                if(id==''){ //tambah
                    cmbdepartemen('form','');
                    $('#kategorianggaranH').val($('#kategorianggaranS').val());
                }else{ // edit
                    var u = dir;
                    var d = 'aksi=ambiledit&replid='+id;
                    ajax(u,d).done(function (dt) {
                        $('#idformH').val(id);
                        $('#kategorianggaranH').val(dt.idkategorianggaran);
                        $('#detilanggaranTB').val(dt.detilanggaran);
                        $('#keteranganTB').val(dt.keterangan);
                        console.log(dt.keterangan);
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
        var d = 'aksi=cmb'+mnu3+(dep!=''?'&eplid='+dep:'');
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
                $('#departemenTD').html(': '+dt.departemen[0].nama);
                cmbtingkat('form','');
            }else{ // filter
                $('#departemenS').html(out);
                cmbtingkat('filter','');
            }
        });
    }

// combo kategorianggaran ---
    function cmbkategorianggaran(typ,ting){
        u =dir2;
        d ='aksi=cmb'+mnu2+'&departemen='+$('#departemenS').val()+'&tingkat='+$('#tingkatS').val();
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.kategorianggaran.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.kategorianggaran, function(id,item){
                        out+='<option '+((ting!='' && ting==item.replid)?'selected':'')+' value="'+item.replid+'">'+item.kategorianggaran+' </option>';
                    });
                }
            }
            if(typ=='filter'){ // filter
                $('#kategorianggaranS').html(out);
                viewTB();
            }else{ // form 
                $('#kategorianggaranTD').html(': '+dt.kategorianggaran[0].kategorianggaran);
            }
        });
    }
// combo tingkat ---
    function cmbtingkat(typ,ting){
        u =dir5;
        d ='aksi=cmb'+mnu5+'&departemen='+$('#departemenS').val();
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.tingkat.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.tingkat, function(id,item){
                        out+='<option '+((ting!='' && ting==item.replid)?'selected':'')+' value="'+item.replid+'">'+item.tingkat+' </option>';
                    });
                }
            }
            if(typ=='filter'){ // filter
                $('#tingkatS').html(out);
                cmbkategorianggaran('filter','');
            }else{ // form 
                $('#tingkatTD').html(': '+dt.tingkat[0].tingkat);
                cmbkategorianggaran('form','');
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