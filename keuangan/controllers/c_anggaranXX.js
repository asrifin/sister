var mnu       ='anggaran'; 
var mnu2      ='tahunbuku'; 
var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php'; 
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<label>Tahunbuku</label>'

                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="tahunbukuH" id="tahunbukuH" class="span2">'
                            // +'<input enabled="enabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<input disabled="disabled" name="tahunbukuTB" id="tahunbukuTB" class="span2">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Nama</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="Nama"  class="span2" required type="text" name="namaTB" id="namaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Nominal</label>'
                        +'<div class="input-control text">'
                            +'<input  placeholder="Nominal" required type="text" name="nominalTB" id="nominalTB">'
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

        cmbtahunbuku('filter','');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action 
        $('#anggaranS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB($('#tahunbukuS').val());
        });
        $('#departemenS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                // viewTB($('#keteranganS').val());
                viewTB($('#tahunbukuS').val());
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            // $('#tahunbukuS').val('');
            $('#anggaranS').val('');
            $('#departemenS').val('');
        });
    }); 
// end of main function ---

// combo departemen ---
    function cmbdepartemen(typ,dep){
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
                    $.each(dt.departemen, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                    if(typ=='filter'){
                        $('#departemenS').html(out);
                        viewTB(); 
                    }else{
                        $('#departemenTB').html(dt.departemen[0].nama);
                    }
                }
            }
        });
    }
//end of combo tahun buku ---

// combo tahun buku ---
    function cmbtahunbuku(typ,thn){
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
                    $.each(dt.tahunbuku, function(id,item){
                        if(item.aktif==1)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+' (aktif)</option>';
                        else
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                    if(typ=='filter'){
                        $('#tahunbukuS').html(out);
                        cmbdepartemen();
                    }else{
                        $('#tahunbukuTB').html(out);
                    }
                }
            }
        });
    }
//end of combo tahun buku ---

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
                    viewTB($('#tahunbukuS').val());
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(){ 
        var aksi ='aksi=tampil';
        var cari ='&tahunbukuS='+$('#tahunbukuS').val()
                +'&namaS='+$('#namaS').val()
                +'&keteranganS='+$('#keteranganS').val()
                +'&departemenS='+$('#departemenS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
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
                        data:'aksi=cmblokasi&replid='+$('#tahunbukuS').val(),
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#tahunbukuTB').val(dt.tahunbuku[0].nama);
                            $('#tahunbukuH').val($('#tahunbukuS').val());
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
                            $('#tahunbukuH').val($('#tahunbukuS').val()); // edit by epii
                            $('#tahunbukuTB').val(dt.tahunbuku);
                            $('#namaTB').val(dt.nama);
                            $('#nominalTB').val(dt.nominal);
                            $('#keteranganTB').val(dt.keterangan);
                        }
                    });
                }$.Dialog.title(titlex+' '+mnu); 
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

//paging ---

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
                    viewTB($('#tahunbukuS').val());
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
        $('#namaTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

	function xx () {
		alert(arguments[0]); // baca argument tanpa harus tulis d fungsi
	}
