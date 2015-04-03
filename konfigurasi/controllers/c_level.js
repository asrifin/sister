var mnu       = 'level';
var dir       = 'models/m_'+mnu+'.php';
var aksiFR = levelFR = contentFR = '';

// main function ---
    $(document).ready(function(){
        levelFR += '<form autocomplete="off" id="levelFR" onsubmit="simpan(\'level\');return false;" >' 
                        +'<input id="idformlevelH" type="hidden">' 

                        +'<label>'+mnu+'</label>'
                        +'<div class="input-control text">'
                            +'<input required placeholder="'+mnu+'" name="'+mnu+'TB" id="'+mnu+'TB">'
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
        aksiFR += '<form autocomplete="off" id="levelaksiFR" onsubmit="simpan(\'levelaksi\'); return false;">' 
                        +'<input id="idformlevelaksiH" type="hidden">' 
                        +'<table>'
                            +'<tr>'
                                +'<td><b>Level</b></td>'
                                +'<td id="levelTD"></td>'
                            +'</tr>'
                        +'</table>'
                        //detail Aksi per kategori menu 
                        +'<legend></legend>'
                        +'<div style="overflow:scroll;height:250px;">'
                           +'<ul id="katgrupmenuDV" class="treeview" data-role="treeview">'
                           +'</ul>'
                        +'</div>'               

                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';
        viewTB();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('level','');
        });

        //search action
        $('#'+mnu+'S, #actionS, #keteranganS').keydown(function (e){
            if(e.keyCode == 13)
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
    function simpan(subaksi){
        // var x = $('#'+subaksi+'FR').serialize();
        var urlx ='&aksi=simpan&subaksi='+subaksi;
        if($('#idform'+subaksi+'H').val()!='') 
           urlx += '&id_'+mnu+'='+$('#idform'+subaksi+'H').val();

        // alert(urlx);return false;
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$('#'+subaksi+'FR').serialize()+urlx,
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    kosongkan();
                    if(subaksi=='level'){ //level 
                        $.Dialog.close();
                        viewTB($('#departemenS').val());
                    }else{ // levelaksi
                        viewFR('levelaksi',$('#idform2H').val());
                    }
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
    function viewTB(){
        var aksi ='aksi=tampil&subaksi=level';
        var cari ='&'+mnu+'S='+$('#'+mnu+'S').val()
                +'&actionS='+$('#actionS').val()
                +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="5"><img src="../img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---

// form ---
    function viewFR(menu,idlevel){
        // alert(menu+','+idlevel);return false;
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            // heigth:200,
            padding: 10,
            onShow: function(){
                var titlex=contentFR='';
                if(idlevel==''){  //add mode
                    alert('masuk levelaksi - add');
                    // titlex='<span class="icon-plus-2"></span> Tambah ';
                    // contentFR = levelFR;
                }else{ // edit mode
                    if(menu=='levelaksi'){ // aksi
                        titlex='<span class="icon-search"></span> Detail Aksi ';
                        $.ajax({
                            url:dir,
                            data:'aksi=tampil&subaksi=levelaksi&id_level='+idlevel,
                            type:'post',
                            dataType:'json',
                            success:function(dt){
                                if(dt.status!='sukses'){
                                    notif(dt.status,'red');
                                }else{
                                    $('#idformlevelaksiH').val(idlevel);
                                    $('#levelTD').html(': '+dt.data.keterangan+'('+dt.data.level+')');
                                    var out='';
                                    $.each(dt.data.katgrupmenuArr,function(id,item){
                                        out+='<li class="node">'
                                                +'<a href="#"><span class="node-toggle"></span>'+item.keterangan+'</a>'
                                                    +'<ul>'
                                            $.each(item.aksiArr, function (id,item) {
                                                out+='<li style="padding-left:20px;">'
                                                        +'<label>'
                                                            +'<input value="'+item.id_aksi+'" id="aksi'+item.id_levelaksi+'_TB" name="aksiTB['+item.id_katgrupmenu+'][]" '+(item.stataksi==1?'checked':'')+' type="checkbox"  /> '
                                                                +item.keterangan+''
                                                        +'</label>'
                                                    +'</li>';
                                            }); out+='</ul>'
                                            +'</li>';
                                    });$('#katgrupmenuDV').html(out);
                                }
                            }
                        });
                        contentFR += aksiFR;
                    }else{ // level
                        alert('masuk level - edit');

                        // $.ajax({
                        //     url:dir,
                        //     data:'aksi=ambiledit&id_'+mnu+'='+idlevel,
                        //     type:'post',
                        //     dataType:'json',
                        //     success:function(dt){
                        //         $('#idformH').val(id);
                        //         $('#'+mnu+'TB').val(dt.level);
                        //         $('#actionTB').val(dt.action);
                        //         $('#keteranganTB').val(dt.keterangan);
                        //     }
                        // });contentFR = levelFR;
                    }
                }
                $.Dialog.title(titlex+' '+mnu);
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
