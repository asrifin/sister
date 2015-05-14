var mnu  = 'kategorirekening';
var dir  = 'models/m_'+mnu+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 

                        +'<label>Kode </label>'
                        +'<div class="input-control text">'
                            +'<input type="number" placeholder="kode kategori rekening" required name="kodeTB" id="kodeTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Kategori Rekening </label>'
                        +'<div class="input-control text">'
                            +'<input  placeholder="kategori rekening" required name="namaTB" id="namaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Jenis Normal</label>'
                        +'<div class="input-control select">'
                            +'<select required name="jenisTB" id="jenisTB">'
                                +'<option value="d">DEBIT</option>'
                                +'<option value="k">KREDIT</option>'
                            +'</select>'
                        +'</div>'

                        +'<label>Penambahan </label>'
                        +'<div class="input-control select">'
                            +'<select required name="jenistambahTB" id="jenistambahTB">'
                                +'<option value="d">DEBIT</option>'
                                +'<option value="k">KREDIT</option>'
                            +'</select>'
                        +'</div>'

                        +'<label>Pengurangan </label>'
                        +'<div class="input-control select">'
                            +'<select required name="jeniskurangTB" id="jeniskurangTB">'
                                +'<option value="d">DEBIT</option>'
                                +'<option value="k">KREDIT</option>'
                            +'</select>'
                        +'</div>'

                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';
        viewTB();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#kodeS,#namaS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#tahunbukuS').val('');
        });
    }); 
// end of save process ---

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
        if($('#idformH').val()!='') urlx += '&replid='+$('#idformH').val();

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
        var cari ='&namaS='+$('#namaS').val()
                +'&keteranganS='+$('#keteranganS').val()
                +'&kodeS='+$('#kodeS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="7"><img src="../img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                // setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                // },1000);
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
                if(id==''){  //add mode
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            $('#kodeTB').val(dt.kode);
                            $('#namaTB').val(dt.nama);
                            $('#jenisTB').val(dt.jenis);
                        }
                    });
                }$.Dialog.title(titlex+' '+mnu);
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

//paging ---
    function pagination(page,aksix,menux){
        var datax= 'starting='+page+'&aksi='+aksix+'&menu='+menux;
        var cari ='&kodeS='+$('#kodeS').val()
                 +'&keteranganS='+$('#keteranganS').val()
                 +'&namaS='+$('#namaS').val();
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
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                    viewTB();
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
        $('#tahunbukuTB').val('');
        $('#tglmulaiTB').val('');
        $('#saldoTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

//aktifkan process ---
    function aktifkan(id){
    	var th  = $('#'+mnu+'TD_'+id).html();
        if(confirm(' mengaktifkan "'+th+'"" ?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=aktifkan&replid='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Mengaktifkan '+th+' ..';
                    clr  ='red';
                }else{
                    // viewTB($('#departemenS').val());
                    cont = '..Berhasil Mengaktifkan '+th+' ..';
                    clr  ='green';
                    viewTB();
                }
                notif(cont,clr);
            }
        });
    }
//end of aktifkan process ---
