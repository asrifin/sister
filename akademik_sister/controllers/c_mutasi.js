var mnu  ='mutasi';
var mnu2 ='departemen';
var mnu3 ='jenismutasi';
var dir  ='models/m_'+mnu+'.php';
var dir2 ='models/m_'+mnu2+'.php';
var dir3 ='models/m_'+mnu3+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<label>Departemen</label>'
                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="departemenH" id="departemenH" class="span2">'
                            +'<input disabled="disabled" name="departemenTB" id="departemenTB" class="span2">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Cari Siswa</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="kode/nama siswa" id="siswaTB">'
                            +'<input  type="hidden" name="siswaH" id="siswaH" >'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<legend>NISN</legend>'
                        +'<div class="input-control text">'
                            +'<input disabled="disabled" placeholder="kode" id="nisnTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<legend>Nama Siswa</legend>'
                        +'<div class="input-control text">'
                            +'<input disabled="disabled" placeholder="nama siswa" id="namaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Jenis Mutasi</label>'
                        +'<div class="input-control select span3">'
                            +'<select  name="jenismutasiTB" id="jenismutasiTB"></select>'
                        +'</div>'
                        +'<label>Tanggal Mutasi</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-date="2014-10-23"'
                            +'data-format="yyyy-mm-dd"'
                            +'data-effect="slide">'
                            +'<input id="tanggalTB" name="tanggalTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                        +'<label>keterangan</label>'
                        +'<div class="input-control text">'
                            +'<input required type="text" name="keteranganTB" id="keteranganTB">'
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
        });

        //search action
        // $('#angkatanS').keydown(function (e){
        //     if(e.keyCode == 13)
        //         viewTB($('#departemenS').val());
        // });
        // $('#keteranganS').keydown(function (e){
        //     if(e.keyCode == 13)
        //         viewTB($('#departemenS').val());
        // });
        $('#departemenS').on('change',function(){
            viewTB();
        })

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#nisnS').val('');
            $('#namaS').val('');
            $('#jenismutasiS').val('');
            $('#keteranganS').val('');
        });
        $('#nisnS,#namaS,#jenismutasiS,#keteranganS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13)
                viewTB();
        });
            // $('#tanggalS').val('');

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
                    $('#departemenS').html(out);
                    viewTB(); 
                }
            }
        });
    }
//end of combo departemen ---
// combo jenismutasi ---
  function cmbjenismutasi (nama) {
            $.ajax({
                url:dir3,
                type:'post',
                dataType:'json',
                data:'aksi=cmb'+mnu3+'&de='+$('#departemenS').val(),
                success:function(dt){
                    var opt='';
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                        opt+='<option value="">'+dt.status+'</option>'
                    }else{
                        // alert(id);return false;
                        $.each(dt.nama,function(id,item){
                            if(nama==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>'
                            else
                                opt+='<option value="'+item.replid+'">'+item.nama+'</option>'
                        });$('#jenismutasiTB').html(opt);
                    }
                },
            });
        }
//end of combo jenismutasi ---

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
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari = '&departemenS='+$('#departemenS').val()
                    +'&nisnS='+$('#nisnS').val()
                    +'&namaS='+$('#namaS').val()
                    +'&jenismutasiS='+$('#jenismutasiS').val()
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
                    // $('#tbody').delay(4000).fadeIn().html(data);
                },1000);
            }
        });
    }
                    // +'&tanggalS='+$('#tanggalS').val()
// end of view table ---

// form ---
    function viewFR(id){
        var pel=$('#departemenS').val();
        $.Dialog({
            shadow:true,
            overlay:true,
            draggable:true,
            height:'auto',
            width:'35%',
            padding:20,
            onShow: function(){
                var titlex;
                if(id==''){  //add mode
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    $.ajax({
                        url:dir2,
                        data:'aksi=cmbdepartemen&replid='+$('#departemenS').val(),
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#departemenH').val($('#departemenS').val());
                            $('#departemenTB').val(dt.departemen[0].nama);
                            cmbjenismutasi('');
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
                            $('#departemenH').val($('#departemenS').val());
                            $('#departemenTB').val(dt.departemen);
                            $('#siswaH').val(dt.siswa);
                            $('#namaTB').val(dt.nama);
                            $('#nisnTB').val(dt.nisn);
                            $('#tanggalTB').val(dt.tanggal);
                            $('#keteranganTB').val(dt.keterangan);
                            cmbjenismutasi(dt.nama.nama);
                        }
                    });
                }$.Dialog.title(titlex+' '+mnu);
                $.Dialog.content(contentFR);
            }
        });
        // autosuggest
        $("#siswaTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{
                    'align':'left',
                    'columnName':'nisn',
                    'hide':true,
                    'width':'55',
                    'label':'NISN'
                },{   
                    'columnName':'nama',
                    'width':'40',
                    'label':'NAMA'
                }],
            url: dir+'?aksi=autocomp',
            select: function( event, ui ) {
                $('#siswaH').val(ui.item.replid);
                $('#nisnTB').val(ui.item.nisn);
                $('#namaTB').val(ui.item.nama);
                $('#siswaTB').combogrid( "option", "url", dir+'?aksi=autocomp&departemen='+$('#departemenS').val() );
                return false;
            }
        });
    }
// end of form ---

//paging ---
function pagination(page,aksix){
        var datax = 'starting='+page+'&aksi='+aksix;
         var cari = '&departemenS='+$('#departemenS').val();
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
                // viewTB();
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
        $('#angkatanTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

    // ---------------------- //
    // -- created by epiii -- //
    // ---------------------- //