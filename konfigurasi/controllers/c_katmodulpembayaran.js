var mnu  ='katmodulpembayaran'; 
var dir  ='models/m_'+mnu+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 

                        +'<label>Kategori</label>'
                        +'<div>'
                            +'<div class="input-control size3 text" >'
                                +'<input  placeholder="kategori" name="namaTB" id="namaTB" type="text">'
                            +'</div>'
                        +'</div>'    

                        +'<label>siswa</label>'
                        +'<div>'
                            +'<div class="input-control size2 select" >'
                                +'<select name="siswaTB" id="siswaTB">'
                                    +'<option value="aktif">Siswa Aktif</option>'
                                    +'<option value="calon">Calon Siswa</option>'
                                +'</select>'
                            +'</div>'
                        +'</div>'        

                        +'<label>Sumbangan</label>'
                        +'<div>'
                            +'<div class="input-control size2 select" >'
                                +'<select name="sifatTB" id="sifatTB">'
                                    +'<option value="wajib">wajib</option>'
                                    +'<option value="sukarela">sukarela</option>'
                                +'</select>'
                            +'</div>'
                        +'</div>'                        

                        +'<label>Ketarangan</label>'
                        +'<div>'
                            +'<div class="input-control textarea" >'
                                +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                            +'</div>'
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

        //cari ----
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#namaS').val('');
            $('#keteranganS').val('');
        });

        //search action // edit by epiii
        $('#namaS,#siswaS,#keteranganS,#sifatS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13)
                viewTB();
        });
       
    }); 
// end of main function ---

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
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                    viewTB();
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(){ 
        var aksi ='aksi=tampil';
        var cari ='&namaS='+$('#namaS').val()
                +'&siswaS='+$('#siswaS').val()
                +'&sifatS='+$('#sifatS').val()
                +'&keteranganS='+$('#keteranganS').val();

        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },500);
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
                var titlex='<span class="icon-pencil"></span> Ubah';
                $.ajax({
                    url:dir,
                    data:'aksi=ambiledit&replid='+id,
                    type:'post',
                    dataType:'json',
                    success:function(dt){
                        $('#idformH').val(id);
                        $('#namaTB').val(dt.nama);
                        $('#keteranganTB').val(dt.keterangan);
                        $('#siswaTB').val(dt.siswa);
                        $('#sifatTB').val(dt.sifat);
                    }
                });
                $.Dialog.title(titlex+' '+mnu); // edit by epiii
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
                }notif(cont,clr);
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
        $('#namaTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
