var mnu  = 'user';
var mnu2 = 'level';
var mnu3 = 'departemen';
var mnu4 = 'modul';
var mnu5 = 'grupmenu';
var mnu6 = 'menu';

var dir  = 'models/m_'+mnu+'.php';
var dir2 = 'models/m_'+mnu2+'.php';
var dir3 = '../akademik/models/m_'+mnu3+'.php';
var dir4 = 'models/m_'+mnu4+'.php';
var dir5 = 'models/m_'+mnu5+'.php';
var dir6 = 'models/m_'+mnu6+'.php';

var aksiFR = levelFR = contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<form style="overflow:scroll;height:560px;"  autocomplete="off" onsubmit="simpan();return false;" >' 
                        +'<input name="idformH" id="idformH" type="hidden">' 
                        
                        // nama
                        +'<label>Nama</label>'
                        +'<div class="input-control text">'
                            +'<input required placeholder="nama" name="namaTB" id="namaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        // username
                        +'<label>Username</label>'
                        +'<div class="input-control text">'
                            +'<input required placeholder="username" name="usernameTB" id="usernameTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        // pass
                        +'<label>Password</label>'
                        +'<div class="input-control text">'
                            +'<input type="password" required placeholder="password" name="passwordTB" id="passwordTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // accordion
                        +'<div class="accordion with-marker xspan3 xplace-left margin10" data-role="accordion" data-closeany="true">'
                            +'<div class="accordion-frame active">'
                                +'<a class="heading bg-lightBlue fg-white" href="#">Level</a>'
                                +'<div style="display: block;" class="content">'
                                     // Level
                                    +'<div id="levelDV"></div>'
                                +'</div>'
                            +'</div>'
                            +'<div class="accordion-frame">'
                                +'<a class="heading bg-lightBlue fg-white" href="#">Departemen</a>'
                                +'<div style="display: block;" class="content">'
                                    // departemen
                                    +'<div id="departemenDV"></div>'
                                +'</div>'
                            +'</div>'
                            +'<div class="accordion-frame">'
                                +'<a class="heading bg-lightBlue fg-white" href="#">Modul</a>'
                                +'<div style="display: block;" class="content">'
                                    // modul
                                    +'<div id="modulDV"></div>'
                                +'</div>'
                            +'</div>'
                        +'</div>'

                       
                        // button
                        +'<div class="form-actions">' 
                            +'<button id="simpanTB" class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';

        cmblevel('filter','');
        //add form
        // $("#tambahBC").on('click', function(){
            // viewFR('level','');
        // });

        //search action
        $('#namaS, #usernameS').keydown(function (e){
            if(e.keyCode == 13) viewTB();
        });
        $('#levelS,#aktifS').on('change',function (){
            viewTB();
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
           urlx += '&id_'+mnu+'='+$('#idformH').val();

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
                    // kosongkan();
                    $.Dialog.close();
                    viewTB();
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---
    
    function levelAksiVW (level) {
        $.ajax({
            url:dir,
            data:'aksi=tampil&subaksi=levelaksi&id_level='+level,
            type:'post',
            dataType:'json',
            success:function(dt){
                // alert(dt);return false;
                console.log(dt);
                if(dt.status!='sukses'){
                    notif(dt.status,'red');
                }else{
                    alert(level);
                    $('#idformlevelaksiH').val(dt.data.level);
                    $('#levelTD').html(': '+dt.data.keterangan+'('+dt.data.level+')');
                    // return false;
                    // data detail barang
                    // var tbl='';
                    // $.each(dt.data.barangArr,function(id,item){
                    //     var btn;
                    //     tbl+='<tr>'
                    //         +'<td><input '+(item.status==3||item.status==4?'disabled':'')+' type="checkbox" dp="'+item.iddpeminjaman+'" brg="'+item.idbarang+'" /></td>'
                    //         +'<td>'+item.kode+'</td>'
                    //         +'<td>'+item.barang+'</td>'
                    //         +'<td>'+item.tgl_kembali2+'</td>'
                    //         +'<td>'
                    //             +'<button style="background-color:'+item.color+'" '
                    //                 +(item.status==3||item.status==4?'onclick="alert(\'sudah dikembalikan\')"':'onclick="kembalikanFC('+item.iddpeminjaman+','+item.idbarang+')"')+'>'
                    //                 +'<i style="color:white;" class="icon-undo"></i>'
                    //             +'</button>'
                    //         +'</td>'
                    //     +'</tr>';
                    // });$('#barangTBL2').html(tbl);
                }
            }
        });
        // contentFR=contentDetail;
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
                $(el2).html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }

// level
    function levelFC(lv){
        var u = dir2;
        var d = 'aksi=cmb'+mnu2;
        ajax(u,d).done(function  (dt) {
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                if(dt.level.length==0) out+='level masih kosong (hubungi admin konfigurasi)';
                else{
                    $.each(dt.level,function(id,item){
                        out+='<div data-hint="info| okokokok" data-role="input-control" class="input-control radio default-style" >'
                                +'<label >'
                                    +'<input name="levelTB" value="'+item.id_level+'" onclick="departemenFC('+item.urutan+',\'\');modulFC('+item.urutan+',\'\');" '+(typeof lv!=undefined && item.id_level==lv?'checked':'')+' value="'+item.id_level+'" required type="radio"  />'
                                    +'<span class="check"></span>'
                                    +item.keterangan
                                    +' <i class="fg-'+(item.urutan==1?'yellow':'black')+' icon-'+(item.urutan==1||item.urutan==2?'star-4':'')+'"></i>'
                                +'</label>'
                            +'</div><br />';
                    });
                }$('#levelDV').html(out);
            }
        });
    }     

// departemen
    function departemenFC(lv,dp) {
        var u   = dir3;
        var d   = 'aksi=cmb'+mnu3;
        ajax(u,d).done(function  (dt) {
            var out ='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                if(dt.departemen.length==0) out+='<b class="bg-red fg-white">'+mnu3+'masih kosong (hubungi admin akademik)</b>';
                else{
                    $.each(dt.departemen,function(id,item){
                        out+='<div data-role="input-control" class="input-control '+(lv==1?'checkbox':'radio default-style')+' margin3" >'
                                +'<label class="inline-block">'
                                    +'<input name="departemenTB[]" value="'+item.replid+'" '+(typeof dp!=undefined && item.replid==dp?'checked':'')+' required type="'+(lv==1?'checkbox':'radio')+'"  />'
                                    +'<span class="check"></span>'
                                    +item.nama
                                +'</label>'
                            +'</div><br />';
                    });
                }$('#departemenDV').html(out);
            }
        });
    }

    function modulDefaultFC(md){
        if($('#modul'+md+'TB').is(':checked')) {
            $('#default'+md+'TB').removeAttr('disabled');
            $('#default'+md+'TB').attr('checked',true);
        } else {
            $('#default'+md+'TB').attr('disabled',true);
            $('#default'+md+'TB').removeAttr('checked');
        }
    } 

// modul
    function modulFC(lv,md){
        var u = dir4;
        var d = 'aksi=cmb'+mnu4;
        ajax(u,d).done(function  (dt) {
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                if(dt.modul.length==0) 
                    out+=mnu4+' masih kosong (hubungi admin '+mnu4+')';
                else{
                    $.each(dt.modul,function(id,item){
                        out+=lv==2?'<input required disabled data-hint="default" type="radio" name="defaultTB" id="default'+item.id_modul+'TB" value="'+item.id_modul+'" />':'';
                        // out+='<div data-role="input-control" class="input-control radio default-style"><input type="radio" /></div>'
                        // out+=lv==2?'<div data-role="input-control" class="input-control radio"><input type="radio" /></div>':'';
                        out+=' <div data-role="input-control" id="modulsub'+item.id_modul+'DV" class="input-control '+(lv==1||lv==2?'checkbox':'radio default-style')+'" >'
                                +'<label>'
                                    +'<input id="modul'+item.id_modul+'TB" '+(lv==1?'disabled':'')+'  onclick="'+(lv==2?'modulDefaultFC('+item.id_modul+');':'')+' grupMenuFC('+item.id_modul+',\'\')" '+(lv==1||(typeof md!=undefined && item.id_modul)==md?'checked':'')+' value="'+item.id_modul+'" type="'+(lv==1||lv==2?'checkbox':'radio')+'"  />'
                                    +'<span class="check"></span>'
                                    +item.modul
                                +'</label>'
                            +'</div>'
                            +'<ul style="margin-left:22px;" class="grupmenuDV" id="grupmenu'+item.id_modul+'DV" class="treeview" data-role="treeview">'
                            +'</ul>';
                    });
                }$('#modulDV').html(out);
            }
        });
    }     

// grupmenu
    function grupMenuFC(md,gm){
        var u = dir5;
        var d = 'aksi=cmb'+mnu5+'&id_modul='+md+'&id_level='+$('input[name=levelTB]:checked').val();
        ajax(u,d).done(function  (dt) {
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                if($('[name="modulTB"]').attr('type')=='radio') $('.grupmenuDV').html('');
                if(dt.grupmenu.length==0) {
                    if($('#modul'+md+'TB').is(':checked')) 
                        out+='<div class="notice marker-on-top bg-amber">'
                                +'<div class="fg-white"><i class="icon-warning"></i> '+mnu5+' masih kosong (hubungi admin '+mnu5+')</div>'
                            +'</div>';
                }else{
                    if($('#modul'+md+'TB').is(':checked')) {
                        $.each(dt.grupmenu,function(id,item){
                            out+='<div data-role="input-control" class="input-control checkbox">'
                                    +'<label>'
                                        +'<input id="grupmenu'+item.id_grupmenu+'TB" '+(item.aktif==0?'disabled':'')+' onclick="menuFC(\''+item.id_grupmenu+'\',\'\')" '+(typeof gm!=undefined && item.id_grupmenu==gm?'checked':'')+' value="'+item.id_grupmenu+'" type="checkbox"  />'
                                        +'<span class="check"></span>'
                                        +item.grupmenu
                                        +'<sub class="fg-gray"> ('+item.keterangan+')</sub>'
                                    +'</label>'
                                +'</div>'
                                +'<ul style="margin-left:22px;" class="menuDV" id="menu'+item.id_grupmenu+'DV" class="treeview" data-role="treeview">'
                                +'</ul>';
                        });
                    }
                }
                $('#grupmenu'+md+'DV').html(out);
            }
        });
    }
// menu
    function menuFC(gm,mn){
        var u = dir6;
        var d = 'aksi=cmb'+mnu6+'&id_grupmenu='+gm;
        ajax(u,d).done(function  (dt) {
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                if(dt.menu.length==0) {
                    out+='<div class="notice marker-on-top bg-amber">'
                            +'<div class="fg-white"><i class="icon-warning"></i>'+mnu6+' masih kosong (hubungi admin '+mnu6+')</div>'
                        +'</div>';
                }else{
                    if($('#grupmenu'+gm+'TB').is(':checked')){
                        $.each(dt.menu,function(id,item){
                            out+='<div style="margin-left:15px;" data-role="input-control" class="input-control checkbox">'
                                    +'<label>'
                                        +'<input name="menuTB[]" value="'+item.id_menu+'" '+(mn=='' || mn==item.id_menu?'checked':'')+' type="checkbox"/>'
                                        +'<span class="check"></span>'
                                        +item.menu
                                    +'</label>'
                                +'</div>';
                        });
                    }
                }$('#menu'+gm+'DV').html(out);
            }
        });
    }

// form ---
    function viewFR(iduser){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '50%',
            padding: 10,
            onShow: function(){
                if(iduser!=''){ // edit 
                    var u = dir;
                    var d ='aksi=ambiledit&id_user='+iduser;
                    ajax(u,d).done(function  (dt) {
                        if(dt.status!='sukses'){
                            notif(dt.status,'red');
                        }else{
                            if(dt.isLogged) { //sudah aktif (pernah login)
                                $('#namaTB').attr('disabled',true);
                                $('#usernameTB').attr('disabled',true);
                                $('#passwordTB').attr('disabled',true);
                                $('#simpanTB').attr('disabled',true);
                            }
                            $('#idformH').val(iduser);
                            $('#namaTB').val(dt.nama);
                            $('#usernameTB').val(dt.username);
                            
                            levelFC(dt.id_level);
                            departemenFC(dt.id_level,dt.departemen);
                            // modulFC(dt.id_level,md)
                        }
                    });
                }else{ //add
                    levelFC();
                    departemenFC();
                    modulFC();
                }
                titlex='<span class="icon-plus-2"></span> Tambah ';
                $.Dialog.title(titlex+' '+mnu);
                $.Dialog.content(contentFR);
                $('#namaTB').focus();
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
            data:'aksi=hapus&id_'+mnu+'='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                    viewTB();
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
        if(confirm(' mengaktifkan  user ?')){
            var u = dir;
            var d ='aksi=aktifkan&id_login='+id;
            // alert(d);return false;
            ajax(u,d).done(function (dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Mengaktifkan user.';
                    clr  ='red';
                }else{
                    cont = '..Berhasil Mengaktifkan user.';
                    clr  ='green';
                    viewTB();
                }notif(cont,clr);
            });
        }
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

// combo level---
    function cmblevel(typ,lv){
        var u = dir2;
        var d ='aksi=cmb'+mnu2+(lv!=''?'&id_'+mnu2+'='+lv:'');
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.level, function(id,item){
                    out+='<option '+(lv!='' && lv==item.id_level?'selected':'')+' value="'+item.id_level+'">'+item.keterangan+' ['+item.level+']</option>';
                });
            }
            if(typ=='filter'){
                $('#levelS').html('<option value="">-SEMUA-</option>'+out);
                viewTB();
            }else{
                $('#levelTB').html('<option value="">-Pilih level-</option>'+out);
            }
        });
    }
