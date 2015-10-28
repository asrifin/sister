var mnu       ='anggota';
var mnu2      = 'departemen';
var mnu3      = 'tahunajaran';
var mnu4      = 'tingkatbuku';
var mnu5      = 'kelas';
var dir       ='models/m_'+mnu+'.php';
var dir2      = '../akademik/models/m_'+mnu2+'.php';
var dir3      = '../akademik/models/m_'+mnu3+'.php';
var dir4      = 'models/m_'+mnu4+'.php';
var dir5      = '../akademik/models/m_'+mnu5+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="luarFR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<label>ID Member</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="idmember" required type="text" name="idmemberTB" id="idmemberTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Nama</label>'
                        +'<div class="input-control text">'
                            +'<input  placeholder="Tingkat Buku" required type="text" name="namaTB" id="namaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Kontak</label>'
                        +'<div class="input-control text">'
                            +'<input  placeholder="Kontak" required type="text" name="kontakTB" id="kontakTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Alamat</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="alamat" name="alamatTB" id="alamatTB"></textarea>'
                        +'</div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        //combo departemen
        cmbdepartemen();
        
        //load table Siswa
        viewTB('siswa');
        viewTB('pegawai');
        viewTB('luar');
        // vwSiswa();

        $("#pegawai").on('click', function(){
            viewTB('pegawai');
            // vwPegawai();
        });
        $("#luar").on('click', function(){
            viewTB('luar');
            // vwLuar();
        });

        //add form
        $("#tambahBC").on('click', function(){
            luarFR('');
        });

        //search action
        $('#nisS').keydown(function (e){
            if(e.keyCode == 13)
            viewTB('siswa');
             // vwSiswa();
        });$('#namaS').keydown(function (e){
            if(e.keyCode == 13)
            viewTB('siswa');
             // vwSiswa();
        });$('#nipS').keydown(function (e){
            if(e.keyCode == 13)
            viewTB('pegawai');
         // vwPegawai();
        });
        // $('#pegawaiS').keydown(function (e){
        //     if(e.keyCode == 13)
                // viewTB('pegawai');
        //      vwPegawai();
        // });$('#idmemberS').keydown(function (e){
        //     if(e.keyCode == 13)
                // viewTB('pegawai');
        // });
        // $('#nama_luarS').keydown(function (e){
        //     if(e.keyCode == 13)
                // viewTB('pegawai');
        // });
                //search action
        $('#lokasiS').on('change',function(){
            cmbtahunajaran($(this).val());
        });$('#tahunajaranS').on('change',function (){
            cmbtingkatbuku($(this).val());
        });$('#tingkatS').on('change',function (){
            cmbkelas($(this).val());
        });$('#kelasS').on('change',function (){
                viewTB('siswa');
            // vwSiswa(); 
        });

        // search button
        $('#siswaBC').on('click',function(){
            $('#siswaTR').toggle('slow');
            $('#nisS').val('');
            $('#namaS').val('');
        });
        // search pegawai
        $('#pegawaiBC').on('click',function(){
            $('#pegawaiTR').toggle('slow');
            $('#nipS').val('');
            $('#pegawaiS').val('');
        });
        // search button
        $('#luarBC').on('click',function(){
            $('#luarTR').toggle('slow');
            $('#idmemberS').val('');
            $('#nama_luarS').val('');
        });
    }); 
// end of main function ---

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
                }
                $('#lokasiS').html(out);
                cmbtahunajaran(dt.departemen[0].replid);
            }
        });
    }
//end of combo departemen ---

// combo tahunajaran ---
    function cmbtahunajaran(dep){
        $.ajax({
            url:dir3,
            data:'aksi=cmbtahunajaran&departemen='+dep,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.tahunajaran, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.tahunajaran+' (aktif)</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.tahunajaran+'</option>';
                        }
                    });
                }$('#tahunajaranS').html(out);
                cmbtingkatbuku(dt.tahunajaran[0].replid);
            }
        });
    }
//end of combo tahunajaran ---

function cmbtingkatbuku(tgt){
        $.ajax({
            url:dir4,
            data:'aksi=cmbtingkatbuku&tahunajaran='+tgt,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                // alert(dt.status);return false;
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.tingkatbuku, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama       +' (aktif)</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                        }
                    });
                }$('#tingkatbukuS').html(out);
                cmbkelas(dt.tingkatbuku[0].replid);
                // vwSiswa(); 
 
            }
        });
    }

function cmbkelas(kls){
        $.ajax({
            url:dir5,
            data:'aksi=cmbkelas&tingkatbuku='+kls,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                // alert(dt.status);return false;
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.kelas, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.kelas+'</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.kelas+'</option>';
                        }
                    });
                }$('#kelasS').html(out);
                // cmbtingkatbuku(dt.tingkatbuku[0].replid);
                // vwSiswa(); 
 
            }
        });
    }
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
                    // kosongkan();
                    viewTB($('').val());
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
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
                $(el2).html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }

    // function vwSiswa(){
    //     var aksi ='aksi=tampil&subaksi=siswa';
    //     var cari = '&nisS='+$('#nisS').val()
    //                 +'&namaS='+$('#namaS').val();
    //     $.ajax({
    //         url : dir,
    //         type: 'post',
    //         // data: aksi,
    //         data: aksi+cari, //edit by epiii
    //         beforeSend:function(){
    //             $('#siswa_tbody').html('<tr><td align="center" colspan="7"><img src="../img/w8loader.gif"></td></tr></center>');
    //         },success:function(dt){
    //             setTimeout(function(){
    //                 $('#siswa_tbody').html(dt).fadeIn();
    //                 // $('#tbody').delay(4000).fadeIn().html(data);
    //             },1000);
    //         }
    //     });
    // }
// end of view table ---

// view table PEgawai ---
    // function vwPegawai(){
    //     // alert(0099999);
    //     var aksi ='aksi=tampil&subaksi=pegawai';
    //     var cari = '&nipS='+$('#nipS').val()
    //                 +'&pegawaiS='+$('#pegawaiS').val();
    //     $.ajax({
    //         url : dir,
    //         type: 'post',
    //         // data: aksi,
    //         data: aksi+cari, //edit by epiii
    //         beforeSend:function(){
    //             $('#pegawai_tbody').html('<tr><td align="center" colspan="7"><img src="../img/w8loader.gif"></td></tr></center>');
    //         },success:function(dt){
    //             setTimeout(function(){
    //                 $('#pegawai_tbody').html(dt).fadeIn();
    //                 // $('#tbody').delay(4000).fadeIn().html(data);
    //             },1000);
    //         }
    //     });
    // }
// end of view table --

// view table Member Lain ---
    // function vwLuar(kode){
    //     var aksi ='aksi=tampil&subaksi=luar';
    //     var cari = '&idmemberS='+$('#idmemberS').val()
    //                 +'&nama_luarS='+$('#nama_luarS').val();
    //     $.ajax({
    //         url : dir,
    //         type: 'post',
    //         // data: aksi,
    //         data: aksi+cari, //edit by epiii
    //         beforeSend:function(){
    //             $('#luar_tbody').html('<tr><td align="center" colspan="6"><img src="../img/w8loader.gif"></td></tr></center>');
    //         },success:function(dt){
    //             setTimeout(function(){
    //                 $('#luar_tbody').html(dt).fadeIn();
    //                 // $('#tbody').delay(4000).fadeIn().html(data);
    //             },1000);
    //         }
    //     });
    // }
// end of view table ---

// form ---
    function luarFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                if(id==''){  //add mode
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    $.ajax({
                        url:dir,
                        data:'aksi=replid',
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            // $('#lokasiH').val($('#lokasiS').val());
                            $('#lokasiTB').val(dt.lokasi[0].kode);
                        }
                    });

                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            // $('#lokasiH').val($('#lokasiS').val());
                            $('#idmemberTB').val(dt.nid);
                            $('#namaTB').val(dt.nama);
                            $('#kontakTB').val(dt.kontak);
                            $('#alamatTB').val(dt.alamat);
                        }
                    });
                }$.Dialog.title(titlex+' '+mnu);
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
                    viewTB($('').val());
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
    // function kosongkan(){
    //     $('#idformTB').val('');
    //     $('#kodeTB').val('');
    //     $('#namaTB').val('');
    //     $('#keteranganTB').val('');
    // }
//end of reset form ---