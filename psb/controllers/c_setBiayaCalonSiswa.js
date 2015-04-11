var mnu       = 'setBiayaCalonSiswa';
var mnu2      = 'departemen';
var mnu3      = 'proses';
var mnu4      = 'kelompok';

var dir       = 'models/m_'+mnu+'.php';
var dir2      = '../akademik/models/m_'+mnu2+'.php';
var dir3      = 'models/m_'+mnu3+'.php';
var dir4      = 'models/m_'+mnu4+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        // contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
        //                 +'<input id="idformH" type="hidden">' 
                        
        //                 +'<label>Departemen</label>'
        //                 +'<div class="input-control text">'
        //                     +'<input type="hidden" name="departemenH" id="departemenH">'
        //                     +'<input disabled type="text" name="departemenTB" id="departemenTB">'
        //                     +'<button class="btn-clear"></button>'
        //                 +'</div>'
                        
        //                 +'<label>Tahun Ajaran</label>'
        //                 +'<div class="input-control text">'
        //                     +'<input type="hidden" name="tahunajaranH" id="tahunajaranH">'
        //                     +'<input disabled type="text" name="tahunajaranTB" id="tahunajaranTB">'
        //                     +'<button class="btn-clear"></button>'
        //                 +'</div>'
                        
        //                 // +'<label>Tingkat</label>'
        //                 // +'<div class="input-control text">'
        //                 //     +'<input disabled placeholder="tingkat" required type="text" name="tingkatTB" id="tingkatTB">'
        //                 //     +'<button class="btn-clear"></button>'
        //                 // +'</div>'
                        
        //                 +'<label>Kapasitas</label>'
        //                 +'<div class="input-control text">'
        //                     +'<input class="span1" placeholder="kapasitas" required type="text" name="kapasitasTB" id="kapasitasTB">'
        //                     +'<button class="btn-clear"></button> siswa'
        //                 +'</div>'

        //                 +'<label>Kelas</label>'
        //                 +'<div class="input-control text">'
        //                     +'<input class="span2" placeholder="kelas" required type="text" name="kelasTB" id="kelasTB">'
        //                     +'<button class="btn-clear"></button>'
        //                 +'</div>'

        //                 +'<label>Wali Kelas</label>'
        //                 +'<div class="input-control text">'
        //                     +'<input disabled class="span2" placeholder="NIP" required name="nipTB" id="nipTB">'
        //                     +' <input class="span4" placeholder="wali kelas" required type="text" name="waliTB" id="waliTB">'
        //                     +'<button class="btn-clear"></button>'
        //                 +'</div>'

        //                 // oninvalid="this.setCustomValidity(\'isi dulu gan\');"
        //                 +'<label>Keterangan</label>'
        //                 +'<div class="input-control textarea">'
        //                     +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
        //                 +'</div>'
                        
        //                 +'<div class="form-actions">' 
        //                     +'<button class="button primary">simpan</button>&nbsp;'
        //                     +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
        //                 +'</div>'
        //             +'</form>';

        // combo departemen
        cmbdepartemenS('');
        // cmbdepartemen(false,'');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#departemenS').on('change',function(){
            cmbprosesS($(this).val());
        });$('#prosesS').on('change',function (){
            cmbkelompokS($(this).val());
        });$('#kelompokS').on('change',function (){
            viewTB();
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#kelasS').val('');
            $('#waliS').val('');
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
                cmbprosesS($('#departemenS').val());
            }
        });
    }
// combobox filtering : tahun ajaran
    function cmbprosesS(dep){
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
                cmbkelompokS($('#prosesS').val());
            }
        });
    }
// combobox filtering : kelompok pendaftaran
    function cmbkelompokS(thn){
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

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$('form').serialize()+urlx,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="7">'
                        +'<img src="../img/w8loader.gif">'
                    +'</td></tr>'
                    +'<tr><td colspan="7" align="center">'
                        +'<span style="color:white;background-color:green;">Mohon Sabar menunggu proses simpan data</span>'
                    +'</td></tr>');
            },success:function(dt){
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
        var cari =  '&departemenS='+$('#departemenS').val()
                    +'&prosesS='+$('#prosesS').val()
                    +'&kelompokS='+$('#kelompokS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="7">'
                    +'<img src="../img/w8loader.gif">'
                +'</td></tr>'
                +'<tr><td colspan="7" align="center">'
                    +'<span style="color:white;padding:5px;background-color:orange;">Memuat Data</span>'
                +'</td></tr>');
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
        // $.Dialog({
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex='';

                // form :: departemen (disabled field) -----------------------------
                    $.ajax({
                        url:dir2,
                        data:'aksi=cmb'+mnu2+'&replid='+$('#departemenS').val(),
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            titlex+='';
                            $('#departemenH').val($('#departemenS').val());
                            $('#tahunajaranH').val($('#tahunajaranS').val());
                            $('#tingkatH').val($('#tingkatS').val());
                            var out;
                            if(dt.status!='sukses'){
                                out=dt.status;
                            }else{
                                out=dt.departemen[0].nama;
                            }$('#departemenTB').val(out);
                  
                        // form :: tahun ajaran (disabled field) --------------
                            $.ajax({
                                url:dir3,
                                // data:'aksi=cmbtahunajaran&departemen='+$('#departemenS').val()+'&replid='+$('#tahunajaranS').val(),
                                data:'aksi=cmbtahunajaran&replid='+$('#tahunajaranS').val(),
                                dataType:'json',
                                type:'post',
                                success:function(dt2){
                                    // alert(titlex+' ok');
                                    var out2;
                                    if(dt.status!='sukses'){
                                        out2=dt2.status;
                                    }else{
                                        out2=dt2.tahunajaran[0].tahunajaran;
                                    }$('#tahunajaranTB').val(out2);
                                    
                                // form :: tingkat (disabled field) --------------
                                    $.ajax({
                                        url:dir4,
                                        data:'aksi=cmbtingkat&replid='+$('#tingkatS').val(),
                                        dataType:'json',
                                        type:'post',
                                        success:function(dt3){
                                            // alert(titlex+' ok');
                                            var out3;
                                            if(dt3.status!='sukses'){
                                                out3=dt3.status;
                                            }else{
                                                out3=dt3.tingkat[0].tingkat;
                                            }$('#tingkatTB').val(out3);
                                            
                                            if (id!='') { // edit mode
                                            // form :: edit :: tampilkan data 
                                                $.ajax({
                                                    url:dir,
                                                    data:'aksi=ambiledit&replid='+id,
                                                    type:'post',
                                                    dataType:'json',
                                                    success:function(dt3){
                                                        $('#idformH').val(id);
                                                        $('#kelasTB').val(dt3.kelas);
                                                        $('#kapasitasTB').val(dt3.kapasitas);
                                                        $('#waliTB').val(dt3.wali);
                                                        $('#keteranganTB').val(dt3.keterangan);
                                                    }
                                                });
                                            // end of form :: edit :: tampilkan data 
                                                // titlex='<span class="icon-pencil"></span> Ubah ';
                                                titlex+='<span class="icon-pencil"></span> Ubah ';
                                            }else{ //add mode
                                                // alert('judul ='+titlex);
                                                titlex+='<span class="icon-plus-2"></span> Tambah ';
                                                // titlex='<span class="icon-plus-2"></span> Tambah ';
                                            }
                                        }
                                    });

                                }
                            });
                            // alert(titlex);
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
    function pagination(page,aksix){
        var datax = 'starting='+page+'&aksi='+aksix;
        var cari =  '&tingkatS='+$('#tingkatS').val()
                    +'&kelasS='+$('#kelasS').val()
                    +'&waliS='+$('#waliS').val();
        $.ajax({
            url:dir,
            type:"post",
            data: datax+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="7"><img src="../img/w8loader.gif"></td></tr></center>');
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


// input uang --------------------------
    function inputuang(e) {
        $(e).maskMoney({
            precision:0,
            prefix:'Rp. ', 
            // allowNegative: true, 
            thousands:'.', 
            // decimal:',', 
            affixesStay: true
        });
    }
// end of input uang --------------------------


    // ---------------------- //
    // -- created by epiii -- //
    // ---------------------- //