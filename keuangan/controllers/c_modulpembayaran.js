var mnu  ='modulpembayaran'; 
var dir  ='models/m_'+mnu+'.php';
var mnu2 ='katmodulpembayaran'; 
var dir2 ='models/m_'+mnu2+'.php';
var mnu3 ='angkatan'; 
var dir3 ='../akademik/models/m_'+mnu3+'.php';
var mnu4 ='departemen'; 
var dir4 ='../akademik/models/m_'+mnu4+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR +='<form style="overflow:scroll;height:500px;" autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        +'<input name="angkatanH"  id="angkatanH" type="hidden">' 
                        +'<label>Kategori Modul</label>'
                            +'<div class="input-control select">'
                                +'<select name="katmodulpembayaranTB" id="katmodulpembayaranTB"></select>'
                            +'</div>'
                        +'</div>'

                        +'<label>Nama Pembayaran</label>'
                            +'<div class="input-control text">'
                                +'<input placeholder="Nama Pembayaran" required name="namaTB" id="namaTB">'
                            +'</div>'
                        +'</div>'

                        +'<label>Rek. Kas</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" id="rek1H" name="rek1H" />'
                            +'<input placeholder="Rekening Kas" name="rek1TB" id="rek1TB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Rek. Pendapatan</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" id="rek2H" name="rek2H" />'
                            +'<input placeholder="Rekening Pendapatan" name="rek2TB" id="rek2TB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Rek. Piutang</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" id="rek3H" name="rek3H" />'
                            +'<input placeholder="Rekening Piutang" name="rek3TB" id="rek3TB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Nominal</label>'
                        +'<div class="input-control text">'
                            +'<input required onclick="inputuang(this);" placeholder="Nominal" name="nominalTB" id="nominalTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Cicilan</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="cicilan" onclick="inputuang(this);"  name="cicilanTB" id="cicilanTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Diskon</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="diskon" onclick="inputuang(this);"  name="diskonTB" id="diskonTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Biaya Administrasi</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="biayaadmin" onclick="inputuang(this);"  name="biayaadminTB" id="biayaadminTB">'
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

        cmbdepartemen('filter','');
        
        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //cari ----
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#kodeS').val('');
            $('#namaS').val('');
            $('#keteranganS').val('');
        });
        //search action // edit by epiii
        $('#departemenS,#katmodulpembayaranS,#angkatanS').on('change',viewTB);
        $('#nominalS,#namaS,#keteranganS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13)
                viewTB();
        });
    }); 
// end of main function ---

// combo departemen ---
    function cmbdepartemen(typ,idkat){
        $.ajax({
            url:dir4,
            data:'aksi=cmb'+mnu4,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.departemen, function(id,item){
                        if(idkat==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'"> '+item.nama+'</option>';
                    });
                    if(typ=='filter'){
                        $('#departemenS').html(out);
                        cmbangkatan('filter',dt.departemen[0].replid,'');
                    }else{
                        $('#departemenTB').html(out);
                    }
                }
            }
        });
    }
//end of combo departemen---

// combo angkatan ---
    function cmbangkatan(typ,dep,idkat){
        $.ajax({
            url:dir3,
            data:'aksi=cmb'+mnu3+'&departemen='+dep,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.angkatan, function(id,item){
                        if(idkat==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.angkatan+'</option>';
                        else
                            out+='<option value="'+item.replid+'"> '+item.angkatan+'</option>';
                    });
                    if(typ=='filter'){
                        $('#angkatanS').html(out);
                        cmbkatmodulpembayaran('filter','');
                    }else{
                        $('#angkatanTB').html(out);
                    }
                }
            }
        });
    }
//end of combo angkatan ---

// combo kategori modul pembayaran  ---
    function cmbkatmodulpembayaran(typ,idkat){
        $.ajax({
            url:dir2,
            data:'aksi=cmb'+mnu2,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.katmodulpembayaran, function(id,item){
                        if(idkat==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'"> '+item.nama+'</option>';
                    });
                    if(typ=='filter'){
                        $('#katmodulpembayaranS').html('<option value="">-SEMUA-</option>'+out);
                        viewTB();
                    }else{
                        $('#katmodulpembayaranTB').html(out);
                    }
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
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                    viewTB();
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(){ 
        var aksi ='aksi=tampil';
        var cari ='&katmodulpembayaranS='+$('#katmodulpembayaranS').val()
                +'&departemenS='+$('#departemenS').val()
                +'&angkatanS='+$('#angkatanS').val()
                +'&namaS='+$('#namaS').val()
                +'&nominalS='+$('#nominalS').val()
                +'&namaS='+$('#namaS').val()
                +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
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
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    cmbkatmodulpembayaran('form','');
                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            $('#nominalTB').val(dt.nominal);
                            $('#diskonTB').val(dt.diskon);
                            $('#cicilanTB').val(dt.cicilan);
                            $('#biayaadminTB').val(dt.biayaadmin);
                            $('#rek1TB').val(dt.rek1);
                            $('#rek2TB').val(dt.rek2);
                            $('#rek3TB').val(dt.rek3);
                            $('#rek1H').val(dt.idrek1);
                            $('#rek2H').val(dt.idrek2);
                            $('#rek3H').val(dt.idrek3);
                            $('#namaTB').val(dt.nama);
                            $('#keteranganTB').val(dt.keterangan);
                            cmbkatmodulpembayaran('form',dt.katmodulpembayaran);
                        }
                    });
                }
                $.Dialog.title(titlex+' '+mnu); // edit by epiii
                $.Dialog.content(contentFR);
            }
        });
        $('#angkatanH').val($('#angkatanS').val());

        // autosuggest rek 1
        $("#rek1TB").combogrid({
            debug:true,
            width:'600px',
            colModel: [{
                    'align':'left',
                    'columnName':'kode',
                    'hide':true,
                    'width':'15',
                    'label':'KODE'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'85',
                    'label':'NAMA'
            }],
            url: dir+'?aksi=autocomp&subaksi=kas', /*epiii*/
            select: function( event, ui ) {
                $('#rek1H').val(ui.item.replid);
                $(this).val(ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $(this).on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#rek1H').val()!=''){
                                $('#rek1H').val('');
                                $('#rek1TB').val('');
                            }
                        }
                    });
                return false;
            }
        }); //end of autosuggest rek1
        
        // autosuggest rek 2
        $("#rek2TB").combogrid({
            debug:true,
            width:'600px',
            colModel: [{
                    'align':'left',
                    'columnName':'kode',
                    'hide':true,
                    'width':'15',
                    'label':'KODE'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'85',
                    'label':'NAMA'
            }],
            url: dir+'?aksi=autocomp&subaksi=pendapatan', /*epiii*/
            select: function( event, ui ) {
                $('#rek2H').val(ui.item.replid);
                $(this).val(ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $(this).on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#rek2H').val()!=''){
                                $('#rek2H').val('');
                                $('#rek2TB').val('');
                            }
                        }
                    });
                return false;
            }
        }); //end of autosuggest rek1
        
        // autosuggest rek 3
        $("#rek3TB").combogrid({
            debug:true,
            width:'600px',
            colModel: [{
                    'align':'left',
                    'columnName':'kode',
                    'hide':true,
                    'width':'15',
                    'label':'KODE'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'85',
                    'label':'NAMA'
            }],
            url: dir+'?aksi=autocomp&nama=piutang', /*epiii*/
            select: function( event, ui ) {
                $('#rek3H').val(ui.item.replid);
                $(this).val(ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $(this).on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#rek3H').val()!=''){
                                $('#rek3H').val('');
                                $('#rek3TB').val('');
                            }
                        }
                    });
                return false;
            }
        }); //end of autosuggest rek1
        
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
//end of paging ---

    // function pagination(page,aksix,menux){ 
    //     var datax = 'starting='+page+'&aksi='+aksix+'&menu='+menux;
    //     var cari  = '&kategoriS='+$('#kategoriS').val();
    //                 // +'&tempatS='+$('#tempatS').val()
    //                 // +'&keteranganS='+$('#keteranganS').val();
    //     $.ajax({
    //         url:dir,
    //         type:"post",
    //         data: datax+cari,
    //         beforeSend:function(){
    //             $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
    //         },success:function(dt){
    //             setTimeout(function(){
    //                 $('#tbody').html(dt).fadeIn();
    //             },1000);
    //         }
    //     });
    // }   
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
                    // viewTB($('#tempatS').val());
                    viewTB($('#'+mnu2+'S').val());
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
        $('#kodeTB').val('');
        $('#rekeningTB').val('');
        // $('#aktivitasTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

// input uang --------------------------
    function inputuang(e) {
        $(e).maskMoney({
            precision:0,
            prefix:'Rp. ', 
            // allowNegative: true, 
            thousands:'.', 
            // decimal:',', 
            affixesStay: true
        });
    }
// end of input uang --------------------------

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
