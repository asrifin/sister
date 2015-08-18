var mnu  ='grupmenu';
var mnu2 ='grupmodul';
var mnu3 ='warna';
var mnu4 ='icon';
var mnu5 ='modul';
var mnu6 ='katgrupmenu';

var dir  ='models/m_'+mnu+'.php';
var dir2 ='models/m_'+mnu2+'.php';
var dir3 ='models/m_'+mnu3+'.php';
var dir4 ='models/m_'+mnu4+'.php';
var dir5 ='models/m_'+mnu5+'.php';
var dir6 ='models/m_'+mnu6+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        cmbgrupmodul('filter','');
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        // grup Modul
                        +'<label>Grup Modul</label>'
                        +'<div class="input-control select">'
                            +'<select onchange="cmbmodul(\'form\',$(this).val());" required id="grupmodulTB"name="grupmodulTB"></select>'
                        +'</div>'

                        // modul
                        +'<label>modul</label>'
                        +'<div class="input-control select">'
                            +'<select required id="modulTB"name="modulTB"></select>'
                        +'</div>'

                        // kateg
                        +'<label>Kategori</label>'
                        +'<div class="input-control select">'
                            +'<select required id="katgrupmenuTB"name="katgrupmenuTB"></select>'
                        +'</div>'

                        //link
                        +'<label>Grup Menu</label>'
                        +'<div class="input-control text">'
                            +'<input required type="text"  placeholder="grup menu" name="grupmenuTB" id="grupmenuTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        //size
                        +'<label>size</label>'
                        +'<div class="input-control select">'
                            +'<select id="sizeTB" name="sizeTB">'
                                +'<option value="">kecil</option>'
                                +'<option value="four">Besar</option>'
                            +'</select>'
                        +'</div>'

                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        $('#grupmodulS').on('change',function(){
            cmbmodul('filter',$(this).val(),'');
        });
        $('#modulS,#katgrupmenuS').on('change',function(){
            viewTB();
        });
        //search action
        $('#grupmenuS').keydown(function (e){
            if(e.keyCode == 13) viewTB();
        })
    }); 
// end of main function ---

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
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
                    viewTB($('#departemenS').val());
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
                $(el2).html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
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
                    cmbgrupmodul('form','');
                    cmbmodul('form','');
                    cmbkatgrupmenu('form','');
                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&id_grupmenu='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            $('#grupmenuTB').val(dt.grupmenu);
                            cmbgrupmodul('form',dt.grupmodul);
                            cmbmodul('form',dt.grupmodul,dt.modul);
                            cmbkatgrupmenu('form',dt.katgrupmenu);
                        }
                    });
                }$.Dialog.title(titlex+' '+mnu);
                $.Dialog.content(contentFR);
            }
        });
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
                    viewTB($('#departemenS').val());
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
        $('#angkatanTB').val('');
        $('#keteranganTB').val('');
    }

// combo icon ---
    function cmbkatgrupmenu(typ,kat){
        var u = dir6;
        var d ='aksi=cmb'+mnu6;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.katgrupmenu, function(id,item){
                    out+='<option '+(kat!='' && kat==item.id_katgrupmenu?'selected':'')+' value="'+item.id_katgrupmenu+'">'+item.keterangan+'</option>';
                });
            }
            if(typ=='filter'){
                $('#katgrupmenuS').html('<option value="">-SEMUA-</option>'+out);
                viewTB();
            }else{
                $('#katgrupmenuTB').html('<option value="">-Pilih Kategori-</option>'+out);
            }
        });
    }

// combo modul---
    function cmbmodul(typ,gm,mod){
        if(gm==''){
            $('#modulS').html('<option value="">-SEMUA-</option>');
            cmbkatgrupmenu('filter','');
        }else{
            var u = dir5;
            var d ='aksi=cmb'+mnu5+(gm!=''?'&id_grupmodul='+gm:'');
            ajax(u,d).done(function (dt) {
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.modul, function(id,item){
                        out+='<option '+(mod!='' && mod==item.id_modul?'selected':'')+' value="'+item.id_modul+'">'+item.modul+'</option>';
                    });
                }
                if(typ=='filter'){
                    $('#modulS').html('<option value="">-SEMUA-</option>'+out);
                    cmbkatgrupmenu('filter','');
                }else{
                    $('#modulTB').html('<option value="">-Pilih Modul-</option>'+out);
                }
            });
        }
    }

// combo grupmodul ---
    function cmbgrupmodul(typ,gm){
        var u = dir2;
        var d ='aksi=cmb'+mnu2;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.grupmodul, function(id,item){
                    out+='<option '+(gm!='' && gm==item.id_grupmodul?'selected':'')+' value="'+item.id_grupmodul+'">'+item.grupmodul+'</option>';
                });
            }
            if(typ=='filter'){
                $('#grupmodulS').html('<option value="">-SEMUA-</option>'+out);
                cmbmodul('filter','','');
            }else{
                $('#grupmodulTB').html('<option value="">-Pilih Grup Modul-</option>'+out);
            }
        });
    }

    function ajax (u,d) {
        return $.ajax({
            url:u,
            data:d,
            dataType:'json',
            type:'post',
        });
    }