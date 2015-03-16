var mnu  = 'kategorirekening';
var dir  = 'models/m_'+mnu+'.php';
var mnu2 = 'subrekening';
var dir2 = 'models/m_'+mnu2+'.php';
var mnu3 = 'statusrekening';
var dir3 = 'models/m_'+mnu3+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 

                        +'<label>Sub Rekening</label>'
                        +'<div class="input-control select">'
                            +'<select name="subrekeningTB" id="subrekeningTB"></select>'
                        +'</div>'

                        +'<label>Status</label>'
                        +'<div class="input-control select">'
                            +'<select name="statusrekeningTB" id="statusrekeningTB"></select>'
                        +'</div>'

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

                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'
                        
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';
        // viewTB();
        cmbsubrekening('filter','');
        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#subrekeningS,#statusrekeningS').on('change',function(){
            viewTB();
        });$('#kodeS,#namaS,#keteranganS').keydown(function (e){
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

// combo statusrekening ---
    function cmbstatusrekening(typ,stat){
        $.ajax({
            url:dir3,
            data:'aksi=cmb'+mnu3,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.statusrekening, function(id,item){
                        if(stat==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                    if(typ=='filter'){ // filtering/ searching
                        $('#statusrekeningS').html('<option value="">..SEMUA..</option>'+out);
                        viewTB();
                    }else{ //form
                        $('#statusrekeningTB').html(out);
                    }
                }
            }
        });
    }
//end of combo statusrekening ---

// combo subrekening ---
    function cmbsubrekening(typ,sub){
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
                    $.each(dt.subrekening, function(id,item){
                        if(sub==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                    if(typ=='filter'){ // filtering/ searching
                        $('#subrekeningS').html('<option value="">..SEMUA..</option>'+out);
                        cmbstatusrekening('filter','');
                    }else{ //form
                        $('#subrekeningTB').html(out);
                    }
                }
            }
        });
    }
//end of combo subrekening ---


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
                +'&statusrekeningS='+$('#statusrekeningS').val()
                +'&subrekeningS='+$('#subrekeningS').val()
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
                    cmbsubrekening('form','');
                    cmbstatusrekening('form','');
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
                            cmbsubrekening('form',dt.subrekening);
                            cmbstatusrekening('form',dt.statusrekening);
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
                 +'&subrekeningS='+$('#subrekeningS').val()
                 +'&statusrekeningS='+$('#statusrekeningS').val()
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
