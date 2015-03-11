var mnu       ='sirkulasi'; 
var mnu2      ='lokasi'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';

var pinjam_contentFR = k_contentFR = b_contentFR ='';
// main function load first 
    $(document).ready(function(){
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

            //Dialog Pinjam
        pinjam_contentFR +='<div style="overflow:scroll;height:500px;">'
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
                                                +'<select  name="memberTB" id="memberTB"></select>'
                                            +'</div>'
                                            +'<div class="input-control text size4">'
                                                +'<input placeholder="ID atau Nama Peminjam" id="peminjamTB">'
                                                +'<button class="btn-clear"></button>'
                                            +'</div>'
                                                +'<img id="b_photoIMG" src="../img/no_image.jpg" width="100" class="shadow" align="center">'
                                        // '<table>'
                                        //     +'<tr>'
                                        //           +'<td>Nama</td>'
                                        //         +'<td>: <b id="namaTD">Nama</b></td>'

                                        //     +'</tr>'
                                        //     +'<tr>'
                                        //         +'<td>No. Pendaftaran</td>'
                                        //         +'<td>: <span id="nopendaftaranTD"></span></td>'
                                        //     +'</tr>'
                                        //     +'<tr>'
                                        //         +'<td colspan="2">sebagai siswa aktif pada </td>'
                                        //     +'</tr>'
                                        //     +'<tr>'
                                        //         +'<td>Departemen</td>'
                                        //         +'<td>: <span id="departemenTD"></span></td>'
                                        //     +'</tr>'
                                        //     +'<tr>'
                                        //         +'<td>Angkatan</td>'
                                        //         +'<td>: <span id="angkatanTD"></span></td>'
                                        //     +'</tr>'
                                        // +'</table>'                                        
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

        cmblokasi();

    // button action
        //add ---
        $("#peminjamanBC").on('click', function(){ 
            pinjamFR('');
        });
        //print ---
        $('#ju_cetakBC').on('click',function(){
            printPDF('grup');
        });

        $("#statistik").on('click', function(){
            statistikVW();
        });

        //search ---
        $('#memberS').keydown(function (e){
            if(e.keyCode == 13)
                sirkulasiVW();
        });
        $('#barcodeS').keydown(function (e){
            if(e.keyCode == 13)
                sirkulasiVW();
        });$('#judulS').keydown(function (e){
            if(e.keyCode == 13)
                sirkulasiVW();
        });$('#s_judulS').keydown(function (e){
            if(e.keyCode == 13)
                statistikVW();
        });$('#klasifikasiS').keydown(function (e){
            if(e.keyCode == 13)
                statistikVW();
        });
        $('#pengarangS').keydown(function (e){
            if(e.keyCode == 13)
                statistikVW();
        });
        $('#penerbitS').keydown(function (e){
            if(e.keyCode == 13)
                statistikVW();
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
            $('#cari_sirkulasiTR').toggle('slow');
            $('#memberS').val('');
            $('#barcodeS').val('');
            $('#judulS').val('');
        });
        $('#cari_statistikBC').on('click',function(){
            $('#cari_statistikTR').toggle('slow');
            $('#s_judulS').val('');
            $('#klasifikasiS').val('');
            $('#pengarangS').val('');
            $('#penerbitS').val('');
        });

        // default tampilkan jurnal umum 
        sirkulasiVW();
    }); 
// end of main function ---------

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

                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.statistik, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }
                $('#statistikS').html(out);
                // statistikVW();
            }
        });
    }

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
                    });(dt.lokasi[0].replid);
                    // $('#barangTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+dt.lokasi[0].replid);
                }$('#lokasiS').html(out);
            }
        });
    }
//end of combo departemen ---

// load form (all)
    function loadFR(titl,cont,inpArr){        
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                $.Dialog.title(titl+' '+mnu); 
                $.Dialog.content(cont);
                  
                if(inpArr!=null){ // main form : set value fields 
                    $.each(inpArr,function (id,item) {
                       $('#'+id).val(item);
                    });
                }
                // if(rekN>0){// detail form
                //     setTimeout(function(){
                //         $('#ju_rekTBL').append(rekTR(rekN));
                //         autosuggest(pre,rekN);
                //         // autosuggest(cgArr);
                //     },500);
                // }
            }
        });
    }

/* form peminjaman (add & edit) */
    function pinjamFR(id){
        if(id!=''){ // edit mode
            
        }else{ // add  mode
            var titl   ='<i class="icon-plus-2"></i> Tambah ';
            var inpArr ={"tgl_pinjamTB":getToday(),"tgl_kembaliTB":getLastDate};
            loadFR(titl,pinjam_contentFR,inpArr);
        }

        //autocomplete
        $("#judulTB").combogrid({
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
            url: dir+'?aksi=autocomp&subaksi=judul',
            select: function( event, ui ) { // event setelah data terpilih 
                barangAdd(ui.item.replid,ui.item.barkode,ui.item.judul);
                $('#judulTB').combogrid( "option", "url", dir+'?aksi=autocomp&subaksi=judul&lokasi='+$('#lokasiS').val()+'&barang='+barangArr() );
                return false;
            }
        }); //End autocomplete

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
            var tr ='<tr class="warning"><td colspan="3" class="text-center">Silahkan pilih Judul Buku ..</td></tr>';
            if($('#barangTBL').html()=='')
                $('#barangTBL').html(tr);
            else
                $('#barangTBL').html('');
        }
    //end of barang record kosong --

    // pilih barang yg akan dipinjam ---
        function barangAdd (id,barkode,judul) {
            var tr ='<tr val="'+id+'" class="barangTR" id="barangTR_'+id+'">'
                        +'<td>'+barkode+'</td>'
                        +'<td>'+judul+'</td>'
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

/*view*/
    // Sirkulasi ---
        function sirkulasiVW(){  
            var aksi ='aksi=tampil&subaksi=sirkulasi';
            var cari ='&memberS='+$('#memberS').val()
                     +'&barcodeS='+$('#barcodeS').val();
                     +'&judulS='+$('#judulS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#sirkulasi_tbody').html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    setTimeout(function(){
                        $('#sirkulasi_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }

        function statistikVW(){  
            var aksi ='aksi=tampil&subaksi=statistik';
            var cari ='&s_judulS='+$('#s_judulS').val()
                     +'&klasifikasiS='+$('#klasifikasiS').val();
                     +'&pengarangS='+$('#pengarangS').val();
                     +'&penerbitS='+$('#penerbitS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#statistik_tbody').html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    setTimeout(function(){
                        $('#statistik_tbody').html(dt).fadeIn();
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
    //jurnal umum  ---
    function juSV(e){
        var url  = dir;
        var data = $(e).serialize()+'&aksi=simpan&subaksi=ju';
        // edit mode
        if($('#ju_idformH').val()!='')
            url += '&replid='+$('#ju_idformH').val();
        // alert(ajaxFC(url,'post','json',data));
        var exec = ajaxFC(url,'post','json',data);
        alert();
        // if(exec){
        //     res=exec.status;
        // }else{
        //     notif()
        // }            

        
        // $.ajax({
        //     url:dir,
        //     cache:false,
        //     type:'post',
        //     dataType:'json',
        //     data:$('form').serialize()+urlx,
        //     success:function(dt){
        //         if(dt.status!='sukses'){
        //             cont = 'Gagal menyimpan data';
        //             clr  = 'red';
        //         }else{
        //             $.Dialog.close();
        //             gkosongkan();
        //             vwGrup($('#g_lokasiS').val());
        //             cont = 'Berhasil menyimpan data';
        //             clr  = 'green';
        //         }notif(cont,clr);
        //     }
        // });
        // return false;
    }


/*delete*/
    //jurnal umum   ---
        function juDel(id){
            if(confirm('melanjutkan untuk menghapus data?'))
            $.ajax({
                url:dir,
                type:'post',
                data:'aksi=hapus&subaksi=grup&replid='+id,
                dataType:'json',
                success:function(dt){
                    var cont,clr;
                    if(dt.status!='sukses'){
                        cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                        clr  ='red';
                    }else{
                        vwGrup($('#g_lokasiS').val());
                        cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                        clr  ='green';
                    }notif(cont,clr);
                }
            });
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

        
