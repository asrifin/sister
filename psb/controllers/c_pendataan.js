var mnu       = 'pendataan';
var mnu2      = 'departemen';
var mnu3      = 'proses';
// var mnu3      = 'tahunajaran';
var mnu4      = 'kriteriaCalonSiswa';
var mnu5      = 'golonganCalonSiswa';
var mnu6      = 'setAngsuran'; 
var mnu_kel   = 'kelompok';
var dir       = 'models/m_'+mnu+'.php';
var dir2      = '../akademik/models/m_'+mnu2+'.php';
var dir3      = 'models/m_'+mnu3+'.php';
var dir_kel   = 'models/m_'+mnu_kel+'.php';
var dir4      = 'models/m_'+mnu4+'.php';
var dir5      = 'models/m_'+mnu5+'.php';
var dir6      = 'models/m_'+mnu6+'.php';
var contentFR = '';

//epiii : switch panel (form<=>table)
    function switchPN(){
        $('#pendataanFR').toggle('slow');
        // $('#importFR').toggle('slow');
        $('#pendataanTBL').toggle('slow');
    }
    function switchPN2(){
        $('#importFR').toggle('slow');
        $('#pendataanTBL').toggle('slow');
    }



// main function ---
    $(document).ready(function(){
        cmbdepartemen('');
        // $('#panel1').removeAttr('style');
        // $('#pendataanFR').attr('style','display:none;');

                content +='<div class="span10">'
                            +'<table>'
                            +'<tr>'
                                +'<td>Departemen</td>'
                                +'<td>: <b id="departemenTD"></b></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Proses Penerimaan</td>'
                                +'<td>: <span id="prosesTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Kelompok calon siswa</td>'
                                +'<td>: <span id="kelompokTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>No. Pendaftaran</td>'
                                +'<td>: <span id="nopendaftaranTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Status</td>'
                                +'<td>: <span id="statusTD"></span></td>'
                            +'</tr>'
                        +'</table>'
                            +'</div>'
                            //Data Siswa
                        +'<div style="overflow:scroll;height:600px;">'
                        +'<table>'
                            +'<tr>'
                                +'<td colspan="2"><b>Data Pribadi Siswa :</b></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td class="span3">: <span id="nama_siswaTD"></span></td>'
                                +'<input type="hidden" id="photo2H"/>'
                                +'<td rowspan="6"> <img width="150" id="previmg" src="../img/no_image.jpg" ><br></td>'
                                // +'<input onchange="PreviewImage2(this);" id="photoTD" name="photoTD" type="file">'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Jenis kelamin</td>'
                                +'<td>: <span id="jkTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Tempat lahir</td>'
                                +'<td>: <span id="temp_lahirTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Tanggal lahir</td>'
                                +'<td>: <span id="tgl_lahirTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Agama</td>'
                                +'<td>: <span id="agamaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Alamat rumah</td>'
                                +'<td>: <span id="alamatTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Telepon rumah</td>'
                                +'<td>: <span id="teleponTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>&nbsp</td>'
                                +'<td>&nbsp</td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td><b>Kesehatan Siswa</b></td>'
                                +'<td>&nbsp</td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Golongan Darah</td>'
                                +'<td>: <span id="goldarahTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Penyakit yang pernah diderita</td>'
                                +'<td>: <span id="penyakitTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Alergi terhadap</td>'
                                +'<td>: <span id="alergiTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>&nbsp</td>'
                                +'<td>&nbsp</td>'
                            +'</tr>'
                            //Data Orang Tua
                            +'<tr>'
                                +'<td colspan="2"><b>Data Orantua Siswa :</b></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>&nbsp;</td>'
                                +'<td class="span4">&nbsp&nbspAyah</td>'
                                +'<td>Ibu</td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="nama_ayahTD"></span></td>'
                                +'<td><span id="nama_ibuTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Kebangsaan</td>'
                                +'<td>: <span id="kebangsaan_ayahTD"></span></td>'
                                +'<td><span id="kebangsaan_ibuTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Tempat lahir</td>'
                                +'<td>: <span id="temp_lahir_ayahTD"></span></td>'
                                +'<td><span id="temp_lahir_ibuTD"></span></td>'
                            +'</tr>'

                            +'<tr>'
                                +'<td>Tanggal lahir</td>'
                                +'<td>: <span id="tgl_lahir_ayahTD"></span></td>'
                                +'<td><span id="tgl_lahir_ibuTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Pekerjaan</td>'
                                +'<td>: <span id="pekerjaan_ayahTD"></span></td>'
                                +'<td><span id="pekerjaan_ibuTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Telepon Orantua</td>'
                                +'<td>: <span id="telepon_ayahTD"></span></td>'
                                +'<td><span id="telepon_ibuTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>PIN BB Orantua</td>'
                                +'<td>: <span id="pinbb_ayahTD"></span></td>'
                                +'<td><span id="pinbb_ibuTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Email Orantua</td>'
                                +'<td>: <span id="email_ayahTD"></span></td>'
                                +'<td><span id="email_ibuTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>&nbsp</td>'
                                +'<td>&nbsp</td>'
                            +'</tr>'
                            //Data Keluarga Siswa
                            +'<tr>'
                                +'<td colspan="2"><b>Data Keluarga Siswa :</b></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Tanggal perkawinan Orantua</td>'
                                +'<td>: <span id="tgl_perkawinanTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama Kakek</td>'
                                +'<td>: <span id="kakekTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama Nenek</td>'
                                +'<td>: <span id="nenekTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>&nbsp</td>'
                                +'<td>&nbsp</td>'
                            +'</tr>'
                            //Saudara Siswa
                            +'<tr>'
                                +'<td colspan="2"><b>Saudara Siswa :</b></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama Saudara</td>'
                                +'<td>: <span id="nama_saudaraTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Tanggal lahir Saudara</td>'
                                +'<td>: <span id="tgl_lahir_saudaraTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Sekolah Saudara</td>'
                                +'<td>: <span id="sekolah_saudaraTD"></span></td>'
                            +'</tr>'
                            //Nomor yang dapat dihubungi
                            +'<tr>'
                                +'<td colspan="2"><b>Dalam Kondisi Mendesak, orang yang dapat dihubungi (selain orang tua) :</b></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="nama_daruratTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Hubungan</td>'
                                +'<td>: <span id="hubunganTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nomor yang dapat dihubungi</td>'
                                +'<td>: <span id="nomor_daruratTD"></span></td>'
                            +'</tr>'
                        +'</table>'
                        +'</div>'


    // epiii : button action
        $("#tambahBC").on('click',function(){
            switchPN(); 
            cmbkriteria('');
            cmbgolongan('');
            cmbagama('');
            cmbangsuran('');
            getuang('');
            inputuang('');
        // $('#').on('click',switchPN);
    });$("#importBC").on('click',function(){
            switchPN2();             
        });
        
    //search action
        $('#departemenS').on('change',function(){
            cmbproses($(this).val());
        });$('#prosesS').on('change',function (){
            cmbkelompok($(this).val());
        });$('#kelompokS').on('change',function (){
            viewTB(); 
        })
        $('#nopendaftaranS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });$('#namaS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });


        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#namaS').val('');
            $('#nopendaftaranS').val('');
        });
        $("#diskon_subsidiTB,#diskon_saudaraTB").keydown(function(){
             hitung_diskon();
             getuang($("#diskon_subsidiTB").val());
        });
        $("#diskon_tunaiTB").change(function(){
             hitung_diskon();
        });

    }); 

// end of save process ---

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
                        $('#previmg2').attr('src','../img/w8loader.gif');
                        var reader = new FileReader();
                        reader.readAsDataURL(e.files[0]);
            
                        reader.onload = function (oFREvent){
                            var urlx  = oFREvent.target.result;
                            setTimeout(function(){
                                $('#previmg2').attr('src',urlx);//.removeAttr('style');
                            },1000);
                        };
                    }
                }else{ // format salah
                    $('#previmg2').attr('src','<img src="../img/loader.gif">');
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
                }cmbproses(dt.departemen[0].replid);
            }
        });
    }
//end of combo departemen ---

// combo tahunajaran ---
    function cmbproses(dep){
        $.ajax({
            url:dir3,
            data:'aksi=cmbproses&departemen='+dep,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.proses, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.proses+' (aktif)</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.proses+'</option>';
                        }
                    });
                    // viewTB(dep,dt.proses[0].replid); 
                }
                $('#prosesS').html(out);
                cmbkelompok(dt.proses[0].replid);

                // viewTB(); 
            }
        });
    }
//end of combo tahunajaran ---

// combo kelompok ---
    function cmbkelompok(thn){
        $.ajax({
            url:dir_kel,
            data:'aksi=cmbkelompok&proses='+thn,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.kelompok, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.kelompok+' </option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.kelompok+'</option>';
                        }
                    });
                    // viewTB(dep,dt.kelompok[0].replid); 
                }
                $('#kelompokS').html(out);
                viewTB(); 
            }
        });
    }
//end of combo tahunajaran ---


//save process ---
    function siswaSV(){
        // var urlx ='&aksi=simpan&departemen='+$('#departemenS').val();
        var urlx ='&aksi=simpan&subaksi=siswa';
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
                     $('#pendataanFR').removeAttr('style');
                     $('#importFR').removeAttr('style');
                     $('#panel1').attr('style','display:none;');
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
        var cari = '&namaS='+$('#namaS').val()
                    +'&departemenS='+$('#departemenS').val()
                    +'&prosesS='+$('#prosesS').val()
                    +'&kelompokS='+$('#kelompokS').val()
                    +'&nopendaftaranS='+$('#nopendaftaranS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="10"><img src="../img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---
        
        function viewFR(id) {
            // epi:edit
            if(id!='') {
                $.ajax({
                    url : dir,
                    type: 'post',
                    data:'aksi=ambiledit&replid='+id,
                    dataType:'json',
                    success:function(dt){
                        $('#idformH').val(id);
                        $('#uang_pangkalTB').val(dt.sumpokok);
                        $('#uang_pangkalnetTB').val(dt.sumnet);
                        $('#angsuranTB').val(dt.angsuran);
                        $('#sppTB').val(dt.sppbulan);
                        $('#diskon_subsidiTB').val(dt.disctb);
                        $('#diskon_saudaraTB').val(dt.discsaudara);
                        $('#diskon_tunaiTB').val(dt.disctunai);
                        $('#diskon_totalTB').val(dt.disctotal);
                        $('#nopendaftaranTB').val(dt.nopendaftaran);
                        $('#namaTB').val(dt.siswa);
                        $('#tempatlahirTB').val(dt.tmplahir);
                        $('#tgllahiranakTB').val(dt.tgllahir);
                        $('#alamatsiswaTB').val(dt.alamat);
                        $('#telpsiswaTB').val(dt.telpon);
                        $('#asalsekolahTB').val(dt.sekolahasal);
                        //Orangtua
                        $('#ayahTB').val(dt.nama_ayah);
                        $('#kebangsaan_ayahTB').val(dt.kebangsaan_ayah);
                        $('#tempatlahir_ayahTB').val(dt.tempatlahir_ayah);
                        $('#tgllahir_ayahTB').val(dt.tgllahir_ayah);
                        $('#pekerjaan_ayahTB').val(dt.pekerjaan_ayah);
                        $('#telpayahTB').val(dt.telpayah);
                        $('#pinbb_ayahTB').val(dt.pinbb_ayah);
                        $('#email_ayahTB').val(dt.email_ayah);
                        
                        $('#ibuTB').val(dt.nama_ibu);
                        $('#kebangsaan_ibuTB').val(dt.kebangsaan_ibu);
                        $('#tempatlahir_ibuTB').val(dt.temp_lahir_ibu);
                        $('#tgllahir_ibuTB').val(dt.tgllahir_ibu);
                        $('#pekerjaan_ibuTB').val(dt.pekerjaan_ibu);
                        $('#telpibuTB').val(dt.telepon_ibu);
                        $('#pinbb_ibuTB').val(dt.pinbb_ibu);
                        $('#email_ibuTB').val(dt.email_ibu);

                        $('#nama_kontakTB').val(dt.namalain);
                        $('#hubunganTB').val(dt.hubungan);
                        $('#nomorTB').val(dt.telponlain);

                        $('#kakekTB').val(dt.kakek);
                        $('#nenekTB').val(dt.nenek);

                        // $('#kakekTB').val(dt.kakek-nama);
                        // $('#nenekTB').val(dt.nenek-nama);
                        cmbkriteria(dt.kriteria);
                        cmbgolongan(dt.golongan);
                        cmbagama(dt.agama);
                        cmbangsuran(dt.jmlangsur);
                    }
                });
            }else{ 

            }
            // epiii : switch panel
            switchPN();

        }  

        function cmbkriteria (kriteria) {
            // alert(1);return false;
            $.ajax({
                url:dir4,   
                type:'post',
                dataType:'json',
                data:'aksi=cmb'+mnu4,
                success:function(dt){
                    var opt='';
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                        opt+='<option value="">'+dt.status+'</option>'
                    }else{
                        // alert(id);return false;
                        var opt = '';
                        $.each(dt.kriteria,function(id,item){
                            if(kriteria==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.kriteria+'</option>'
                            else
                                opt+='<option value="'+item.replid+'">'+item.kriteria+'</option>'
                        });$('#kriteriaTB').html('<option value="">Pilih Kriteria ..</option>'+opt);
                    }
                },
            });
        }

        function cmbgolongan (golongan) {
            // alert(1);return false;
            $.ajax({
                url:dir5,   
                type:'post',
                dataType:'json',
                data:'aksi=cmb'+mnu5,
                success:function(dt){
                    var opt='';
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                        opt+='<option value="">'+dt.status+'</option>'
                    }else{
                        // alert(id);return false;
                        var opt = '';
                        $.each(dt.golongan,function(id,item){
                            if(golongan==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.golongan+'</option>'
                            else
                                opt+='<option value="'+item.replid+'">'+item.golongan+'</option>'
                        });$('#golonganTB').html('<option value="">Pilih Golongan ..</option>'+opt);
                    }
                },
            });
        }

        function cmbagama (agama) {
            // alert(1);return false;
            $.ajax({
                url:dir,   
                type:'post',
                dataType:'json',
                data:'aksi=cmbagama',
                success:function(dt){
                    var opt='';
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                        opt+='<option value="">'+dt.status+'</option>'
                    }else{
                        // alert(id);return false;
                        var opt = '';
                        $.each(dt.agama,function(id,item){
                            if(agama==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.agama+'</option>'
                            else{
                                if (item.urutan=='3') 
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.agama+'</option>'
                            else 
                                opt+='<option value="'+item.replid+'">'+item.agama+'</option>'
                            }
                        });$('#agamaTB').html('<option value="">Pilih Agama ..</option>'+opt);
                    }
                },
            });
        }

        function cmbangsuran (cicilan) {
            // alert(1);return false;
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
                        // alert(id);return false;
                        var opt = '';
                        $.each(dt.cicilan,function(id,item){
                            if(cicilan==item.replid)
                                opt+='<option selected="selected" value="'+item.replid+'">'+item.cicilan+'</option>'
                            else
                                opt+='<option value="'+item.replid+'">'+item.cicilan+'</option>'
                        });$('#angsuranTB').html('<option value="">Pilih Angsuran ..</option>'+opt);
                    }
                },
            });
        }

        function hitung(){
            var pangkal       = $("#uang_pangkalTB").val();
            var pangkalnet    = $("#uang_pangkalnetTB").val();
            var angsuran      = $("#angsuranTB").val();
            var angsuranbulan = $("#angsuranbulanTB").val();
        }

        function hitung_diskon(){
            var disc_subsidi  = parseFloat(getuang($("#diskon_subsidiTB").val()));
            var disc_saudara  = parseFloat(getuang($("#diskon_saudaraTB").val()));
            var disc_tunai    = parseFloat(getuang($("#disc_tunai").val()));
            var disc_tunaiTB  = parseFloat(getuang($("#disc_tunaiTB").val()));
            if(disc_subsidi>0 && disc_saudara>0 && disc_tunaiTB>0){
                var total_diskon = disc_subsidi+disc_saudara+disc_tunaiTB;
                $("#diskon_totalTB").val(total_diskon);
            }
        }


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
                $(el2).html('<tr><td align="center" colspan="10"><img src="../img/w8loader.gif"></td></tr></center>');
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

//load  detail Siswa ---
    function Modal(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            data:'aksi=detail&replid='+id,
            width: 'auto',
            height: '500',
            padding: 10,
            // onShow: function(res){
            onShow: function(){
                var titl,cont;
                    cont= content;
                    titl= 'Data Calon Siswa';
                    // var res = ajax(dir,'aksi=detail&replid='+id);  // <-- hapus lagi comment nya gan  (epiii) 
                    ajax(dir,'aksi=detail&replid='+id).done(function(res){
                        $('#departemenTD').html(res.data.departemen);
                        $('#prosesTD').html(res.data.proses);
                        $('#kelompokTD').html(res.data.kelompok);
                        $('#nopendaftaranTD').html(res.data.nopendaftaran);
                        $('#statusTD').html(res.data.statusx);
                        $('#nama_siswaTD').html(res.data.nama_siswa);
                        $('#jkTD').html(res.data.jk);
                        $('#temp_lahirTD').html(res.data.temp_lahir);
                        $('#tgl_lahirTD').html(res.data.tgl_lahir);
                        $('#agamaTD').html(res.data.agama);
                        $('#alamatTD').html(res.data.alamat);
                        $('#teleponTD').html(res.data.telepon);
                        $('#goldarahTD').html(res.data.goldarah);
                        $('#penyakitTD').html(res.data.penyakit);
                        $('#alergiTD').html(res.data.alergi);
                        var img;
                        if(res.data.photo2!='' && res.data.photo2!=null){//ada gambar
                            img='../img/upload/'+res.data.photo2;
                        }else{
                            img='../img/no_image.jpg';
                        }
                        $('#previmg2').attr('src',img);
                        $('#photo2H').html(res.data.photo2); 
                    //Saudara Siswa                       
                        $('#nama_saudaraTD').html(res.data.nama_saudara);
                        $('#tgl_lahir_saudaraTD').html(res.data.tgl_lahir_saudara);
                        $('#sekolah_saudaraTD').html(res.data.sekolah_saudara);
                    // data ayah
                        $('#nama_ayahTD').html(res.data.nama_ayah);
                        $('#kebangsaan_ayahTD').html(res.data.kebangsaan_ayah);
                        $('#temp_lahir_ayahTD').html(res.data.temp_lahir_ayah);
                        $('#tgl_lahir_ayahTD').html(res.data.tgl_lahir_ayah);
                        $('#telepon_ayahTD').html(res.data.telepon_ayah);
                        $('#pinbb_ayahTD').html(res.data.pinbb_ayah);
                        $('#pinbb_ayahTD').html(res.data.email_ayah);
                    //Data Ibu
                        $('#nama_ibuTD').html(res.data.nama_ibu);
                        $('#kebangsaan_ibuTD').html(res.data.kebangsaan_ibu);
                        $('#temp_lahir_ibuTD').html(res.data.temp_lahir_ibu);
                        $('#tgl_lahir_ibuTD').html(res.data.tgl_lahir_ibu);
                        $('#telepon_ibuTD').html(res.data.telepon_ibu);
                        $('#pinbb_ibuTD').html(res.data.pinbb_ibu);
                        $('#pinbb_ibuTD').html(res.data.email_ibu);
                    //Data Saudara
                        $('#tgl_perkawinanTD').html(res.data.tgl_perkawinan);
                        $('#kakekTD').html(res.data.kakek);
                        $('#nenekTD').html(res.data.nenek);
                    //Data Kontak Darurat
                        $('#nama_daruratTD').html(res.data.nama_darurat);
                        $('#hubunganTD').html(res.data.hubungan);
                        $('#nomor_daruratTD').html(res.data.nomor_darurat);
                    });

                    // ajax(dir,'aksi=detail&replid='+id);  // <-- hapus lagi comment nya gan  (epiii) 
                    // alert(res.data.nama_siswa);return false;
                    // setTimeout(function(){
                    //     $('#nama_siswaTD').html(res.data.nama_siswa);
                    //     $('#jkTD').html(res.data.jk);
                    //     $('#temp_lahirTD').html(res.data.temp_lahir);
                    //     // $('#tgl_lahirTD').html(res.data.tgl_lahir);
                    //     // $('#agamaTD').html(res.data.agama);
                    //     // $('#alamatTD').html(res.data.alamat);
                    //     // $('#teleponTD').html(res.data.telepon);
                    //     // $('#goldarahTD').html(res.data.goldarah);
                    //     // $('#penyakitTD').html(res.data.penyakit);
                    //     // $('#alergiTD').html(res.data.alergi);
                    // // data ayah
                    //     $('#nama_ayahTD').html(res.data.nama_ayah);
                    // data ibu
                    // },100);
                $.Dialog.title(titl);
                $.Dialog.content(cont);
            }
        });
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

// input uang --------------------------
    function inputuang(e) {
        $(e).maskMoney({
            precision:0,
            prefix:'Rp. ', 
            // allowNegative: true, 
            thousands:',', 
            // decimal:',', 
            affixesStay: true
        });
    }
// end of input uang --------------------------

// get uang --------------------------
    function getuang(e) {
        x = $(e).val().replace(/[^0-9]/g,'')
        return x;
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
