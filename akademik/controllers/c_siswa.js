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
var contentFR =  contentAdd=contentEdit='';

// main function ---
   $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<label>Angkatan</label>'
                            +'<div class="input-control select">'
                                +'<select required name="angkatanTB" id="angkatanTB"></select>'
                            +'</div>'
                        +'<label>Nama Lokasi</label>'
                        +'<div class="input-control text">'
                            +'<input  placeholder="lokasi" required type="text" name="namaTB" id="namaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Alamat</label>'
                        +'<div class="input-control text">'
                            +'<input  placeholder="alamat" required type="text" name="alamatTB" id="alamatTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Kontak</label>'
                        +'<div class="input-control text">'
                            +'<input  placeholder="kontak / no telp" required type="text" name="kontakTB" id="kontakTB">'
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

        cmbdepartemen();
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
            viewTB();
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
    function cmbangkatan(){
        $.ajax({
            url:dir7,
            data:'aksi=cmbangkatan',
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.angkatan, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                    //panggil fungsi viewTB() ==> tampilkan tabel 
                    viewTB(dt.angkatan[0].replid); 
                }$('#angkatanS').html(out);
                viewFR();
            }
        });
    }
// end combo angkatan

// combo departemen ---
    function cmbdepartemen(){
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
                    }$('#departemenS').html(out);
                }cmbtahunajaran(dt.departemen[0].replid);
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
                    if(dt.nama.length==0)
                        out+='<option value="">kosong</option>';
                    else{
                        $.each(dt.nama, function(id,item){
                            out+='<option value="'+item.replid+'">Kelas '+item.subtingkat+'</option>';
                        });
                    }$('#subtingkatS').html(out);
                }cmbkelas(dt.nama[0].replid);
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
                }viewTB();
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
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari = '&tahunajaranS='+$('#tahunajaranS').val()
                    +'&departemenS='+$('#departemenS').val()
                    +'&tingkatS='+$('#tingkatS').val()
                    +'&subtingkatS='+$('#subtingkatS').val()
                    +'&kelasS='+$('#kelasS').val()
                    +'&nisnS='+$('#nisnS').val()
                    +'&namaS='+$('#namaS').val();
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
        var pel=$('#tahunlulusS').val();
        $.Dialog({
            shadow:true,
            overlay:true,
            draggable:true,
            height:'auto',
            width:'35%',
            padding:20,
            onShow: function(){
                var titlex;
                var contentFR;
                $('#departemenH').val($('#departemenS').val());
                $('#tahunlulusH').val($('#tahunlulusS').val());
                if (id!='') { // edit mode
                    // alert('masuk edit'); return false;
                    titlex='<span class="icon-pencil"></span> Ubah ';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            // $('#departemenTB').val(dt.departemen);
                            $('#nisnTB').val(dt.nisn); 
                            $('#tahunlulusTB').val(dt.tahunlulus); 
                            $('#tahunlulusH').val(dt.idtahunlulus); 
                            $('#siswa2TB').val(dt.siswa); 
                            $('#siswaH').val(dt.siswak); 
                            $('#keteranganTB').val(dt.ket);
                            // cmbdepartemen('form',$('#departemenS').val());
                            // cmbtahunlulus2('form',dt.iddepartemen,dt.idtahunlulus);
                        }
                    });contentFR=contentEdit;
                }else{ //add mode
                   titlex='<span class="icon-plus-2"></span> Tambah ';
                    $.ajax({
                        url:dir2,
                        data:'aksi=cmbdepartemen',
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            cmbdepartemen('form',$('#departemenS').val());
                            cmbtahunlulus2('form',$('#tahunlulusS').val());
                        }
                    });
                    contentFR=contentAdd;
                }
                $.Dialog.title(titlex+' '+mnu);
                $.Dialog.content(contentFR);

                $("#siswaTB").combogrid({
                    debug:true,
                    width:'400px',
                    colModel: [{
                            'align':'left',
                            'columnName':'nisn',
                            'hide':true,
                            'width':'55',
                            'label':'NISN'
                        },{   
                            'columnName':'nama',
                            'width':'40',
                            'label':'NAMA'
                        }],
                    // url: dir+'?aksi=autocomp',
                    url: dir+'?aksi=autocomp&tahunlulus='+pel,
                    select: function( event, ui ) { // event setelah data terpilih 
                        // $('#gruruH').val(ui.item.replid);
                        
                        siswaAdd(ui.item.replid,ui.item.nisn,ui.item.nama);
                        // alert(ui.item.replid);
                        
                        // $('#barangTB').combogrid( "option", "url", dir+'?aksi=autocomp&tahunlulus='+pel+'&siswa='+siswaArr() );
                        // $(this).combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiTB').val() );
                            // $('#siswaTB').combogrid( "option", "url", dir+'?aksi=autocomp');
                        return false;
                    }
                    
                });

            }
        });
}
// pilih barang yg akan dipinjam ---
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