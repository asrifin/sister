var mnu       ='aktivitas'; 
var mnu2      ='lokasi'; 
var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<label>Lokasi</label>'
                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="lokasiH" id="lokasiH" class="span2">'
                            // +'<input enabled="enabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<input disabled="disabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Tanggal Mulai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-date="2014-10-23"'
                            +'data-format="yyyy-mm-dd"'
                            +'data-effect="slide">'
                            +'<input id="tanggal1TB" name="tanggal1TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                        +'<label>Tanggal Mulai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-date="2014-10-23"'
                            +'data-format="yyyy-mm-dd"'
                            +'data-effect="slide">'
                            +'<input id="tanggal2TB" name="tanggal2TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                        +'<label>Aktivitas</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="aktivitas" required type="text" name="aktivitasTB" id="aktivitasTB">'
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

        /*
        load pertama kali (pilihn salah satu) :
        cmblokasi : bila ada combo box
        viewTB : jika tanpa combo box
        */

        //combo lokasi
        cmblokasi();
        
        //load table // edit by epiii
        // viewTB();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action // edit by epiii
        $('#lokasiS').on('change',function (e){ // change : combo box
                viewTB($('#lokasiS').val());
        });
        // $('#tempatS').on('keydown',function (e){ // keydown : textbox
        //     if(e.keyCode == 13)
        //         // viewTB($('#tempatS').val());
        //         viewTB($('#lokasiS').val());
        // });
        // $('#keteranganS').on('keydown',function (e){ // keydown : textbox
        //     if(e.keyCode == 13)
        //         // viewTB($('#keteranganS').val());
        //         viewTB($('#lokasiS').val());
        // });

        // search button
        // $('#cariBC').on('click',function(){
        //     $('#cariTR').toggle('slow');
        //     // $('#lokasiS').val('');
        //     $('#tempatS').val('');
        //     $('#keteranganS').val('');
        // });
    }); 
// end of main function ---

// ghjg
// ghjg
// combo departemen ---
    // function cmblokasi(lok){ edited by epiii
    function cmblokasi(){
        $.ajax({
            url:dir2,
            data:'aksi=cmblokasi',
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.lokasi, function(id,item){
                        out+='<option value="'+item.replid+'">['+item.kode+'] '+item.nama+'</option>';
                    });
                    //panggil fungsi viewTB() ==> tampilkan tabel 
                    viewTB(dt.lokasi[0].replid); 
                }$('#lokasiS').html(out);
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
                    viewTB($('#'+mnu2+'S').val()); //value : combo box LOKASI 
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    // function viewTB(nama){          
    function viewTB(lok){ //edit by epiii 
        var aksi ='aksi=tampil';
        var cari ='&lokasiS='+lok
                    +'&aktivitasS='+$('#aktivitasS').val()
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
                        data:'aksi=cmblokasi&replid='+$('#lokasiS').val(),
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#lokasiTB').val(dt.lokasi[0].nama);
                            $('#lokasiH').val($('#lokasiS').val());
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
                            $('#lokasiH').val($('#lokasiS').val()); // edit by epii
                            $('#lokasiTB').val(dt.lokasi);
                            $('#tanggal1TB').val(dt.tanggal1);
                            $('#tanggal2TB').val(dt.tanggal2);
                            $('#aktivitasTB').val(dt.aktivitas);
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
        var cari  = '&lokasiS='+$('#lokasiS').val();
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
        $('#tanggal1TB').val('');
        $('#tanggal1TB').val('');
        $('#aktivitasTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
