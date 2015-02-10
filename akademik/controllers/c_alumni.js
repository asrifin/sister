var mnu       = 'alumni';
var mnu2      = 'departemen';
var mnu3      = 'tahunlulus';
var dir       = 'models/m_'+mnu+'.php';
var dir2      = 'models/m_'+mnu2+'.php';
var dir3      = 'models/m_'+mnu3+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        +'<label>Departemen</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="departemenH" id="departemenH">'
                            +'<input disabled type="text" name="departemenTB" id="departemenTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>NISN</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="NISN" id="nisnTB">'
                            +'<input  type="hidden" name="nisnH" id="nisnH" >'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Nama Siswa</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="Nama Siswa" id="siswaTB">'
                            +'<input  type="hidden" name="siswaH" id="siswaH" >'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Tahun Lulus</label>'
                        +'<div class="input-control select span3">'
                            +'<select  name="tahunlulusTB" id="tahunlulusTB"></select>'
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

        // combo departemen
        cmbdepartemen('');
        // cmbdepartemen(false,'');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#departemenS').on('change',function(){
            cmbtahunlulus($(this).val());
        });
        $('#tahunlulusS').on('change',function (){
            viewTB();
        });
    }); 
// end of save process ---

// combo departemen ---
    function cmbdepartemen(dep){
        $.ajax({
            url:dir2,
            data:'aksi=cmbdepartemen',
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.departemen, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                    $('#departemenS').html(out);
                }
                cmbtahunlulus(dt.departemen[0].replid);
            }
        });
    }
//end of combo departemen ---

// combo tahunlulus ---
    function cmbtahunlulus(dep,hun,idhun){
        console.log(dep+','+hun+','+idhun);
        // return false;
        var select='',tb;
        if(hun){// form
            tb='#tahunlulusTB';
        }else{// search
            tb='#tahunlulusS';
            select+='<option value="">---------- Semua ----------</option>';
            // if ($('#tahunlulusS').val()!='') {
            //     tl=''
            // };
        }
        $.ajax({
            url:dir3,
            data:'aksi=cmbtahunlulus&departemen='+dep,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.nama, function(id,item){
                        if(idhun==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }$(tb).html((dt.nama==null?'':select)+out);
                if(!hun) viewTB();
            }
        });
    }
//end of combo tahunlulus ----

// combo tahunlulus2 ---
    function cmbtahunlulus2(hun){
        $.ajax({
            url:dir3,
            data:'aksi=cmbtahunlulus',
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.nama, function(id,item){
                        if(item.replid==hun)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }$('#tahunlulusTB').html(out);
            }
        });
    }
//end of combo tahunlulus2 ----

//save process ---
    function simpan(){
        // var urlx ='&aksi=simpan&departemen='+$('#departemenS').val();
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
                    viewTB($('#departemenS').val());
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari = '&tahunlulusS='+$('#tahunlulusS').val()
                    +'&departemenS='+$('#departemenS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="7"><img src="img/w8loader.gif"></td></tr></center>');
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
                $('#departemenH').val($('#departemenS').val());
                $('#tahunlulusH').val($('#tahunlulusS').val());
                if (id!='') { // edit mode
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            $('#nisnTB').val(dt.nisn); 
                            $('#siswaTB').val(dt.siswa);
                            $('#keteranganTB').val(dt.ket);
                            // cmbtahunlulus(dt3.nama,true,dt3.nama);
                            cmbtahunlulus(dt.departemen,true,dt.nama); /*epiii*/
                        }
                    });titlex='<span class="icon-pencil"></span> Ubah ';
                }else{ //add mode
                    cmbtahunlulus($('#tahunlulusS').val(),true,null);
                    titlex='<span class="icon-plus-2"></span> Tambah ';
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
        $('#tingkatTB').val('');
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
    // -- created by epiii -- //
    // ---------------------- //