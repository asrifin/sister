var mnu       = 'katalog';
var dir       = 'models/m_'+mnu+'.php';
var dir2      = 'models/m_jenisbuku.php';
var dir3      = 'models/m_bahasa.php';
var dir4      = 'models/m_tingkatbuku.php';
var dir5      = 'models/m_lokasi.php';

var klasifikasi_contentFR = pengarang_contentFR = penerbit_contentFR = bahasa_contentFR = jenis_contentFR = koleksi_contentFR = dua_koleksi_contentFR ='';

// notes ----------------------------
// katalogTBL   : view (list katalog) 
// k_viewFR     : view (detail katalog + list koleksi)  :: k_viewtbody : view(koleksi) 
// katalogFR    : form (add/edit katalog)  
// koleksi_contentFR : form-popUP (add/edit koleksi)  

//asrifin : switch panel (form<=>table)
    function switchPN(){
        $('#katalogFR').toggle('slow');
        $('#katalogTBL').toggle('slow');
        $('#tambahBC').toggle('slow');
        $('#cariBC').toggle('slow');
        kosongkan();    

        // autosuggest pengarang
        $("#pengarangTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{   
                    'columnName':'nama',
                    'width':'40',
                    'label':'NAMA'
                }],
            url: dir+'?aksi=autocomp&subaksi=pengarang', /*epiii*/
            select: function( event, ui ) {
                $('#pengarang_autoH').val(ui.item.replid);
                $('#pengarangTB').val(ui.item.nama);

                urlx = dir+'?aksi=autocomp&subaksi=pengarang&departemen='+$('#departemenS').val(); /*epiii*/
                $('#pengarangTB').combogrid( "option", "url", urlx ); /*epiii*/
                return false;
            }
        }); 
        
        // autosuggest penerbit
        $("#penerbitTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{   
                    'columnName':'nama',
                    'width':'40',
                    'label':'NAMA'
                }],
            url: dir+'?aksi=autocomp&subaksi=penerbit',
            // url: dir+'?aksi=autocomp',
            select: function( event, ui ) {
                $('#penerbit_autoH').val(ui.item.replid);
                $('#penerbitTB').val(ui.item.nama);

                urlx = dir+'?aksi=autocomp&subaksi=pengerbit&departemen='+$('#departemenS').val(); 
                $('#penerbitTB').combogrid( "option", "url", urlx ); 
                // $('#penerbitTB').combogrid( "option", "url", dir+'?aksi=autocomp&departemen='+$('#departemenS').val());
                return false;
            }
        }); 

        // autosuggest penerbit
        $("#klasifikasi_selectTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{   
                    'columnName':'kode',
                    'width':'40',
                    'label':'Kode'
                },{   
                    'columnName':'nama',
                    'width':'50',
                    'label':'NAMA'
                }],
            url: dir+'?aksi=autocomp&subaksi=klasifikasi',
            // url: dir+'?aksi=autocomp',
            select: function( event, ui ) {
                $('#klasifikasi_selectH').val(ui.item.replid);
                $('#klasifikasiTB').val(ui.item.kode);
                $('#klasifikasi_selectTB').val(ui.item.nama);

                urlx = dir+'?aksi=autocomp&subaksi=klasifikasi&departemen='+$('#departemenS').val(); 
                $('#klasifikasi_selectTB').combogrid( "option", "url", urlx ); 
                // $('#penerbitTB').combogrid( "option", "url", dir+'?aksi=autocomp&departemen='+$('#departemenS').val());
                return false;
            }
        });
    }//end of switch panel 

    //SwitchPN edit info katalog pada view katalog
    function switchPN_edit(id){
        if (id!=''){
            $.ajax({
                    url : dir,
                    type: 'post',
                    data:'aksi=ambiledit&subaksi=katalog&replid='+id,
                    dataType:'json',
                    success:function(dt){
                        $('#idformH').val(id);
                        $('#judulTB').val(dt.judul);
                        $('#klasifikasiTB').val(dt.kode_klas);
                        $('#klasifikasi_selectTB').val(dt.klasifikasi);
                        $('#nama_pengarangTB').val(dt.pengarang);
                        $('#callnumberTB').val(dt.callnumber);
                        $('#penerjemahTB').val(dt.penerjemah);
                        $('#editorTB').val(dt.editor);
                        $('#penerbitTB').val(dt.penerbit);
                        $('#tahun_terbitTB').val(dt.tahun_terbit);
                        $('#kotaTB').val(dt.kota);
                        $('#isbnTB').val(dt.isbn);
                        $('#issnTB').val(dt.issn);
                        $('#bahasaTB').val(dt.bahasa);
                        $('#seri_bukuTB').val(dt.seri);
                        $('#volumeTB').val(dt.volume);
                        $('#edisiTB').val(dt.edisi);
                        $('#jenis_bukuTB').val(dt.jenisbuku);
                        // $('#photoTB').val(dt.photo);
                        var img;
                        if(dt.photo2!='' && dt.photo2!=null){//ada gambar
                            img='../img/upload/'+dt.photo2;
                        }else{
                            img='../img/no_image.jpg';
                        }
                        $('#previmg').attr('src',img);
                        $('#k_photoH').val(dt.photo2);
                        $('#jumlahTB').val(dt.halaman);
                        $('#edisiTB').val(dt.edisi);
                        $('#sinopsisTB').val(dt.deskripsi);

                        cmbjenisbuku(dt.jenisbuku);
                        cmbbahasa(dt.bahasa);
                    }
                });
        }
        // $('#katalogFR').toggle();
        $('#katalogFR').toggle('slow');
        $('#katalogTBL').attr('style','display:none;');
        $('#k_viewFR').toggle('slow');
        $('#tambahBC').toggle('slow');
        $('#cariBC').toggle('slow');
        // kosongkan();    
        // autosuggest pengarang
        $("#pengarangTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{   
                    'columnName':'nama',
                    'width':'40',
                    'label':'NAMA'
                }],
            url: dir+'?aksi=autocomp&subaksi=pengarang', /*epiii*/
            select: function( event, ui ) {
                $('#pengarang_autoH').val(ui.item.replid);
                $('#pengarangTB').val(ui.item.nama);

                urlx = dir+'?aksi=autocomp&subaksi=pengarang&departemen='+$('#departemenS').val(); /*epiii*/
                $('#pengarangTB').combogrid( "option", "url", urlx ); /*epiii*/
                return false;
            }
        }); 
        // autosuggest penerbit
        $("#penerbitTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{   
                    'columnName':'nama',
                    'width':'40',
                    'label':'NAMA'
                }],
            url: dir+'?aksi=autocomp&subaksi=penerbit',
            // url: dir+'?aksi=autocomp',
            select: function( event, ui ) {
                $('#penerbit_autoH').val(ui.item.replid);
                $('#penerbitTB').val(ui.item.nama);

                urlx = dir+'?aksi=autocomp&subaksi=pengerbit&departemen='+$('#departemenS').val(); 
                $('#penerbitTB').combogrid( "option", "url", urlx ); 
                // $('#penerbitTB').combogrid( "option", "url", dir+'?aksi=autocomp&departemen='+$('#departemenS').val());
                return false;
            }
        });

        // autosuggest penerbit
        $("#klasifikasi_selectTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{   
                    'columnName':'kode',
                    'width':'40',
                    'label':'Kode'
                },{   
                    'columnName':'nama',
                    'width':'50',
                    'label':'NAMA'
                }],
            url: dir+'?aksi=autocomp&subaksi=klasifikasi',
            // url: dir+'?aksi=autocomp',
            select: function( event, ui ) {
                $('#klasifikasi_selectH').val(ui.item.replid);
                $('#klasifikasiTB').val(ui.item.kode);
                $('#klasifikasi_selectTB').val(ui.item.nama);

                urlx = dir+'?aksi=autocomp&subaksi=klasifikasi&departemen='+$('#departemenS').val(); 
                $('#klasifikasi_selectTB').combogrid( "option", "url", urlx ); 
                // $('#penerbitTB').combogrid( "option", "url", dir+'?aksi=autocomp&departemen='+$('#departemenS').val());
                return false;
            }
        });
    }

    function switchPN_view(){
        $('#k_viewFR').toggle('slow');
        // $('#katalogFR').toggle('slow');
        $('#katalogTBL').toggle('slow');
    }

// main function ---
    $(document).ready(function(){
        // cmbdepartemen('');

        klasifikasi_contentFR += '<form autocomplete="off" onsubmit="klasifikasiSV(this); return false;" id="klasifikasiFR">' 
                        +'<input  id="klasifikasiH" type="hidden">'

                        +'<label>Kode</label>' 
                        +'<div class="input-control text">'
                            // +'<input type="hidden" name="kode_klasifikasiH" id="kode_klasifikasiH">'
                            +'<input required type="text" name="kode_klasifikasiTB" id="kode_klasifikasiTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Nama</label>'
                        +'<div class="input-control text size2">'
                            +'<input required type="text" name="nama_klasifikasiTB" id="nama_klasifikasiTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Keterangan</label>'
                        +'<div class="input-control text">'
                            +'<input type="text" name="ket_klasifikasiTB" id="ket_klasifikasiTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        pengarang_contentFR += '<form autocomplete="off" onsubmit="pengarangSV(this);return false;" id="pengarangFR">' 
                        +'<input  id="pengarangH" type="hidden">'

                        +'<label>Nama Pengarang</label>' 
                        +'<div class="input-control text">'
                            // +'<input type="hidden" name="nama_pengarangH" id="nama_pengarangH">'
                            +'<input required type="text" name="nama_pengarangTB" id="nama_pengarangTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Nama Kutipan</label>'
                        +'<div class="input-control text size2">'
                            +'<input required type="text" name="nama_kutipanTB" id="nama_kutipanTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Keterangan</label>'
                        +'<div class="input-control text">'
                            +'<input type="text" name="ket_pengarangTB" id="ket_pengarangTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        penerbit_contentFR += '<form autocomplete="off" onsubmit="penerbitSV(this);return false;" id="penerbitFR">' 
                        +'<input  id="penerbitH" type="hidden">'

                        +'<label>Nama Penerbit</label>' 
                        +'<div class="input-control text">'
                            +'<input required type="text" name="nama_penerbitTB" id="nama_penerbitTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Keterangan</label>'
                        +'<div class="input-control text">'
                            +'<input type="text" name="ket_penerbitTB" id="ket_penerbitTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        bahasa_contentFR += '<form autocomplete="off" onsubmit="bahasaSV(this);return false;" id="bahasaFR">' 
                        +'<input  id="bahasaH" type="hidden">'

                        +'<label>Kode</label>' 
                        +'<div class="input-control text">'
                            +'<input required type="text" name="kode_bahasaTB" id="kode_bahasaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Bahasa</label>'
                        +'<div class="input-control text size2">'
                            +'<input required type="text" name="nama_bahasaTB" id="nama_bahasaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Keterangan</label>'
                        +'<div class="input-control text">'
                            +'<input type="text" name="ket_bahasaTB" id="ket_bahasaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        jenis_contentFR += '<form autocomplete="off" onsubmit="jenisbukuSV(this);return false;" id="jenisFR">' 
                        +'<input  id="jenisbukuH" type="hidden">'

                        +'<label>Kode</label>' 
                        +'<div class="input-control text">'
                            +'<input required type="text" name="kode_jenisTB" id="kode_jenisTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Jenis Koleksi</label>'
                        +'<div class="input-control text size2">'
                            +'<input required type="text" name="nama_jenisTB" id="nama_jenisTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Keterangan</label>'
                        +'<div class="input-control text">'
                            +'<input type="text" name="ket_jenisTB" id="ket_jenisTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        koleksi_contentFR += '<form autocomplete="off"  style="overflow:scroll;height:600px;"  onsubmit="koleksiSV(this);return false;" id="koleksiFR">' 
                        // hidden
                        +'<input  id="koleksiH" type="hidden">'
                        // judul
                        +'<tr>'
                            +'<td>Judul</td>'
                            +'<td>: <span style="font-weight:bold;" id="judul_koleksiTD"></span></td>'
                        +'</tr>'

                        +'<label><b>Alokasi Lokasi</b></label>' 
                        // lokasi
                        +'<label>Lokasi</label>' 
                        +'<div class="input-control select">'
                            +'<select onchange="kode_gen();" required id="lokasiTB" name="lokasiTB">'
                              +'</select>'
                        +'</div>'
                        // tingkat buku
                        +'<label>Tingkat</label>' 
                        +'<div class="input-control select">'
                            +'<select onchange="kode_gen();" required id="tingkatTB" name="tingkatTB">'
                              +'</select>'
                        +'</div>'
                        // jumlah 
                        +'<label>Jumlah Koleksi Baru</label>' 
                        +'<div class="input-control text">'
                            +'<input onchange="kode_gen();" value="1" required type="number" min="1" name="jml_koleksiTB" id="jml_koleksiTB">'
                        +'</div>'
                        // sumber
                        +'<label>Sumber</label>'
                        +'<div>'
                            +'<div class="input-control radio margin3" >'
                                +'<label>'
                                    +'<input onchange="kode_gen();" checked value="0" required type="radio" name="sumberTB" />'  /*default*/
                                    +'<span class="check"></span>'
                                    +'Beli'
                                +'</label>'
                            +'</div>'
                        +'</div>'
                        +'<div>'
                            +'<div class="input-control radio margin3" >'
                                +'<label>'
                                    +'<input onchange="kode_gen();"  value="1" required type="radio" name="sumberTB"/>'
                                    +'<span class="check"></span>'
                                    +'Pemberian'
                                +'</label>'
                            +'</div>'
                        +'</div>'
                        // tanggal
                        +'<label>Tanggal Diperoleh</label>'
                        +'<div class="input-control text" data-position="top"  data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input onchange="kode_gen();"onkeyup="kode_gen();" id="tglTB" name="tglTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                        // label buku
                        +'<label>ID Buku</label>' 
                        +'<div class="input-control text">'
                            +'<input  id="idbukuH" type="hidden">'
                            +'<input readonly required type="text" name="idbukuTB" id="idbukuTB">'
                        +'</div>'
                        // barcode 
                        +'<label>Barcode</label>'
                        +'<div class="input-control text">'
                            +'<input readonly required type="text" name="barcodeTB" id="barcodeTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        // harga
                        +'<label>Harga</label>'
                        +'<div class="input-control text">'
                            +'<input onclick="inputuang(this);" onfocus="inputuang(this);" required type="text" name="hargaTB" id="hargaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';


        //load table
        viewTB();

        $("#tambahBC").on('click',function(){
            switchPN(); 
            // $('#katalogFR').toggle('slow'); // katalog form add/edit 
            // $('#katalogTBL').toggle('slow'); // katalog view / list 
            cmbjenisbuku('');
            cmbbahasa('');
        });
        $("#edit_katalogBC").on('click',function(){
            switchPN_edit($('#idkatalogH').val());
            // viewFR($('#idkatalogH').val());
        });
        $("#koleksiBC").on('click',function(){
            koleksiFR('');
        });
        $("#koleksi_duaBC").on('click',function(){
            koleksiFR('');
        });
        $("#ubah_koleksiBC").on('click',function(){
            dua_koleksiFR('');
        });
        $("#hapus_koleksiBC").on('click',function(){
            del_koleksi('');
        });

        //add
        $("#klasifikasiBC").on('click',function(){
                klasifikasiFR();
        });$("#penerbitBC").on('click',function(){
                penerbitFR(); 
        });$("#pengarangBC").on('click',function(){
                pengarangFR(); 
        });$("#bahasaBC").on('click',function(){
                bahasaFR();
        });$("#jenisbukuBC").on('click',function(){
                jenisbukuFR(); 
        });
        $('#judulS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });
        $('#kode_klasifikasiS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });
        $('#pengarangS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });
        $('#penerbitS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });
        

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#judulS').val('');
            $('#kode_klasifikasiS').val('');
            $('#pengarangS').val('');
            $('#penerbitS').val('');
        });

    }); ////end of  main function ---
 

        // //preview image sebelum upload -------
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

// // submit katalog ---------------------------
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

        // // upload image
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
                var formData = $('#katalog_form').serialize();
                if($('#idformH').val()!=''){
                    formData +='&replid='+$('#idformH').val();
                }

                if(filex!=''){// ada upload file nya
                    formData +='&file='+filex.file ;    
                    if($('#k_photoH').val()!=''){
                        formData+='&photo_asal='+$('#k_photoH').val();
                    }
                }
                // alert(formData);return false;
                $.ajax({
                    // url: dir+'?aksi=simpan&subaksi=katalog',
                    url: dir,
                    type:'POST',
                    data:formData+'&aksi=simpan&subaksi=katalog',
                    // data:'aksi=simpan&subaksi=katalog'+formData,
                    // data:'aksi=simpan&subaksi=katalog'+formData+$('#katalog_form').serialize(),
                    cache:false,
                    dataType: 'json',
                    success: function(data, textStatus, jqXHR){
                        if(data.status != 'sukses'){
                            // alert('Gagal');
                           notif(data.status,'red');
                        }else{
                            // alert('suksessh');
                            // notif(data.status,'green'); 
                            k_view(data.id);
                        }
                    },error: function(jqXHR, textStatus, errorThrown){
                        console.log('ERRORS savedata2: ' + textStatus);
                    }
                });
            }
        // // end of simpan ke database

//save process katalog ---
 //    function simpan(){
 //        // var urlx ='&aksi=simpan&departemen='+$('#departemenS').val();
 //        var urlx ='&aksi=simpan&subaksi=katalog';
 //        // edit mode
 //        if($('#idformH').val()!=''){
 //            urlx += '&replid='+$('#idformH').val();
 //        }
 //        $.ajax({
 //            url:dir,
 //            cache:false,
 //            type:'post',
 //            dataType:'json',
 //            data:$('form').serialize()+urlx,
 //            success:function(dt){
 //                if(dt.status!='sukses'){
 //                    cont = 'Gagal menyimpan data';
 //                    clr  = 'red';
 //                }else{
 //                    $.Dialog.close();
 //                    kosongkan();
 //                    viewTB($('#departemenS').val());
 //                     $('#katalogFR').removeAttr('style');
 //                     $('#panel1').attr('style','display:none;');
 //                    cont = 'Berhasil menyimpan data';
 //                    clr  = 'green';
 //                }
 //                notif(cont,clr);
 //            }
 //        });
 //    }
 // //end of save process ---

    function klasifikasiSV(e){
        var urlx ='&aksi=simpan&subaksi=klasifikasi';
        // edit mode
        if($('#klasifikasiH').val()!=''){
            urlx += '&replid='+$('#klasifikasiH').val();
        }
        // alert(urlx);
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$(e).serialize()+urlx, 
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    // kosongkan();
                    viewTB($('').val());
                     $('#katalogFR').removeAttr('style');
                     // $('#panel1').attr('style','display:none;');
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
            }
        });
    }


    function pengarangSV(e){
        var urlx ='&aksi=simpan&subaksi=pengarang';
        // edit mode
        if($('#pengarangH').val()!=''){
            urlx += '&replid='+$('#pengarangH').val();
        }
        // alert(urlx);
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$(e).serialize()+urlx, 
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    // kosongkan();
                    viewTB($('').val());
                     $('#katalogFR').removeAttr('style');
                     // $('#panel1').attr('style','display:none;');
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
            }
        });
    }


    function penerbitSV(e){
        var urlx ='&aksi=simpan&subaksi=penerbit';
        // edit mode
        if($('#penerbitH').val()!=''){
            urlx += '&replid='+$('#penerbitH').val();
        }
        // alert(urlx);
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$(e).serialize()+urlx, 
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    // kosongkan();
                    viewTB($('').val());
                     $('#katalogFR').removeAttr('style');
                     // $('#panel1').attr('style','display:none;');
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
            }
        });
    }


    function bahasaSV(e){
        var urlx ='&aksi=simpan&subaksi=bahasa';
        // edit mode
        if($('#bahasaH').val()!=''){
            urlx += '&replid='+$('#bahasaH').val();
        }
        // alert(urlx);
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$(e).serialize()+urlx, 
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    // kosongkan();
                    viewTB($('').val());
                     $('#katalogFR').removeAttr('style');
                     // $('#panel1').attr('style','display:none;');
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
            }
        });
    }


    function jenisbukuSV(e){
        var urlx ='&aksi=simpan&subaksi=jenisbuku';
        // edit mode
        if($('#jenisbukuH').val()!=''){
            urlx += '&replid='+$('#jenisbukuH').val();
        }
        // alert(urlx);
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$(e).serialize()+urlx, 
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    // kosongkan();
                    viewTB($('').val());
                     $('#katalogFR').removeAttr('style');
                     // $('#panel1').attr('style','display:none;');
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
            }
        });
    }

    function koleksiSV(e){
        var urlx ='&aksi=simpan&subaksi=koleksi';
        // edit mode
        if($('#koleksiH').val()!=''){
            urlx += '&replid='+$('#koleksiH').val();
        }
        // alert(urlx);
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$(e).serialize()+urlx, 
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    kosongkan_koleksi();
                    // viewTB($('').val());
                     // $('#katalogFR').removeAttr('style');
                     // $('#panel1').attr('style','display:none;');
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
            }
        });
    }


// view table ---
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari = '&judulS='+$('#judulS').val()
                    +'&kode_klasifikasiS='+$('#kode_klasifikasiS').val();
                    +'&pengarangS='+$('#pengarangS').val();
                    +'&penerbitS='+$('#penerbitS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="7"><img src="../img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---
        
        //Add
    function klasifikasiFR(){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                $.Dialog.title(" Tambah Klasifikasi");
                $.Dialog.content(klasifikasi_contentFR);
            }
        });
    }
// end of form ---

        
        //Add
    function pengarangFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                $.Dialog.title("Tambaha Pengarang");
                $.Dialog.content(pengarang_contentFR);
            }
        });
    }
// end of form ---

        
        //Add
    function penerbitFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                $.Dialog.title("Tambah Penerbit");
                $.Dialog.content(penerbit_contentFR);
            }
        });
    }
// end of form ---

        
        //Add
    function bahasaFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                $.Dialog.title("Tambah Bahasa");
                $.Dialog.content(bahasa_contentFR);
            }
        });
    }
// end of form ---
        
        //Add
    function jenisbukuFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                $.Dialog.title("Tambah Jenis Buku");
                $.Dialog.content(jenis_contentFR);
            }
        });
    }
// end of form ---

        //add katalog
        function viewFR(id) {
            // alert(9999);
            // epi:edit
            if(id!='') {
                $.ajax({
                    url : dir,
                    type: 'post',
                    data:'aksi=ambiledit&subaksi=katalog&replid='+id,
                    dataType:'json',
                    success:function(dt){
                        $('#idformH').val(id);
                        $('#judulTB').val(dt.judul);
                        $('#klasifikasiTB').val(dt.kode_klas);
                        $('#klasifikasi_selectH').val(dt.idklasifikasi);
                        $('#klasifikasi_selectTB').val(dt.klasifikasi);
                        $('#pengarang_autoH').val(dt.idpengarang);
                        $('#nama_pengarangTB').val(dt.pengarang);
                        $('#callnumberTB').val(dt.callnumber);
                        $('#penerjemahTB').val(dt.penerjemah);
                        $('#editorTB').val(dt.editor);
                        $('#penerbit_autoH').val(dt.idpenerbit);
                        $('#penerbitTB').val(dt.penerbit);
                        $('#tahun_terbitTB').val(dt.tahun_terbit);
                        $('#kotaTB').val(dt.kota);
                        $('#isbnTB').val(dt.isbn);
                        $('#issnTB').val(dt.issn);
                        $('#bahasaTB').val(dt.bahasa);
                        $('#seri_bukuTB').val(dt.seri);
                        $('#volumeTB').val(dt.volume);
                        $('#edisiTB').val(dt.edisi);
                        $('#jenis_bukuTB').val(dt.jenisbuku);
                        // $('#photoTB').val(dt.photo);
                        var img;
                        if(dt.photo2!='' && dt.photo2!=null){//ada gambar
                            img='../img/upload/'+dt.photo2;
                        }else{
                            img='../img/no_image.jpg';
                        }
                        $('#previmg').attr('src',img);
                        $('#k_photoH').val(dt.photo2);
                        $('#jumlahTB').val(dt.halaman);
                        $('#edisiTB').val(dt.edisi);
                        $('#sinopsisTB').val(dt.deskripsi);

                        cmbjenisbuku(dt.jenisbuku);
                        cmbbahasa(dt.bahasa);
                        $('#katalogFR').toggle('slow');
                        $('#katalogTBL').toggle('slow');
                        $('#tambahBC').toggle('slow');
                        $('#cariBC').toggle('slow');
                        // switchPN();
                    }
                });
            }else{ 
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    var idkatalog = $('#idformH').val(); 
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&subaksi=katalog&replid='+idkatalog,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            // $('#koleksiH').val(id);
                        $('#edit_katalogH').val(id);
                        $('#judulTB').val(dt.judul);
                        $('#klasifikasiTB').val(dt.kode_klas);
                        $('#klasifikasi_selectTB').val(dt.klasifikasi);
                        $('#nama_pengarangTB').val(dt.pengarang);
                        $('#callnumberTB').val(dt.callnumber);
                        $('#penerjemahTB').val(dt.penerjemah);
                        $('#editorTB').val(dt.editor);
                        $('#penerbitTB').val(dt.penerbit);
                        $('#tahun_terbitTB').val(dt.tahun_terbit);
                        $('#kotaTB').val(dt.kota);
                        $('#isbnTB').val(dt.isbn);
                        $('#issnTB').val(dt.issn);
                        $('#bahasaTB').val(dt.bahasa);
                        $('#seri_bukuTB').val(dt.seri);
                        $('#volumeTB').val(dt.volume);
                        $('#edisiTB').val(dt.edisi);
                        $('#jenis_bukuTB').val(dt.jenisbuku);
                        // $('#photoTB').val(dt.photo);
                        var img;
                        if(dt.photo2!='' && dt.photo2!=null){//ada gambar
                            img='../img/upload/'+dt.photo2;
                        }else{
                            img='../img/no_image.jpg';
                        }
                        $('#previmg').attr('src',img);
                        $('#k_photoH').val(dt.photo2);
                        $('#jumlahTB').val(dt.halaman);
                        $('#edisiTB').val(dt.edisi);
                        $('#sinopsisTB').val(dt.deskripsi);

                        cmbjenisbuku(dt.jenisbuku);
                        cmbbahasa(dt.bahasa);
                        $('#katalogFR').toggle('slow');
                        $('#katalogTBL').toggle('slow');
                        $('#tambahBC').toggle('slow');
                        $('#cariBC').toggle('slow');
                        }
                    });
            }

        }  

        function k_view(id) {
            // epi:edit
            if(id!='') {
                $.ajax({
                    url : dir,
                    type: 'post',
                    data:'aksi=ambiledit&subaksi=k_detail&replid='+id,
                    dataType:'json',
                    success:function(dt){
                        if(dt.status!='sukses'){//gagal
                            notif(dt.status,'red');
                        }else{ //sukses
                            $('#v_idformH').html(id);
                            $('#idkatalogH').val(id); //id yang di view katalog
                            $('#judulTD').html(dt.data.judul);
                            $('#klasifikasiTD').html(dt.data.kode_klas);
                            $('#klasifikasi_selectTD').html(dt.data.klasifikasi);
                            $('#pengarangTD').html(dt.data.pengarang);
                            $('#callnumberTD').html(dt.data.callnumber);
                            $('#penerjemahTD').html(dt.data.penerjemah);
                            $('#editorTD').html(dt.data.editor);
                            $('#penerbitTD').html(dt.data.penerbit);
                            $('#tahun_terbitTD').html(dt.data.tahun_terbit);
                            $('#kotaTD').html(dt.data.kota);
                            $('#isbnTD').html(dt.data.isbn);
                            $('#issnTD').html(dt.data.issn);
                            $('#bahasaTD').html(dt.data.bahasa);
                            $('#seri_bukuTD').html(dt.data.seri);
                            $('#volumeTD').html(dt.data.volume);
                            $('#edisiTD').html(dt.data.edisi);
                            $('#jenis_bukuTD').html(dt.data.jenisbuku);
                            // $('#photoTD').html(dt.data.photo);
                            $('#jumlahTD').html(dt.data.halaman);
                            $('#edisiTD').html(dt.data.edisi);
                            $('#sinopsisTD').html(dt.data.deskripsi);

                            cmblokasi('filter','');
                            
                            var tbl='';
                            $.each(dt.data.barangArr,function(id,item){
                                var btn;
                                tbl+='<tr>'
                                    // +'<td><input '+(item.status==3||item.status==4?'disabled':'')+' type="checkbox" dp="'+item.iddpeminjaman+'" brg="'+item.idbarang+'" /></td>'
                                    +'<td>'+item.barkode+'</td>'
                                    +'<td>'+item.idbuku+'</td>'
                                    +'<td>'+item.sumber+'</td>'
                                    +'<td>'+item.harga+'</td>'
                                    +'<td>'+item.tanggal+'</td>'
                                    +'<td>'+item.statusbuku+'</td>'
                                    +'<td>'+item.lokasi+'</td>'
                                    +'<td>'+item.tingkatbuku+'</td>'
                                    +'<td>'
                                        +'<button onclick="koleksiFR('+item.id+')">'
                                            +'<i style="color:black;" class="icon-pencil"></i>'
                                        +'</button>'
                                        +'<button onclick="del_koleksi('+item.id+')">'
                                            +'<i style="color:black;" class="icon-remove"></i>'
                                        +'</button>'
                                    +'</td>'
                                    +'</tr>';
                            });
                            $('#k_viewtbody').html(tbl);
                            $('#katalogTBL').attr('style','display:none;');
                            $('#katalogFR').attr('style','display:none;');
                            // $('#katalogTBL').removeAttr('style');
                            $('#k_viewFR').toggle('slow');
                        }
                    } //end else
                });
            }else{ //add
                $('#k_viewFR').toggle('slow');
                $('#katalogFR').toggle('slow');
                // switchPN_view();
            }
        }  

    
// generator label ---
    function kode_gen(){
        titlex='<span class="icon-pencil"></span> Tambah';
        var datax   ='&sumber='+$('[name="sumberTB"]:checked').val()
                    +'&lokasi='+$('#lokasiTB').val()
                    +'&tanggal='+$('#tglTB').val()
                    +'&tingkat='+$('#tingkatTB').val()
                    +'&jml_koleksi='+$('#jml_koleksiTB').val()
        $.ajax({
            url:dir,
            data:'aksi=codeGen&subaksi=trans'+datax,
            type:'post',
            dataType:'json',
            success:function(dt){
                $('#idbukuTB').val(dt.idbuku); 
                $('#barcodeTB').val(dt.barcode); /*epiii*/
            }
        });
    }

// form ---
    function koleksiFR(id){
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
                    var idkatalog = $('#idkatalogH').val(); // untuk nambah koleksi pada view katalog
                    $.ajax({
                        url:dir,
                        // data:'aksi=ambiledit&subaksi=koleksi&replid='+idkatalog,
                        data:'aksi=ambiledit&subaksi=katalog&replid='+idkatalog, /*epiii*/
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#koleksiH').val(id);
                            $('#judul_koleksiTD').html(dt.judul);
                            // $('#jml_koleksiTB').val(dt.jum);
                            // $('#idbukuTB').val(dt.kode);
                            // $('#barcodeTB').val(dt.barkode);
                            // $.each($('input[name="sumberTB"]'),function(){
                            //     if(dt.sumber==$(this).val()) $(this).attr('checked',true);
                            // });                            
                            // $('#hargaTB').val(dt.harga);
                            $('#tglTB').val(getToday());
                            // $('#lokasiTB').val(dt.lokasi);
                            // $('#tingkatTB').val(dt.tingkatbuku);
                            
                            cmblokasi(dt.lokasi);
                            cmbtingkatbuku(dt.tingkatbuku);
                            kode_gen();
                        }
                    });

                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Edit';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&subaksi=koleksi&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#koleksiH').val(id);
                            $('#judul_koleksiTD').html(dt.judul);
                            $('#jml_koleksiTB').val(dt.jum);
                            $('#idbukuTB').val(dt.kode);
                            $('#barcodeTB').val(dt.barkode);
                                    $.each($('input[name="sumberTB"]'),function(){
                                        if(dt.sumber==$(this).val())
                                            $(this).attr('checked',true);
                                    });                            
                            $('#hargaTB').val(dt.harga);
                            $('#tglTB').val(dt.tanggal);
                            $('#lokasiTB').val(dt.lokasi);
                            $('#tingkatTB').val(dt.tingkatbuku);
                            
                            kode_gen('idfmt');
                            cmblokasi(dt.lokasi);
                            cmbtingkatbuku(dt.tingkatbuku);

                        }
                    });
                }
                $.Dialog.title(titlex+' Koleksi');
                $.Dialog.content(koleksi_contentFR);
            }
        });
    }
// end of form ---


        function cmbjenisbuku (jenisbuku) {
            // alert(1);return false;
            $.ajax({
                url:dir2,   
                type:'post',
                dataType:'json',
                data:'aksi=cmbjenisbuku',
                success:function(dt){
                    var opt='';
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                        opt+='<option value="">'+dt.status+'</option>'
                    }else{
                        // alert(id);return false;
                        var opt = '';
                        $.each(dt.jenisbuku,function(id,item){
                            if(jenisbuku==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>'
                            else
                                opt+='<option value="'+item.replid+'">'+item.nama+'</option>'
                        });$('#jenis_bukuTB').html('<option value="">Pilih Jenis Buku ..</option>'+opt);
                    }
                },
            });
        }



        function cmbbahasa (bahasa) {
            // alert(1);return false;
            $.ajax({
                url:dir3,   
                type:'post',
                dataType:'json',
                data:'aksi=cmbbahasa',
                success:function(dt){
                    var opt='';
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                        opt+='<option value="">'+dt.status+'</option>'
                    }else{
                        // alert(id);return false;
                        var opt = '';
                        $.each(dt.nama,function(id,item){
                            if(bahasa==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>'
                            else
                                opt+='<option value="'+item.replid+'">'+item.nama+'</option>'
                        });$('#bahasaTB').html('<option value="">Pilih Bahasa ..</option>'+opt);
                    }
                },
            });
        }

        function cmblokasi (typ,lokasi) {
            // alert(lokasi);return false;
            $.ajax({
                url:dir5,   
                type:'post',
                dataType:'json',
                data:'aksi=cmblokasi',
                success:function(dt){
                    var opt='';
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                        opt+='<option value="">'+dt.status+'</option>'
                    }else{
                        var opt = '';
                        $.each(dt.lokasi,function(id,item){
                            if(lokasi==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>'
                            else
                                opt+='<option value="'+item.replid+'">'+item.nama+'</option>'
                        });
                        if (typ=='filter') {
                            $('#lokasiS').html(opt);
                        }else{
                            $('#lokasiTB').html('<option value="">Pilih Lokasi ..</option>'+opt);
                        }
                    }
                },
            });
        }

        function cmbtingkatbuku (tingkatbuku) {
            // alert(1);return false;
            $.ajax({
                url:dir4,   
                type:'post',
                dataType:'json',
                data:'aksi=cmbtingkatbuku',
                success:function(dt){
                    var opt='';
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                        opt+='<option value="">'+dt.status+'</option>'
                    }else{
                        // alert(id);return false;
                        var opt = '';
                        $.each(dt.tingkatbuku,function(id,item){
                            if(tingkatbuku==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>'
                            else
                                opt+='<option value="'+item.replid+'">'+item.nama+'</option>'
                        });$('#tingkatTB').html('<option value="">Pilih Tingkat ..</option>'+opt);
                    }
                },
            });
        }
    // }
// end of form ---

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
                $(el2).html('<tr><td align="center" colspan="8"><img src="../img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of paging ---
    

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
   
//del process ---
    function del(id){
        if(confirm('melanjutkan untuk menghapus data?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=hapus&subaksi=katalog&replid='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    // viewTB($('#departemenS').val());
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                }
                notif(cont,clr);
            }
        });
    }
//end of del process ---

//del Koleksi process ---
    function del_koleksi(id){
        if(confirm('melanjutkan untuk menghapus data?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=hapus&subaksi=koleksi&replid='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    // viewTB($('#departemenS').val());
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                }
                notif(cont,clr);
            }
        });
    }
//end of del process ---
    
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
                        $('#judulTB').val('');
                        $('#klasifikasiTB').val('');
                        $('#klasifikasi_selectTB').val('');
                        $('#nama_pengarangTB').val('');
                        $('#callnumberTB').val('');
                        $('#penerjemahTB').val('');
                        $('#editorTB').val('');
                        $('#pengarangTB').val('');
                        $('#penerbitTB').val('');
                        $('#tahun_terbitTB').val('');
                        $('#kotaTB').val('');
                        $('#isbnTB').val('');
                        $('#issnTB').val('');
                        $('#bahasaTB').val('');
                        $('#seri_bukuTB').val('');
                        $('#volumeTB').val('');
                        $('#edisiTB').val('');
                        $('#jenis_bukuTB').val('');
                        $('#k_photoTB').val('');
                        $('#previmg').val('');
                        $('#jumlahTB').val('');
                        $('#edisiTB').val('');
                        $('#sinopsisTB').val('');
    }
//end of reset form ---

//reset form ---
    function kosongkan_koleksi(){
                            $('#koleksiH').val('');
                            $('#judul_koleksiTD').val('');
                            $('#jml_koleksiTB').val('');
                            $('#idbukuTB').val('');
                            $('#barcodeTB').val('');
                            $('#sumberTB').val('');
                            $('#hargaTB').val('');
                            $('#tglTB').val('');
                            $('#lokasiTB').val('');
                            $('#tingkatTB').val('');
    }
//end of reset form ---

//aktifkan process ---
    function aktifkan(id){
        var th  = $('#'+mnu+'TD_'+id).html();
        var dep = $('#'+mnu2+'S').val();
        //alert('d '+dep);
        //return false;
        if(confirm(' mengaktifkan "'+th+'"" ?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=aktifkan&replid='+id+'&departemen='+dep,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Mengaktifkan '+th+' ..';
                    clr  ='red';
                }else{
                    viewTB($('#departemenS').val());
                    cont = '..Berhasil Mengaktifkan '+th+' ..';
                    clr  ='green';
                }notif(cont,clr);
            }
        });
    }
//end of aktifkan process ---

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
//date format -----------------
    function dateFormatx(typ,d,m,y){
        if(typ=='id') // 25 Dec 2014
            return d+' '+m+' '+y;
        else // 2014-12-25
            return y+'-'+m+'-'+d;
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
