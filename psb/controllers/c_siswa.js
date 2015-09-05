var mnu       = 'siswa';
var mnu2      = 'departemen';
var mnu3      = 'tahunajaran';
var mnu4      = 'tingkat';
var mnu5      = 'golongan';
var mnu6      = 'angsuran'; 
var mnu7      = 'detaildiskon';
var mnu8      = 'detailgelombang';
var mnu9      = 'subtingkat';

var dir       = 'models/m_'+mnu+'.php';
var dir2      = '../akademik/models/m_'+mnu2+'.php';
var dir3      = '../akademik/models/m_'+mnu3+'.php';
var dir4      = '../akademik/models/m_'+mnu4+'.php';
var dir5      = 'models/m_'+mnu5+'.php';
var dir6      = 'models/m_'+mnu6+'.php';
var dir7      = 'models/m_'+mnu7+'.php';
var dir8      = 'models/m_'+mnu8+'.php';
var dir9      = '../akademik/models/m_'+mnu9+'.php';
var contentFR = '';

// main function ---
var selectedDiskReg = new Array;
    $(document).ready(function(){
        cmbdepartemen('filter','');
        contentFR +='<form style="overflow:scroll;height:560px;"  enctype="multipart/form-data" autocomplete="off" onsubmit="simpanSV(); return false;">' 
                        // accordion
                        +'<div class="accordion with-marker xspan3 xplace-left margin10" data-role="accordion" data-closeany="true">'
                            // kriteria
                            +'<div class="accordion-frame active">'
                                +'<a class="heading bg-lightBlue fg-white" href="#">Kriteria Siswa</a>'
                                +'<div  style="display: block;" class="content grid">'
                                    // baris 1
                                    +'<div class="row">'
                                        // kolom1
                                        +'<div class="span3">'
                                            // departemen
                                            +'<label>Departemen</label>'
                                            +'<div class="input-control select xsize3">'
                                                +'<select required onchange="cmbdetailgelombang(\'form\',\'\'); getBiaya();" id="departemenTB" name="departemenTB"></select>'
                                            +'</div>'
                                            // tahunajaran
                                            +'<label>Tahun Ajaran</label>'
                                            +'<div class="input-control select xsize3">'
                                                +'<select required  onchange="cmbdetailgelombang(\'form\',\'\'); getBiaya();;" id="tahunajaranTB" name="tahunajaranTB"></select>'
                                            +'</div>'
                                            // Detailgelombang
                                            +'<label>Detail Gelombang</label>'
                                            +'<div class="input-control select xsize3">'
                                                +'<select onchange=" getBiaya();" required id="detailgelombangTB" name="detailgelombangTB"><option value="">-silahkan pilih Dept. dan Tahun Ajaran dahulu-</option></select>'
                                            +'</div>'
                                            // tingkat
                                            +'<label>Tingkat</label>'
                                            +'<div class="input-control select xsize3">'
                                                +'<select required onchange="cmbsubtingkat(\'form\',$(\'#tingkatTBZ\').val()); getBiaya();" id="tingkatTBZ" name="tingkatTB"></select>'
                                            +'</div>'
                                            // subtingkat
                                            +'<label>Sub Tingkat</label>'
                                            +'<div class="input-control select xsize3">'
                                                +'<select onchange=" getBiaya();"  required id="subtingkatTB" name="subtingkatTB"></select>'
                                            +'</div>'
                                            // golongan
                                            +'<label>Golongan</label>'
                                            +'<div class="input-control select xsize3">'
                                                +'<select onchange=" getBiaya();"  required id="golonganTBZ" name="golonganTBs"></select>'
                                            +'</div>'
                                        +'</div>'
                                            
                                        // kolom2
                                        +'<div id="biayaDV" class="span6"></div>'
                                    +'</div>'


                                +'</div>'
                            +'</div>'
                            
                            // bioadata
                            +'<div class="accordion-frame">'
                                +'<a class="heading bg-lightBlue fg-white" href="#">Biodata</a>'
                                +'<div style="display: block;" class="content">'
                                    +'<div id="bioadataTD"></div>'
                                +'</div>'
                            +'</div>'

                        +'</div>'
                        // end of accrdion 
                    +'</form>';

    // button action
        $("#batalBC").on('click',function(){
            switchPN('view','');
        });
        // $("#lihatBC").on('click',function(){
        //     switchPN('view','');
        // });
        // $("#tambahBC").on('click',function(){
        //     switchPN('form',''); 
        // });
        $("#tambahsdrBC").on('click',function(){
            $('#cetak').toggle('slow');
        });
        $("#saudara2TB").on('click',function(){
            $('#saudara2').toggle('slow');
            $('#saudara').toggle('slow');
        });

    //search action
        // $('#departemenS').on('change',function(){
        //     cmbtahunajaran('filter',$(this).val(),'');
        // });
        // $('#tahunajaranS').on('change',function (){
        //     cmbkelompok('filter',$(this).val(),'');
        // });
        // $('#kelompokS').on('change',function (){
        //     viewTB(); 
        // })
        $('#prosesTB').on('change',function(){
            cmbkelompok('form',$(this).val(),'');
        });
        $('#nopendaftaranS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });$('#namaS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });$('#tingkatS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });

        //add
        $("#klasifikasiBC").on('click',function(){
            saudaraFR();
        });

    // search button
        $("#diskon_subsidiTB,#diskon_saudaraTB").keyup(function(){
            hitung_diskon();
            hitung_dpp();
        }); $("#diskon_tunai").change(function(){
            setdiskon();
            hitung_diskon();
            hitung_dpp();
        });
    }); 

    function cariFC() {
        $('#cariTR').toggle('slow');
        $('#namaS').val('');
        $('#nopendaftaranS').val('');
        $('#tingkatS').val('');
    }
        
//preview image sebelum upload -------
/*    function PreviewImage2(e){
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
*/
//preview image sebelum upload -------
    function PreviewImage(e){
        var typex   = e.files[0].type;
        var sizex   = e.files[0].size;
        var namex   = e.files[0].name;
        
        if(typex =='image/png'||typex =='image/jpg'||typex =='image/jpeg'|| typex =='image/gif'){ //validasi format
            // alert('masuk valid type');
            if(sizex>(900*900)){ //validasi size
                // alert('masuk invalid size');
                notif('ukuran max 1 MB','red');
                $(e).val('');
                return false;   
            }else{ 
                // alert('masuk preview');
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
            // alert('masuk invalid type');
            $('#previmg').attr('src','<img src="../img/loader.gif">');
            $(e).val('');
            notif('hanya format gambar(jpeg,jpg,png)','red');
            return false;
        }
    };

// autosuggest
    // function autoSuggest(el,subaksi,opsi){
    //     if(subaksi=='saudara'){
    //         var urlx = '?aksi=autocomp&subaksi='+subaksi;
    //         var col= [{
    //                 'align':'left',
    //                 'columnName':'siswa',
    //                 'hide':true,
    //                 'width':'55',
    //                 'label':'Nama'
    //             },{   
    //                 'columnName':'sekolah',
    //                 'width':'40',
    //                 'label':'Sekolah'
    //             }];
    //     }
    //     /*else{ // anggaran 
    //         var urlx= '?aksi=autocomp&subaksi='+subaksi;
    //         var col =[{
    //                 'align':'left',
    //                 'columnName':'nama',
    //                 'hide':true,
    //                 'width':'30',
    //                 'label':'Anggaran'
    //         },{   
    //                 'align':'left',
    //                 'columnName':'kategorianggaran',
    //                 'width':'15',
    //                 'label':'Kategori'
    //         },{   
    //                 'align':'left',
    //                 'columnName':'tingkat',
    //                 'width':'25',
    //                 'label':'Jenjang'
    //         },{   
    //                 'align':'right',
    //                 'columnName':'sisaBilCur',
    //                 'width':'15',
    //                 'label':'Sisa'
    //         },{   
    //                 'align':'right',
    //                 'columnName':'kuotaBilCur',
    //                 'width':'15',
    //                 'label':'Nominal'
    //         }];
    //     }*/
    //     urly = dir+urlx;
    //     var t= terpilihx = '';
    //     if(rekArr!='' || rekArr!=null){
    //         t         = rekArr.filter(function(item) { return item !== ''; });
    //         terpilihx = '&terpilihArr='+t.toString();
    //     }

    //     $('#'+el+'TB').combogrid({
    //         debug:true,
    //         width:'750px',
    //         colModel: col ,
    //         url: urly+terpilihx,
    //         select: function( event, ui ) { // event setelah data terpilih 
    //             $('#'+el+'H').val(ui.item.replid);
    //             if(subaksi=='saudara'){ // diskon dari saudara 
    //                 saudaraAdd(ui.item.replid,ui.item.siswa,ui.item.sekolah);
    //                 $('#nama_saudaraTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiS').val()+'&saudara='+saudaraArr() );
    //             }
    //             else if (subaksi=='rek') { // rekening 
    //                 $('#'+el+'TB').val(ui.item.nama+' ( '+ui.item.kode+' )');
    //                 var arr = rekArrFC();
    //                 var str = arr.toString();
    //                 console.log('terpilih in auto 1 =>'+str);
    //             }

    //             // validasi input (tidak sesuai data dr server)
    //                 $('#'+el+'TB').on('keyup', function(e){
    //                     var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
    //                     var keyCode = $.ui.keyCode;
    //                     if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
    //                         if($('#'+el+'H').val()!=''){
    //                             $('#'+el+'H').val('');
    //                             $('#'+el+'TB').val('');
            
    //                             var str = rekArr.toString();
    //                             console.log('terpilih in auto 2 =>'+str+' arr=> '+rekArr);
    //                             if(subaksi=='out_come') $('#detilanggaranV').val(''); // :: out_come
    //                         }
    //                     }
    //                 });
    //                 $('#'+el+'TB').on('blur,change',function(){
    //                     if($('#'+el+'H').val()=='') {
    //                         $('#'+el+'TB').val(''); // :: all 
    //                         if(subaksi=='out_come') $('#detilanggaranV').val(''); // :: out_come
    //                     }
    //                 });
    //             return false;
    //         }
    //     });
    // }

// switch panel 
    function switchPN(typ,id){
        if(typ=='view'){ // viw table
        // button
            $('#lihatBC').attr('style','display:none;');
            $('#tambahBC').removeAttr('style');
            $('#cariBC').removeAttr('style');
        // panel    
            $('#pendataanTBL').removeAttr('style');
            $('#pendataanFR').attr('style','display:none;');
            $('.cari').removeAttr('style');
            viewTB();
            kosongkan();
        }else{ // form (add||edit)
        // button
            $('#tambahBC').attr('style','display:none;');
            $('#cariBC').attr('style','display:none;');
            $('#lihatBC').removeAttr('style');
        // panel    
            $('#pendataanFR').removeAttr('style');
            $('#pendataanTBL').attr('style','display:none;');
            $('.cari').attr('style','display:none;');
            
            if(id==''){ // add mode 
                getNoPendaftaran('');
                cmbtahunajaran('form',$('#departemenS').val(),'');
                cmbkelompok('');
                cmbtingkat('');
                cmbdisctunai('');
                cmbgolongan('');
                cmbagama('');
                cmbangsuran('');
            }else{ //edit mode
                var u =dir;
                var d ='aksi=ambiledit&replid='+id;
                ajax(u,d).done(function  (dt) {
                    $('#idformH').val(id);
                // data siswa
                    cmbtahunajaran('form',$('#departemenS').val(),dt.tahunajaran);
                    cmbkelompok('form',dt.tahunajaran,dt.kelompok);
                    cmbtingkat(dt.tingkat);
                    cmbgolongan(dt.golongan);
                    $('#nopendaftaranH').val(dt.nopendaftaranH);
                    $('#nopendaftaranTB').val(dt.nopendaftaran);
                    $('#namaTB').val(dt.namaSiswa);
                    var kelamin = dt.kelamin;
                    $.each($('input[name="jkTB"]'),function(){
                        // if(dt.kelamin==$(this).val()) $(this).addClass('bg-red');
                        if(kelamin == $(this).val()) {
                            $(this).attr('checked',true);
                        } 
                            // console.log('kel dt = '+dt.kelamin+',kel val '+$(this).val());
                    });$('#tempatlahirTB').val(dt.tmplahir);
                    $('#tgllahiranakTB').val(dt.tgllahir);
                    cmbagama(dt.agama);
                    $('#alamatsiswaTB').val(dt.alamat);
                    $('#telpsiswaTB').val(dt.telpon);
                    $('#asalsekolahTB').val(dt.sekolahasal);
                    $('#goldarahTB').val(dt.darah);
                    $('#penyakitTB').val(dt.kesehatan);
                    $('#catatan_kesehatanTB').val(dt.ketkesehatan);
                    var img;
                    if(dt.photo!='' && dt.photo!=null)   img='./img/upload/'+dt.photo; // ada foto 
                    else img='./img/no_image.jpg'; // tdak ada foto

                    $('#previmg2').attr('src',img);
                    $('#photoH').val(dt.photo);
                // pembayaran
                    $('#setbiayaTB').val(dt.setbiaya);
                    $('#registrationTD').html(dt.registration);
                    cmbangsuran(dt.angsuran);
                    $('#discangsuranTD').html(dt.discangsuran);
                    $('#discsubsidiTB').val(dt.discsubsidi);
                    $('#discsaudaraTB').val(dt.discsaudara);
                    $('#disctotalTD').html(dt.disctotal);
                    $('#registrationnetTD').html(dt.registrationnet);
                    cmbdisctunai(dt.iddisctunai);
                    $('#disctunai2TD').html(dt.disctunai);
                    $('#materialTD').html(dt.material);
                    $('#tuitionTD').html(dt.tuition);
                //ayah
                    $('#ayahTB').val(dt.namaAyah);
                    $('#kebangsaan_ayahTB').val(dt.kebangsaanAyah);
                    $('#tempatlahir_ayahTB').val(dt.tmplahirAyah);
                    $('#tgllahir_ayahTB').val(dt.tgllahirAyah);
                    $('#pekerjaan_ayahTB').val(dt.pekerjaanAyah);
                    $('#telpayahTB').val(dt.telponAyah);
                    $('#pinbb_ayahTB').val(dt.pinbbAyah);
                    $('#email_ayahTB').val(dt.emailAyah);
                //ibu
                    $('#ibuTB').val(dt.namaIbu);
                    $('#kebangsaan_ibuTB').val(dt.kebangsaanIbu);
                    $('#tempatlahir_ibuTB').val(dt.tmplahirIbu);
                    $('#tgllahir_ibuTB').val(dt.tgllahirIbu);
                    $('#pekerjaan_ibuTB').val(dt.pekerjaanIbu);
                    $('#telpibuTB').val(dt.telponIbu);
                    $('#pinbb_ibuTB').val(dt.pinbbIbu);
                    $('#email_ibuTB').val(dt.emailIbu);
                // kontak darurat
                    $('#nama_kontakTB').val(dt.namaDarurat);
                    $('#hubunganTB').val(dt.hubungan);
                    $('#nomorTB').val(dt.telponDarurat);
                // kakek nenek
                    $('#kakekTB').val(dt.namaKakek);
                    $('#nenekTB').val(dt.namaNenek);

                    // var tbl='';
                    // $.each(dt.saudaraArr,function(id,item){
                    //     var btn;
                    //     tbl+='<tr>'
                    //         +'<td>'+item.nis+'</td>'
                    //         +'<td>'+item.nama+'</td>'
                    //     +'</tr>';
                    // });$('saudaraTBL').html(tbl);

                    // $('#kakekTB').val(dt.kakek-nama);
                    // $('#nenekTB').val(dt.nenek-nama);
                });            
            }
            // autoSuggest('nama_saudara','saudara','');
        }
        // $('#pendataanFR').toggle('slow');
        // $('#pendataanTBL').toggle('slow');
    }

// hapus saudara terpilih
    function saudaraDelx(id){
        $('#saudaraTR_'+id).fadeOut('slow',function(){
            $('#saudaraTR_'+id).remove();
        });
    }
    
//saudara record kosong --
    function saudaraExist(){
        alert('jumlah tr: '+$('#saudaraTBL','.saudaraTR').length);return false;
        var tr ='<tr class="warning"><td colspan="3" class="text-center">Silahkan pilih Nama Siswa ..</td></tr>';
        if($('#saudaraTBL').html()=='')
            $('#saudaraTBL').html(tr);
        else
            $('#saudaraTBL').html('');
    }

// pilih saudara  ---
    function saudaraAdd (id,siswa,sekolah) {
        var tr ='<tr val="'+id+'" class="saudaraTR" id="saudaraTR_'+id+'">'
                    +'<td>'+siswa+'</td>'
                    +'<td>'+sekolah+'</td>'
                    // +'<td><button xhref="#" xonclick="saudaraDel('+id+');"onclick="alert('+id+');"><i class="icon-remove"></i></button></td>'
                    +'<td>'
                        +'<a href="#" onclick="saudaraDelx('+id+');" xonclick="alert('+id+');">'
                            +'<i class="icon-remove"></i>'
                        +'</a>'
                    +'</td>'
                +'</tr>';
            // alert(id);return false;
        $('#saudaraTBL').append(tr); 
        saudaraArr();
        // $('#saudaraTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiS').val()+'&saudara='+saudaraArr() );

        // saudaraExist();
    }
        
//himpun array saudara terpilih
    function saudaraArr(){
        var y=[];
        $('.saudaraTR').each(function(id,item){
            y.push($(this).attr('val'));
        });return y;
    }

// submit Foto siswa ---------------------------
    function siswaSV () {
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

        if($('#photoTB').val()=='') siswaDb(''); // upload
        else siswaUp(filesAdd); // ga upload
    }

// upload image
    function siswaUp(dataAdd){
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
                    siswaDb(data);
                }else{ //error
                    notif(data.status,'red');
                }
            },error: function(jqXHR, textStatus, errorThrown){
                notif('error'+textStatus,'red');
            }
        });
    }

// simpan ke database
    function siswaDb(filex){
        var formData = $('#siswa_form').serialize();
        if($('#idformH').val()!=''){
            formData +='&replid='+$('#idformH').val();
        }

        if(filex!=''){// ada upload file nya
            formData +='&file='+filex.file ;    
            if($('#photoH').val()!=''){
                formData+='&photo_asal='+$('#photoH').val();
            }
        }

        $.ajax({
            url: dir,
            type:'POST',
            data:formData+'&aksi=simpan&subaksi=siswa&kelompokS='+$('#kelompokS').val(),
            cache:false,
            dataType: 'json',
            success: function(data, textStatus, jqXHR){
                if(data.status != 'sukses'){
                   notif(data.status,'red');
                }else{
                    notif(data.status,'green'); 
                   switchPN('view','');
                }
            },error: function(jqXHR, textStatus, errorThrown){
                console.log('ERRORS savedata2: ' + textStatus);
            }
        });
    }

// combo departemen ---
    function cmbdepartemen(typ,dep){
        var u= dir2;
        var d ='aksi=cmbdepartemen';
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.departemen, function(id,item){
                    out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                });
            }
            if(typ=='filter'){ // filter (search)
                $('#departemenS').html(out);
                cmbtahunajaran('filter','');
            }else{ // form (edit & add)
                $('#departemenTB').html('<option value="">-Pilih Departemen-</option>'+out);
            }
        });
    }

// combo tahunajaran ---
    function cmbtahunajaran(typ,thn){
        var u= dir3;
        var d='aksi=cmb'+mnu3;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.tahunajaran.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.tahunajaran, function(id,item){
                        out+='<option '+(thn==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1)+'</option>';
                    });
                }
                if(typ=='filter'){ // filter (search)
                    $('#tahunajaranS').html(out);
                    cmbdetailgelombang('filter','');
                }else{ // form (edit & add)
                    // var th1 = dt.tahunajaran[0].tahunajaran;
                    // var th2 = parseInt(th1)+1;
                    // $('#tahunajaranDV').text(': '+th1+' - '+th2);
                    $('#tahunajaranTB').html('<option value="">-Pilih Tahun Ajaran-</option>'+out);
                }
            }
        });
    }
//end of combo tingkat ---

// combo kelompok ---
    function cmbkelompok(typ,thn,kel){
        var u = dir_kel;
        var d = 'aksi=cmbkelompok&'+(thn!=''?'tahunajaran='+thn:'');
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.kelompok, function(id,item){
                    out+='<option '+(kel==item.replid?'selected':'')+' value="'+item.replid+'">'+item.kelompok+'</option>';
                });
            }
            if(typ=='form') { // form 
                if(thn!=''){ // proses terpilih
                    $('#kelompokTB').html('<option value="">-Pilih Kelompok-</option>'+out);
                }else {// proses kosong
                    $('#kelompokTB').html('<option value="">-Pilih Tahun Ajaran-</option>');
                }
            }else { // filtering
                $('#kelompokS').html(out);
                viewTB(); 
            }
        });
    }

// view table ---
    function viewTB(subaksi){
        var aksi ='aksi=tampil';
        if(typeof subaksi!=='undefined'){
            aksi+='&subaksi='+subaksi;
        }
        var cari ='';
        var el,el2;

        if(typeof subaksi!=='undefined'){ // multi paging
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
                $(el2).html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }

// load pop up        
    function loadFR(id) {
        if(id!='') {// view data siswa
            var u =dir;
            var d ='aksi=ambiledit&replid='+id;
            ajax(u,d).done(function  (dt) {
                $('#idformH').val(id);
                $('#uang_pangkalTB').val(dt.sumpokok);
                $('#uang_pangkalnetTB').val(dt.sumnet);
                $('#angsuranTB').val(dt.angsuran);
                $('#sppTB').val(dt.sppbulan);
                $('#diskon_subsidiTB').val(dt.disctb);
                $('#diskon_saudaraTB').val(dt.discsaudara);
                $('#diskon_tunaiTB').val(dt.disctunai);
                $('#diskon_totalTB').val(dt.disctotal);
                $('#joiningTB').val(dt.joining);
                $('#nopendaftaranTB').val(dt.nopendaftaran);
                $('#namaTB').val(dt.siswa);
                $('#tempatlahirTB').val(dt.tmplahir);
                $('#jkTB').val(dt.kelamin);
                $('#tgllahiranakTB').val(dt.tgllahir);
                $('#alamatsiswaTB').val(dt.alamat);
                $('#telpsiswaTB').val(dt.telpon);
                $('#asalsekolahTB').val(dt.sekolahasal);
                var img;
                if(dt.photo!='' && dt.photo!=null){//ada gambar
                    img='./img/upload/'+dt.photo;
                }else{
                    img='./img/no_image.jpg';
                }
                $('#previmg').attr('src',img);
                $('#photoH').val(dt.photo);
            //ayah
                $('#ayahTB').val(dt.nama_ayah);
                $('#kebangsaan_ayahTB').val(dt.kebangsaan_ayah);
                $('#tempatlahir_ayahTB').val(dt.tempatlahir_ayah);
                $('#tgllahir_ayahTB').val(dt.tgllahir_ayah);
                $('#pekerjaan_ayahTB').val(dt.pekerjaan_ayah);
                $('#telpayahTB').val(dt.telpayah);
                $('#pinbb_ayahTB').val(dt.pinbb_ayah);
                $('#email_ayahTB').val(dt.email_ayah);
            //ibu
                $('#ibuTB').val(dt.nama_ibu);
                $('#kebangsaan_ibuTB').val(dt.kebangsaan_ibu);
                $('#tempatlahir_ibuTB').val(dt.temp_lahir_ibu);
                $('#tgllahir_ibuTB').val(dt.tgllahir_ibu);
                $('#pekerjaan_ibuTB').val(dt.pekerjaan_ibu);
                $('#telpibuTB').val(dt.telepon_ibu);
                $('#pinbb_ibuTB').val(dt.pinbb_ibu);
                $('#email_ibuTB').val(dt.email_ibu);
            // kontak darurat
                $('#nama_kontakTB').val(dt.namalain);
                $('#hubunganTB').val(dt.hubungan);
                $('#nomorTB').val(dt.telponlain);
            // kakek nenek
                $('#kakekTB').val(dt.kakek);
                $('#nenekTB').val(dt.nenek);

                // var tbl='';
                // $.each(dt.saudaraArr,function(id,item){
                //     var btn;
                //     tbl+='<tr>'
                //         +'<td>'+item.nis+'</td>'
                //         +'<td>'+item.nama+'</td>'
                //     +'</tr>';
                // });$('saudaraTBL').html(tbl);

                // $('#kakekTB').val(dt.kakek-nama);
                // $('#nenekTB').val(dt.nenek-nama);
                cmbkriteria(dt.kriteria);
                cmbgolongan(dt.golongan);
                cmbagama(dt.agama);
                cmbangsuran(dt.jmlangsur);
                cmbdisctunai(dt.nilai);
            });
        }else{ // add 

        }
    }  

// cmbo golongan 
    function cmbtingkatZ(tip,tgk) {
        var d = 'aksi=cmb'+mnu4;
        ajax(dir4,d).done(function (dt){
            var opt='';
            if (dt.status!='sukses') {
                notif(dt.status,'red');
                opt+='<option value="">'+dt.status+'</option>'
            }else{
                var opt = '';
                $.each(dt.tingkat,function (id,item){
                    opt+='<option '+(tgk==item.replid?'selected':'')+' value="'+item.replid+'">'+item.tingkat+'</option>'
                });
                // console.log(opt);
                if(tip=='form') $('#tingkatTBZ').html('<option value="">-Pilih Tingkat-</option>'+opt);
            }
        });
    }   

// cmbo golongan 
    function cmbgolongan (golongan) {
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

// combo agama
    function cmbagama (agama) {
        var u = dir;
        var d ='aksi=cmbagama';
        ajax(u,d).done(function(dt){
            var opt='';
            if (dt.status!='sukses') {
                notif(dt.status,'red');
                opt+='<option value="">'+dt.status+'</option>'
            }else{
                var opt = '';
                $.each(dt.agama,function(id,item){
                    opt+='<option '+(item.replid==agama?'selected':'')+' value="'+item.replid+'">'+item.agama+'</option>'
                });
            }
            $('#agamaTB').html('<option value="">Pilih Agama ..</option>'+opt);
        });
    }

// combo jumlah angsuran 
    /*function cmbangsuran (cicilan) {
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
                        // if(cicilan==item.replid)
                        //     opt+='<option selected="selected" value="'+item.replid+'">'+item.cicilan+'</option>'
                        // else{
                        //     if (item.replid=='1') 
                        //     opt+='<option selected="selected" value="'+item.replid+'">'+item.cicilan+'</option>'
                        // else 
                        //     opt+='<option value="'+item.replid+'">'+item.cicilan+'</option>'
                        // }
                        if(cicilan==item.replid)
                            opt+='<option selected="selected" value="'+item.replid+'">'+item.cicilan+'</option>'
                        else
                            opt+='<option value="'+item.replid+'">'+item.cicilan+'</option>'
                    });$('#angsuranTB').html('<option value="">Pilih Angsuran ..</option>'+opt);
                }
            },
        });
    }*/

// combo angsuran 
    function cmbangsuran (idx,ang) {
        var u = dir6;
        var d ='aksi=cmb'+mnu6;
        ajax(u,d).done(function(dt){
            var opt='';
            if (dt.status!='sukses') {
                notif(dt.status,'red');
                opt+='<option value="">'+dt.status+'</option>'
            }else{
                var opt = '';
                $.each(dt.angsuran,function(id,item){
                    opt+='<option '+(ang==item.replid?'selected':'')+' value="'+item.replid+'">'+item.angsuran+' x </option>'
                });
            }
            $('#angsuran'+idx+'TB').html(opt);
        });
    }

// // combo detaildiskon 
//     function cmbdetaildiskon (idx,disk,cls) {
//         var dept = $('#departemenTB').val();
//         var thn  = $('#tahunajaranTB').val();
//         if(dept!='' || thn!='' ){
//             var u = dir7;
//             var d ='aksi=cmb'+mnu7+'&departemen='+dept+'&tahunajaran='+thn;
//             ajax(u,d).done(function (dt){
//                 var opt='';
//                 if (dt.status!='sukses') {
//                     notif(dt.status,'red');
//                     opt+='<option value="">'+dt.status+'</option>'
//                 }else{
//                     var opt = '';
//                     if(dt.detaildiskon.length==0) opt+='<option value="">kosong</option>';
//                     else{
//                         $.each(dt.detaildiskon,function(id,item){
//                             opt+='<option '+(disk==item.replid?'selected':'')+' value="'+item.replid+'">'+item.diskon+'</option>'
//                         });
//                     }
//                 }
//                 $((cls==''?'#detaildiskon'+idx+'TB':'.detaildiskon')).html(opt);
//             });
//         }
//     }

// combo diskon tunai 
    function cmbdisctunai (nilai) {
        var u = dir7;
        var d ='aksi=cmb'+mnu7;
        ajax(u,d).done(function(dt){
            var opt='';
            if (dt.status!='sukses') {
                notif(dt.status,'red');
                opt+='<option value="">'+dt.status+'</option>'
            }else{
                var opt = '';
                $.each(dt.nilai,function(id,item){
                    opt+='<option '+(nilai==item.replid?'selected':'')+' value="'+item.replid+'">'+item.keterangan+' ('+item.nilai+' %)</option>'
                });
            }
            $('#disctunaiTB').html('<option value="">-Pilih Diskon-</option>'+opt);
        });
    }        

// combo get biaya
    function getBiaya(){
        enableDiskon('combo');
        var dgel = $('#detailgelombangTB').val();
        var subt = $('#subtingkatTB').val();
        var gol  = $('#golonganTBZ').val();
        if(dgel!='' && subt!='' && gol!=''){
            var u = dir;
            var d ='aksi=getBiaya'
                    +'&detailgelombang='+dgel
                    +'&subtingkat='+subt
                    +'&golongan='+gol
            ajax(u,d).done(function (dt){
                if(dt.status!='sukses') notif(dt.status,'red');
                else{
                    if(dt.biayaArr.length==0) notif('data kosong,silahkan hubungi admin');
                    else{
                        $.each(dt.biayaArr,function (id,item){
                            $('#biayaawal'+item.replid+'TD').html('Rp. '+parseInt(item.nominal).setCurr());
                            $('#iddetailbiaya'+item.replid+'H').val(item.iddetailbiaya);
                        })
                    }
                }
            });            
        }
    }

//get discount tunai  
    function getDiscTunai(){
        var replid = $('#disctunaiTB').val();
        if(replid=='') $('#disctunai2TD').val('Rp. 0');
        else{
            var u = dir;
            var d ='aksi=getDisc&replid='+replid;
            ajax(u,d).done(function (dt) {
                var regVal    = $('#registrationTD').html();
                var regNum    = getCurr((typeof regVal=='NaN' || regVal=='' || regVal=='Rp. 0')?0:regVal);
                var discNum   = parseInt(dt.nilai);
                var discTunai = regNum*discNum/100;
                $('#disctunai2TD').html('Rp. '+parseInt(discTunai).setCurr());
                getDiscTotal();
            });
        }
    }
// get discount angsuran 
    function getDiscAngsuran () {
        var u = dir;
        var d ='aksi=getDiscAngsuran'
                +'&discAngsuran='+$('#angsuranTB').val()
                +'&regNum='+$('#registrationTD').html();
        ajax(u,d).done(function (dt) {
            var discNum = 'Rp. '+dt.discNum.setCurr();
            $('#discangsuranTD').html(discNum);
            getDiscTotal();
        });
    }

    // function getSetBiaya () {
    //     if($('#tingkatTB').val()!='' & $('#tingkatTB').val()!=''){
    //         var u = dir;
    //         var d = 'aksi=getSetBiaya'
    //                 +'&kelompok='+$('#kelompokS').val()
    //                 +'&kriteria='+$('#tingkatTB').val()
    //                 +'&golongan='+$('#golonganTB').val();
    //         ajax(u,d).done(function (dt) {
    //             $('#setbiayaTB').val(dt.setbiaya);
    //         });
    //     }
    // }
//                  (idbiaya, iddetailbiaya)
    function getBiayaNett(idx) {
        selectedDiskReg=[];
        var idy = $('#iddetailbiaya'+idx+'H').val();
        var diskonreguler='';
        $('.detaildiskon'+idx+'TB').each(function (id,item){
            diskonreguler+='&diskonreguler[]='+($(this).val());
            selectedDiskReg.push($(this).val());
        });console.log(selectedDiskReg);
        var d ='aksi=getBiayaNett&iddetailbiaya='+idy+diskonreguler+'&diskonkhusus='+$('#diskonkhusus'+idx+'TB').val();
        // var d ='aksi=getBiayaNett&iddetailbiaya='+idy+diskonreguler+'&diskonkhusus='+$('#diskonkhusus'+idx+'TB').val()+'&delecteddiskon='+selectedDiskReg;
        ajax(dir,d).done(function (dt){
            if(dt.status!='sukses') notif(dt.status,'red');
            else $('#biayaNett'+idx+'TD').html('Rp. '+(dt.biayaNett.setCurr()) );
        });
    }

// biaya  : registration net
     function getRegistrationNet(){
        var regNum       = getCurr($('#registrationTD').html());
        var disctotalNum = getCurr($('#disctotalTD').html());
        var regNetNum    = 'Rp. '+(regNum - disctotalNum).setCurr();
        $('#registrationnetTD').html(regNetNum);
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

// form ---
    function viewFR(idsiswa){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '80%',
            padding: 10,
            onShow: function(){
                $.Dialog.content(contentFR);
                if(idsiswa!=''){ // edit 
                    var u = dir;
                    var d ='aksi=ambiledit&id_user='+idsiswa;
                    ajax(u,d).done(function  (dt) {
                        if(dt.status!='sukses'){
                            notif(dt.status,'red');
                        }else{
                            if(dt.isLogged) { //sudah aktif (pernah login)
                                $('#namaTB').attr('disabled',true);
                                $('#usernameTB').attr('disabled',true);
                                $('#passwordTB').attr('disabled',true);
                                $('#simpanTB').attr('disabled',true);
                            }
                            $('#idformH').val(idsiswa);
                            $('#namaTB').val(dt.nama);
                            $('#usernameTB').val(dt.username);
                            
                            levelFC(dt.id_level);
                            departemenFC(dt.id_level,dt.departemen);
                            // modulFC(dt.id_level,md)
                        }
                    });
                }else{ //add
                    cmbdepartemen('form','');
                    cmbtahunajaran('form','');
                    cmbtingkatZ('form','');
                    cmbsubtingkat('form','','');
                    cmbgolongan('form','');
                    cmbangsuran('');
                    biayaFC();
                }
                titlex='<span class="icon-plus-2"></span> Tambah ';
                $.Dialog.title(titlex+' '+mnu);
                $('#cmbdepartemenTB').focus();
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
                    viewTB();
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
// get uang --------------------------
    // function getuang(e) {
    //     x = $(e).val().replace(/[^0-9]/g,'');
    //     return x;
    // }
// end of get uang --------------------------

   function kodeTrans(){
        var url = dir;
        var data = 'aksi=codeGen&subaksi=transNo';
        ajax(url,data).done(function(dt){
            $('#nopendaftaranTB').val(dt.kode);
        });
    }
    
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
    // function kosongkan(){
    //     $('#idformH').val('');
    // // data siswa
    //     $('#tingkatTB').val('');
    //     $('#golonganTB').val('');
    //     $('#nopendaftaranTB').val('');
    //     $('#namaTB').val('');
    //     // $.each($('[name="jkTB"]'),function(){
    //     //     $(this).removeAttr('checked');
    //     // });
    //     $('#tempatlahirTB').val('');
    //     $('#tgllahiranakTB').val('');
    //     $('#agamaTB').val('');
    //     $('#alamatsiswaTB').val('');
    //     $('#telpsiswaTB').val('');
    //     $('#asalsekolahTB').val('');
    //     // $('#goldarahTB').val('-');
    //     $('#penyakitTB').val('');
    //     $('#catatan_kesehatanTB').val('');
    //     $('#previmg2').attr('src','../img/no_image.jpg');
    //     $('#photoH').val('');
    // // pembayaran
    //     $('#setbiayaTB').val('');
    //     $('#registrationTD').html('');
    //     $('#angsuranTB').val('');
    //     $('#discangsuranTD').html('');
    //     $('#discsubsidiTB').val('');
    //     $('#discsaudaraTB').val('');
    //     $('#disctotalTD').html('');
    //     $('#registrationnetTD').html('');
    //     $('#disctunaiTB').val('');
    //     $('#disctunai2TD').html('');
    //     $('#materialTD').html('');
    //     $('#tuitionTD').html('');
    // //ayah
    //     $('#ayahTB').val('');
    //     $('#kebangsaan_ayahTB').val('');
    //     $('#tempatlahir_ayahTB').val('');
    //     $('#tgllahir_ayahTB').val('');
    //     $('#pekerjaan_ayahTB').val('');
    //     $('#telpayahTB').val('');
    //     $('#pinbb_ayahTB').val('');
    //     $('#email_ayahTB').val('');
    // //ibu
    //     $('#ibuTB').val('');
    //     $('#kebangsaan_ibuTB').val('');
    //     $('#tempatlahir_ibuTB').val('');
    //     $('#tgllahir_ibuTB').val('');
    //     $('#pekerjaan_ibuTB').val('');
    //     $('#telpibuTB').val('');
    //     $('#pinbb_ibuTB').val('');
    //     $('#email_ibuTB').val('');
    // // kontak darurat
    //     $('#nama_kontakTB').val('');
    //     $('#hubunganTB').val('');
    //     $('#nomorTB').val('');
    // }
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

// ajax jquery (mode : asyncronous) ---
    function ajax(u,d){
        return $.ajax({
            url:u,
            data:d,
            type:'post',
            dataType:'json'
        });
    }

// currency to number (ex : Rp. 500.000 -> 500000)
    function getCurr(n){  
        // var x = Number(n.replace(/[^0-9\,.]+/g,""));
        var num = n==''?'0':n;
        var x   = num.replace(/[^0-9]+/g,"");
        var y   = parseInt(x);
        return y;
    }

// number to currency (ex : 500000 -> 500.000)  
    Number.prototype.setCurr=function(){
        return this.toFixed(0).replace(/(\d)(?=(\d{3})+\b)/g,'$1.');
    }

// no pendaftaran auto 
    function getNoPendaftaran (e) {
        var u = dir;
        var d = 'aksi=nopendaftaran&kelompok='+$(e).val() ;
        ajax(u,d).done(function (dt){
            getBiaya();
            $('#nopendaftaranTB').val(dt.nopendaftaran);
            $('#nopendaftaranH').val(dt.nopendaftaranH);
        });
    }

// combobox detailgelombang pendaftaran
    function cmbdetailgelombang(typ,dgel){
        var end =typ=='filter'?'S':'TB';
        var dep =$('#departemen'+end).val();
        var thn =$('#tahunajaran'+end).val();
        // console.log(dep+','+thn);return false;
        var d = 'aksi=cmb'+mnu8+'&tahunajaran='+thn+'&departemen='+dep;
        if(dep!='' && thn!=''){
            ajax(dir8,d).done(function (dt){
                var opt='';
                if(dt.status!='sukses'){
                    notif(dt.status,'red');
                }else{
                    $.each(dt.detailgelombang, function(id,item){
                        opt+='<option '+(dgel==item.replid?'selected':'')+' value="'+item.replid+'">'+item.gelombang+'</option>';
                    }); 
                }
                if(typ=='filter'){
                    $('#detailgelombangS').html(opt);
                }else{
                    $('#detailgelombangTB').html('<option value="">-Pilih Gelombang-</option>'+opt);
                }
            });
        }
    }


// combo subtingkat ---
    function cmbsubtingkat(typ,ting,sub){
        if(typ=='form' && ting==''){
            $('#subtingkatTB').html('<option value="">-Pilih Tingkat Dahulu-</option>');
        }else{
            var u=dir9;
            var d= 'aksi=cmbsubtingkat'+(ting!=''?'&tingkat='+ting:'');
            ajax(u,d).done(function (dt) {
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.subtingkat, function(id,item){
                        out+='<option '+(sub!='' && sub==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.subtingkat+'</option>';
                    });
                }
                if(typ=='filter'){
                    $('#subtingkatS').html('<option value="">-SEMUA-</option>'+out);
                    viewTB();
                }else{
                    $('#subtingkatTB').html('<option value="">-Pilih Sub Tingkat-</option>'+out);
                }
            });
        }
    }

// combo golongan ---
    function cmbgolongan(typ,gol){
        var u = dir5;
        var d = 'aksi=cmb'+mnu5;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.golongan, function(id,item){
                    out+='<option '+(gol!='' && gol==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.golongan+'</option>';
                });
            }
            if(typ=='filter'){
                $('#golonganS').html(out);
                viewTB();
            }else{
                $('#golonganTBZ').html('<option value="">-Pilih Golongan -</option>'+out);
            }
        });
    }

    function biayaFC(){
        var d='aksi=tampil&subaksi=biaya';
        ajax(dir,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                if(dt.biayaArr.length==0) {
                   out+='<label class="fg-white bg-red"> Biaya Masih kosong silahkan hubungi administrator biaya</label>'
                    $('#biayaDV').html(out);
                }else{
                    $.each(dt.biayaArr, function (id,item){
                        out+='<label>'+item.biaya+'</label>'
                            +'<table class="table hovered bordered">'
                                +'<thead>'
                                    +'<tr class="fg-white bg-blue">'
                                        +'<th colspan="2">Item</th>'
                                        +'<th>Nominal</th>'
                                    +'</tr>'
                                +'</thead>'

                                +'<tbody>'
                                    // biaya awal
                                    +'<tr>'
                                        +'<td colspan="2">Biaya '+item.biaya+' Awal'
                                            +'<input type="hidden" id="iddetailbiaya'+item.replid+'H" name="iddetailbiaya'+item.replid+'H">'
                                        +'</td>'
                                        +'<td class="text-right" id="biayaawal'+item.replid+'TD">'
                                            +'silahkan lengkapi dept. dll'
                                        +'</td>'
                                    +'</tr>'

                                    // dskon
                                    +'<tr>'
                                        +'<td>Diskon Reguler</td>'
                                        +'<td>'
                                            +'<table width="100%">'
                                                +'<thead>'
                                                    +'<th align="center" colspan="2">'
                                                        +'<button disabled id="diskon'+item.replid+'BC" onclick="detaildiskonFC('+item.replid+'); return false;" data-hint="Tambah" class="fg-white bg-green diskonBC"><i class="icon-plus-2"></i></button>'
                                                    +'</th>'
                                                +'</thead>'
                                                +'<tbody class="detaildiskonTBL" id="detaildiskon'+item.replid+'TBL">'
                                                +'</tbody>'
                                            +'</table>'
                                        +'</td>'
                                        +'<td></td>'
                                    +'</tr>'

                                    // Diskon Khusus
                                    +'<tr>'
                                        +'<td>Diskon Khusus </td>'
                                        +'<td><div class="input-control text"><input placeholder="keterangan diskon" type="text" id="ketdiskonkhusus'+item.replid+'TB" /></div></td>'
                                        +'<td><div class="input-control text"><input onkeyup="getBiayaNett('+item.replid+');" value="Rp. 0" class="text-right" onfocus="inputuang(this);" placeholder="nominal" type="text" id="diskonkhusus'+item.replid+'TB" name="diskonkhusus'+item.replid+'TB"/></div></td>'
                                    +'</tr>'

                                    // biaya nett
                                    +'<tr>'
                                        +'<td colspan="2">Biaya '+item.biaya+' Nett</td>'
                                        +'<td class="text-right" id="biayaNett'+item.replid+'TD">Rp. 0</td>'
                                    +'</tr>'

                                    // jenis tagihan 
                                    +'<tr>'
                                        +'<td>Ditagih</td>'
                                        +'<td>'+(item.jenistagihan!='sekali'?'per ':'')+item.jenistagihan+'</td>'
                                        +'<td></td>'
                                    +'</tr>'

                                    // cara bayar
                                    +'<tr>'
                                        +'<td>Angsuran</td>'
                                        +'<td>'
                                            +'<div class="input-control select">'
                                                +'<select class="text-center" id="angsuran'+item.replid+'TB" name="angsuran'+item.replid+'TB"><option value=""></option></select>'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="text-right" id="'+item.isDiskon+'TD"></td>'
                                    +'</tr>'

                                +'</tbody>'
                            +'</table>'; 
                    });
                    $('#biayaDV').html(out);
                }
                $.each(dt.biayaArr, function (id,item){
                    cmbangsuran(item.replid,'');
                    // cmbdetaildiskon(item.replid,'','');
                });
            }
        });
    }

// combo detaildiskon 
    // function cmbdetaildiskon (idx,disk,cls) {
    //     var dept = $('#departemenTB').val();
    //     var thn  = $('#tahunajaranTB').val();
    //     if(dept!='' || thn!='' ){
    //         var u = dir7;
    //         var d ='aksi=cmb'+mnu7+'&departemen='+dept+'&tahunajaran='+thn;
    //         ajax(u,d).done(function (dt){
    //             var opt='';
    //             if (dt.status!='sukses') {
    //                 notif(dt.status,'red');
    //                 opt+='<option value="">'+dt.status+'</option>'
    //             }else{
    //                 var opt = '';
    //                 if(dt.detaildiskon.length==0) opt+='<option value="">kosong</option>';
    //                 else{
    //                     $.each(dt.detaildiskon,function(id,item){
    //                         opt+='<option '+(disk==item.replid?'selected':'')+' value="'+item.replid+'">'+item.diskon+'</option>'
    //                     });
    //                 }
    //             }
    //             $((cls==''?'#detaildiskon'+idx+'TB':'.detaildiskon')).html(opt);
    //         });
    //     }else notif('pilih departemen & tahun ajaran dahulu ','red');
    // }

    function isDiskonSelectedAll(idx){
        var stat=true;
        if($('.detaildiskon'+idx+'TB').length>0){
            $('.detaildiskon'+idx+'TB').each(function (id,item){
                stat=($(this).val()=='')?false:true;
            });
        }
        return stat; 
    } 

    var idy=1;
    function detaildiskonFC(idx){
        console.log('ebnable='+enableDiskon('button')); 
        console.log('select='+isDiskonSelectedAll(idx)); 
        if(enableDiskon('button') && isDiskonSelectedAll(idx)){ // jika true (semua combo terpilih semua)
            var u = dir7;
            var d ='aksi=cmb'+mnu7+'&departemen='+$('#departemenTB').val()+'&tahunajaran='+$('#tahunajaranTB').val();
            ajax(u,d).done(function (dt){
                var tr = '<tr id="detaildiskon'+idx+idy+'TR"><td>';
                tr+='<div class="input-control select"><select onchange="getBiayaNett('+idx+');" required  class="detaildiskon'+idx+'TB"  id="detaildiskon'+idx+idy+'TB" name="detaildiskonTB['+idx+idy+']">';
                if(dt.status!='sukses') notif(dt.status,'red');
                else{
                    if(dt.detaildiskon.length==0) tr+='<option value="">kosong</option>';
                    else{   
                        // var yy = jQuery.inArray(8,selectedDiskReg)
                        // console.log(yy);
                        tr+='<option value="">-Pilih Diskon-</option>';
                        $.each(dt.detaildiskon,function (id,item){
                            tr+='<option '+(jQuery.inArray(item.replid,selectedDiskReg)!=-1?'disabled class="fg-white bg-black"':'')+' value="'+item.replid+'">'+item.nilai+'% | '+item.diskon+'</option>';
                        });
                    }
                }tr+='</div></select>';
                tr+='</td><td><a onclick="detaildiskonDel('+idx+idy+');" class="button bg-white fg-red"  data-hint="Hapus" href="#"><i class="icon-cancel-2"></i></a></td></tr>';
                $('#detaildiskon'+idx+'TBL').append(tr);
                idy+=1;
            });
        }
    }

    function enableDiskon(typ){
        if(typ=='combo') {
            $('.detaildiskonTBL').html('');
            selectedDiskReg=[];
        }var dept = $('#departemenTB').val();
        var thn  = $('#tahunajaranTB').val();
        var dgel = $('#detailgelombangTB').val();
        var ting = $('#tingkatTB').val();
        var subt = $('#subtingkatTB').val();
        var gol  = $('#golonganTBZ').val();
        if(dept=='' || thn==''|| dgel==''|| ting==''|| subt=='' || gol==''){ // jka smua combo sudah terpilih
            $('.diskonBC').attr('disabled',true);
            stat=false;
        }else{ // jika salah combo belum terpilih
            $('.diskonBC').removeAttr('disabled');
            stat=true;
        }return stat;   
    }

    function detaildiskonDel(xy){
        $('#detaildiskon'+xy+'TR').fadeOut('slow',function(){
            $('#detaildiskon'+xy+'TR').remove();
            // var arr = [1,2,[1,1], 'abc'];
            selectedDiskReg.splice($.inArray($('#detaildiskon'+xy+'TB').val(),selectedDiskReg),1);
            // console.log(arr) //[1, 2, 'abc']

            // selectedDiskReg.remove($('#detaildiskon'+xy+'TB').val());
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
