// var mnu       = 'periode';
var mnu       = 'proses';
var mnu2      = 'departemen';
var mnu3      = 'angkatan';
var dir       ='models/m_'+mnu+'.php';
var dir2      ='../akademik/models/m_'+mnu2+'.php';
var dir3      ='../akademik/models/m_'+mnu3+'.php';
var contentFR='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input  id="idformH" type="hidden">'

                        +'<label>Departemen</label>'
                        +'<div class="input-control text size4">'
                            +'<input  type="hidden" name="departemenH" id="departemenH" >'
                            +'<input disabled="disabled" name="departemenTB" id="departemenTB" xclass="span2">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Nama Periode</label>' 
                        +'<div class="input-control text">'
                            +'<input required type="text" name="periodeTB" id="periodeTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Angkatan</label>' 
                        +'<div class="input-control select size2">'
                            +'<select id="angkatanTB" name="angkatanTB">'
                              +'</select>'
                        +'</div>'
                        +'<label>Kode Awalan</label>'
                        +'<div class="input-control text size2">'
                            +'<input required type="text" name="kode_awalanTB" id="kode_awalanTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Aktif</label>' 
                        +'<div class="input-control select size2">'
                            +'<select id="aktifTB" name="aktifTB">'
                            +'<option value="0">Ditutup</option>'
                            +'<option value="1">Dibuka</option>'
                              +'</select>'
                        +'</div>'
                        +'<label>Kapasitas</label>' 
                        +'<div class="input-control text size1">'
                            +'<input required type="text" name="kapasitasTB" id="kapasitasTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Keterangan</label>'
                        +'<div class="input-control text">'
                            +'<input type="text" name="keteranganTB" id="keteranganTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        //combo departemen
        cmbdepartemen();

        //load table
        // viewTB();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
            cmbangkatan($('#departemenS').val(),'');
        });

        // search
        $('#periodeS').on('keyup',viewTB);
        $('#keteranganS').on('keyup',viewTB);

        //search action
        $('#periodeS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB($('#departemenS').val());
        });$('#keteranganS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB($('#departemenS').val());
        });$('#departemenS').on('change',function(){
            viewTB($(this).val());
        })

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#periodeS').val('');
            $('#keteranganS').val('');
        });

    }); 
// end of main function ---

// combo departemen ---
    function cmbdepartemen(){
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
                    //panggil fungsi viewTB() ==> tampilkan tabel 
                    viewTB(dt.departemen[0].replid); 
                    // $('#departemenTB').val('ok');
                }$('#departemenS').html(out);
            }
        });
    }
//end of combo departemen ---

        function cmbangkatan (dep,angkatan) {
            // alert(1);return false;
            $.ajax({
                url:dir3,   
                type:'post',
                dataType:'json',
                data:'aksi=cmb'+mnu3+'&departemen='+dep,
                success:function(dt){
                    var opt='';
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                        opt+='<option value="">'+dt.status+'</option>'
                    }else{
                        // alert(id);return false;
                        var opt = '';
                        $.each(dt.angkatan,function(id,item){
                            if(angkatan==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.angkatan+'</option>'
                            else{
                                if (item.urutan=='3') 
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.angkatan+'</option>'
                            else 
                                opt+='<option value="'+item.replid+'">'+item.angkatan+'</option>'
                            }
                        });$('#angkatanTB').html('<option value="">Pilih Angkatan ..</option>'+opt);
                    }
                },
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
    function viewTB(dep){
        var aksi ='aksi=tampil';
        var cari = '&departemenS='+dep

                    // +'&periodeS='+$('#periodeS').val()
                    // +'&kode_awalanS='+$('#kode_awalanS').val()
                    // +'&keteranganS='+$('#keteranganS').val();

                    // +'&periodeS='+$('#periodeS').val()
                    // +'&kode_awalanS='+$('#kode_awalanS').val();
                    // +'&keteranganS='+$('#keteranganS').val();
                    // +'&kode_awalanS='+$('#kode_awalanS').val()
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="9"><img src="../img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                    // $('#tbody').delay(4000).fadeIn().html(data);
                },1000);
            }
        });
    }
// end of view table ---

// form ---
//     function viewFR(id){
//         $.Dialog({
//             shadow: true,
//             overlay: true,
//             draggable: true,
//             width: 500,
//             padding: 10,
//             onShow: function(){
//                 var titlex;
//                 if(id==''){  //add mode
//                     titlex='<span class="icon-plus-2"></span> Tambah ';
//                     $.ajax({
//                         url:dir2,
//                         data:'aksi=cmbdepartemen&replid='+$('#departemenS').val(),
//                         type:'post',
//                         dataType:'json',
//                         success:function(dt){
//                             $('#departemenH').val($('#departemenS').val());
//                             $('#departemenTB').val(dt.departemen[0].nama);
//                         }
//                     });

//                 }else{ // edit mode
//                     titlex='<span class="icon-pencil"></span> Ubah';
//                     $.ajax({
//                         url:dir,
//                         data:'aksi=ambiledit&replid='+id,
//                         type:'post',
//                         dataType:'json',
//                         success:function(dt){
//                             $('#idformH').val(id);
//                             $('#departemenH').val($('#departemenS').val());
//                             // cmbdepartemen()
//                             // $('#departemenTB').val(dt.departemen);
//                             $('#departemenTB').val(dt.nama);
//                             $('#periodeTB').val(dt.proses);
//                             $('#kode_awalanTB').val(dt.kodeawalan);
//                             $('#angkatanTB').val(dt.angkatan);
//                             $('#kapasitasTB').val(dt.kapasitas);                            
//                             $('#keteranganTB').val(dt.keterangan);
//                         }
//                     });
//                 }$.Dialog.title(titlex+" Periode Penerimaan");
//                 $.Dialog.content(contentFR);
//             }
//         });
//     }
// // end of form ---

// form ---
    function viewFR(id){
        // alert(id); return false;
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                // form :: departemen (disabled field) -----------------------------
                    $.ajax({
                        url:dir2,
                        data:'aksi=cmb'+mnu2+'&replid='+$('#departemenS').val(),
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#departemenH').val($('#departemenS').val());
                            $('#tahunajaranH').val($('#tahunajaranS').val());
                            var out;
                            if(dt.status!='sukses'){
                                out=dt.status;
                            }else{
                                out=dt.departemen[0].nama;
                            }$('#departemenTB').val(out);
                         
                                    if (id!='') { // edit mode
                                    // form :: edit :: tampilkan data 
                                        titlex='<span class="icon-pencil"></span> Ubah ';
                                        $.ajax({
                                            url:dir,
                                            data:'aksi=ambiledit&replid='+id,
                                            type:'post',
                                            dataType:'json',
                                            success:function(dt){
                                            $('#idformH').val(id);
                                            $('#departemenH').val($('#departemenS').val());
                                            if(dt.angkatan==$('#angkatanTB').val())
                                                $('angkatanTB').attr('selected',true);
                                            // cmbdepartemen()
                                            // $('#departemenTB').val(dt.departemen);
                                            $('#departemenTB').val(dt.nama);
                                            $('#periodeTB').val(dt.proses);
                                            $('#kode_awalanTB').val(dt.kodeawalan);
                                            $('#aktifTB').val(dt.aktif);
                                            $('#kapasitasTB').val(dt.kapasitas);                            
                                            $('#keteranganTB').val(dt.keterangan);
                                            cmbangkatan(dt.iddepartemen,dt.angkatan);
                                            }
                                        });
                                    // end of form :: edit :: tampilkan data 
                                        // titlex='<span class="icon-pencil"></span> Ubah ';
                                    }
                                    else{ //add mode
                                        titlex='<span class="icon-plus-2"></span> Tambah ';
                                    }
                            //     }
                            // });
                        //end of  form :: tahun ajaran (disabled field) --------------
                        }
                    });
                //end of form :: departemen (disabled field) -----------------------------
                $.Dialog.title(titlex+' '+mnu);
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

//paging ---
    function pagination(page,aksix,menux){
        var datax = 'starting='+page+'&aksi='+aksix+'&menu='+menux;
        var cari =  '&departemenS='+$('#departemenS').val()
                    // +'&periodeS='+$('#periodeS').val()
                    // +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url:dir,
            type:"post",
            data: datax+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="9"><img src="../img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
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
        $('#periodeTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---