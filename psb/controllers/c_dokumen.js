var mnu  = 'dokumen';
var mnu2 = 'satuanjumlah';
var dir  = 'models/m_'+mnu+'.php';
var dir2 = 'models/m_'+mnu2+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<form style="overflow:scroll;height:500px;" autocomplete="off" id="dokumenFR" onsubmit="simpan();return false;" >' 
                        +'<input name="idformH" id="idformH" type="hidden">' 

                        // item
                        +'<label>Item</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea required placeholder="item" name="dokumenTB" id="dokumenTB"></textarea>'
                        +'</div>'

                        // sub dokumen 
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr class="bg-blue fg-white">'
                                    +'<th>Tingkat </th>'
                                    +'<th>Jumlah</th>'
                                    +'<th>Satuan</th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="subdokumenDV">'
                            +'</tbody>'
                        +'</table>'

                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';
        viewTB('dokumen');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('dokumen','');
        });

        //search action
        $('.'+mnu+'_cari').keydown(function (e){
            if(e.keyCode == 13) viewTB(mnu);
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#'+mnu+'S').val('');
        });
    }); 
// end of save process ---

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
        if($('#idformH').val()!='') 
           urlx += '&replid='+$('#idformH').val();

        var u=dir;
        var d=$('form').serialize()+urlx;
        ajax(u,d).done(function (dt){
            if(dt.status!='sukses'){
                cont = dt.status;
                clr  = 'red';
            }else{
                $.Dialog.close();
                viewTB('dokumen');
                cont = dt.status;
                clr  = 'green';
            }notif(cont,clr);
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
                $(el2).html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }


// form ---
    function viewFR(iddok){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '40%',
            padding: 10,
            onShow: function(){
                    var titlex='<span class="icon-search"></span> Detail Aksi ';
                    if(iddok=='')  subdokumenFC('');
                    else{
                        // console.log('masuk edit');
                        var u=dir;
                        var d ='aksi=ambiledit&replid='+iddok;
                        ajax(u,d).done(function (dt){
                            if(dt.status!='sukses'){
                                notif(dt.status,'red');
                            }else{
                                $('#idformH').val(iddok);
                                $('#dokumenTB').html(dt.dokumen);
                                subdokumenFC(iddok);
                            }
                        });
                    }$.Dialog.title(titlex+' '+mnu);
                    $.Dialog.content(contentFR);
                    $('#dokumenTB').focus();
                }
        });
    }
// end of form ---

    function subdokumenFC (iddok) {
        var u = dir;
        var d ='aksi=tampil&subaksi=subdokumen'+(iddok!=''?'&replid='+iddok:'');
        ajax(u,d).done(function (dt){
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                var o ='';
                if(dt.subdokumenArr.length==0){
                    o+='<tr><td class="fg-red" colspan="2">..kosong..</td></tr>';
                }else{
                    $.each(dt.subdokumenArr, function (id,item){
                        o+='<tr>'
                                +'<td>'
                                    +'<div data-role="input-control" class="input-control checkbox">'
                                        +'<label>'
                                            +'<input class="tingkatTB" '+(item.idsubdokumen!=null?'checked':'')+' onclick="jumlahToggleFC('+item.idtingkat+')" id="tingkat'+item.idtingkat+'TB" name="tingkatTB['+item.idtingkat+']" type="checkbox">'
                                            +'<span class="check"></span>'
                                            +item.tingkat+' ('+item.kode+')'
                                        +'</label>'
                                    +'</div>'
                                +'</td>'
                                +'<td>'
                                    +'<div class="input-control text">'
                                        +'<input type="hidden" value="'+(item.idsubdokumen===null?'':item.idsubdokumen)+'" name="idsubdokumenH['+item.idtingkat+']" />'
                                        +'<input min="1" class="text-center" '+(item.jumlah==undefined || item.jumlah==null?'disabled':'')+' type="number" id="jumlah'+item.idtingkat+'TB" value="'+(typeof item.jumlah==undefined || item.jumlah==null?'':item.jumlah)+'" name="jumlah'+item.idtingkat+'TB">'
                                    +'</div>'
                                +'</td>'
                                +'<td>'
                                    +'<div class="input-control select">'
                                        +'<select id="satuanjumlah'+item.idtingkat+'TB" name="satuanjumlah'+item.idtingkat+'TB"></select>'
                                    +'</div>'
                                +'</td>'
                            +'</tr>';
                    }); 
                    $.each(dt.subdokumenArr, function (id,item){
                        cmbsatuanjumlah(item.idtingkat,item.satuanjumlah);
                    });
                }
                $('#subdokumenDV').html(o);
            }
        });
    }

    function jumlahToggleFC (idting) {
        if($('#tingkat'+idting+'TB').is(':checked')){
            $('#jumlah'+idting+'TB').removeAttr('disabled')
                                    .attr('required',true);
            $('#jumlah'+idting+'TB').val(1);
        }else{
            $('#jumlah'+idting+'TB').attr('disabled',true)
                                    .removeAttr('required');
            $('#jumlah'+idting+'TB').val('');
        }
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
                $(el2).html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
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
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                    viewTB('dokumen');
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
        $('#tglmulaiTB').val('');
        $('#saldoTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

//aktifkan process ---
    function aktifkan(id){
    	var th  = $('#'+mnu+'TD_'+id).html();
        if(confirm(' mengaktifkan "'+th+'"" ?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=aktifkan&id_'+mnu+'='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Mengaktifkan '+th+' ..';
                    clr  ='red';
                }else{
                    // viewTB($('#departemenS').val());
                    cont = '..Berhasil Mengaktifkan '+th+' ..';
                    clr  ='green';
                    viewTB();
                }
                notif(cont,clr);
            }
        });
    }
//end of aktifkan process ---


    function ajax (u,d) {
        return $.ajax({
            url:u,
            data:d,
            dataType:'json',
            type:'post',
        });
    }
    // urutan tabel
    function urutFC (e) {
        var u = dir;
        var d ='aksi=urutan&replid1='+$(e).attr('replid1')+'&urutan2='+$(e).val();
        ajax(u,d).done(function(dt){
            var cont,clr;
            if(dt.status!='sukses'){
                cont = '..Gagal Merubah urutan ';
                clr  ='red';
            }else{
                viewTB();
                cont = '..Berhasil Merubah Urutan ';
                clr  ='green';
            }notif(cont,clr);
        });
    }

// combo satuanjumlah ---
    function cmbsatuanjumlah(idx,sat){
        u=dir2;
        d='aksi=cmbsatuanjumlah';
        ajax(u,d).done(function(dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.satuanjumlah, function(id,item){
                    out+='<option '+(item.replid==sat?'selected':'')+' value="'+item.replid+'">'+item.satuanjumlah+'</option>';
                });
            }
            $('#satuanjumlah'+idx+'TB').html(out);
        });
    }
//end of combo satuanjumlah ---
