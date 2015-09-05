var mnu  ='detaildiskon';
var mnu2 ='departemen';
var mnu3 ='tahunajaran';
var mnu4 ='biaya';

var dir  ='models/m_'+mnu+'.php';
var dir2 ='../akademik/models/m_'+mnu2+'.php';
var dir3 ='../akademik/models/m_'+mnu3+'.php';
var dir4  ='models/m_'+mnu4+'.php';


var contentFR ='';
// main function ---
    $(document).ready(function(){
        contentFR += '<form onsubmit="simpan();return false;" style="overflow:scroll;height:500px;"  id="diskonFR">' 
                        +'<input  id="idformH" type="hidden">' 
                        
                        // departemen 
                        +'<table class="table hovered bordered striped">'
                            +'<tr>'
                                +'<td>Departemen </td>'
                                +'<td id="departemenDV"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Biaya </td>'
                                +'<td id="biayaDV"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Tahun Ajaran</td>'
                                +'<td id="tahunajaranDV"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Diskon </td>'
                                +'<td id="diskonDV"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Keterangan </td>'
                                +'<td id="keteranganDV"></td>'
                            +'</tr>'
                        +'</table>'

                        // nilai diskon 
                        +'<label>Nilai Diskon</label>'
                        +'<div class="input-control text">'
                            +'<input maxlength="3" max="100" min="1" required type="number" name="nilaiTB" id="nilaiTB">'
                            +'<button class="btn-clear"></button>'
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

        $('#keteranganS,#nilaiS,#diskonS').keydown(function (e){
            if(e.keyCode == 13) viewTB();
        });
        $('#isAktifS,#biayaS,#tahunajaranS,#departemenS').on('change',function (){
            viewTB();
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#diskonS').val('');
            $('#keteranganS').val('');
        });

    }); 
// end of main function ---

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
        // edit mode
        if($('#idformH').val()!=''){
            urlx += '&replid='+$('#idformH').val();
        }
        $.ajax({
            url:dir,
            type:'post',
            dataType:'json',
            data:$('form').serialize()+urlx,
            success:function(data){
                if(data.status!='sukses'){
                    alert(data.status);
                }else{
                    $.Dialog.close();
                    kosongkan();
                    viewTB();
                }
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

// add form ---
    function viewFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            icon: '<span class="icon-plus-2"></span>',
            title: 'Draggable window',
            width: 500,
            padding: 10,
            content: 'This Window is draggable by caption.',
            onShow: function(){
                var titlex;
                if(id==''){  //add mode
                    titlex='Tambah ';
                }else{ // edit mode
                    titlex='Ubah '; 
                    var u=dir;
                    var d='aksi=ambiledit&replid='+id;
                    ajax(u,d).done(function (dt){
                        $('#idformH').val(id);
                        cmbbiaya('form',dt.idbiaya);
                        cmbdepartemen('form',dt.departemen);
                        cmbtahunajaran('form',dt.tahunajaran);
                        $('#diskonDV').text(': '+dt.diskon);
                        $('#keteranganDV').text(': '+dt.keterangan);
                        $('#nilaiTB').val(dt.nilai);
                    });
                }$.Dialog.title(titlex+"Set Diskon");
                $.Dialog.content(contentFR);
            }
        });
    }
// end of add form ---

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
                $(el2).html('<tr><td align="center" colspan="8"><img src="../img/w8loader.gif"></td></tr></center>');
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
            success:function(data){
                if(data.status!='sukses'){
                    alert('gagal menghapus data');
                }else{
                    viewTB();
                }
            }
        });
    }
//end of del process ---
    
//reset form ---
    function kosongkan(){
        $('#nilaiTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---


// combo departemen ---
    function cmbdepartemen(typ,dep){
        var u = dir2;
        var d ='aksi=cmb'+mnu2+(dep!=''?'&replid='+dep:'');
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
                cmbtahunajaran('filter','');
            }else{
                $('#departemenDV').text(': '+dt.departemen[0].nama);
            }
        });
    }
// combo tahunajaran ---
    function cmbtahunajaran(typ,thn){
        var u = dir3;
        var d ='aksi=cmb'+mnu3+(thn!=''?'&replid='+thn:'');
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    out+='<option '+(thn!='' && thn==item.replid?'selected':'')+' value="'+item.replid+'">'+item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1)+'</option>';
                });
            }
            if(typ=='filter'){
                $('#tahunajaranS').html(out);
                cmbbiaya('filter', '');
            }else{
                var tahun  = dt.tahunajaran[0].tahunajaran;
                var tahun2 = parseInt(tahun)+1;
                $('#tahunajaranDV').text(': '+tahun+' - '+tahun2);
            }
        });
    }
// combo biaya ---
    function cmbbiaya(typ,bya){
        var u = dir4;
        var d ='aksi=cmb'+mnu4+'&isDiskon='+(bya!=''?'&replid='+bya:'');
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
                $('#biayaDV').text(': '+dt.biaya[0].biaya);
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
    
    function refresh(){
        var d='aksi=refresh&tahunajaran='+$('#tahunajaranS').val()+'&departemen='+$('#departemenS').val();
        ajax(dir,d).done(function (dt){
            if(dt.status=='sukses') viewTB();
            notif(dt.status,(dt.status=='sukses'?'green':'red'));
        });
    }

//aktifkan process ---
    function aktifkan(id){
        if(confirm(' ubah status ?')){
            var u = dir;
            var d ='aksi=aktifkan&id_'+mnu+'='+id;
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
