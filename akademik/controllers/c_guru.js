var mnu       = 'guru';
var mnu2      = 'departemen';
var mnu3      = 'tahunajaran';
var mnu4      = 'pelajaran';
var dir       = 'models/m_'+mnu+'.php';
var dir2      = 'models/m_'+mnu2+'.php';
var dir3      = 'models/m_'+mnu3+'.php';
var dir4      = 'models/m_'+mnu4+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
       contentDetail+=''
                +'<div style="overflow:scroll;height:500px;"  class="">'
                    //keterangan peminjaman 
                    +'<legend>Data Peminjaman</legend>'
                    +'<table>'
                        +'<tr>'
                            +'<td><b>Peminjam</b></td>'
                            +'<td id="peminjamTD"></td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td><b>Tanggal Pinjam</b></td>'
                            +'<td id="tanggal_pinjamTD"></td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td><b>Tanggal Wajib Kembali</b></td>'
                            +'<td  id="tanggal_kembaliTD"></td>'
                            +'<td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td><b>Keterangan</b></td>'
                            +'<td  id="keteranganTD"></td>'
                            +'<td>'
                        +'</tr>'
                    +'</table>'
                    //detail barang
                    +'<legend>Detail Barang</legend>'
                    +'<table class="table hovered bordered striped">'
                        +'<thead>'
                            +'<tr style="color:white;"class="info">'
                                +'<th class="text-center">Kode</th>'
                                +'<th class="text-center">Barang</th>'
                                +'<th class="text-center">Tgl Kembali</th>'
                                +'<th class="text-center">Aksi</th>'
                            +'</tr>'
                        +'</thead>'
                        +'<tbody id="barangTBL2"></tbody>'
                    +'</table>'
                +'</div>';
        contentAdd+='<div style="overflow:scroll;height:500px;"  class="">'
                   +'<legend>Data Barang</legend>'
                        +'<div class="input-control text">'
                            +'<input placeholder="kode/nama barang" id="barangTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">Kode</th>'
                                    +'<th class="text-center">Barang</th>'
                                    +'<th class="text-center">Aksi</th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="barangTBL">'
                            +'</tbody>'
                                // +'<tr class="warning"><td colspan="3" class="text-center">Silahkan pilih barang.. </td></tr>'
                            +'<tfoot>'
                            +'</tfoot>'
                        +'</table>'

                    +'<legend>Data Peminjaman</legend>'
                    +'<form onsubmit="simpan();return false;" autocomplete="off"><input id="idformH" type="hidden">' 
                        +'<label>Lokasi</label>'
                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="lokasiH" id="lokasiH" >'
                            // +'<input enabled="enabled" name="lokasiTB" id="lokasiTB" '
                            +'<input disabled="disabled" name="lokasiTB" id="lokasiTB" >'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Peminjam</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="Nama Peminjam"  required type="text" name="peminjamTB" id="peminjamTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Tanggal Peminjaman</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            // +'data-date="2014-10-23"'
                            +'data-format="yyyy-mm-dd"'
                            +'data-effect="slide">'
                            +'<input required="required"  id="tgl_pinjamTB" name="tgl_pinjamTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        +'<label>Tanggal Pengembalian</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            // +'data-date="2014-10-23"'
                            +'data-format="yyyy-mm-dd"'
                            +'data-effect="slide">'
                            +'<input required="required" id="tgl_kembaliTB" name="tgl_kembaliTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'

                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'

                    +'</form>'
                +'</div>';

        // combo departemen
        cmbdepartemen('');
        // cmbdepartemen(false,'');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#departemenS').on('change',function(){
            cmbtahunajaran($(this).val());
        });$('#tahunajaranS').on('change',function (){
            viewTB();
        });$('#pelajaranS').on('change',function (){
            viewTB();
        });
        // $('#keteranganS').keydown(function(e){
        //     if(e.keyCode==13)
        //         viewTB();
        // });

        // search button
        // $('#cariBC').on('click',function(){
        //     $('#cariTR').toggle('slow');
        //     $('#tingkatS').val('');
        //     $('#keteraganS').val('');
        // });
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
                }cmbtahunajaran(dt.departemen[0].replid);
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
                    // viewTB(dep,dt.tahunajaran[0].replid); 
                }
                $('#tahunajaranS').html(out);
                cmbpelajaran(dt.tahunajaran[0].replid);
            }
        });
    }
//end of combo tahunajaran ---
// combo pelajaran ---
    function cmbpelajaran(thn){
        $.ajax({
            url:dir4,
            data:'aksi=cmbpelajaran&tahunajaran='+thn,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                // alert(dt.status);return false;
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.pelajaran, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+' (aktif)</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                        }
                    });
                }$('#pelajaranS').html('<option value="">---------- Semua ----------</option>'+out);
                // alert('d '+out);return false;
                viewTB();
            }
        });
    }
//end of combo pelajaran ----

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
                }
                notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari = '&tahunajaranS='+$('#tahunajaranS').val()
                    +'&departemenS='+$('#departemenS').val()
                    +'&pelajaranS='+$('#pelajaranS').val();
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
                // form :: departemen (disabled field) -----------------------------
                    $.ajax({
                        url:dir,
                        data:'aksi=cmb'+mnu4+'&replid='+$('#pelajaranS').val(),
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
                        // form :: tahun ajaran (disabled field) --------------
                            $.ajax({
                                url:dir3,
                                data:'aksi=cmbtahunajaran&departemen='+$('#departemenS').val()+'&replid='+$('#tahunajaranS').val(),
                                dataType:'json',
                                type:'post',
                                success:function(dt2){
                                    var out2;
                                    if(dt.status!='sukses'){
                                        out2=dt2.status;
                                    }else{
                                        out2=dt2.tahunajaran[0].tahunajaran;
                                    }$('#tahunajaranTB').val(out2);
                                    
                                    if (id!='') { // edit mode
                                    // form :: edit :: tampilkan data 
                                        $.ajax({
                                            url:dir,
                                            data:'aksi=ambiledit&replid='+id,
                                            type:'post',
                                            dataType:'json',
                                            success:function(dt3){
                                                $('#idformH').val(id);
                                                $('#tingkatTB').val(dt3.tingkat);
                                                $('#keteranganTB').val(dt3.keterangan);
                                            }
                                        });
                                    // end of form :: edit :: tampilkan data 
                                        titlex='<span class="icon-pencil"></span> Ubah ';
                                    }else{ //add mode
                                        titlex='<span class="icon-plus-2"></span> Tambah ';
                                    }
                                }
                            });
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
    // function pagination(page,aksix,menux){
    function pagination(page,aksix){
        var datax = 'starting='+page+'&aksi='+aksix;
        var cari = '&tahunajaranS='+$('#tahunajaranS').val()
                    +'&pelajaranS='+$('#pelajaranS').val()
                    +'&departemenS='+$('#departemenS').val();

        $.ajax({
            url:dir,
            type:"post",
            data: datax+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="7"><img src="img/w8loader.gif"></td></tr></center>');
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