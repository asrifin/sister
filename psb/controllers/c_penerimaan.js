var mnu  = 'penerimaan';
var mnu2 = 'departemen';
var mnu3 = 'proses';
var mnu4 = 'kelompok';
var mnu5 = 'angkatan';

var dir  = 'models/m_'+mnu+'.php';
var dir2 = '../akademik/models/m_'+mnu2+'.php';
var dir3 = 'models/m_'+mnu3+'.php';
var dir4 = 'models/m_'+mnu4+'.php';
var dir5 = '../akademik/models/m_'+mnu5+'.php';

// var contentFR_terima = contentFR_siswa = '';
var content_stat = content_det = '';

// main function ---
    $(document).ready(function(){
        // first load 
        cmbdepartemenS();

        //form terima
        content_stat += '<form autocomplete="off" onsubmit="terima(this);return false;" id="'+mnu+'FR">' 
                        +'<table>'
                            +'<tr>'
                                +'<td colspan="2">Terima calon siswa berikut ini </td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <b id="namaTD"></b></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>No. Pendaftaran</td>'
                                +'<td>: <span id="nopendaftaranTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td colspan="2">sebagai siswa aktif pada </td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Departemen</td>'
                                +'<td>: <span id="departemenTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Angkatan</td>'
                                +'<input id="idformH_angkatan" name="idformH_angkatan" type="text">' 
                                +'<td>: <span id="angkatanTD"></span></td>'
                            +'</tr>'
                        +'</table>'
                        
                        +'<input id="idformH_terima" name="idformH_terima" type="hidden">' 
                        +'<legend>Silahkan lengkapi data berikut:</legend>'
                        +'<label>No Induk</label>'
                        +'<div class="input-control text size2">'
                            +'<input required type="text" name="nisTB" id="nisTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>NISN</label>'
                        +'<div class="input-control text size3">'
                            +'<input required type="text" name="nisnTB" id="nisnTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        //form batal terima
        content_det += '<form autocomplete="off" onsubmit="tolak(this);return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH_batal" name="idformH_batal" type="hidden">' 

                        +'<label>Pembatalan penerimaan siswa ini juga menghapus data siswa aktif.</label>'
                        +'<label>Apakah anda yakin untuk membatalkan penerimaan siswa:</label>'
                        +'<table>'
                            +'<tr>'
                                +'<td>: <b id="nama_batalTD"></b></td>'
                            +'</tr>'
                        +'</table>'
                        // +'<div class="input-control text">'
                        //     +'<input disabled type="text" name="namaTB" id="namaTB">'
                        //     +'<button class="btn-clear"></button>'
                        // +'</div>'
                                                
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        //search action
        $('#departemenS').on('change',function(){
            cmbproses($(this).val());
        });
        $('#prosesS').on('change',function (){
            cmbkelompok($(this).val());
        });
        $('#kelompokS').on('change',function(){
            viewTB();
        });
        $('#no_pendaftaranS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });$('#namaS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });
        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#no_pendaftaranS').val('');
            $('#namaS').val('');
        });
    }); 
// end of save process ---

// fetch data list : department 
    function deplist(){
        return $.ajax({
            url:dir2,
            data:'aksi=cmbdepartemen',
            dataType:'json',
            type:'post'
        });
    }
// fetch data list : tahun ajaran 
    function thnlist(dep){
        return $.ajax({
            url:dir3,
            data:'aksi=cmbproses&departemen='+dep,
            dataType:'json',
            type:'post'
        });
    }
// fetch data list : kelompok 
    function kellist(thn){
        return $.ajax({
            url:dir4,
            data:'aksi=cmbkelompok&proses='+thn,
            dataType:'json',
            type:'post'
        });
    }
// combobox filtering : department
    function cmbdepartemenS(){
        deplist().done(function(res){
            var opt='';
            if(res.status!='sukses'){
                notif(res.status,'red');
            }else{
                $.each(res.departemen, function(id,item){
                    opt+='<option value="'+item.replid+'">'+item.nama+'</option>'
                });
                $('#departemenS').html(opt);
                cmbproses($('#departemenS').val());
            }
        });
    }

// combo tahunajaran ---
    // function cmbproses(dep){
    //     $.ajax({
    //         url:dir3,
    //         data:'aksi=cmbproses&departemen='+dep,
    //         dataType:'json',
    //         type:'post',
    //         success:function(dt){
    //             var out='';
    //             if(dt.status!='sukses'){
    //                 out+='<option value="">'+dt.status+'</option>';
    //             }else{
    //                 $.each(dt.proses, function(id,item){
    //                     if(item.aktif=='1'){
    //                         out+='<option selected="selected" value="'+item.replid+'">'+item.proses+' (aktif)</option>';
    //                     }else{
    //                         out+='<option value="'+item.replid+'">'+item.proses+'</option>';
    //                     }
    //                 });
    //                 // viewTB(dep,dt.proses[0].replid); 
    //             }
    //             $('#prosesS').html(out);
    //             cmbkelompok(dt.proses[0].replid);

    //             // viewTB(); 
    //         }
    //     });
    // }
//end of combo tahunajaran ---

// combobox filtering : tahun ajaran
    function cmbproses(dep){
        thnlist(dep).done(function(res){
            var opt='';
            if(res.status!='sukses'){
                notif(res.status,'red');
            }else{
                $.each(res.proses, function(id,item){
                    if(item.aktif=='1')
                        opt+='<option selected="selected" value="'+item.replid+'">'+item.proses +' (aktif)</option>';
                    else
                        opt+='<option value="'+item.replid+'">'+item.proses+'</option>';
                });$('#prosesS').html(opt);
                cmbkelompok($('#prosesS').val());
            }
        });
    }
// combobox filtering : kelompok pendaftaran
    function cmbkelompok(thn){
        kellist(thn).done(function(res){
            var opt='';
            if(res.status!='sukses'){
                notif(res.status,'red');
            }else{
                $.each(res.kelompok, function(id,item){
                    opt+='<option value="'+item.replid+'">'+item.kelompok+'</option>';
                });$('#kelompokS').html(opt);
                viewTB($('#kelompokS').val());
            }
        });
    }

// combo tahunajaran ---
    // function cmbproses(dep){
    //     $.ajax({
    //         url:dir3,
    //         data:'aksi=cmbproses&departemen='+dep,
    //         dataType:'json',
    //         type:'post',
    //         success:function(dt){
    //             var out='';
    //             if(dt.status!='sukses'){
    //                 out+='<option value="">'+dt.status+'</option>';
    //             }else{
    //                 $.each(dt.proses, function(id,item){
    //                     if(item.aktif=='1')
    //                         out+='<option selected="selected" value="'+item.replid+'">'+item.proses+' (aktif)</option>';
    //                     else
    //                         out+='<option value="'+item.replid+'">'+item.proses+'</option>';
    //                 });cmbkelompok(dt.proses[0].replid);
    //             }$('#prosesS').html(out);
    //             cmbkelompok($('#prosesS').val());
    //             viewTB(); 
    //         }
    //     });
    // }
//end of combo tahunajaran ---

// combo kelompok ---
    // function cmbkelompok(thn){
    //     $.ajax({
    //         url:dir4,
    //         data:'aksi=cmbkelompok&tahunajaran='+thn,
    //         dataType:'json',
    //         type:'post',
    //         success:function(dt){
    //             var out='';
    //             // alert(dt.status);return false;
    //             if(dt.status!='sukses'){
    //                 out+='<option value="">'+dt.status+'</option>';
    //             }else{
    //                 $.each(dt.kelompok, function(id,item){
    //                     if(item.aktif=='1'){
    //                         out+='<option selected="selected" value="'+item.replid+'">'+item.kelompok+' (aktif)</option>';
    //                     }else{
    //                         out+='<option value="'+item.replid+'">'+item.kelompok+'</option>';
    //                     }
    //                 });
    //             }$('#kelompokS').html(out);
    //             viewTB(); 
    //         }
    //     });
    // }
//end of combo tingkat ---

//save process ---
    function terima(e){
        var datax = $(e).serialize()+'&aksi=simpan&subaksi=penerimaan';
        ajax(dir,datax).done(function(res){
                    viewTB();
                    if(res.status == "gagal"){
                        clr = "red";
                    }else{
                        clr = "green"
                    }
                notif(res.status,clr);
                // alert(res.status);
        });
    }
    
//save process ---
    function tolak(e){ //Tombol Terima
        // var urlx ='&aksi=terima&subaksi=tidak_terima';
        var datax = $(e).serialize()+'&aksi=simpan&subaksi=tidak_terima';
// alert(datax); return false;
        ajax(dir,datax).done(function(res){
                    viewTB();
                    if(res.status == "gagal"){
                        clr = "red";
                    }else{
                        clr = "green"
                    }
                notif(res.status,clr);
                // alert(res.status);
        });       
    }
//end of save process ---

// view table ---
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari = '&no_pendaftaranS='+$('#no_pendaftaranS').val()
                    +'&departemenS='+$('#departemenS').val()
                    +'&prosesS='+$('#prosesS').val()
                    +'&kelompokS='+$('#kelompokS').val()
                    +'&namaS='+$('#namaS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="7"><img src="../img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---

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

//load  dialog form  ---
    function loadModal(typ,calon){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titl,cont;
                if(typ=='belum'){ //form mode : belum diterima 
                    // alert(calon);
                    cont= content_stat;
                    titl= 'Calon Siswa (belum dikonfirmasi)';
                    // url : dir,'aksi=ambiledit&subaksi=status&replid='+calon);
                    ajax(dir,'aksi=ambiledit&subaksi=status&replid='+calon).done(function(dt){

                        $('#idformH_terima').val(calon);
                        $('#idformH_angkatan').val(dt.data.idangkatan);
                        $('#namaTD').html(dt.data.nama);
                        $('#nopendaftaranTD').html(dt.data.nopendaftaran);
                        $('#departemenTD').html(dt.data.departemen);
                        $('#angkatanTD').html(dt.data.angkatan);
                    });
                    // setTimeout(function(){
                    // },200);
                }else if(typ='sudah'){ // form mode : sudah diterima
                    cont= content_det;
                    titl= 'Batalkan Penerimaan Siswa';
                    ajax(dir,'aksi=ambiledit&subaksi=batal&replid='+calon).done(function(res){
                        $('#idformH_batal').val(calon);
                        $('#nama_batalTD').html(res.nama_batal);
                    });
                }else{ // form mode : detail calon siswa

                }$.Dialog.title(titl);
                $.Dialog.content(cont);
            }
        });
    }
// end of dialog form ---

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
        $('#'+mnu+'TB').val('');
    }
//end of reset form ---

//aktifkan process ---
    function aktifkan(id){
    	var th  = $('#'+mnu+'TD_'+id).html();
    	var dep = $('#'+mnu2+'S').val();
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

