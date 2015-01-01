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
       contentFR+='<div style="overflow:scroll;height:500px;"  class="">'
                    +'<form onsubmit="simpan();return false;" autocomplete="off"><input id="idformH" type="hidden">' 

                        +'<label>Cari Pegawai</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="kode/nama pegawai" id="guruTB">'
                            +'<input  type="hidden" name="guruH" id="guruH" >'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>nip</label>'
                        +'<div class="input-control text">'
                            +'<input disabled="disabled" placeholder="nip" id="nipTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>nama</label>'
                        +'<div class="input-control text">'
                            +'<input disabled="disabled" placeholder="nama" id="namaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'   
                        +'<label>Pelajaran</label>'
                        +'<div class="input-control select span3">'
                            +'<select data-hint="Pelajaran" name="pelajaranTB" id="pelajaranTB"></select>'
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
            // viewTB();
            // function cmbpelajaran(thn,pel,idpel){
            // alert($(this).val());return false;
            cmbpelajaran($(this).val(),false,null);
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
                }$('#tahunajaranS').html(out);
                cmbpelajaran(dt.tahunajaran[0].replid,false,null);
            }
        });
    }
//end of combo tahunajaran ---

// combo pelajaran ---
    function cmbpelajaran(thn,pel,idpel){
        var select='',tb;
        if(pel){// form
            tb='#pelajaranTB';
        }else{// search
            tb='#pelajaranS';
            select+='<option value="">---------- Semua ----------</option>';
        }
        $.ajax({
            url:dir4,
            data:'aksi=cmbpelajaran&tahunajaran='+thn,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.pelajaran, function(id,item){
                        if(idpel==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }$(tb).html((dt.pelajaran==null?'':select)+out);
                if(!pel) viewTB();
            }
        });
    }
//end of combo pelajaran ----

// combo pelajaran2 ---
    function cmbpelajaran2(pel){
        $.ajax({
            url:dir4,
            data:'aksi=cmbpelajaran',
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.pelajaran, function(id,item){
                        if(item.replid==pel)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }$('#pelajaranTB').html(out);
            }
        });
    }
//end of combo pelajaran2 ----

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan&tahunajaran='+$('#tahunajaranS').val();
        if($('#idformH').val()!='') //edit mode
            urlx += '&replid='+$('#idformH').val();

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
                    +'&tahunajaranS='+$('#tahunajaranS').val()
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
        var pel=$('#tahunajaranS').val();
        $.Dialog({
            shadow:true,
            overlay:true,
            draggable:true,
            height:'auto',
            width:'35%',
            padding:20,
            onShow: function(){
                var titlex;
                $('#tahunajaranH').val($('#tahunajaranS').val());
                if (id!='') { // edit mode
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt3){
                            $('#idformH').val(id);
                            $('#namaTB').val(dt3.nama);
                            $('#nipTB').val(dt3.nip);
                            $('#keteranganTB').val(dt3.keterangan);
                            cmbpelajaran(dt3.tahunajaran,true,dt3.pelajaran);
                        }
                    });titlex='<span class="icon-pencil"></span> Ubah ';
                }else{ //add mode
                    cmbpelajaran($('#pelajaranS').val(),true,null);
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                }
                $.Dialog.title(titlex+' '+mnu);
                $.Dialog.content(contentFR);
            }
        });
        $("#guruTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{
                    'align':'left',
                    'columnName':'nip',
                    'hide':true,
                    'width':'55',
                    'label':'NIP'
                },{   
                    'columnName':'nama',
                    'width':'40',
                    'label':'NAMA'
                }],
            url: dir+'?aksi=autocomp',
            select: function( event, ui ) {
                $('#guruH').val(ui.item.replid);
                $('#nipTB').val(ui.item.nip);
                $('#namaTB').val(ui.item.nama);
                $('#guruTB').combogrid( "option", "url", dir+'?aksi=autocomp&pelajaran='+$('#pelajaranS').val() );
                return false;
            }
        });
    }
// end of form ---

// //paging ---
    function pagination(page,aksix){
        var datax = 'starting='+page+'&aksi='+aksix;
         var cari = '&departemenS='+$('#departemenS').val()
                    +'&tahunajaranS='+$('#tahunajaranS').val()
                    +'&pelajaranS='+$('#pelajaranS').val();
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
        $('#pelajaranTB').val('');
        $('#namaTB').val('');
        $('#nipTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

    // ---------------------- //
    // -- created by rovi -- //
    // ---------------------- //