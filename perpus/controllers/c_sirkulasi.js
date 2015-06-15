var mnu       ='sirkulasi'; 
var mnu2      ='lokasi'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';

var pinjam_contentFR = kembalikan_contentFR = kembali_contentFR = contentFR ='';
// main function load first 
    $(document).ready(function(){

        $('#lokasiTB').on('focus',function(){
            autoSug($('#judulTB'),$(this).val());
        });        

        $('#optionBC').on('click',function(){
            $('#optionPN').toggle('slow');
        });
        $('#hari_iniBC').on('click',function(){
            $('#tgl1TB,#tgl2TB').val(getToday());
        });
        $('#bulan_iniBC').on('click',function(){
            $('#tgl1TB').val(getFirstDate());
            $('#tgl2TB').val(getLastDate());
        });

        kembalikan_contentFR +='<form autocomplete="off" onsubmit="kembalikanSV();return false;">'
                                +'<input  id="kembalikanH" name="kembalikanH">'
                                +'<table>'
                                +'<tr>'
                                      +'<td colspan="2">Kembalikan item berikut ini?</td>'
                                      +'<td></td>'
                                +'</tr>'
                                +'<tr>'
                                      +'<td>Judul</td>'
                                      +'<td>: <span id="judulTD"></span></td>'
                                +'</tr>'
                                +'<tr>'
                                      +'<td>Barkode</td>'
                                      +'<td>: <span id="barkodeTD"></span></td>'
                                +'</tr>'
                                +'</table>'
                                +'<br>'
                                +'<div class="form-actions">' 
                                    +'<button class="button primary">simpan</button>&nbsp;'
                                    +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                                +'</div>'
                           +'</form>'

            //Dialog Pinjam
        pinjam_contentFR +='<div style="overflow:scroll;height:500px;" autocomplete="off">'
                           +'<legend>Daftar item yang dipinjam</legend>'
                            +'<label>Lokasi</label>'
                            +'<div class="input-control select span4">'
                                +'<select  name="lokasiTB" id="lokasiTB"></select>'
                            +'</div><br>'
                            +'<div class="input-control text size4">'
                                +'<input placeholder="Barcode atau Judul item" id="judulTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'
                            +'<table width="500" class="table hovered bordered striped">'
                                +'<thead>'
                                    +'<tr style="color:white;"class="info">'
                                        +'<th width="200" class="text-center">Barcode</th>'
                                        +'<th width="200" class="text-center">Judul</th>'
                                        +'<th width="100"class="text-center">Aksi</th>'
                                    +'</tr>'
                                +'</thead>'
                                +'<tbody id="barangTBL">'
                                +'</tbody>'
                                    // +'<tr class="warning"><td colspan="3" class="text-center">Silahkan pilih barang.. </td></tr>'
                                +'<tfoot>'
                                +'</tfoot>'
                            +'</table>'

                            +'<div class="grid">'
                            +'<legend>Data Peminjaman</legend>'
                            +'<form enctype="multipart/form-data" class="span12" autocomplete="off" onsubmit="pinjamSV(); return false;">' 
                                    +'<input id="idformH" type="hidden">' 
                                    // lokasi , keterangan
                                    +'<div class="row">'
                                        +'<div class="span5"> '
                                            +'<label>Peminjam</label>'
                                            +'<div class="input-control select span4">'
                                                +'<select  name="tipeTB" id="tipeTB">'
                                                    +'<option value="0">Siswa</option>'
                                                    +'<option value="0">Guru</option>'
                                                    +'<option value="0">Member Luar</option>'
                                                +'</select>'
                                            +'</div>'
                                            +'<div class="input-control text size4">'
                                                +'<input placeholder="ID atau Nama Peminjam" id="peminjamTB">'
                                                +'<button class="btn-clear"></button>'
                                            +'</div>'
                                                +'<img id="b_photoIMG" src="../img/no_image.jpg" width="100" class="shadow" align="center">'
                                        +'<table class="table hovered bordered striped">'
                                            +'<tr>'
                                                +'<td colspan="2"><b id="namaTD"></b></td>'
                                                // +'<td>: <b id="namaTD"></b></td>'

                                            +'</tr>'
                                            +'<tr>'
                                                +'<td>ID Member</td>'
                                                +'<td>: <span id="idmemberTD"></span></td>'
                                            +'</tr>'
                                                +'<td>Tipe Member</td>'
                                                +'<td>: <span id="tipememberTD"></span></td>'
                                            +'</tr>'
                                            // +'<tr>'
                                            //     +'<td>Kelas</td>'
                                            //     +'<td>: <span id="kelasTD"></span></td>'
                                            // +'</tr>'
                                        +'</table>'                                        
                                        +'</div>'
                                        +'<div class="span5">'
                                            +'<label><b>Waktu Peminjaman</b></label>'
                                            +'<label>Tanggal Peminjaman</label>'
                                            +'<div class="input-control text size3" data-role="datepicker"'
                                                // +'data-date="2014-10-23"'
                                                +'data-format="yyyy-mm-dd"'
                                                +'data-effect="slide">'
                                                +'<input required="required"  id="tgl_pinjamTB" name="tgl_pinjamTB" type="text">'
                                                +'<button class="btn-date"></button>'
                                            +'</div>'
                                            +'<label>Tanggal Pengembalian</label>'
                                            +'<div class="input-control text size3" data-role="datepicker"'
                                                // +'data-date="2014-10-23"'
                                                +'data-format="yyyy-mm-dd"'
                                                +'data-effect="slide">'
                                                +'<input required="required" id="tgl_kembaliTB" name="tgl_kembaliTB" type="text">'
                                                +'<button class="btn-date"></button>'
                                            +'</div>'                                            
                                            +'<label><b>Catatan Peminjaman</b></label>'
                                            +'<label>Keterangan</label>'
                                            +'<div class="input-control textarea">'
                                                +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                                            +'</div>'
                                        +'</div>' //end span
                                        // +'</div>' //end span 2
                                    +'</div>' //end row
                                    
                                    // nama member
                                    +'<div class="row">'
                                        +'<div class="span5"> '
                                        '<table>'
                                            +'<tr>'
                                                  +'<td>Nama</td>'
                                                +'<td>: <b id="namaTD"></b></td>'

                                            +'</tr>'
                                            +'<tr>'
                                                +'<td>No. Pendaftaran</td>'
                                                +'<td>: <span id="nopendaftaranTD"></span></td>'
                                            +'</tr>'
                                        +'</table>'    
                                        +'</div>'
                                        +'<div class="span5"> '

                                        +'</div>' //end span
                                    +'</div>'//end row
                                    

                                    +'<div class="row">'
                                        +'<div class="span5"> '
                                            +'<div class="form-actions">' 
                                                +'<button class="button primary">simpan</button>&nbsp;'
                                                +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                                            +'</div>'
                                        +'</div>'
                                    +'</div>'
                                +'</form>'
                            +'</div>'
                                //End Grid  
                        +'</div>';
                         //End div

        kembali_contentFR +='<div style="overflow:scroll;height:500px;">'
                           // +'<form  class="span12" autocomplete="off" onsubmit="pinjamSV(); return false;">' 
                           +'<legend>Daftar item yang dikembalikan</legend>'
                            +'<label>Lokasi</label>'
                            +'<div class="input-control select span4">'
                                +'<select  name="lokasiTB" id="lokasiTB"></select>'
                            +'</div><br>'
                            +'<div class="input-control text size4">'
                                +'<input placeholder="Barcode atau Judul item" id="k_judulTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'
                            +'<table width="500" class="table hovered bordered striped">'
                                +'<thead>'
                                    +'<tr style="color:white;"class="info">'
                                        +'<th width="200" class="text-center">Barcode</th>'
                                        +'<th width="200" class="text-center">Judul</th>'
                                        +'<th width="100"class="text-center">Aksi</th>'
                                    +'</tr>'
                                +'</thead>'
                                +'<tbody id="kembaliTBL">'

                                +'</tbody>'
                                +'<tfoot>'
                                +'</tfoot>'
                            +'</table>'
                            +'<div class="form-actions">' 
                                    +'<button class="button primary">simpan</button>&nbsp;'
                                    +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                            +'</div>'

                        +'</div>';
                        // +'</form>';
                         //End div

        cmblokasi('filter','');

    // button action
        //add ---
        // $("#peminjamanBC").on('click', function(){ 
        //     // pinjamFR('');
        // });
        // $("#pengembalianBC").on('click', function(){ 
        //     kembaliFR('');
        // });

        $("#statistik").on('change', function(){
            autoSug($('#labelTB'),$(this).val());
        });

        //search sirkulasi---
        $('#memberS,#barkodeS,#judulS').on('keydown',function (e){ 
            if(e.keyCode == 13)  viewTB('sirkulasi');
        });
        
        //search statistik---
        $('#s_judulS,#klasifikasiS,#pengarangS,#penerbitS').on('keydown',function (e){ 
            if(e.keyCode == 13)  viewTB('statistik');
        });

        // set default this month
        $('#tgl1TB').val(getFirstDate());
        $('#tgl2TB').val(getLastDate());

        $('#s_tgl1TB').val(getFirstDate());
        $('#s_tgl2TB').val(getLastDate());
        // jurnal umum :: tampilkan detail jurnal
        // $('#ju_detiljurnalCB').on('click',function(){
        //     $('.uraianCOL').toggle();
        // });

        // search button
        $('#cari_sirkulasiBC').on('click',function(){
            $('#sirkulasiTR').toggle('slow');
            $('#memberS').val('');
            $('#barkodeS').val('');
            $('#judulS').val('');
        });
        $('#cari_statistikBC').on('click',function(){
            $('#statistikTR').toggle('slow');
            $('#s_judulS').val('');
            $('#klasifikasiS').val('');
            $('#pengarangS').val('');
            $('#penerbitS').val('');
        });

        // default tampilkan 
        // viewTB('sirkulasi');
        loadAll();
    }); 
// end of main function ---------

     function loadAll(){
        viewTB('sirkulasi');
        viewTB('statistik');
    }
    
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
                $(el2).html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
//end of paging ---
    
    //combo statistik
    function cmbstatistik(lok){
        $.ajax({
            url:dir,
            data:'aksi=cmbstatistik',
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                    // out+='<option value="1">'+Judulyangpalingseringdipinjam+'</option>';
                    // out+='<option value="2">'+Member dengan peminjaman terbanyak+'</option>';

                // if(dt.status!='sukses'){
                //     out+='<option value="">'+dt.status+'</option>';
                // }else{
                //     $.each(dt.statistik, function(id,item){
                //         out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                //     });
                // }
                $('#statistikS').html(out);
                // statistikVW();
                viewTB('statistik');
            }
        });
    }

// combo lokasi ---
    function cmblokasi(typ,lok){
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
                    if (typ=='filter') { //filtering / searching
                        $('#lokasiS').html(out);
                        ('filter',dt.lokasi[0].replid);
                        // cmbtahunlulus2('filter',dt.departemen[0].replid,'');
                    }else{
                        $('#lokasiTB').html(out);
                        // autoSug($('#judulTB'),$('#lokasiTB').val());
                    } 
                }
            }
        });
    }

// load form (all)
    function loadFR(typx,id){        
                        // console.log(typx); return false;
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 800,
            padding: 10,
            onShow: function(){
                setTimeout(function(){
                    $('idformH').val(typx);
                    if (typx=='peminjaman') {
                        contentFR=pinjam_contentFR;

                            $('#tgl_pinjamTB').val(getFirstDate());
                            $('#tgl_kembaliTB').val(getLastDate());
                        if (id=='') { //add
                            titl = ' Tambah Peminjaman';
                            cmblokasi();


                        }else{
                            titl = ' Ubah Peminjaman';

                        }
                    } 
                    else if (typx=='pengembalian') {
                        contentFR=kembali_contentFR;

                        if (id=='') {//add
                            titl = ' Tambah Pengembalian';
                            cmblokasi();

                        } else { //Edit
                            titl = ' Ubah Pengembalian';

                        }
                    }
                    $.Dialog.content(contentFR);
                    $.Dialog.title('<i class="fg-white icon-'+(id!=''?'pencil':'plus-2')+'"></i> '+titl); 
                },100);  

            }
        });
    }

    function autoSug(el,subaksi,lok){
        if(subaksi=='pinjam'){ //rekening
            var urlx= '?aksi=autocomp&subaksi=subaksi&lokasi='+lok;
            var col = [{
                    'align':'left',
                    'columnName':'barkode',
                    'hide':true,
                    'width':'55',
                    'label':'Barkode'
                },{   
                    'align':'left',
                    'columnName':'judul',
                    'width':'50',
                    'label':'Judul'
            }];
        }else{
            var urlx= '?aksi=autocomp&subaksi='+subaksi;
            var col = [{
                    'align':'left',
                    'columnName':'barkode',
                    'hide':true,
                    'width':'55',
                    'label':'Barkode'
                },{   
                    'align':'left',
                    'columnName':'judul',
                    'width':'50',
                    'label':'Judul'
            }];

        }

        urly = dir+urlx;
        var t= terpilihx = '';
        if(subaksi=='pinjam'){ // Pinjam 
            if(pinjamArr!='' || pinjamArr!=null){
                t         = pinjamArr.filter(function(item) { return item !== ''; });
                terpilihx = '&pinjamArr='+t.toString();
            }
        }
        else{ // Kembali
            if(kembaliArr!='' || kembaliArr!=null){
                t         = kembaliArr.filter(function(item) { return item !== ''; });
                terpilihx = '&kembaliArr='+t.toString();
            }
        }

        $('#'+el+'TB').combogrid({
            debug:true,
            width:'800px',
            colModel : col,
            url: urly+terpilihx,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                if (subaksi=='pinjam') {
                    collectArr();
                    $('#'+el+'TB').val(ui.item.barkode);
                    $('#'+el+'TB').val(ui.item.judul);
                }else{
                    $('#'+el+'TB').val(ui.item.barkode);
                    $('#'+el+'TB').val(ui.item.judul);
                }
                // barangAdd(ui.item.replid,ui.item.barkode,ui.item.judul);
                // $(el).val('');
                // // $('#judulTB').combogrid( "option", "url", dir+'?aksi=autocomp&subaksi=judul&lokasi='+$('#lokasiS').val()+'&brgArr='+barangArr().toString() );
                return false;
            }
        }); //End autocomplete
    }

   function collectArr(){
        pinjamArr=[];
        kembaliArr=[];
        if($('#subaksiH').val()=='kembali'){ // outcome saja
            console.log('masuk pengembalian ');
            $('#k_judulTB').each(function(id,item){
                kembaliArr.push($(this).val());
            });
            console.log(kembaliArr);
            return kembaliArr;
        }else{ // selain outcome (income,jurnal-umum)
            console.log('masuk peminjaman');
            $('#judulTB').each(function(id,item){
                pinjamArr.push($(this).val());
            });
            console.log(pinjamArr);
            return pinjamArr;
        }
    }

    // hapus barang terpilih
        function bukuDel(id){
            $('#bukuTR_'+id).fadeOut('slow',function(){
                $('#bukuTR_'+id).remove();
                // barangExist();
                collectArr();
                console.log('arr terpilih in bukuDel=>'+pinjamArr);
            });
        }

    // pilih barang yg akan dipinjam ---
        function barangAdd (id,barkode,judul) {
            var tr ='<tr val="'+id+'" class="barangTR" id="barangTR_'+id+'">'
                        +'<td>'+barkode+'</td>'
                        +'<td>'+judul+'</td>'
                        +'<td><button onclick="barangDel('+id+');"><i class="icon-remove"></button></i></td>'
                    +'</tr>';
            $('#barangTBL').prepend(tr); 
            barangArr();
            $('#judulTB').combogrid( "option", "url", dir+'?aksi=autocomp&subaksi=tersedia&lokasi='+$('#lokasiTB').val()+'&brgArr='+barangArr().toString() );
            // enabledButton();
            // barangExist();
        }
        
    //himpun array barang terpilih
        function barangArr(){
            var y=[];
            $('.barangTR').each(function(id,item){
                y.push($(this).attr('val'));
            });return y;
        }
    // end peminjaman

        //autocomplete
        $("#k_judulTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{
                    'align':'left',
                    'columnName':'barkode',
                    'hide':true,
                    'width':'55',
                    // 'width':'8',
                    'label':'Barkode'
                },{   
                    'columnName':'judul',
                    'width':'40',
                    'label':'Judul'
                }],
            url: dir+'?aksi=autocomp&subaksi=dipinjam',
            select: function( event, ui ) { // event setelah data terpilih 
                kembaliAdd(ui.item.replid,ui.item.barkode,ui.item.judul);
                // $('#k_judulTB').combogrid( "option", "url", dir+'?aksi=autocomp&subaksi=dipinjam&lokasi='+$('#lokasiS').val()+'&kembali='+kembaliArr() );
                return false;
            }
        }); //End autocomplete

    // hapus barang terpilih
        function kembaliDel(id){
            $('#kembaliTR_'+id).fadeOut('slow',function(){
                $('#kembaliTR_'+id).remove();
                // kembaliExist();
            });
        }
    //Barang record kosong --
        function kembaliExist(){
            // var jumImg = $('.imgTR:visible','#imgTB').length; //hitung jumlah gambar bkeg bukeg  dalam form 
            alert('jumlah tr: '+$('#kembaliTBL','.kembaliTR').length);return false;
            var tr ='<tr class="warning"><td colspan="3" class="text-center">Silahkan pilih Judul Buku ..</td></tr>';
            if($('#kembaliTBL').html()=='')
                $('#kembaliTBL').html(tr);
            else
                $('#kembaliTBL').html('');
        }
    //end of kembali record kosong --

    // pilih barang yg akan dipinjam ---
        function kembaliAdd (id,barkode,judul) {
            var tr ='<tr val="'+id+'" class="kembaliTR" id="kembaliTR_'+id+'">'
                        +'<td>'+barkode+'</td>'
                        +'<td>'+judul+'</td>'
                        +'<td><button onclick="kembaliDel('+id+');"><i class="icon-remove"></button></i></td>'
                    +'</tr>';
            $('#kembaliTBL').append(tr); 
            kembaliArr();
            // $('#kembaliTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiS').val()+'&kembali='+kembaliArr() );

            // kembaliExist();
        }
        
    //himpun array kembali terpilih
        function kembaliArr(){
            var y=[];
            $('.kembaliTR').each(function(id,item){
                y.push($(this).attr('val'));
            });return y;
        }
    // end autocomplete

/*view*/
    // Sirkulasi ---
        function viewTB(subaksi){
            var aksi ='aksi=tampil&subaksi='+subaksi;
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
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#'+subaksi+'_tbody').html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    setTimeout(function(){
                        $('#'+subaksi+'_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }    

// fungsi AJAX : asyncronous
    function ajaxFC (u,d) {
        return $.ajax({
            url:u,
            type:'post',
            dataType:'json',
            data:d
        });
    }

/*save (insert & update)*/
  

// input uang --------------------------
    function inputuang(e) {
        $(e).maskMoney({
            precision:0,
            prefix:'Rp. ', 
            // allowNegative: true, 
            thousands:'.', 
            // decimal:',', 
            affixesStay: true
        });
    }
// end of input uang --------------------------


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

//end of  print to PDF -------
    function printPDF(mn){
        var par='',tok='',p,v;
        $('.'+mn+'_cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });var x  = $('#id_loginS').val();
        var token = encode64(x+tok);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }

// input uang --------------------------
    function inputuang(e) {
        $(e).maskMoney({
            precision:0,
            prefix:'Rp. ', 
            // allowNegative: true, 
            thousands:'.', 
            // decimal:',', 
            affixesStay: true
        });
    }

// left pad (replace with 0)
    function lpadZero (n, length){
        var str = (n > 0 ? n : -n) + "";
        var zeros = "";
        for (var i = length - str.length; i > 0; i--)
            zeros += "0";
        zeros += str;
        return n >= 0 ? zeros : "-" + zeros;
    }

    function validUang () {
        //TODO
    }

/*about date*/ 
// get month format -------------
    function monthFormat(mon){
        switch(mon){
            case 1:return 'Jan';break;
            case 2:return 'Feb';break;
            case 3:return 'Mar';break;
            case 4:return 'Apr';break;
            case 5:return 'May';break;
            case 6:return 'Jun';break;
            case 7:return 'Jul';break;
            case 8:return 'Aug';break;
            case 9:return 'Sep';break;
            case 10:return 'Oct';break;
            case 11:return 'Nov';break;
            case 12:return 'Dec';break;
        }
    }

//date format -----------------
    function dateFormatx(typ,d,m,y){
        if(typ=='id') // 25 Dec 2014
            return d+' '+m+' '+y;
        else // 2014-12-25
            return y+'-'+m+'-'+d;
    }

//global u/ tanggal --------
    var now  = new Date();
    var dd   = now.getDate();
    var mm   = now.getMonth()+1;
    var yyyy = now.getFullYear();

//tanggal terakhir : dd
    function lastDate(m,y){
        return 32 - new Date(y, (m-1), 32).getDate();
    }
// tanggal hari ini : dd mm yyyy
    function getToday() {
        // function addLeadingZeros (n, length){
        return dateFormatx('id',lpadZero(dd,2),monthFormat(mm),yyyy);
    }
// tanggal pertama bulan ini : dd mm yyyy 
    function getFirstDate() {
        return dateFormatx('id','01',monthFormat(mm),yyyy);
    }
// tanggal terakhir bulan ini  : dd mm yyyy
    function getLastDate() {
        var dd = lastDate(mm,yyyy);
        return dateFormatx('id',dd,monthFormat(mm),yyyy);
    }
// ajax jquery (mode : asyncronous) ---
    function ajax(u,d){
        return $.ajax({
            url:u,
            data:d,
            type:'post',
            dataType:'json'
        });
    }

// ajax jquery (mode : syncronous) -----
    function sjax(u,d) {
        var ret;
        $.ajax({
            url:u,
            data:d,
            async:false,
            type:'post',
            dataType:'json',
            success:function(res){ret = res;}
        });return ret;
    }