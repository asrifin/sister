var mnu  ='menu';
var mnu2 ='grupmodul';
var mnu3 ='warna';
var mnu4 ='icon';
var mnu5 ='modul';
var mnu6 ='katgrupmenu';
var mnu7  ='grupmenu';

var dir  ='models/m_'+mnu+'.php';
var dir2 ='models/m_'+mnu2+'.php';
var dir3 ='models/m_'+mnu3+'.php';
var dir4 ='models/m_'+mnu4+'.php';
var dir5 ='models/m_'+mnu5+'.php';
var dir6 ='models/m_'+mnu6+'.php';
var dir7 ='models/m_'+mnu7+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        cmbgrupmodul('filter','');
        contentFR += '<form style="overflow:scroll;height:500px;"  autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        // grup Modul
                        +'<label>Grup Modul</label>'
                        +'<div class="input-control select">'
                            +'<select onchange="cmbmodul(\'form\',$(this).val());" required id="grupmodulTB"name="grupmodulTB"></select>'
                        +'</div>'

                        // modul
                        +'<label>modul</label>'
                        +'<div class="input-control select">'
                            +'<select onchange="cmbgrupmenu(\'form\',$(this).val(),\'\');" required id="modulTB"name="modulTB"></select>'
                        +'</div>'

                        // grup menu
                        +'<label>Grup Menu</label>'
                        +'<div class="input-control select">'
                            +'<select required id="grupmenuTB"name="grupmenuTB"></select>'
                        +'</div>'

                        //menu
                        +'<label>Menu</label>'
                        +'<div class="input-control text">'
                            +'<input required type="text"  placeholder="menu" name="menuTB" id="menuTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        //link
                        +'<label>Link</label>'
                        +'<div class="input-control text">'
                            +'<input required type="text"  placeholder="Link" name="linkTB" id="linkTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // warna 
                        +'<label>Warna </label>'
                        +'<div class="input-control select">'
                            +'<select required id="warnaTB"name="warnaTB"></select>'
                        +'</div>'

                        // icon 
                        +'<label>icon </label>'
                        +'<div class="input-control select">'
                            +'<select required id="iconTB"name="iconTB"></select>'
                        +'</div>'

                        //size
                        +'<label>size</label>'
                        +'<div class="input-control select">'
                            +'<select id="sizeTB" name="sizeTB">'
                                +'<option value="">kecil</option>'
                                +'<option value="double">Besar</option>'
                            +'</select>'
                        +'</div>'

                        // keterangan
                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'

                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';

        //add form
        // $("#tambahBC").on('click', function(){
        //     viewFR('');
        // });

        $('#grupmodulS').on('change',function(){
            cmbmodul('filter',$(this).val(),'');
        });
        $('#modulS').on('change',function(){
            cmbgrupmenu('filter',$(this).val(),'');
        });
        $('#warnaS,#iconS').on('change',function(){
            viewTB();
        });
        //search action
        $('#menuS,#linkS').keydown(function (e){
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
                $(el2).html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr>');
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
                $.Dialog.content(contentFR);
                if(id==''){  //add mode
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    cmbgrupmodul('form','');
                    cmbmodul('form','','');
                    cmbgrupmenu('form','','');
                    cmbwarna('form','');
                    cmbicon('form','');
                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            $('#menuTB').val(dt.menu);
                            $('#linkTB').val(dt.link);
                            $('#sizeTB').val(dt.size);
                            $('#keteranganTB').val(dt.keterangan);
                            cmbgrupmodul('form',dt.grupmodul);
                            cmbmodul('form',dt.grupmodul,dt.modul);
                            cmbgrupmenu('form',dt.modul,dt.grupmenu);
                            cmbwarna('form',dt.warna);
                            cmbicon('form',dt.icon);
                        }
                    });
                }
                $.Dialog.title(titlex+' '+mnu);
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
    function cmbgrupmenu(typ,mod,gm){
        if(mod==''){
            if(typ=='filter'){
                $('#grupmenuS').html('<option value="">-SEMUA-</option>');
                cmbwarna('filter','');
            }else $('#grupmenuTB').html('<option value="">-Pilih Dahulu Modul-</option>');
        }else{
            var u = dir7;
            var d ='aksi=cmb'+mnu7+(mod!=''?'&id_modul='+mod:'');
            ajax(u,d).done(function (dt) {
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.grupmenu, function(id,item){
                        out+='<option '+(gm!='' && gm==item.id_grupmenu?'selected':'')+' value="'+item.id_grupmenu+'">'+item.grupmenu+'</option>';
                    });
                }
                if(typ=='filter'){
                    $('#grupmenuS').html('<option value="">-SEMUA-</option>'+out);
                    cmbwarna('filter','');
                }else{
                    // console.log('masuk form grup menu');
                    $('#grupmenuTB').html('<option value="">-Pilih Kategori-</option>'+out);
                }
            });
        }
    }

// combo modul---
    function cmbmodul(typ,gm,mod){
        if(gm==''){
           if(typ=='filter'){
                $('#modulS').html('<option value="">-SEMUA-</option>');
                cmbgrupmenu('filter','','');
            }else $('#modulTB').html('<option value="">-Pilih Dahulu Grup Modul-</option>');
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
                    cmbgrupmenu('filter','','');
                }else{
                    $('#modulTB').html('<option value="">-Pilih Modul-</option>'+out);
                }
            });
        }
    }

// combo warna ---
    function cmbwarna(typ,war){
        var u = dir3;
        var d ='aksi=cmb'+mnu3;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.warna, function(id,item){
                    out+='<option '+(war!='' && war==item.id_warna?'selected':'')+' value="'+item.id_warna+'">'+item.warna+'</option>';
                });
            }
            if(typ=='filter'){
                $('#warnaS').html('<option value="">-SEMUA-</option>'+out);
                cmbicon('filter','','');
            }else{
                $('#warnaTB').html('<option value="">-Pilih Warna-</option>'+out);
            }
        });
    }
// combo icon ---
    function cmbicon(typ,ico){
        var u = dir4;
        var d ='aksi=cmb'+mnu4;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.icon, function(id,item){
                    out+='<option '+(ico!='' && ico==item.id_icon?'selected':'')+' value="'+item.id_icon+'">'+item.icon+'</option>';
                });
            }
            if(typ=='filter'){
                $('#iconS').html('<option value="">-SEMUA-</option>'+out);
                viewTB();
            }else{
                $('#iconTB').html('<option value="">-Pilih icon-</option>'+out);
            }
        });
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