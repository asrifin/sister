// ok
var mnu       ='peminjaman'; 
var mnu2      ='lokasi'; 
var dir       ='models/m_'+mnu+'.php'; 
var dir2      ='models/m_'+mnu2+'.php'; 
var contentAdd=contentDetail='';

// main function ---
    $(document).ready(function(){
        contentDetail+='<div style="overflow:scroll;height:500px;">'
                    //keterangan peminjaman 
                    +'<legend>Data Peminjaman</legend>'
                    +'<table>'
                        +'<tr>'
                            +'<td><b>Peminjam</b></td>'
                            +'<td id="peminjamTD"></td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td><b>Tanggal Pinjam</b></td>'
                            +'<td id="tanggal_pinjamTD"></td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td><b>Tanggal Wajib Kembali</b></td>'
                            +'<td  id="tanggal_kembaliTD"></td>'
                            +'<td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td><b>Keterangan</b></td>'
                            +'<td  id="keteranganTD"></td>'
                            +'<td>'
                        +'</tr>'
                    +'</table>'
                    //detail barang
                    +'<legend>Detail Barang</legend>'
                    +'<button id="kembalikanBC" onclick="kembalikanFC();" class="info"><i class="icon-undo"></i></button>'
                    +'<table class="table hovered bordered striped">'
                        +'<thead>'
                            +'<tr style="color:white;"class="info">'
                                +'<th class="text-center">'
                                    // +'<div class="input-control checkbox">'
                                        +'<input id="kembalikanCB" type="checkbox"><span class="check"></span>'
                                    // +'</div>'
                                +'</th>'
                                +'<th class="text-center">Kode</th>'
                                +'<th class="text-center">Barang</th>'
                                +'<th class="text-center">Tgl Kembali</th>'
                                +'<th class="text-center">Aksi</th>'
                            +'</tr>'
                        +'</thead>'
                        +'<tbody id="barangTBL2"></tbody>'
                        +'<tfoot id="legendDet">'
                            +'<tr class="info">'
                                +'<th colspan="5" align="left" style="color:white;">'
                                    +'<button style="background-color:red;"></button> : belum dikembalikan (terlambat)<br>'
                                    +'<button style="background-color:blue;"></button> : belum dikembalikan<br>'
                                    +'<button style="background-color:orange;"></button> : sudah dikembalikan (terlambat)<br>'
                                    +'<button style="background-color:green;"></button> : sudah dikembalikan '
                                +'</th>'
                            +'</tr>'
                        +'</tfoot>'
                    +'</table>'
                +'</div>';
        contentAdd+='<div style="overflow:scroll;height:500px;"  class="">'
                   +'<legend>Data Barang</legend>'
                        +'<div class="input-control text">'
                            +'<input placeholder="kode/nama barang" id="barangTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">Kode</th>'
                                    +'<th class="text-center">Barang</th>'
                                    +'<th class="text-center">Aksi</th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="barangTBL">'
                            +'</tbody>'
                                // +'<tr class="warning"><td colspan="3" class="text-center">Silahkan pilih barang.. </td></tr>'
                            +'<tfoot>'
                            +'</tfoot>'
                        +'</table>'

                    +'<legend>Data Peminjaman</legend>'
                    +'<form onsubmit="simpan();return false;" autocomplete="off"><input id="idformH" type="hidden">' 
                        +'<label>Lokasi</label>'
                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="lokasiH" id="lokasiH" >'
                            // +'<input enabled="enabled" name="lokasiTB" id="lokasiTB" '
                            +'<input disabled="disabled" name="lokasiTB" id="lokasiTB" >'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Peminjam</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="Nama Peminjam"  required type="text" name="peminjamTB" id="peminjamTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        +'<label>Tanggal Peminjaman</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            // +'data-date="2014-10-23"'
                            +'data-format="yyyy-mm-dd"'
                            +'data-effect="slide">'
                            +'<input required="required"  id="tgl_pinjamTB" name="tgl_pinjamTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        +'<label>Tanggal Pengembalian</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            // +'data-date="2014-10-23"'
                            +'data-format="yyyy-mm-dd"'
                            +'data-effect="slide">'
                            +'<input required="required" id="tgl_kembaliTB" name="tgl_kembaliTB" type="text">'
                            +'<button class="btn-date"></button>'
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
        //combo lokasi
        cmblokasi();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action // edit by epiii
        $('#lokasiS').on('change',function (e){ // change : combo box
            viewTB($('#lokasiS').val());
            // $('#barangTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$(this).val() );
        });
        $('#peminjamS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB($('#lokasiS').val());
        });
        $('#keteranganS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13)
                viewTB($('#lokasiS').val());
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            // $('#lokasiS').val('');
            $('#peminjamS').val('');
            // $('#keteranganS').val('');
        });
    }); 
// end of main function ---

// combo departemen ---
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
                    });viewTB(dt.lokasi[0].replid);
                    // $('#barangTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+dt.lokasi[0].replid);
                }$('#lokasiS').html(out);
            }
        });
    }
//end of combo departemen ---

//submit form  -----------
    function simpan(){
        if(barangArr().length<=0){
            $('#barangTB').focus();
            return false;
        }else{
            var data ='&aksi=simpan';
            $.each(barangArr(),function(id,item){
                data+='&barang[]='+item;  
            });
            // console.log(JSON.stringify(xx));
            // console.log(JSON.stringify(x()));
            $.ajax({
                url:dir,
                data:$('form').serialize()+data,
                cache:false,
                type:'post',
                dataType:'json',
                success:function(dt){
                    if(dt.status!='sukses'){
                        cont = 'Gagal menyimpan data';
                        clr  = 'red';
                    }else{
                        $.Dialog.close();
                        kosongkan();
                        viewTB($('#lokasiS').val());
                        cont = 'Berhasil menyimpan data';
                        clr  = 'green';
                    }notif(cont,clr);
                }
            });
        }
    }
//end of submit form ---

// view table ---
    function viewTB(lok){ //edit by epiii 
        var aksi ='aksi=tampil';
        var cari ='&lokasiS='+lok
                 +'&peminjamS='+$('#peminjamS').val()
                 +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#peminjamantbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#peminjamantbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---

// form ---
    function viewFR(id){
        var lok = $('#lokasiS').val();
        $.Dialog({
            shadow:true,
            overlay:true,
            draggable:true,
            height:'auto',
            width:'45%',
            padding:20,
            onShow: function(){
                var titlex;
                var contentFR;
                if(id==''){ // add form
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
                    });contentFR=contentAdd;
                }else{ //detail view
                    titlex='<span class="icon-search"></span> Detail barang ';
                    $.ajax({
                        url:dir,
                        data:'aksi=detail&peminjaman='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            // console.log(dt);
                            if(dt.status!='sukses'){
                                notif(dt.status,'red');
                            }else{
                                // data peminjaman
                                $('#peminjamTD').html(': '+dt.data.peminjam);
                                $('#tanggal_pinjamTD').html(': '+dt.data.tgl_pinjam);
                                $('#tanggal_kembaliTD').html(': '+dt.data.tgl_kembali);
                                $('#keteranganTD').html(': '+dt.data.keterangan);
                                // data detail barang
                                var tbl='';
                                $.each(dt.data.barangArr,function(id,item){
                                    var btn;
                                    tbl+='<tr>'
                                        +'<td><input '+(item.status==3||item.status==4?'disabled':'')+' type="checkbox" dp="'+item.iddpeminjaman+'" brg="'+item.idbarang+'" /></td>'
                                        +'<td>'+item.kode+'</td>'
                                        +'<td>'+item.barang+'</td>'
                                        +'<td>'+item.tgl_kembali2+'</td>'
                                        +'<td>'
                                            +'<button style="background-color:'+item.color+'" '
                                                +(item.status==3||item.status==4?'onclick="alert(\'sudah dikembalikan\')"':'onclick="kembalikanFC('+item.iddpeminjaman+','+item.idbarang+')"')+'>'
                                                +'<i style="color:white;" class="icon-undo"></i>'
                                            +'</button>'
                                        +'</td>'
                                    +'</tr>';
                                });$('#barangTBL2').html(tbl);
                            }
                        }
                    });contentFR=contentDetail;
                }$.Dialog.title(titlex+' '+mnu); // edit by epiii
                $.Dialog.content(contentFR);
                // barangExist();
            }
        });
        //autocomplete
        $("#barangTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{
                    'align':'left',
                    'columnName':'kode',
                    'hide':true,
                    'width':'55',
                    // 'width':'8',
                    'label':'kode'
                },{   
                    'columnName':'nama',
                    'width':'40',
                    'label':'Barang'
                }],
            url: dir+'?aksi=autocomp&lokasi='+lok,
            // url: dir+'?aksi=autocomp&lokasi='+lok+'&barang='+barangArr(),
            // $('#barangTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiTB').val() );
            select: function( event, ui ) { // event setelah data terpilih 
                // $('#gruruH').val(ui.item.replid);
                
                // $(this).combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiTB').val() );
                barangAdd(ui.item.replid,ui.item.kode,ui.item.nama);
                $('#barangTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiS').val()+'&barang='+barangArr() );
                return false;
            }
        });
    }   

// hapus barang terpilih
    function barangDel(id){
        $('#barangTR_'+id).fadeOut('slow',function(){
            $('#barangTR_'+id).remove();
            // barangExist();
        });
    }
//barang record kosong --
    function barangExist(){
        // var jumImg = $('.imgTR:visible','#imgTB').length; //hitung jumlah gambar bkeg bukeg  dalam form 
        alert('jumlah tr: '+$('#barangTBL','.barangTR').length);return false;
        var tr ='<tr class="warning"><td colspan="3" class="text-center">Silahkan pilih barang ..</td></tr>';
        if($('#barangTBL').html()=='')
            $('#barangTBL').html(tr);
        else
            $('#barangTBL').html('');
    }
//end of barang record kosong --

// pilih barang yg akan dipinjam ---
    function barangAdd (id,kode,nama) {
        var tr ='<tr val="'+id+'" class="barangTR" id="barangTR_'+id+'">'
                    +'<td>'+kode+'</td>' //diganti form textbox $('#barangTBL').val()
                    +'<td>'+nama+'</td>'
                    +'<td><button onclick="barangDel('+id+');"><i class="icon-remove"></button></i></td>'
                +'</tr>';
        $('#barangTBL').append(tr); 
        barangArr();
        // $('#barangTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiS').val()+'&barang='+barangArr() );

        // barangExist();
    }
    
//himpun array barang terpilih
    function barangArr(){
        var y=[];
        $('.barangTR').each(function(id,item){
            y.push($(this).attr('val'));
        });return y;
    }
// end autocomplete

//paging ---
    function pagination(page,aksix,subaksi){ 
        var aksi ='aksi='+aksix+'&subaksi='+subaksi+'&starting='+page;
        var cari ='';
        $('.'+subaksi+'_cari').each(function(){
            var p = $(this).attr('id');
            var v = $(this).val();
            cari+='&'+p+'='+v;
        });
        $.ajax({
            url:dir,
            type:"post",
            data: aksi+cari,
            beforeSend:function(){
                $('#'+subaksi+'tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#'+subaksi+'tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
//end of paging ---
    
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
        $('#peminjamTB').val('');
        $('#tgl_pinjamTB').val('');
        $('#tgl_kembaliTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

function barangTerpilih () {
    var brg=[],dp=[];
    $('input[type="checkbox"]:checked').each(function(){
        brg.push($(this).attr('brg'));
        dp.push($(this).attr('dp'));
    });var ret={'brg':brg,'dp':dp};
    return ret;
}

function brgPilihAll () {
    barangTerpilih();
    $('.').each(function  (argument) {

    });
}

function kembalikanFC (iddp,idbrg) {
    if (confirm('Mengembalikan barang')){
        var dp,brg;
        if(typeof iddp=='undefined'){ // multi update
            var arr=barangTerpilih();
                dp  =arr.dp;
                brg =arr.brg;
        }else{ // single update
            dp  =iddp;
            brg =idbrg;
        }

        $.ajax({
            url:dir,
            dataType:'json',
            data:'aksi=kembalikan&dpeminjaman='+dp+'&barang='+brg,
            type:'post',
            success:function(dt){
                if(dt.status!='sukses'){
                    notif(dt.status,'red');
                }else{
                    notif(dt.status,'green');
                    $.Dialog.close();
                    viewTB($('#lokasiS').val());
                }
            }
        });
    }
}
    // ------------------------ //
    // - created by rovi/epiii- //
    // ------------------------ // 
