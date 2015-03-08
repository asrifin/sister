var mnu       ='rekening'; 
// var mnu2      ='lokasi'; 
var dir       ='models/m_'+mnu+'.php';
// var dir2      ='models/m_'+mnu2+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                            +'<div class="row">'
                                +'<div class="span5">'
                                    +'<label>Kategori Rekening</label>'
                                    +'<div class="input-control select">'
                                    +'<select required name="kategoriTB" id="kategoriTB"><option value="">Pilih Kategori Rekening</option></select>'
                                    +'</div>'
                                +'</div>'
                            +'</div>'

                        +'<label>Kode</label>'
                        +'<div class="span3 size-2">'
                            +'<div class="input-control text" >'
                                +'<input required maxlength="9" placeholder="Kode Rekening" name="kodeTB" id="kodeTB" type="text">'
                            +'</div>'
                        +'</div>'                        

                        +'<label>Rekening</label>'
                        +'<div class="span3 size-2">'
                            +'<div class="input-control text" >'
                                +'<input required maxlength="9" placeholder="Rekening" name="rekeningTB" id="rekeningTB" type="text">'
                            +'</div>'
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

        /*
        load pertama kali (pilihn salah satu) :
        cmbkategori : bila ada combo box
        viewTB : jika tanpa combo box
        */

        cmbkategorirek('');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action // edit by epiii
        $('#kategorirekS').on('change',function (e){ // change : combo box
            viewTB($(this).val());
        });
       
    }); 
// end of main function ---

// combo departemen ---
    function cmbkategorirek(id){
        $.ajax({
            url:dir,
            data:'aksi=cmbkategorirek',
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.kategorirek, function(id,item){
                        if(id==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">['+item.kode+'] '+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'">['+item.kode+'] '+item.nama+'</option>';
                    });$('#kategorirekS').html('<option value="">--SEMUA--</option>'+out);
                    viewTB(dt.kategorirek[0].replid); 
                }
            }
        });
    }
//end of combo departemen ---

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
                    // viewTB($('#aktivitasS').val());
                    //viewTB($('#'+mnu2+'S').val()); //value : combo box LOKASI 
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    // function viewTB(nama){          
    function viewTB(){ //edit by epiii 
        var aksi ='aksi=tampil';
        var cari ='&kategorirekS='+$('#kategorirekS').val()
                +'&kodeS='+$('#kodeS').val()
                +'&namaS='+$('#namaS').val()
                +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
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
                if(id==''){  //add mode
                    // alert('halooo');
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    $.ajax({
                        url:dir2,
                        data:'aksi=cmbkategori&replid='+$('#kategoriS').val(),
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#kategoriTB').val(dt.kategori[0].nama);
                            // $('#lokasiH').val($('#kategoriS').val());
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
                            // $('#tempatH').val($('#tempatS').val());
                            // $('#lokasiH').val($('#kategoriS').val()); // edit by epii
                            $('#kategoriTB').val(dt.kategori);
                            $('#kodeTB').val(dt.kode);
                            $('#rekeningTB').val(dt.rekening);
                            // $('#aktivitasTB').val(dt.aktivitas);
                            $('#keteranganTB').val(dt.keterangan);
                        }
                    });
                }$.Dialog.title(titlex+' '+mnu); // edit by epiii
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

//paging ---
    function pagination(page,aksix,menux){ 
        var datax = 'starting='+page+'&aksi='+aksix+'&menu='+menux;
        var cari  = '&kategoriS='+$('#kategoriS').val();
                    // +'&tempatS='+$('#tempatS').val()
                    // +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url:dir,
            type:"post",
            data: datax+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
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
                    // viewTB($('#tempatS').val());
                    viewTB($('#'+mnu2+'S').val());
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
// hjkagj
//reset form ---
    function kosongkan(){
        $('#idformTB').val('');
        $('#kodeTB').val('');
        $('#rekeningTB').val('');
        // $('#aktivitasTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
