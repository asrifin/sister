var mnu       = 'katalog';
var dir       = 'models/m_'+mnu+'.php';
var dir2      = 'models/m_jenisbuku.php';
var dir3      = 'models/m_bahasa.php';
var dir4      = 'models/m_tingkatbuku.php';
var dir5      = 'models/m_lokasi.php';

var klasifikasi_contentFR = pengarang_contentFR = penerbit_contentFR = bahasa_contentFR = jenis_contentFR = koleksi_contentFR = '';

//asrifin : switch panel (form<=>table)
    function switchPN(){
        // $('#katalogFR').toggle();
        $('#katalogFR').toggle('slow');
        $('#katalogTBL').toggle('slow');
        $('#tambahBC').toggle('slow');
        $('#cariBC').toggle('slow');
    
        // autosuggest
        $("#pengarangTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{   
                    'columnName':'nama',
                    'width':'40',
                    'label':'NAMA'
                }],
            url: dir+'?aksi=autocomp',
            select: function( event, ui ) {
                $('#pengarang_autoH').val(ui.item.replid);
                $('#pengarangTB').val(ui.item.nama);
                $('#pengarangTB').combogrid( "option", "url", dir+'?aksi=autocomp&subaksi=penerbit&departemen='+$('#departemenS').val() );
                // $('#pengarangTB').combogrid( "option", "url", dir+'?aksi=autocomp' );
                return false;
            }
        });
        // autosuggest
        $("#penerbitTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{   
                    'columnName':'nama',
                    'width':'40',
                    'label':'NAMA'
                }],
            url: dir+'?aksi=autocomp',
            select: function( event, ui ) {
                $('#penerbit_autoH').val(ui.item.replid);
                $('#penerbitTB').val(ui.item.nama);
                $('#penerbitTB').combogrid( "option", "url", dir+'?aksi=autocomp&departemen='+$('#departemenS').val() );
                // $('#pengarangTB').combogrid( "option", "url", dir+'?aksi=autocomp' );
                return false;
            }
        });
    }

    function switchPN_view(){
        $('#k_viewFR').toggle('slow');
        $('#katalogTBL').toggle('slow');
        $('#tambahBC').toggle('slow');
        $('#cariBC').toggle('slow');
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

        koleksi_contentFR += '<form autocomplete="off" onsubmit="koleksiSV(this);return false;" id="koleksiFR">' 
                        +'<input  id="koleksiH" type="hidden">'
                            +'<tr>'
                                +'<td>Judul</td>'
                                +'<td>: <span id="judulTD"></span></td>'
                            +'</tr>'

                        // +'<label>Judul</label>' 
                        // +'<div class="input-control text size2">'
                        //     +'<input required type="text" name="judulTB" id="judulTB">'
                        //     +'<button class="btn-clear"></button>'
                        // +'</div>'
                        +'<label>Jumlah Koleksi Baru</label>' 
                        +'<div class="input-control text size2">'
                            +'<input required type="text" name="jml_koleksiTB" id="jml_koleksiTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>ID Buku</label>' 
                        +'<div class="input-control text">'
                            +'<input disabled="disabled" required type="text" name="idbukuTB" id="idbukuTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Barcode</label>'
                        +'<div class="input-control text size3">'
                            +'<input disabled="disabled" required type="text" name="barcodeTB" id="barcodeTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                                        +'<label>Sumber</label>'
                                        +'<div>'
                                            +'<div class="input-control radio margin3" >'
                                                +'<label>'
                                                    +'<input value="0" required type="radio" name="sumberTB" />'
                                                    +'<span class="check"></span>'
                                                    +'Beli'
                                                +'</label>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div>'
                                            +'<div class="input-control radio margin3" >'
                                                +'<label>'
                                                    +'<input  value="1" required type="radio" name="sumberTB"/>'
                                                    +'<span class="check"></span>'
                                                    +'Pemberian'
                                                +'</label>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div>'
                        +'<label>Harga</label>'
                        +'<div class="input-control text size3">'
                            +'<input disabled="disabled" required type="text" name="hargaTB" id="hargaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Tanggal Diperoleh</label>'
                        +'<div class="input-control text size2" data-role="datepicker"'
                            +'data-format="yyyy-mm-dd"'
                            +'data-effect="slide">'
                            +'<input id="tglTB" name="tglTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                        +'<label>Alokasi Lokasi</label>' 
                        +'<label>Lokasi</label>' 
                        +'<div class="input-control select size4">'
                            +'<select id="lokasiTB" name="lokasiTB">'
                              +'</select>'
                        +'</div>'
                        +'<label>Tingkat</label>' 
                        +'<div class="input-control select size4">'
                            +'<select id="tingkatTB" name="tingkatTB">'
                              +'</select>'
                        +'</div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        //load table
        viewTB();

    // epiii : button action
        $("#tambahBC").on('click',function(){
            // viewFR('');
            switchPN(); 
            cmbjenisbuku('');
            cmbbahasa('');
        });
        $("#edit_katalogBC").on('click',function(){
            viewFR('');
        });
    //     $("#kembaliBC").on('click',function(){
    //         // viewTB();
    //         switchPN_view();
    // });
    
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
    // $("#koleksiBC").on('click',function(){
    //         koleksiFR(); 
    // });
    //search action
        // $('#judulS,#kode_klasifikasiS,#pengarangS,#penerbitS').keydown(function (e){
        //     if(e.keyCode == 13)
        //         viewTB();
        // });
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
        //     function PreviewImage(e){
        //         var typex   = e.files[0].type;
        //         var sizex   = e.files[0].size;
        //         var namex   = e.files[0].name;
                
        //         if(typex =='image/png'||typex =='image/jpg'||typex =='image/jpeg'|| typex =='image/gif'){ //validasi format
        //             if(sizex>(900*900)){ //validasi size
        //                 notif('ukuran max 1 MB','red');
        //                 $(e).val('');
        //                 return false;   
        //             }else{ 
        //                 $('#previmg').attr('src','../img/w8loader.gif');
        //                 var reader = new FileReader();
        //                 reader.readAsDataURL(e.files[0]);
            
        //                 reader.onload = function (oFREvent){
        //                     var urlx  = oFREvent.target.result;
        //                     setTimeout(function(){
        //                         $('#previmg').attr('src',urlx);//.removeAttr('style');
        //                     },1000);
        //                 };
        //             }
        //         }else{ // format salah
        //             $('#previmg').attr('src','<img src="../img/loader.gif">');
        //             $(e).val('');
        //             notif('hanya format gambar(jpeg,jpg,png)','red');
        //             return false;
        //         }
        //     };
        //end of preview image sebelum upload -------

// // submit katalog ---------------------------
//             function katalogSV () {
//                 //add image
//                 var files =new Array();
//                 $("input:file").each(function() {
//                     files.push($(this).get(0).files[0]); 
//                 });
                 
//                 // Create a formdata object and add the files
//                 var filesAdd = new FormData();
//                 $.each(files, function(key, value){
//                     filesAdd.append(key, value);
//                 });

//                 if($('#k_photoTB').val()=='')//upload
//                     katalogDb('');
//                 else// ga upload
//                     katalogUp(filesAdd);
//             }
        //end of submit katalog ---------------------------

        // // upload image
        //     function katalogUp(dataAdd){
        //         $.ajax({
        //             url: dir+'?upload',
        //             type: 'POST',
        //             data: dataAdd,
        //             cache: false,
        //             dataType: 'json',
        //             processData: false,// Don't process the files
        //             contentType: false,//Set content type to false as jq 'll tell the server its a query string request
        //             success: function(data, textStatus, jqXHR){
        //                 if(data.status == 'sukses'){ //gak error
        //                     katalogDb(data);
        //                 }else{ //error
        //                     notif(data.status,'red');
        //                 }
        //             },error: function(jqXHR, textStatus, errorThrown){
        //                 notif('error'+textStatus,'red');// $('#loadarea').html('<img src="../img/loader.gif"> ').fadeOut();
        //             }
        //         });
        //     }
        //end of upload image

        // simpan ke database
            // function katalogDb(filex){
            //     var formData = $('#katalogFR').serialize();
            //     if($('#k_idformH').val()!=''){
            //         formData +='&replid='+$('#k_idformH').val();
            //     }

            //     if(filex!=''){// ada upload file nya
            //         formData +='&file='+filex.file ;    
            //         if($('#k_photoH').val()!=''){
            //             formData+='&photo_asal='+$('#k_photoH').val();
            //         }
            //     }
            //     // alert(formData);return false;
            //     $.ajax({
            //         url: dir,
            //         type:'POST',
            //         data:formData+'&aksi=simpan&subaksi=katalog',
            //         cache:false,
            //         dataType: 'json',
            //         success: function(data, textStatus, jqXHR){
            //             if(data.status != 'sukses')
            //                notif(data.status,'red');
            //             else
            //                notif(data.status,'green'); 
            //         },error: function(jqXHR, textStatus, errorThrown){
            //             console.log('ERRORS savedata2: ' + textStatus);
            //         },complete: function(){
            //             $.Dialog.close(); 
            //             // vwKatalog($('#k_grupS').val());
            //             // kkosongkan();
            //         }
            //     });
            // }
        // end of simpan ke database

//save process ---
    function simpan(){
        // var urlx ='&aksi=simpan&departemen='+$('#departemenS').val();
        var urlx ='&aksi=simpan&subaksi=katalog';
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
                     $('#katalogFR').removeAttr('style');
                     $('#panel1').attr('style','display:none;');
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
            }
        });
    }
 //end of save process ---

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
                    kosongkan();
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
                    kosongkan();
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
                    kosongkan();
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
                    kosongkan();
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
                    kosongkan();
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

//         //Add
//     function koleksiFR(id){
//         $.Dialog({
//             shadow: true,
//             overlay: true,
//             draggable: true,
//             width: 500,
//             padding: 10,
//             onShow: function(){
//                 var titlex;
//                 $.Dialog.title("Tambah Koleksi Buku");
//                 $.Dialog.content(koleksi_contentFR);
//             }
//         });
//     }
// // end of form ---


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
                        $('#jumlahTB').val(dt.halaman);
                        $('#edisiTB').val(dt.edisi);
                        $('#sinopsisTB').val(dt.deskripsi);

                        cmbjenisbuku(dt.jenisbuku);
                        cmbbahasa(dt.bahasa);
                    }
                });
            }else{ 

            }
            // epiii : switch panel
            switchPN();

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
                        $('#v_idformH').html(id);
                        $('#judulTD').html(dt.judul);
                        $('#klasifikasiTD').html(dt.kode_klas);
                        $('#klasifikasi_selectTD').html(dt.klasifikasi);
                        $('#pengarangTD').html(dt.pengarang);
                        $('#callnumberTD').html(dt.callnumber);
                        $('#penerjemahTD').html(dt.penerjemah);
                        $('#editorTD').html(dt.editor);
                        $('#penerbitTD').html(dt.penerbit);
                        $('#tahun_terbitTD').html(dt.tahun_terbit);
                        $('#kotaTD').html(dt.kota);
                        $('#isbnTD').html(dt.isbn);
                        $('#issnTD').html(dt.issn);
                        $('#bahasaTD').html(dt.bahasa);
                        $('#seri_bukuTD').html(dt.seri);
                        $('#volumeTD').html(dt.volume);
                        $('#edisiTD').html(dt.edisi);
                        $('#jenis_bukuTD').html(dt.jenisbuku);
                        // $('#photoTD').html(dt.photo);
                        $('#jumlahTD').html(dt.halaman);
                        $('#edisiTD').html(dt.edisi);
                        $('#sinopsisTD').html(dt.deskripsi);

                        cmbjenisbuku(dt.jenisbuku);
                        cmbbahasa(dt.bahasa);
                    }
                });
            }else{ //add

            }
            // epiii : switch panel
            switchPN_view();
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
                    $.ajax({
                        url:dir,
                        data:'aksi=replid',
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#lokasiH').val($('#lokasiS').val());
                            // $('#lokasiTB').val(dt.lokasi[0].kode);
                            cmblokasi('');
                        }
                    });

                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Tambah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&subaksi=koleksi&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            var arr = {
                                    'status':dt.stat,
                                    'judul':dt.judul
                            };
                            // $('#koleksiH').val(id);
                            // $('#judulTD').html(dt.judul);alert(dt.judul);
                            // $('#jmlTB').val(dt.jum);
                            // $('#idbukuTB').val(dt.kode);
                            // $('#barcodeTB').val(dt.barkode);
                            //         $.each($('input[name="sumberTB"]'),function(){
                            //             if(dt.sumber==$(this).val())
                            //                 $(this).attr('checked',true);
                            //         });                            
                            // $('#hargaTB').val(dt.harga);
                            // $('#tglTB').val(dt.tanggal);
                            // $('#lokasiTB').val(dt.lokasi);
                            // $('#tingkatTB').val(dt.tingkatbuku);
                            
                            cmblokasi(dt.lokasi);
                            cmbtingkatbuku(dt.tingkatbuku);

                        }
                    });
                }
                setTimeout(function(){
                    $.Dialog.title(titlex+' Koleksi');
                    $.Dialog.content(koleksi_contentFR);
                },2000);
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

        function cmblokasi (lokasi) {
            // alert(1);return false;
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
                        // alert(id);return false;
                        var opt = '';
                        $.each(dt.lokasi,function(id,item){
                            if(lokasi==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>'
                            else
                                opt+='<option value="'+item.replid+'">'+item.nama+'</option>'
                        });$('#lokasiTB').html('<option value="">Pilih Lokasi ..</option>'+opt);
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
        // $('#kelompokTB').val('');
        // $('#tglmulaiTB').val('');
        // $('#tglakhirTB').val('');
        // $('#biaya_pendaftaranTB').val('');
        // $('#kelompokTB').val('');
        // $('#keteranganTB').val('');
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
