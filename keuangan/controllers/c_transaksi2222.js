var mnu       ='transaksi'; 
var mnu2      ='lokasi'; 
var mnu3      ='katalog'; 
var mnu4      ='jenis'; 
var mnu5      ='barang'; 
var mnu6      ='kondisi'; 
var mnu7      ='tempat'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';
var dir3      ='models/m_'+mnu3+'.php';
var dir4      ='models/m_'+mnu4+'.php';
var dir5      ='models/m_'+mnu5+'.php';
var dir6      ='models/m_'+mnu6+'.php';
var dir7      ='models/m_'+mnu7+'.php'; 

var ju_contentFR = k_contentFR = b_contentFR ='';
    
// main function ---
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
        //form content
            // grup
            ju_contentFR =+'<tr>'
                            +'<td><input id="ju_rek1TB" type="text" /></td>'
                            +'<td><input type="text" /></td>'
                            +'<td><input type="text" /></td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td><input  id="ju_rek2TB" type="text" /></td>'
                            +'<td><input type="text" /></td>'
                            +'<td><input type="text" /></td>'
                        +'</tr>'
                        +'<tr>'
                            +'<td><input value="asem"  id="ju_rek3TB" type="text" /></td>'
                            +'<td><input type="text" /></td>'
                            +'<td><input type="text" /></td>'
                        +'</tr>';
            // ju_contentFR += '<form style="overflow:scroll;height:600px;" autocomplete="off" onsubmit="juSV(); return false;" id="'+mnu+'FR">' 
            //                 +'<input id="g_idformH" type="hidden">' 
            //                 +'<input  type="hidden" name="g_lokasiH" id="g_lokasiH" class="span2">'
                            
            //                 +'<label>No. Jurnal</label>'
            //                 +'<div class="input-control text">'
            //                     +'<input disabled="disabled" name="ju_nomerTB" id="ju_nomerTB" class="span2">'
            //                     +'<button class="btn-clear"></button>'
            //                 +'</div>'
                            
            //                 +'<label>No. Bukti </label>'
            //                 +'<div class="input-control text">'
            //                     +'<input placeholder="no bukti" name="ju_nobuktiTB" id="ju_nobuktiTB" class="span1">'
            //                     +'<button class="btn-clear"></button>'
            //                 +'</div>'
                            
            //                 +'<label>Tanggal</label>'
            //                 +'<div class="input-control text span2" data-role="datepicker" data-format="dd mmmm yyyy" data-position="top" data-effect="slide">'
            //                     +'<input type="text" id="ju_tanggalTB">'
            //                     +'<button class="btn-date"></button>'
            //                 +'</div>'

            //                 +'<label>Uraian</label>'
            //                 +'<div class="input-control textarea">'
            //                     +'<textarea placeholder="uraian" name="ju_uraianTB" id="ju_uraianTB"></textarea>'
            //                 +'</div>'

            //                 //rek. perkiraan 
            //                 +'<legend>Rekening :</legend>'
            //                 +'<table class="table hovered bordered striped">'
            //                     +'<thead>'
            //                         +'<tr style="color:white;"class="info">'
            //                             +'<th class="text-center">Rek Perkiraan</th>'
            //                             +'<th class="text-center">Debet</th>'
            //                             +'<th class="text-center">Kredit</th>'
            //                         +'</tr>'
            //                     +'</thead>'
            //                     +'<tbody id="ju_rekTBL">'
            //                         +'<tr>'
            //                             +'<td><input id="ju_rek1TB" type="text" /></td>'
            //                             +'<td><input type="text" /></td>'
            //                             +'<td><input type="text" /></td>'
            //                         +'</tr>'
            //                         +'<tr>'
            //                             +'<td><input  id="ju_rek2TB" type="text" /></td>'
            //                             +'<td><input type="text" /></td>'
            //                             +'<td><input type="text" /></td>'
            //                         +'</tr>'
            //                         +'<tr>'
            //                             +'<td><input  id="ju_rek3TB" type="text" /></td>'
            //                             +'<td><input type="text" /></td>'
            //                             +'<td><input type="text" /></td>'
            //                         +'</tr>'
            //                         +'<tr>'
            //                             +'<td><input type="text" /></td>'
            //                             +'<td><input type="text" /></td>'
            //                             +'<td><input type="text" /></td>'
            //                         +'</tr>'
            //                     +'</tbody>'
            //                     +'<tfoot id="legendDet">'
            //                     +'</tfoot>'
            //                 +'</table>'

            //                 +'<div class="form-actions">' 
            //                     +'<button class="button primary">simpan</button>&nbsp;'
            //                     +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
            //                 +'</div>'
            //             +'</form>';

        // button action
            //add---------
            $("#ju_addBC").on('click', function(){ juFR('');});

            //print----
            $('#g_cetakBC').on('click',function(){
                printPDF('grup');
            });$('#k_cetakBC').on('click',function(){
                printPDF('katalog');
            });$('#b_cetakBC').on('click',function(){
                printPDF('barang');
            });

            // search 
            //ju----
            $('#juBC').on('click',function(){
                $('#juTR').toggle('slow');
                $('#g_kodeS').val('');
                $('#g_udipinjamS').val('');
                $('#g_keteranganS').val('');
            });
            //katalog----
            $('#k_cariBC').on('click',function(){
                $('#k_cariTR').toggle('slow');
                $('#k_kodeS').val('');
                $('#k_namaS').val('');
                $('#k_keteranganS').val('');
            });
            // barang----
            $('#b_cariBC').on('click',function(){
                $('#b_cariTR').toggle('slow').addClass('info').setTimeout(function(){
                    $('#b_cariTR').removeClass('info');
                },2000);
                $('#b_kodeS').val('');
                $('#b_barkodeS').val('');
                $('#b_namaS').val('');
                $('#b_keteranganS').val('');
            });

        //search action 
            // grup barang
            $('#g_lokasiS').on('change',function (e){ // lokasi
                vwGrup($('#g_lokasiS').val());
            });
            $('#ju_noS,#ju_uraianS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13) juVW();
            });

            // katalog barang
            $('#k_kodeS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13)
                    vwKatalog($('#k_grupS').val());
            });$('#k_namaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwKatalog($('#k_grupS').val());
            });$('#k_keteranganS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwKatalog($('#k_grupS').val());
            });

            // unit barang
            $('#b_kondisiS').on('change',function(){
                vwBarang($('#b_katalogS').val());
            });
            $('#b_kodeS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogS').val());
            });$('#b_namaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogS').val());
            });$('#b_barkodeS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogS').val());
            });$('#b_sumberS').on('change',function (){ // nama grup
                vwBarang($('#b_katalogS').val());
            });$('#b_hargaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogS').val());
            });$('#b_kondisiS').on('change',function (){ // nama grup
                vwBarang($('#b_katalogS').val());
            });$('#b_statusS').on('change',function (){ // nama grup
                vwBarang($('#b_katalogS').val());
            });$('#b_keteranganS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogS').val());
            });

        // set default this month
            $('#tgl1TB').val(getFirstDate());
            $('#tgl2TB').val(getLastDate());
        // jurnal umum :: tampilkan detail jurnal
            $('#ju_detiljurnalCB').on('click',function(){
                $('.uraianCOL').toggle();
            });
        // default tampilkan jurnal umum 
            juVW();
    }); 
// end of main function ---------
    
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
//end of get month format -----

//date format -----------------
    function dateFormatx(typ,d,m,y){
        if(typ=='id') // 25 Dec 2014
            return d+' '+m+' '+y;
        else // 2014-12-25
            return y+'-'+m+'-'+d;
    }
//end of date format ----------

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
        return dateFormatx('id',dd,monthFormat(mm),yyyy);
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

/*view*/
    // ju ---
        function juVW(){  
            var aksi ='aksi=tampil&subaksi=ju';
            var cari ='&ju_noS='+$('#ju_noS').val()
                     +'&ju_uraianS='+$('#ju_uraianS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#ju_tbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    setTimeout(function(){
                        $('#ju_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }
    // end of grup  ---

    // katalog barang
        function vwKatalog(id) {
            var aksi ='aksi=tampil&subaksi=katalog&k_grupS='+id;
            var cari ='&k_kodeS='+$('#k_kodeS').val()
                    +'&k_namaS='+$('#k_namaS').val()
                    +'&k_keteranganS='+$('#k_keteranganS').val();
                    // alert(aksi+cari);
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#katalog_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    $('#k_grupS').val(id);
                    switchPN(2);
                    vwHeadKatalog(id);
                    setTimeout(function(){
                        $('#katalog_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }   
    //end of  katalog barang

    // barang
        function vwBarang(id) {
            switchPN(3);
            var aksi ='aksi=tampil&subaksi=barang&b_katalogS='+id;
            var cari ='&b_kodeS='+$('#b_kodeS').val()
                    +'&b_barkodeS='+$('#b_barkodeS').val()
                    +'&b_hargaS='+$('#b_hargaS').val()
                    +'&b_sumberS='+$('#b_sumberS').val()
                    +'&b_kondisiS='+$('#b_kondisiS').val()
                    +'&b_statusS='+$('#b_statusS').val()
                    +'&b_keteranganS='+$('#b_keteranganS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#barang_tbody').html('<tr><td align="center" colspan="9"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    $('#b_katalogS').val(id);
                    vwHeadBarang(id);
                    switchPN(3);
                    setTimeout(function(){
                        $('#barang_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }   
    //end of barang

/*save (insert & update)*/
    //grup ---
        function grupSV(){
            return false;
            var urlx ='&aksi=simpan&subaksi=grup';
            // edit mode
            if($('#g_idformH').val()!=''){
                urlx += '&replid='+$('#g_idformH').val();
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
                        gkosongkan();
                        vwGrup($('#g_lokasiS').val());
                        cont = 'Berhasil menyimpan data';
                        clr  = 'green';
                    }notif(cont,clr);
                }
            });
        }
    //end grup  ---

    //barang ---
        function barangSV(){
            var urlx ='&aksi=simpan&subaksi=barang';
            // edit mode
            if($('#b_idformH').val()!='')
                urlx += '&replid='+$('#b_idformH').val();

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
                        kkosongkan();
                        vwBarang($('#b_katalogS').val());
                        cont = 'Berhasil menyimpan data';
                        clr  = 'green';
                    }notif(cont,clr);
                }
            });
        }
    //end of barang ---

    //katalog  ---
        //preview image sebelum upload -------
            function PreviewImage(e){
                var typex   = e.files[0].type;
                var sizex   = e.files[0].size;
                var namex   = e.files[0].name;
                
                if(typex =='image/png'||typex =='image/jpg'||typex =='image/jpeg'|| typex =='image/gif'){ //validasi format
                    if(sizex>(900*900)){ //validasi size
                        notif('ukuran max 1 MB','red');
                        $(e).val('');
                        return false;   
                    }else{ 
                        $('#previmg').attr('src','../img/w8loader.gif');
                        var reader = new FileReader();
                        reader.readAsDataURL(e.files[0]);
            
                        reader.onload = function (oFREvent){
                            var urlx  = oFREvent.target.result;
                            setTimeout(function(){
                                $('#previmg').attr('src',urlx);//.removeAttr('style');
                            },1000);
                        };
                    }
                }else{ // format salah
                    $('#previmg').attr('src','<img src="../img/loader.gif">');
                    $(e).val('');
                    notif('hanya format gambar(jpeg,jpg,png)','red');
                    return false;
                }
            };
        //end of preview image sebelum upload -------

        // submit katalog ---------------------------
            function katalogSV () {
                //add image
                var files =new Array();
                $("input:file").each(function() {
                    files.push($(this).get(0).files[0]); 
                });
                 
                // Create a formdata object and add the files
                var filesAdd = new FormData();
                $.each(files, function(key, value){
                    filesAdd.append(key, value);
                });

                if($('#k_photoTB').val()=='')//upload
                    katalogDb('');
                else// ga upload
                    katalogUp(filesAdd);
            }
        //end of submit katalog ---------------------------

        // upload image
            function katalogUp(dataAdd){
                $.ajax({
                    url: dir+'?upload',
                    type: 'POST',
                    data: dataAdd,
                    cache: false,
                    dataType: 'json',
                    processData: false,// Don't process the files
                    contentType: false,//Set content type to false as jq 'll tell the server its a query string request
                    success: function(data, textStatus, jqXHR){
                        if(data.status == 'sukses'){ //gak error
                            katalogDb(data);
                        }else{ //error
                            notif(data.status,'red');
                        }
                    },error: function(jqXHR, textStatus, errorThrown){
                        notif('error'+textStatus,'red');// $('#loadarea').html('<img src="../img/loader.gif"> ').fadeOut();
                    }
                });
            }
        //end of upload image

        // simpan ke database
            function katalogDb(filex){
                var formData = $('#katalogFR').serialize();
                if($('#k_idformH').val()!=''){
                    formData +='&replid='+$('#k_idformH').val();
                }

                if(filex!=''){// ada upload file nya
                    formData +='&file='+filex.file ;	
                    if($('#k_photoH').val()!=''){
                    	formData+='&photo_asal='+$('#k_photoH').val();
                    }
                }
                // alert(formData);return false;
                $.ajax({
                    url: dir,
                    type:'POST',
                    data:formData+'&aksi=simpan&subaksi=katalog',
                    cache:false,
                    dataType: 'json',
                    success: function(data, textStatus, jqXHR){
                        if(data.status != 'sukses')
                           notif(data.status,'red');
                        else
                           notif(data.status,'green'); 
                    },error: function(jqXHR, textStatus, errorThrown){
                        console.log('ERRORS savedata2: ' + textStatus);
                    },complete: function(){
                        $.Dialog.close(); 
                        vwKatalog($('#k_grupS').val());
                        kkosongkan();
                    }
                });
            }
        // end of simpan ke database


/*delete*/
    //grup  ---
        function grupDel(id){
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
    //end of grup ---
    
    
    
    function ajaxFC(u,t,dt,d){
        var ret=$.ajax({
            url:u,
            type:t,
            dataType:dt,
            data:d,
            success:function(res){
                return res;
            }
        });
        // return ret;
        // alert(ret);
        console.log(ret.responseJSON);
    }

    function juFR (id) {
        var data='aksi=ambiledit&subaksi=ju&replid='+id;
        var out = ajaxFC('models/m_transaksi.php','post','json',data);
        // console.log(out.datax.tanggal);
        // output seharusnya : 2014-03-06
    }

    //     var nomerTB='',nobuktiTB='',tanggalTB='okok',uraianTB='';
    //     var cont = '<form style="overflow:scroll;height:600px;" autocomplete="off" onsubmit="juSV(); return false;" id="'+mnu+'FR">'
    //     if(id!=''){ //edit
    //     }else{ //add

    //     }
    //             cont+='<input value="'+tanggalTB+'" id="ju_idformH" type="text">' 
    //             +'<label>No. Jurnal</label>'
    //             +'<div class="input-control text">'
    //                 +'<input disabled="disabled" name="ju_nomerTB" id="ju_nomerTB" class="span2">'
    //                 +'<button class="btn-clear"></button>'
    //             +'</div>'
                
    //             +'<label>No. Bukti </label>'
    //             +'<div class="input-control text">'
    //                 +'<input placeholder="no bukti" name="ju_nobuktiTB" id="ju_nobuktiTB" class="span1">'
    //                 +'<button class="btn-clear"></button>'
    //             +'</div>'
                
    //             +'<label>Tanggal</label>'
    //             +'<div class="input-control text span2" data-role="datepicker" data-format="dd mmmm yyyy" data-position="top" data-effect="slide">'
    //                 +'<input type="text" value="'+tanggalTB+'" id="ju_tanggalTB">'
    //                 +'<button class="btn-date"></button>'
    //             +'</div>'

    //             +'<label>Uraian</label>'
    //             +'<div class="input-control textarea">'
    //                 +'<textarea placeholder="uraian" name="ju_uraianTB" id="ju_uraianTB"></textarea>'
    //             +'</div>'

    //             //rek. perkiraan 
    //             +'<legend>Rekening :</legend>'
    //             +'<table class="table hovered bordered striped">'
    //                 +'<thead>'
    //                     +'<tr style="color:white;"class="info">'
    //                         +'<th class="text-center">Rek Perkiraan</th>'
    //                         +'<th class="text-center">Debet</th>'
    //                         +'<th class="text-center">Kredit</th>'
    //                     +'</tr>'
    //                 +'</thead>'
    //                 +'<tbody id="ju_rekTBL">'
    //                     +ju_contentFR
    //                 +'</tbody>'
    //                 +'<tfoot id="legendDet">'
    //                 +'</tfoot>'
    //             +'</table>'

    //             +'<div class="form-actions">' 
    //                 +'<button class="button primary">simpan</button>&nbsp;'
    //                 +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
    //             +'</div>'
    //         +'</form>';
    //     // $('#ju_rek3TB').val('okokokokok');
    //     // var titlex;
    //     // if(id==''){ 
    //     //     titl='<span class="icon-plus-2"></span> Tambah ';
    //     // }else{
    //     //     titl='<span class="icon-pencil"></span> Ubah';
    //     //     $('#ju_nobuktiTB').val('999');
    //     // }           
    //     // autosuggest('ju_rek1TB');
    //     // alert($('#ju_rek3TB').val());
    //     loadDialog(' Jurnal Umum',cont);
    // }

        function autosuggest(el){
            $('#'+el).combogrid({
                debug:true,
                width:'400px',
                colModel: [{
                        'align':'left',
                        'columnName':'kode',
                        'hide':true,
                        'width':'55',
                        'label':'kode'
                    },{   
                        'columnName':'nama',
                        'width':'40',
                        'label':'Barang'
                    }],
                url: dir+'?aksi=autocomp&lokasi=',
                select: function( event, ui ) { // event setelah data terpilih 
                    alert(ui.item.replid);
                    // barangAdd(ui.item.replid,ui.item.kode,ui.item.nama);
                    // $('#barangTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiS').val()+'&barang='+barangArr() );
                    return false;
                }
            });
        }

    //load modal/dialog (edit/add form)
        function loadDialog(title,content){
            $.Dialog({
                shadow: true,
                overlay: true,
                draggable: true,
                width: 500,
                padding: 10,
                onShow: function(){
                    $.Dialog.title(title);
                    $.Dialog.content(content);
                }
            });
        }

    // form katalog---
        function katalogFR(id){
            kkosongkan();
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
                        // form :: jenis  ----------------------------------------
                        $.ajax({
                            url:dir4,
                            data:'aksi=cmbjenis',
                            type:'post',
                            dataType:'json',
                            success:function(dt){
                                var opt='';
                                $.each(dt.jenis,function(id,item){
                                    opt+='<option value="'+item.replid+'">'+item.nama+'</option>';
                                });$('#k_jenisTB').html('<option value="">Pilih Jenis</option>'+opt);
                                $('#k_lokasiTB').val($('#k_lokasiDV').html());
                                $('#k_grupH2').val($('#k_grupS').val());
                                $('#k_grupTB').val($('#k_grupDV').html());
                            }
                        });// end of form :: lokasi (disabled)
                    }else{ // edit mode
                        titlex='<span class="icon-pencil"></span> Ubah';
                        // fetch katalog's data ------------------ 
                        $.ajax({
                            url:dir,
                            data:'aksi=ambiledit&subaksi=katalog&replid='+id,
                            type:'post',
                            dataType:'json',
                            success:function(dt){
                                if(dt.status!='sukses'){
                                    notif(dt.status,'red');
                                }else{
                                    $('#k_idformH').val(id);
                                    $('#k_grupH2').val($('#k_grupS').val());
                                    $('#k_lokasiTB').val($('#k_lokasiDV').html());
                                    $('#k_grupTB').val($('#k_grupDV').html());
                                    $('#k_kodeTB').val(dt.data.kode);
                                    $('#k_namaTB').val(dt.data.nama);
                                    $('#k_susutTB').val(dt.data.susut);
                                    $('#k_keteranganTB').val(dt.data.keterangan);
                                    var img;
                                    if(dt.data.photo2!='' && dt.data.photo2!=null){//ada gambar
                                        img='../img/upload/'+dt.data.photo2;
                                    }else{
                                        img='../img/no_image.jpg';
                                    }
                                    $('#previmg').attr('src',img);
                                    $('#k_photoH').val(dt.data.photo2);
                                    // combo jenis -----------------------
                                    $.ajax({
                                        url:dir4,
                                        type:'post',
                                        dataType:'json',
                                        data:'aksi=cmbjenis',
                                        success:function(dt2){
                                            if(dt2.status!='sukses'){
                                                notif(dt2.status, 'red');
                                            }else{
                                                var opt='';
                                                $.each(dt2.jenis,function(id,item){
                                                    if(dt.data.jenis==item.replid)
                                                        opt+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                                                    else
                                                        opt+='<option value="'+item.replid+'">'+item.nama+'</option>';
                                                });$('#k_jenisTB').html(opt);
                                            }
                                        }
                                    });// end of combo jenis -----------------------
                                }

                            }
                        });// end of fetch katalog's data ------------------ 
                    }$.Dialog.title(titlex+' '+mnu3); // edit by epiii
                    $.Dialog.content(k_contentFR);
                }
            });
        }
    // end of form katalog---

    // form barang---
        function barangFR(id){
            kkosongkan();
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
                        cmbkondisi('form','');
                        cmbtempat('');
                        vwHeadBarang($('#b_katalogS').val());
                    }else{ // edit mode
                        bkosongkan();
                        titlex='<span class="icon-pencil"></span> Ubah';
                        // fetch katalog's data ------------------ 
                        $.ajax({
                            url:dir,
                            data:'aksi=ambiledit&subaksi=barang&replid='+id,
                            type:'post',
                            dataType:'json',
                            success:function(dt){
                                if(dt.status!='sukses'){
                                    notif(dt.status,'red');
                                }else{
                                    // $('#b_tempatTB').focus();
                                    $('#b_katalogTB').val($('#b_katalogDV').html());
                                    $('.jumbarang').attr('style','display:none;');
                                    $('#b_idformH').val(id);
                                    $('#b_urutH').val(dt.data.urut);
                                    $('#b_katalogH2').val($('#b_katalogS').val());
                                    $('#b_barkodeTB').val(dt.data.barkode);
                                    $('#b_kodeTB').val(dt.data.kode);
                                    $('#b_hargaTB').val(dt.data.harga);
                                    $('#b_keteranganTB').val(dt.data.keterangan);
                                    $.each($('input[name="b_sumberTB"]'),function(){
                                        if(dt.data.sumber==$(this).val())
                                            $(this).attr('checked',true);
                                    });cmbkondisi('form',dt.data.kondisi);
                                    cmbtempat(dt.data.tempat);
                                }
                            }
                        });// end of fetch katalog's data ------------------ 
                    }$.Dialog.title(titlex+' '+mnu5);
                    $.Dialog.content(b_contentFR);
                }
            });
        }
    // end of form barang---

/*headinfo*/
    // katalog
        function vwHeadKatalog (id) {
            $.ajax({
                url:dir,
                type:'post',
                dataType:'json',
                data:'aksi=headinfo&subaksi=katalog&grup='+id,
                success:function (dt) {
                    if (dt.status!='sukses') {
                        alert(dt.status+' memuat data header');
                    }else{
                        $('#k_grupDV').html(dt.grup);
                        $('#k_lokasiDV').html(dt.lokasi);
                        $('#k_totasetDV').html('Rp. '+dt.totaset+',-');
                    }
                },
            });
        }
    //end of katalog

    // unit barang
        function vwHeadBarang (id) {
            $.ajax({
                url:dir,
                type:'post',
                dataType:'json',
                data:'aksi=headinfo&subaksi=barang&katalog='+id,
                success:function (dt) {
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                    }else{
                        $('#b_katalogDV').html(dt.data.katalog);
                        $('#b_grupDV').html(dt.data.grup);
                        $('#b_lokasiDV').html(dt.data.lokasi);
                        $('#b_totbarangDV').html(dt.data.totbarang+' unit');
                        $('#b_totasetDV').html('Rp. '+dt.data.totaset+',-');
                        $('#b_susutDV').html(dt.data.susut+' %');
                        $('#b_namaTB').html(dt.data.katalog);
                        var img;
                        if(dt.data.photo2!=''){
                            img='../img/upload/'+dt.data.photo2;
                        }else{
                            img='../img/no_image.jpg';
                        }
                        
                        $('#b_photoIMG').attr('src',img);

                        $('#b_katalogH2').val(id);
                        $('#b_katalogTB').val(dt.data.katalog);
                    }
                },
            });
        }
    //end of unit barang

/*reset form*/
    //grup  ---
        function gkosongkan(){
            $('#idformTB').val('');
            $('#g_kodeTB').val('');
            $('#g_namaTB').val('');
            $('#g_utotalTB').val('');
            $('#g_utersediaTB').val('');
            $('#g_udipinjamTB').val('');
            $('#g_keteranganTB').val('');
        }
    //end of grup ---

    //katalog  ---
        function kkosongkan(){
            $('#k_idformTB').val('');
            $('#k_lokasiTB').val('');
            $('#k_grupTB').val('');
            $('#k_kodeTB').val('');
            $('#k_namaTB').val('');
            $('#k_jenisTB').val('');
            $('#k_susutTB').val('');
            $('#k_photoTB').val('');
        }
    //end of katalog ---

    //barang  ---
        function bkosongkan(){
            $('#k_idformTB').val('');
            $('#b_tempatB').val('');
            $('#b_barkodeTB').val('');
            $('#b_kodeTB').val('');
            $('#b_hargaTB').val('');
            $('#b_kondisiTB').val('');
            $('input[name="b_sumberTB"]').val('');
            $('#b_keteranganTB').val('');
        }
    //end of barang ---


/*combo box*/
    // departemen ---
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
                        });
                        //panggil fungsi vwGrup() ==> tampilkan tabel 
                        // alert(dt.lokasi[0].replid);return false;
                        vwGrup(dt.lokasi[0].replid); 
                    }
                    // alert(out);
                    $('#g_lokasiS').html(out);
                }
            });
        }
    //end of departemen ---

    // Kondisi
        function cmbkondisi (typ,replid) {
            $.ajax({
                url:dir6,
                type:'post',
                dataType:'json',
                data:'aksi=cmb'+mnu6,
                success:function(dt){
                    var opt='';
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                        opt+='<option value="">'+dt.status+'</option>'
                    }else{
                        $.each(dt.kondisi,function(id,item){
                            if(replid==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>'
                            else
                                opt+='<option value="'+item.replid+'">'+item.nama+'</option>'
                        });
                        if(typ=='search'){// search
                            $('#b_kondisiS').html('<option value="">-Semua-</option>'+opt);
                        }else{//form
                            $('#b_kondisiTB').html('<option value="">Pilih Kondisi ...</option>'+opt);
                        }
                    }
                },
            });
        }
    // end of Kondisi
    
    // tempat
        // function cmbtempat (id) {
        function cmbtempat (tempat) {
            $.ajax({
                url:dir7,   
                type:'post',
                dataType:'json',
                data:'aksi=cmb'+mnu7+'&lokasi='+$('#g_lokasiS').val(),
                success:function(dt){
                    var opt='';
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                        opt+='<option value="">'+dt.status+'</option>'
                    }else{
                        // alert(id);return false;
                        $.each(dt.tempat,function(id,item){
                            if(tempat==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>'
                            else
                                opt+='<option value="'+item.replid+'">'+item.nama+'</option>'
                        });$('#b_tempatTB').html('<option value="">Pilih Tempat ..</option>'+opt);
                    }
                },
            });
        }
    // end of Kondisi

function tempatupdate (e) {
    $('#b_tempatTB').val($(e).val());
    if($('#b_idformH').val()!='') //edit
        kodegenerate($('#b_idformH').val());
    else //add
        kodegenerate('');
}

function jumupdate (e) {
    $('#b_jumbarangTB').val($(e).val());
    if($('#b_idformH').val()!='') //edit
        kodegenerate($('#b_idformH').val());
    else //add
        kodegenerate('');
}

// form :: generate barcode & kode ----------------- 
    function kodegenerate (idform) {
        var tempat  = $('#b_tempatTB').val();
        var jum     = $('#b_jumbarangTB').val();
        var katalog = $('#b_katalogH2').val();

        $.ajax({
            url:dir,
            type:'post',
            dataType:'json',
            data:'aksi=kodegenerate&tempat='+tempat+'&katalog='+katalog+'&replid='+idform,
            success:function(dt){
                var kode;
                if(jum>1){
                    kode = '[auto]';
                }else{
                    kode = dt.data.barkode;
                }$('#b_urutH').val(dt.data.urut);
                $('#b_barkodeTB').val(kode);
                $('#b_kodeTB').val(dt.data.lokasi+'/'+dt.data.grup+'/'+dt.data.tempat+'/'+dt.data.katalog+'/'+kode);
            },
        });
    }
// end of form :: generate barcode & kode ----------------- 



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

// get uang --------------------------
    function getuang(e) {
        // var x =$(e).maskMoney('unmasked')[0];
        var x =$(e).val();
        var y = x.replace(/[r\.]/g, '');
        return y;
    }
// end of get uang --------------------------

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
//end of  print to PDF -------

    // ---------------------- //
    // -- created by epiii -- //
    // ---------------------- // 
