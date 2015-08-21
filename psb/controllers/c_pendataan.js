var mnu       = 'pendataan';
var mnu2      = 'departemen';
var mnu3      = 'tahunajaran';
var mnu4      = 'tingkat';
var mnu5      = 'golonganCalonSiswa';
var mnu6      = 'setAngsuran'; 
var mnu7      = 'setDiskon';
var mnu_kel   = 'kelompok';

var dir       = 'models/m_'+mnu+'.php';
var dir2      = '../akademik/models/m_'+mnu2+'.php';
var dir3      = '../akademik/models/m_'+mnu3+'.php';
var dir4      = '../akademik/models/m_'+mnu4+'.php';
var dir5      = 'models/m_'+mnu5+'.php';
var dir6      = 'models/m_'+mnu6+'.php';
var dir7      = 'models/m_'+mnu7+'.php';
var dir_kel   = 'models/m_'+mnu_kel+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        cmbdepartemen('');
        content +='<div class="span10">'
                    +'<table>'
                    +'<tr>'
                        +'<td>Departemen</td>'
                        +'<td class="span6">: <b id="departemenTD"></b></td>'
                        +'<td class="place-right"><button data-hint="Cetak" onclick="printPDF(\'pendataan\');"><span class="icon-printer"></span></button></td>'
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
                +'<div style="overflow:scroll;height:500px;">'
                +'<table>'
                    +'<tr>'
                        +'<td colspan="2"><b>Data Pribadi Siswa :</b></td>'
                    +'</tr>'
                    +'<tr>'
                        +'<td>Nama</td>'
                        +'<td class="span3">: <span id="nama_siswaTD"></span></td>'
                        +'<input type="hidden" id="photoH"/>'
                        +'<td rowspan="6"> <img width="150" id="previmg" src="../img/no_image.jpg" ><br></td>'
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
                +'</div>';

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
    function cmbdepartemen(dep){
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
            $('#departemenS').html(out);
            cmbtahunajaran('filter',dt.departemen[0].replid,'');
        });
    }

// combo Tahunajaran ---
    function cmbtahunajaran(typ,dep,thn){
        var u = dir3;
        var d ='aksi=cmbtahunajaran&departemen='+dep;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    if(typ=='filter' && item.aktif=='1') 
                        out+='<option selected value="'+item.replid+'">'+item.tahunajaran+' (aktif)</option>';
                    else 
                        out+='<option '+(thn==item.replid?'selected':'')+' value="'+item.replid+'">'+item.tahunajaran+'</option>';
                });
            }
            if(typ=='form'){ // form add || edit 
                $('#prosesTB').html('<option value="">-Pilih Tahun Ajaran-</option>'+out);
                if($('#prosesTB').val()==''){
                    cmbkelompok('form','','');
                }
            }else{ // filtering
                $('#tahunajaranS').html(out);
                cmbkelompok('filter',dt.tahunajaran[0].replid,'');
            }
        });
    }

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
  function cmbtingkat (tingkat) {
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
                    $.each(dt.tingkat,function(id,item){
                        if(tingkat==item.replid)
                            opt+='<option selected="selected" value="'+item.replid+'">'+item.tingkat+'</option>'
                        else
                            opt+='<option value="'+item.replid+'">'+item.tingkat+'</option>'
                    });$('#tingkatTB').html('<option value="">Pilih Tingkat ..</option>'+opt);
                }
            },
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
    function cmbangsuran (ang) {
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
                    opt+='<option '+(ang==item.replid?'selected':'')+' value="'+item.replid+'">'+item.cicilan+' x </option>'
                });
            }
            $('#angsuranTB').html('<option value="">-Pilih Angsuran-</option>'+opt);
        });
    }        

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
        if($('#kelompokS').val()!='' && $('#tingkatTB').val()!='' && $('#golonganTB').val()!=''){
            var u = dir;
            var d ='aksi=getBiaya'
                    +'&kelompok='+$('#kelompokS').val()
                    +'&tingkat='+$('#tingkatTB').val()
                    +'&golongan='+$('#golonganTB').val();
            ajax(u,d).done(function (dt){
                $('#setbiayaTB').val(dt.replid);
                $('#registrationTD').html('Rp. '+parseInt(dt.registration).setCurr());
                $('#materialTD').html('Rp. '+parseInt(dt.material).setCurr());
                $('#tuitionTD').html('Rp. '+parseInt(dt.tuition).setCurr());
                getDiscTotal();
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
// get discount total
    function getDiscTotal () {
        var discangsuran = getCurr($('#discangsuranTD').html());
        var discsubsidi  = getCurr($('#discsubsidiTB').val());
        var discsaudara  = getCurr($('#discsaudaraTB').val());
        var disctunai    = getCurr($('#disctunai2TD').html());
        var disctotal    = discangsuran + discsubsidi + discsaudara + disctunai ;
        // var disctotal   = parseInt(discsubsidi) + parseInt(discsaudara) + parseInt(disctunai);
        console.log('angsuran : '+discangsuran);
        console.log('subsi : '+discsubsidi);
        console.log('saud : '+discsaudara);
        console.log('tunai: '+disctunai);
        $('#disctotalTD').html('Rp. '+disctotal.setCurr());
        getRegistrationNet();
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

//load  detail Siswa ---
    function Modal(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            data:'aksi=detail&replid='+id,
            width: '80%',
            height: 400,
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
                        if(res.data.photo!='' && res.data.photo!=null){//ada gambar
                            img='../img/upload/'+res.data.photo;
                        }else{
                            img='../img/no_image.jpg';
                        }
                        $('#previmg2').attr('src',img);
                        $('#photoH').html(res.data.photo); 
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
                    //Dataa Saudara Siswa
                        $('#nama_saudaraTD').html(res.data.nama_saudara);
                        $('#tgl_lahir_saudaraTD').html(res.data.tgl_lahir_saudara);
                        $('#sekolah_saudaraTD').html(res.data.sekolah_saudara);


                    //Data yang bisa dihubungi
                        $('#tgl_perkawinanTD').html(res.data.tgl_perkawinan);
                        $('#kakekTD').html(res.data.kakek);
                        $('#nenekTD').html(res.data.nenek);
                    //Data Kontak Darurat
                        $('#nama_daruratTD').html(res.data.nama_darurat);
                        $('#hubunganTD').html(res.data.hubungan);
                        $('#nomor_daruratTD').html(res.data.nomor_darurat);
                    });

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
    function kosongkan(){
        $('#idformH').val('');
    // data siswa
        $('#tingkatTB').val('');
        $('#golonganTB').val('');
        $('#nopendaftaranTB').val('');
        $('#namaTB').val('');
        // $.each($('[name="jkTB"]'),function(){
        //     $(this).removeAttr('checked');
        // });
        $('#tempatlahirTB').val('');
        $('#tgllahiranakTB').val('');
        $('#agamaTB').val('');
        $('#alamatsiswaTB').val('');
        $('#telpsiswaTB').val('');
        $('#asalsekolahTB').val('');
        // $('#goldarahTB').val('-');
        $('#penyakitTB').val('');
        $('#catatan_kesehatanTB').val('');
        $('#previmg2').attr('src','../img/no_image.jpg');
        $('#photoH').val('');
    // pembayaran
        $('#setbiayaTB').val('');
        $('#registrationTD').html('');
        $('#angsuranTB').val('');
        $('#discangsuranTD').html('');
        $('#discsubsidiTB').val('');
        $('#discsaudaraTB').val('');
        $('#disctotalTD').html('');
        $('#registrationnetTD').html('');
        $('#disctunaiTB').val('');
        $('#disctunai2TD').html('');
        $('#materialTD').html('');
        $('#tuitionTD').html('');
    //ayah
        $('#ayahTB').val('');
        $('#kebangsaan_ayahTB').val('');
        $('#tempatlahir_ayahTB').val('');
        $('#tgllahir_ayahTB').val('');
        $('#pekerjaan_ayahTB').val('');
        $('#telpayahTB').val('');
        $('#pinbb_ayahTB').val('');
        $('#email_ayahTB').val('');
    //ibu
        $('#ibuTB').val('');
        $('#kebangsaan_ibuTB').val('');
        $('#tempatlahir_ibuTB').val('');
        $('#tgllahir_ibuTB').val('');
        $('#pekerjaan_ibuTB').val('');
        $('#telpibuTB').val('');
        $('#pinbb_ibuTB').val('');
        $('#email_ibuTB').val('');
    // kontak darurat
        $('#nama_kontakTB').val('');
        $('#hubunganTB').val('');
        $('#nomorTB').val('');
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