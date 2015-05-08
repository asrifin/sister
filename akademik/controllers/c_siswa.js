var mnu       = 'siswa';
var mnu2      = 'departemen';
var mnu3      = 'tahunajaran';
var mnu4      = 'tingkat';
var mnu5      = 'subtingkat';
var mnu6      = 'kelas';
var mnu7      = 'angkatan';

var dir       = 'models/m_'+mnu+'.php';
var dir2      = 'models/m_'+mnu2+'.php';
var dir3      = 'models/m_'+mnu3+'.php';
var dir4      = 'models/m_'+mnu4+'.php';
var dir5      = 'models/m_'+mnu5+'.php';
var dir6      = 'models/m_'+mnu6+'.php';
var dir7      = 'models/m_'+mnu7+'.php';
var contentFR ='';

// main function ---
   $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        +'<label>Departemen</label>'
                        +'<div class="input-control text">'
                            +'<input disabled type="text" name="departemenTB" id="departemenTB">'
                        +'</div>'
                        
                        +'<label>Angkatan </label>'
                        +'<div class="input-control text">'
                            +'<input disabled type="text" name="angkatanTB" id="angkatanTB">'
                        +'</div>'
                        
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">'
                                        // +'<div class="input-control checkbox">'
                                            +'<input id="kembalikanCB" type="checkbox"><span class="check"></span>'
                                        // +'</div>'
                                    +'</th>'
                                    +'<th class="text-center">NIS</th>'
                                    +'<th class="text-center">Nama</th>'
                                    +'<th class="text-center">Aksi</th>'
                                +'</tr>'
                                +'<tr style="display:none;" id="cariTR" class="selected">'
                                    +'<th></th>'
                                    +'<th class="text-center"><input  class="belum_cari" placeholder="NIS" id="nisS" name="nisS"></th>'
                                    +'<th class="text-center"><input  class="belum_cari" placeholder="Nama" id="namaS" name="namaS"></th>'
                                    +'<th></th>'
                                +'</tr>'

                            +'</thead>'
                            +'<tbody id="belum_tbody"></tbody>'
                        +'</table>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        cmbdepartemen('filter');
        // cmbdepartemen(false,'');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#departemenS').on('change',function(){
            cmbtahunajaran($(this).val());
        });
        $('#tahunajaranS').on('change',function (){
            cmbtingkat($(this).val());
        });
        $('#tingkatS').on('change',function (){
            cmbsubtingkat($(this).val());
        });
        $('#subtingkatS').on('change',function (){
            cmbkelas($(this).val());
        });
        $('#kelasS').on('change',function (){
            viewTB('aktif');
        });
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#nisnS').val('');
            $('#namaS').val('');
            $('#keteranganS').val('');
        });
        $('#nisnS,#namaS,#keteranganS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13)
                viewTB();
        });
        // form        
        // $('#departemenTB').on('change',function(){
        //     cmbtahunlulus2('filter',$(this).val(),'');
        // });
    }); 
// end of save process ---

// combo angkatan
    function cmbangkatan(dep){
        $.ajax({
            url:dir7,
            data:'aksi=cmb'+mnu7+'&departemen='+dep,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    if(dt.angkatan.length==0){
                        out+='<option value="">kosong</option>';
                    }else{
                        $.each(dt.angkatan, function(id,item){
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                        });
                    }$('#angkatanTB').html(out);
                }viewTB('belum'); 
            }
        });
    }
// end combo angkatan

// combo departemen ---
    function cmbdepartemen(typ){
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
                    if(dt.departemen.length==0){
                        out+='<option value="">kosong</option>';
                    }else{
                        $.each(dt.departemen, function(id,item){
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                        });
                    }
                }
                if(typ=='filter'){ // filter
                    $('#departemenS').html(out);
                    cmbtahunajaran(dt.departemen[0].replid);
                }else{ // form
                    $('#departemenTB').html(dt.departemen[0].nama);
                    cmbangkatan(dt.departemen[0].replid);
                }
            }
        });
    }
//end of combo departemen ---

// combo tahunajaran ---
    function cmbtahunajaran(dep){
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
                    if(dt.tahunajaran.length==0){
                        out+='<option value="">kosong</option>';
                    }else{
                        $.each(dt.tahunajaran, function(id,item){
                            out+='<option value="'+item.replid+'">'+item.tahunajaran+(item.aktif=='1'?' (aktif)':'')+'</option>';
                            // out+='<option '+(item.aktif=='1'?'selected':'')+' value="'+item.replid+'">'+item.tahunajaran+(item.aktif=='1'?' (aktif)':'')+'</option>';
                        });
                    }$('#tahunajaranS').html(out);
                }cmbtingkat(dt.tahunajaran[0].replid);
            }
        });
    }
//end of combo tahunajaran ----

// combo tingkat ---
    function cmbtingkat(hun){
        $.ajax({
            url:dir4,
            data:'aksi=cmb'+mnu4+'&tahunajaran='+hun,
            dataType:'json',
            type:'post',
            success:function(dt){
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
                    }$('#tingkatS').html(out);
                }cmbsubtingkat(dt.tingkat[0].replid);
            }
        });
    }
//end of combo tingkat ----

// combo subtingkat ---
    function cmbsubtingkat(tkt){
        $.ajax({
            url:dir5,
            data:'aksi=cmb'+mnu5+'&tingkat='+tkt,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    if(dt.subtingkat.length==0)
                        out+='<option value="">kosong</option>';
                    else{
                        $.each(dt.subtingkat, function(id,item){
                            out+='<option value="'+item.replid+'">Kelas '+item.subtingkat+'</option>';
                        });
                    }$('#subtingkatS').html(out);
                }cmbkelas(dt.subtingkat[0].replid);
            }
        });
    }
//end of combo tingkat ----

// combo kelas ---
    function cmbkelas(stkt){
        $.ajax({
            url:dir6,
            data:'aksi=cmb'+mnu6+'&subtingkat='+stkt,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    if(dt.kelas.length==0)
                        out+='<option value="">kosong</option>';
                    else{
                        $.each(dt.kelas, function(id,item){
                            out+='<option value="'+item.replid+'">'+item.kelas+'</option>';
                        });
                    }$('#kelasS').html(out);
                }viewTB('aktif');
            }
        });
    }
//end of combo tingkat ----

//save process ---
    function simpan(){
        var data ='&aksi=simpan';
        $.each(siswaArr(),function(id,item){
            data+='&siswa[]='+item;  
        });
        if($('#idformH').val()=='' && siswaArr().length<=0){ //add mode
            $('#siswaTB').focus();
            return false;
        }else{ // jika valid siap --> simpan
            var replid = ($('#idformH').val()!='')?'&replid='+$('#idformH').val():'';
            $.ajax({
                url:dir,
                data:$('form').serialize()+data+replid,
                cache:false,
                type:'post',
                dataType:'json',
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
                    viewTB();
                }
            });
        }
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
            height: 600,
            padding: 10,
            onShow: function(){
                var titl,cont;
                if(id!=''){ //form mode : edit 
                    titl= 'Ubah '+mnu;
                    var res = ajax(dir,'aksi=ambiledit&replid='+id);
                    res.done(function(r){
                        $('#idformH').val(id);
                        // cmbdepartemen('form',$('#departemenS').val());
                        // cmbtahunajaran('form',$('#departemenS').val(),r.tahunajaran);
                        // cmbtingkat('form',$('#tahunajaranS').val(),r.tingkat);
                        // $('#subtingkatTB').val(r.subtingkat);
                    });
                }else{ // form mode : add  
                    titl='Tambah '+mnu;
                    cmbdepartemen('form');
                    viewTB('belum');
                    // cmbtahunajaran('form',$('#departemenS').val(),$('#tahunajaranS').val());
                    // cmbtingkat('form',$('#tahunajaranS').val(),$('#tingkatS').val());
                }$.Dialog.title(titl);
                $.Dialog.content(contentFR);
                // $('#tingkatH').val($('#tingkatS').val());
            }
        });
    }
// end of dialog form ---


// // pilih barang yg akan dipinjam ---
    function siswaAdd (id,nisn,nama) {
        //         $('#siswaTBL').html('<tr><td>gjkasfdlkjsadklfjslkdj</td></tr>')
        // return false;
        // alert(9999);return false;
        var tr ='<tr val="'+id+'" class="siswaTR" id="siswaTR_'+id+'">'
                    +'<td>'+nisn+'</td>'
                    +'<td>'+nama+'</td>'
                    +'<td><button onclick="siswaDel('+id+');"><i class="icon-remove"></button></i></td>'
                +'</tr>';
        // alert(tr);return false;
        $('#siswaTBL').append(tr); 

        // alert(tr);
        // siswaArr();
        // $('#siswaTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiS').val()+'&siswa='+siswaArr() );

        // siswaExist();
    }


// end of form ---
    function siswaDel(id){
            $('#siswaTR_'+id).fadeOut('slow',function(){
                $('#siswaTR_'+id).remove();
                // barangExist();
            });
        }

    function siswaExist(){
        // var jumImg = $('.imgTR:visible','#imgTB').length; //hitung jumlah gambar bkeg bukeg  dalam form 
        alert('jumlah tr: '+$('#siswaTBL','.siswaTR').length);return false;
        var tr ='<tr class="warning"><td colspan="3" class="text-center">pilih siswa ..</td></tr>';
        if($('#siswaTBL').html()=='')
            $('#siswaTBL').html(tr);
        else
            $('#siswaTBL').html('');
    }
//end of barang record kosong --


//himpun array siswa terpilih
    function siswaArr(){
        var y=[];
        $('.siswaTR').each(function(id,item){
            y.push($(this).attr('val'));
        });return y;
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
    // -- created by rovi -- //
    // ---------------------- //