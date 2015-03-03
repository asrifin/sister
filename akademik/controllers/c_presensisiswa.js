var mnu  = 'presensisiswa';
var mnu2 = 'departemen';
var mnu3 = 'tahunajaran';
var mnu4 = 'tingkat';
var mnu5 = 'kelas';

var dir  = 'models/m_'+mnu+'.php';
var dir2 = 'models/m_'+mnu2+'.php';
var dir3 = 'models/m_'+mnu3+'.php';
var dir4 = 'models/m_'+mnu4+'.php';
var dir5 = 'models/m_'+mnu5+'.php';

// var contentFR_terima = contentFR_siswa = '';
var content_stat = content_det = '';

// main function ---
    $(document).ready(function(){
        // first load 
        cmbdepartemenS();

        //form terima
        content_stat += '<form autocomplete="off" onsubmit="simpan(this);return false;" id="'+mnu+'FR">' 
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
                                +'<td>: <span id="angkatanTD"></span></td>'
                            +'</tr>'
                        +'</table>'
                        
                        +'<input id="idformH" type="hidden">' 
                        +'<legend>Silahkan lengkapi data berikut:</legend>'
                        +'<label>No Induk</label>'
                        +'<div class="input-control text size2">'
                            +'<input required type="text" name="no_indukTB" id="no_indukTB">'
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
        content_det += '<form autocomplete="off" onsubmit="terima();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH_terima" type="hidden">' 

                        +'<label>Pembatalan penerimaan siswa ini juga menghapus data siswa aktif.</label>'
                        +'<label>Apakah anda yakin untuk membatalkan penerimaan siswa:</label>'
                        +'<div class="input-control text">'
                            +'<input disabled type="text" name="namaTB" id="namaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                                                
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        //search action
        $('#departemenS').on('change',function(){
            cmbtahunajaranS($(this).val());
        });
        $('#tahunajaranS').on('change',function (){
            cmbtingkatS($(this).val());
        });
        $('#tingkatS').on('change',function (){
            cmbkelasS($(this).val());
        });
        $('#kelasS').on('change',function(){
            viewTB();
        });
        $('#tahunS').on('change',function(){
            cmbbln($('#tahunajaranS').val(),$('#tahunS').val());
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
            data:'aksi=cmbtahunajaran&departemen='+dep,
            dataType:'json',
            type:'post'
        });
    }// fetch data list : tahun ajaran 
    function tingklist(thn){
        return $.ajax({
            url:dir4,
            data:'aksi=cmbtingkat&tahunajaran='+thn,
            dataType:'json',
            type:'post'
        });
    }
// fetch data list : kelas
    function klslist(ting){
        return $.ajax({
            url:dir5,
            data:'aksi=cmbkelas&tingkat='+ting,
            dataType:'json',
            type:'post'
        });
    }
// fetch data list : bulan & tahun 
    function tabulist(thn){
        return $.ajax({
            url:dir3,
            data:'aksi=cmbtahunajaran&replid='+thn,
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
                cmbtahunajaranS($('#departemenS').val());
            }
        });
    }
// combobox filtering : tahun ajaran
    function cmbtahunajaranS(dep){
        thnlist(dep).done(function(res){
            var opt='';
            if(res.status!='sukses'){
                notif(res.status,'red');
            }else{
                $.each(res.tahunajaran, function(id,item){
                    if(item.aktif=='1'){
                        opt+='<option selected="selected" value="'+item.replid+'">'+item.tahunajaran +' (aktif)</option>';
                    }else{
                        opt+='<option value="'+item.replid+'">'+item.tahunajaran+'</option>';
                    }
                });$('#tahunajaranS').html(opt);
                cmbtingkatS($('#tahunajaranS').val());
                cmbthn($('#tahunajaranS').val());
            }
        });
    }
// combobox filtering : kelompok pendaftaran
    function cmbtingkatS(thn){
        tingklist(thn).done(function(res){
            var opt='';
            if(res.status!='sukses'){
                notif(res.status,'red');
            }else{
                $.each(res.tingkat, function(id,item){
                    opt+='<option value="'+item.replid+'">'+item.tingkat+'</option>';
                });$('#tingkatS').html(opt);
                cmbkelasS($('#tingkatS').val());
            }
        });
    }
// combobox filtering : kelas
    function cmbkelasS(ting){
        klslist(ting).done(function(res){
            var opt='';
            if(res.status!='sukses'){
                notif(res.status,'red');
            }else{
                $.each(res.kelas, function(id,item){
                    opt+='<option value="'+item.replid+'">'+item.kelas+'</option>';
                });$('#kelasS').html(opt);
                // viewTB($('#kelasS').val());
            }
        });
    }    

    function cmbthn(thn){
        tabulist(thn).done(function(res){
            if(res.status!='sukses'){
                notif(res.status,'red');
            }else{
                th1 = parseInt(res.tahunajaran[0].tglmulai.substr(0,4));
                th2 = parseInt(res.tahunajaran[0].tglakhir.substr(0,4));
                opt='<option value="'+th1+'">'+th1+'</option>'
                    +'<option value="'+th2+'">'+th2+'</option>';
                $('#tahunS').html(opt);
                cmbbln(thn,$('#tahunS').val());
            }
        });
    }

    function cmbbln(t,thn){
        tabulist(t).done(function(res){
            var opt='';
            // console.log(res);return false;
            if(res.status!='sukses'){
                notif(res.status,'red');
            }else{
                var arr=new Array();
                    arr=res.tahunajaran[0];
                b1 =parseInt(arr.tglmulai.substr(5,2));
                b2 =parseInt(arr.tglakhir.substr(5,2));
                t1 =parseInt(arr.tglmulai.substr(0,4));
                var bln =['Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'];
                $.each(bln, function(id,item){
                    disx='';
                    if(thn==t1){ // tahun awal
                        if((id+1)<b1) disx = 'disabled';
                    }else{ //tahun akhir
                        if((id+1)>b2) disx = 'disabled'; // 
                    }opt+='<option '+disx+' value="'+id+'">'+item+'</option>';
                });$('#bulanS').html(opt);
                viewTB($('#bulanS').val());
            }
        });
    }
    
    // function cmbbln(x){
    //     // console.log(x);
    //     $.each(x,function(id,item){
    //         alert(item.b1);
    //     });
    //     console.log(x[0].tglmulai);
    //     var bln =['Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'];
    //     var opt ='';
        
    //     $.each(bln, function(id,item){
    //         opt+='<option  value="'+id+'">'+item+'</option>';
    //     });$('#bulanS').html(opt);
    // }
// combo tahunajaran ---
    // function cmbtahunajaran(dep){
    //     $.ajax({
    //         url:dir3,
    //         data:'aksi=cmbtahunajaran&departemen='+dep,
    //         dataType:'json',
    //         type:'post',
    //         success:function(dt){
    //             var out='';
    //             if(dt.status!='sukses'){
    //                 out+='<option value="">'+dt.status+'</option>';
    //             }else{
    //                 $.each(dt.tahunajaran, function(id,item){
    //                     if(item.aktif=='1')
    //                         out+='<option selected="selected" value="'+item.replid+'">'+item.tahunajaran+' (aktif)</option>';
    //                     else
    //                         out+='<option value="'+item.replid+'">'+item.tahunajaran+'</option>';
    //                 });cmbkelompok(dt.tahunajaran[0].replid);
    //             }$('#tahunajaranS').html(out);
    //             viewTB(); 
    //         }
    //     });
    // }
//end of combo tahunajaran ---

// combo tingkat ---
    // function cmbtingkat(thn){
    //     $.ajax({
    //         url:dir4,
    //         data:'aksi=cmbtingkat&tahunajaran='+thn,
    //         dataType:'json',
    //         type:'post',
    //         success:function(dt){
    //             var out='';
    //             // alert(dt.status);return false;
    //             if(dt.status!='sukses'){
    //                 out+='<option value="">'+dt.status+'</option>';
    //             }else{
    //                 $.each(dt.tingkat, function(id,item){
    //                     if(item.aktif=='1'){
    //                         out+='<option selected="selected" value="'+item.replid+'">'+item.tingkat+' (aktif)</option>';
    //                     }else{
    //                         out+='<option value="'+item.replid+'">'+item.tingkat+'</option>';
    //                     }
    //                 });
    //             }$('#tingkatS').html(out);
    //             viewTB(); 
    //         }
    //     });
    // }
//end of combo tingkat ---

    // function xcmbkelas(kls){
    //     $.ajax({
    //         url:dir5,
    //         data:'aksi=cmbkelas&tingkatbuku='+kls,
    //         dataType:'json',
    //         type:'post',
    //         success:function(dt){
    //             var out='';
    //             // alert(dt.status);return false;
    //             if(dt.status!='sukses'){
    //                 out+='<option value="">'+dt.status+'</option>';
    //             }else{
    //                 $.each(dt.kelas, function(id,item){
    //                     if(item.aktif=='1'){
    //                         out+='<option selected="selected" value="'+item.replid+'">'+item.kelas+'</option>';
    //                     }else{
    //                         out+='<option value="'+item.replid+'">'+item.kelas+'</option>';
    //                     }
    //                 });
    //             }$('#kelasS').html(out);
    //             // cmbtingkatbuku(dt.tingkatbuku[0].replid);
    //             // vwSiswa(); 
 
    //         }
    //     });
    // }

//save process ---
    function simpan(e){
        var datax = $(e).serialize()+'&aksi=simpan&subaksi=penerimaan';
        ajax(dir,datax).done(function(res){
                alert(res.status);
        });
    }
    
//save process ---
    function terima(){ //Tombol Terima
        var urlx ='&aksi=terima&subaksi=tidak_terima';
        // edit mode
        if($('#idformH_terima').val()!=''){
            urlx += '&replid='+$('#idformH_terima').val();
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
                }
                notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari = '&no_pendaftaranS='+$('#no_pendaftaranS').val()
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
    function loadModal(typ,id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titl,cont;
                if(typ=='belum'){ //form mode : belum diterima 
                    cont= content_stat;
                    titl= 'Calon Siswa (belum dikonfirmasi)';
                    var res = sjax(dir,'aksi=ambiledit&subaksi=status&replid='+id);
                    setTimeout(function(){
                        $('#namaTD').html(res.data.nama);
                        $('#nopendaftaranTD').html(res.data.nopendaftaran);
                        $('#departemenTD').html(res.data.departemen);
                        $('#angkatanTD').html(res.data.angkatan);
                    },200);
                }else if(typ='sudah'){ // form mode : sudah diterima

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

/*----------------------*/
/*-  created by epiii  -*/
/*----------------------*/