var mnu  ='detilrekening'; 
var dir  ='models/m_'+mnu+'.php';
var mnu2 ='kategorirekening'; 
var dir2 ='models/m_'+mnu2+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                            +'<div class="row">'
                                +'<div class="span5">'
                                    +'<label>Kategori Rekening</label>'
                                    +'<div class="input-control select">'
                                    +'<select required name="kategorirekeningTB" id="kategorirekeningTB"><option value="">Pilih Kategori Rekening</option></select>'
                                    +'</div>'
                                +'</div>'
                            +'</div>'

                        +'<label>Kode</label>'
                        +'<div>'
                            +'<div class="input-control size2 text" >'
                                +'<input min="1" max="999999"  required maxlength="6" placeholder="Kode Rekening" name="kodeTB" id="kodeTB" type="number">'
                            +'</div>'
                        +'</div>'                        

                        +'<label>Rekening</label>'
                        +'<div>'
                            +'<div class="input-control size3 text" >'
                                +'<input required placeholder="Rekening" name="namaTB" id="namaTB" type="text">'
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

        cmbkategorirekening('filter','');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //cari ----
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#kodeS').val('');
            $('#namaS').val('');
            $('#keteranganS').val('');
        });
        //search action // edit by epiii
        $('#kategorirekeningS').on('change',function (e){ // change : combo box
            viewTB();
        });
        $('#kodeS,#namaS,#keteranganS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13)
                viewTB();
        });
       
    }); 
// end of main function ---

// combo departemen ---
    function cmbkategorirekening(typ,idkat){
        $.ajax({
            url:dir2,
            data:'aksi=cmb'+mnu2,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.kategorirekening, function(id,item){
                        if(idkat==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">['+item.kode+'] '+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'">['+item.kode+'] '+item.nama+'</option>';
                    });
                    if(typ=='filter'){
                        $('#kategorirekeningS').html('<option value="">--Semua Kategori Rekening--</option>'+out);
                        viewTB(dt.kategorirekening[0].replid); 
                    }else{
                        $('#kategorirekeningTB').html(out);
                    }
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
        var cari ='&kategorirekeningS='+$('#kategorirekeningS').val()
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
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    cmbkategorirekening('form','');
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
                            $('#keteranganTB').val(dt.keterangan);
                            cmbkategorirekening('form',dt.kategorirekening);
                        }
                    });
                }$.Dialog.title(titlex+' '+mnu); // edit by epiii
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

    // function pagination(page,aksix,menux){ 
    //     var datax = 'starting='+page+'&aksi='+aksix+'&menu='+menux;
    //     var cari  = '&kategoriS='+$('#kategoriS').val();
    //                 // +'&tempatS='+$('#tempatS').val()
    //                 // +'&keteranganS='+$('#keteranganS').val();
    //     $.ajax({
    //         url:dir,
    //         type:"post",
    //         data: datax+cari,
    //         beforeSend:function(){
    //             $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
    //         },success:function(dt){
    //             setTimeout(function(){
    //                 $('#tbody').html(dt).fadeIn();
    //             },1000);
    //         }
    //     });
    // }   
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
