var mnu       ='sirkulasi'; 
var mnu2      ='lokasi'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';

var pinjam_contentFR = kembalikan_contentFR = kembali_contentFR = contentFR ='';
var pinjamArr= kembaliArr =[];
// main function load first 
    $(document).ready(function(){

        // $('#lokasiTB').on('focus',function(){
        //     autoSug($('#judulTB'),$(this).val());
        // });        

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
                                // +'<input placeholder="Barcode atau Judul item" id="judulTB">'
                                +'<input placeholder="Barcode atau Judul item" id="judulTB" onfocus="autoSug(\'judul\',\'pinjam\',\'\',$(\'#lokasiTB\').val())">'
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
                                +'<tbody id="bukuTBL">'
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
                                                    +'<option value="1">Siswa</option>'
                                                    +'<option value="2">Guru</option>'
                                                    +'<option value="3">Member Luar</option>'
                                                +'</select>'
                                            +'</div>'
                                            +'<div class="input-control text size4">'
                                                +'<input placeholder="ID atau Nama Peminjam" id="peminjamTB" onfocus="autoSug(\'peminjam\',\'pilihan\',$(\'#tipeTB\').val(),\'\')">'
                                                +'<button class="btn-clear"></button>'
                                            +'</div>'
                                                +'<img id="b_photoIMG" src="../img/no_image.jpg" width="100" class="shadow" align="center">'
                                        +'<table class="table hovered bordered striped">'
                                            // +'<tr>'
                                            //     +'<td colspan="2"><b id="namaTD"></b></td>'
                                            //     // +'<td>: <b id="namaTD"></b></td>'

                                            // +'</tr>'
                                            +'<tr>'
                                                +'<td>ID Member</td>'
                                                +'<td>: <span id="idmemberTB"></span></td>'
                                            +'</tr>'
                                                +'<td>Tipe Member</td>'
                                                +'<td>: <span id="tipememberTB"></span></td>'
                                            +'</tr>'                                            // +'<thead>'
                                            +'</table>'                                            // +'<thead>'
                                            //     +'<tr style="color:white;"class="info">'
                                            //         +'<th width="100" class="text-center">ID Member</th>'
                                            //     +'</tr>'
                                            //     +'<tr style="color:white;"class="info">'
                                            //         +'<th width="100"class="text-center">Tipe Member<</th>'
                                            //     +'</tr>'
                                            // +'</thead>'
                                            // +'<tbody id="memberTBL">'
                                            // +'</tbody>'
                                            //     // +'<tr class="warning"><td colspan="3" class="text-center">Silahkan pilih barang.. </td></tr>'
                                            // +'<tfoot>'
                                            // +'</tfoot>'

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
                                    // +'<div class="row">'
                                    //     +'<div class="span5"> '
                                    //     '<table>'
                                    //         +'<tr>'
                                    //               +'<td>Nama</td>'
                                    //             +'<td>: <b id="namaTD"></b></td>'

                                    //         +'</tr>'
                                    //         +'<tr>'
                                    //             +'<td>No. Pendaftaran</td>'
                                    //             +'<td>: <span id="nopendaftaranTD"></span></td>'
                                    //         +'</tr>'
                                    //     +'</table>'    
                                    //     +'</div>'
                                    //     +'<div class="span5"> '

                                    //     +'</div>' //end span
                                    // +'</div>'//end row
                                    

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
                                +'<input type="hidden" id="subaksiH">'
                           +'<legend>Daftar item yang dikembalikan</legend>'
                            +'<label>Lokasi</label>'
                            +'<div class="input-control select span4">'
                                +'<select  name="k_lokasiTB" id="k_lokasiTB"></select>'
                            +'</div><br>'
                            +'<div class="input-control text size4">'
                                // +'<input placeholder="Barcode atau Judul item" id="k_judulTB" onfocus="autoSug(\'k_judul\',\'kembali\',9)">'
                                +'<input placeholder="Barcode atau Judul item" id="k_judulTB" onfocus="autoSug(\'k_judul\',\'kembali\',\'\',$(\'#k_lokasiTB\').val())">'
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

        $("#statistik").on('change', function(){
            // autoSug($('#labelTB'),$(this).val());
        });

        //search sirkulasi---
        $('#memberS,#barkodeS,#judulS').on('keydown',function (e){ 
            if(e.keyCode == 13)  viewTB('sirkulasi');
        });
        
        //search statistik---
        $('#s_judulS,#klasifikasiS,#pengarangS,#penerbitS').on('keydown',function (e){ 
            if(e.keyCode == 13)  viewTB('statistik');
        });
        $('#lokasiS').on('change',function(){
            viewTB('statistik');
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
                        $('#k_lokasiTB').html(out);
                        // autoSug($('#judulTB'),$('#lokasiTB').val());
                    } 
                }
            }
        });
    }

// load form (all)
    function loadFR(typx,id){        
                        // console.log(typx); return false;
                    console.log(typx);
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 800,
            padding: 10,
            onShow: function(){
                setTimeout(function(){
                    $('#idformH').val(typx);
                    $('#subaksiH').val(typx);
                    if (typx=='pinjam') {

                        // autoSug('judul','pinjam',$('#lokasiTB').val());
                        contentFR=pinjam_contentFR;
                            
                        if (id=='') { //add
                            titl = ' Tambah Peminjaman';
                            cmblokasi();
                            $('#tgl_pinjamTB').val(getToday());
                            $('#tgl_kembaliTB').val(getLastDate());


                        }else{
                            titl = ' Ubah Peminjaman';

                        }
                    } 
                    else if (typx=='kembali') {
                        contentFR=kembali_contentFR;
                        // autoSug('k_judul','kembali',$('#k_lokasiTB').val());

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

    function autoSug(el,subaksi,tipe,opsi){
        // console.log(subaksi);
        if(subaksi=='pinjam'){ //rekening
            var urlx= '?aksi=autocomp&subaksi=pinjam&lokasi='+opsi;
            var col = [{
                    'align':'left',
                    'columnName':'barkode',
                    'hide':true,
                    'width':'40',
                    'label':'Barkode'
                },{   
                    'align':'left',
                    'columnName':'judul',
                    'width':'50',
                    'label':'Judul'
            }];
        }else if(subaksi=='kembali'){
            var urlx= '?aksi=autocomp&subaksi=kembali&lokasi'+opsi;
            var col = [{
                    'align':'left',
                    'columnName':'barkode',
                    'hide':true,
                    'width':'35',
                    'label':'Barkode'
                },{   
                    'align':'left',
                    'columnName':'judul',
                    'width':'40',
                    'label':'Judul'
            }];

        }else if(subaksi=='pilihan'){
            if(tipe==1){
                var urlx= '?aksi=autocomp&subaksi=pilihan&tipe=1&lokasi'+opsi;
                var col = [{
                        'align':'left',
                        'columnName':'nis',
                        'hide':true,
                        'width':'15',
                        'label':'Nis'
                    },{   
                        'align':'left',
                        'columnName':'nama',
                        'width':'40',
                        'label':'Nama'
                    }
                    // {   
                    //     'align':'left',
                    //     'columnName':'departemen',
                    //     'width':'25',
                    //     'label':'Departemen'
                    // },{   
                    //     'align':'left',
                    //     'columnName':'tingkat',
                    //     'width':'20',
                    //     'label':'Tingkat'
                    // },{   
                    //     'align':'left',
                    //     'columnName':'kelas',
                    //     'width':'10',
                    //     'label':'Kelas'
                    // }
                    ];
            }else if (tipe==2) {
                var urlx= '?aksi=autocomp&subaksi=pilihan&tipe=2&lokasi'+opsi;
                var col = [{
                        'align':'left',
                        'columnName':'nip',
                        'hide':true,
                        'width':'35',
                        'label':'Nip'
                    },{   
                        'align':'left',
                        'columnName':'nama',
                        'width':'40',
                        'label':'Nama'
                }];
            }else if (tipe==3) {
                var urlx= '?aksi=autocomp&subaksi=pilihan&tipe=3&lokasi'+opsi;
                var col = [{
                        'align':'left',
                        'columnName':'nid',
                        'hide':true,
                        'width':'35',
                        'label':'ID Member'
                    },{   
                        'align':'left',
                        'columnName':'nama',
                        'width':'40',
                        'label':'Nama'
                }];

            }
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
            width:'700px',
            colModel : col,
            url: urly+terpilihx,
            select: function( event, ui ) { // event setelah data terpilih 

                $('#'+el+'H').val(ui.item.replid);
                if (subaksi=='pinjam') {
                    bukuAdd (ui.item.replid,ui.item.barkode,ui.item.judul);
                    // collectArr();
                    // $('#'+el+'TB').val(ui.item.barkode);
                    // $('#'+el+'TB').val(ui.item.judul);
                }else if (subaksi=='kembali'){
                    //untuk multi kalau untuk siswa tanpa add
                    kembaliAdd (ui.item.replid,ui.item.barkode,ui.item.judul);
                    // $('#'+el+'TB').val(ui.item.judul);
                }else if (subaksi=='pilihan') {
                    // siswaAdd (ui.item.replid,ui.item.nis,ui.item.nama,ui.item.departemen);
                    if (tipe==1) {
                        
                        // $('#idmemberTB').val(ui.item.nis);
                        // $('#tipememberTB').val(ui.item.nama);
                        $('#'+el+'TB').html(ui.item.nis);
                        $('#'+el+'TB').html(ui.item.nama);
                        // $('#'+el+'TB').html(ui.item.departemen);
                        // $('#'+el+'TB').html(ui.item.tingkat);
                        // $('#'+el+'TB').html(ui.item.kelas);
                    }
                    else if (tipe==2) {
                        $('#'+el+'TB').html(ui.item.nip);
                        $('#'+el+'TB').html(ui.item.nama);
                    }
                    else if (tipe==3) {
                        $('#'+el+'TB').html(ui.item.nid);
                        $('#'+el+'TB').html(ui.item.nama);
                    }

                }
                return false;
            }
        }); //End autocomplete
    }

   function collectArr(typx){
        // pinjamArr=[];
        // kembaliArr=[];
        // console.log($('#subaksiH').val())
        // if($('#subaksiH').val()=='kembali'){ // Pengembalian
        if(typx=='kembali'){ // Pengembalian
            console.log('masuk pengembalian ');
            $('.kembaliTR').each(function(id,item){
                kembaliArr.push($(this).val());
                console.log($(this).val());
            });
            console.log(kembaliArr);
            return kembaliArr;
        }else{ // peminjaman
            console.log('masuk peminjaman');
            $('.bukuTR').each(function(id,item){
                pinjamArr.push($(this).attr('val'));
                console.log($(this).val());
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
        function bukuAdd (id,barkode,judul) {
            var tr ='<tr val="'+id+'" class="bukuTR" id="bukuTR_'+id+'">'
                        +'<td>'+barkode+'</td>'
                        +'<td>'+judul+'</td>'
                        +'<td><button onclick="bukuDel('+id+');"><i class="icon-remove"></button></i></td>'
                    +'</tr>';
            $('#bukuTBL').prepend(tr); 

            $('#judulTB').combogrid( "option", "url", dir+'?aksi=autocomp&subaksi=pinjam&lokasi='+$('#lokasiTB').val()+'&pinjamArr='+collectArr('pinjam').toString() );
            // $('#k_judulTB').combogrid( "option", "url", dir+'?aksi=autocomp&subaksi=kembali&lokasi='+$('#k_lokasiTB').val()+'&kembaliArr='+collectArr().toString() );
        }        

        function kembaliDel(id){
            $('#kembaliTR_'+id).fadeOut('slow',function(){
                $('#kembaliTR_'+id).remove();
                // barangExist();
                collectArr();
                console.log('arr terpilih in kembaliDel=>'+kembaliArr);
            });
        }

        function kembaliAdd (id,barkode,judul) {
            var tr ='<tr val="'+id+'" class="kembaliTR" id="kembaliTR_'+id+'">'
                        +'<td>'+barkode+'</td>'
                        +'<td>'+judul+'</td>'
                        +'<td><button onclick="kembaliDel('+id+');"><i class="icon-remove"></button></i></td>'
                    +'</tr>';
            $('#kembaliTBL').prepend(tr); 

            $('#k_judulTB').combogrid( "option", "url", dir+'?aksi=autocomp&subaksi=kembali&lokasi='+$('#k_lokasiTB').val()+'&kembaliArr='+collectArr('kembali').toString() );

        }
        // function siswadd (id,nis,nama) {
        //     var tr ='<tr val="'+id+'" class="siswaTR" id="siswaTR_'+id+'">'
        //                 +'<td>'+nis+'</td>'
        //             +'</tr>'
        //             +'<tr>'
        //                 +'<td>'+nama+'</td>'
        //             +'</tr>';
        //     $('#memberTBL').prepend(tr); 

        //     $('#peminjamTB').combogrid( "option", "url", dir+'?aksi=autocomp&subaksi=siswa&tipe='+$('#tipeTB').val() );
        // }
        


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