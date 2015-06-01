var mnu       = 'subtingkat';
var mnu2      = 'tingkat';
var mnu3      = 'tahunajaran';
var mnu4      = 'departemen';

var dir       = 'models/m_'+mnu+'.php';
var dir2      = 'models/m_'+mnu2+'.php';
var dir3      = 'models/m_'+mnu3+'.php';
var dir4      = 'models/m_'+mnu4+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        +'<label>Departemen</label>'
                        +'<div class="input-control text">'
                            +'<input disabled type="text" name="departemenTB" id="departemenTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Tahun Ajaran</label>'
                        +'<div class="input-control text">'
                            +'<input disabled type="text" name="tahunajaranTB" id="tahunajaranTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>tingkat</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="tingkatH" id="tingkatH">'
                            +'<input disabled type="text" name="tingkatTB" id="tingkatTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>'+mnu+'</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="'+mnu+'" required type="text" name="'+mnu+'TB" id="'+mnu+'TB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        // +'<input placeholder="'+mnu+'" oninvalid="this.setCustomValidity(\'isi dulu gan\');" required type="text" name="'+mnu+'TB" id="'+mnu+'TB">'
                        
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

        //search action
        $('#departemenS').on('change',function (){
            cmbtahunajaran('filter',$(this).val(),'');
        });
        $('#tahunajaranS').on('change',function (){
            cmbtingkat('filter',$(this).val(),'');
        });
        $('#tingkatS').on('change',function (){
            viewTB();
        });
        $('#subtingkatS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB();
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#subtingkatS').val('');
        });
    }); 
// end of save process ---

// combo departemen ---
    function cmbdepartemen(typ,id){
        var replid = id!=''?'&replid='+id:'';
        $.ajax({
            url:dir4,
            data:'aksi=cmb'+mnu4+replid,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    if(dt.departemen.length==0){
                        out+='<option value="">kosong</option>';
                    }else{
                        $.each(dt.departemen, function(id,item){
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                        });
                    }
                    if(typ=='filter'){ // filter (search)
                        $('#departemenS').html(out);
                        cmbtahunajaran('filter',dt.departemen[0].replid,'');
                    }else{ // form (edit & add)
                        $('#departemenTB').val(dt.departemen[0].nama);
                    }
                }
            }
        });
    }
//end of combo departemen ---

// combo tahunajaran ---
    function cmbtahunajaran(typ,dep,id){
        var replid = id!=''?'&replid='+id:'';
        $.ajax({
            url:dir3,
            data:'aksi=cmb'+mnu3+'&departemen='+dep+replid,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    if(dt.tahunajaran.length==0){
                        out+='<option value="">kosong</option>';
                    }else{
                        $.each(dt.tahunajaran, function(id,item){
                            out+='<option  value="'+item.replid+'">'+item.tahunajaran+(item.aktif=='1'?' (aktif)':'')+'</option>';
                        });
                    }
                    if(typ=='filter'){ // filter (search)
                        $('#tahunajaranS').html(out);
                        cmbtingkat('filter',dt.tahunajaran[0].replid,'');
                    }else{ // form (edit & add)
                        $('#tahunajaranTB').val(dt.tahunajaran[0].tahunajaran);
                    }
                }
            }
        });
    }
//end of combo departemen ---

// combo tingkat ---
    function cmbtingkat(typ,thn,id){
        var replid = id!=''?'&replid='+id:'';
        $.ajax({
            url:dir2,
            data:'aksi=cmb'+mnu2+'&tahunajaran='+thn+replid,
            dataType:'json',
            type:'post',
            success:function(dt){
                // alert(dt.tingkat.length); return false;
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    if(dt.tingkat.length==0){
                        out+='<option value="">kosong</option>';
                    }else{
                        $.each(dt.tingkat, function(id,item){
                            out+='<option value="'+item.replid+'">'+item.keterangan+'</option>';
                        });
                    }
                    if(typ=='filter'){ // filter (search)
                        $('#tingkatS').html(out);
                        viewTB();
                    }else{ // form (edit & add)
                        $('#tingkatTB').val(dt.tingkat[0].keterangan);
                    }
                }
            }
        });
    }
//end of combo tingkat ---

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
                    var res = ajax(dir,'aksi=ambiledit&replid='+id);
                    res.done(function(r){
                        $('#idformH').val(id);
                        cmbdepartemen('form',$('#departemenS').val());
                        cmbtahunajaran('form',$('#departemenS').val(),r.tahunajaran);
                        cmbtingkat('form',$('#tahunajaranS').val(),r.tingkat);
                        $('#subtingkatTB').val(r.subtingkat);
                    });
                }else{ // form mode : add  
                    titl='Tambah '+mnu;
                    cmbdepartemen('form',$('#departemenS').val());
                    cmbtahunajaran('form',$('#departemenS').val(),$('#tahunajaranS').val());
                    cmbtingkat('form',$('#tahunajaranS').val(),$('#tingkatS').val());
                }$.Dialog.title(titl);
                $.Dialog.content(contentFR);
                $('#tingkatH').val($('#tingkatS').val());
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

// ajax jquery (mode : syncronous) -----
    function sjax(u,d) {
        var ret;
        $.ajax({
            url:u,
            data:d,
            async:false,
            type:'post',
            dataType:'json',
            success:function(res){ret = res;}
        });return ret;
    }

// form ---
    // function viewFRx(id){
    //     $.Dialog({
    //         shadow: true,
    //         overlay: true,
    //         draggable: true,
    //         width: 500,
    //         padding: 10,
    //         onShow: function(){
    //             var titlex;
    //             // form :: departemen (disabled field) -----------------------------
    //                 $.ajax({
    //                     url:dir2,
    //                     data:'aksi=cmb'+mnu2+'&replid='+$('#departemenS').val(),
    //                     type:'post',
    //                     dataType:'json',
    //                     success:function(dt){
    //                         $('#departemenH').val($('#departemenS').val());
    //                         $('#tahunajaranH').val($('#tahunajaranS').val());
    //                         var out;
    //                         if(dt.status!='sukses'){
    //                             out=dt.status;
    //                         }else{
    //                             out=dt.departemen[0].nama;
    //                         }$('#departemenTB').val(out);
    //                     // form :: tahun ajaran (disabled field) --------------
    //                         $.ajax({
    //                             url:dir3,
    //                             data:'aksi=cmbtahunajaran&departemen='+$('#departemenS').val()+'&replid='+$('#tahunajaranS').val(),
    //                             dataType:'json',
    //                             type:'post',
    //                             success:function(dt2){
    //                                 var out2;
    //                                 if(dt.status!='sukses'){
    //                                     out2=dt2.status;
    //                                 }else{
    //                                     out2=dt2.tahunajaran[0].tahunajaran;
    //                                 }$('#tahunajaranTB').val(out2);
                                    
    //                                 if (id!='') { // edit mode
    //                                 // form :: edit :: tampilkan data 
    //                                     $.ajax({
    //                                         url:dir,
    //                                         data:'aksi=ambiledit&replid='+id,
    //                                         type:'post',
    //                                         dataType:'json',
    //                                         success:function(dt3){
    //                                             $('#idformH').val(id);
    //                                             $('#semesterTB').val(dt3.semester);
    //                                             $('#keteranganTB').val(dt3.keterangan);
    //                                         }
    //                                     });
    //                                 // end of form :: edit :: tampilkan data 
    //                                     titlex='<span class="icon-pencil"></span> Ubah ';
    //                                 }else{ //add mode
    //                                     titlex='<span class="icon-plus-2"></span> Tambah ';
    //                                 }
    //                             }
    //                         });
    //                     //end of  form :: tahun ajaran (disabled field) --------------
    //                     }
    //                 });
    //             //end of form :: departemen (disabled field) -----------------------------
    //             $.Dialog.title(titlex+' '+mnu);
    //             $.Dialog.content(contentFR);
    //         }
    //     });
    // }
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
//end of aktifkan process ---

    // ---------------------- //
    // -- created by rovi -- //
    // ---------------------- //