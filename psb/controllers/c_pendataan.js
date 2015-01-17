var mnu       = 'pendataan';
var mnu2      = 'departemen';
var mnu3      = 'tahunajaran';
var mnu4      = 'kriteriaCalonSiswa';
var mnu5      = 'golonganCalonSiswa';
var mnu_kel   = 'kelompok';
var dir       = 'models/m_'+mnu+'.php';
var dir2      = '../akademik/models/m_'+mnu2+'.php';
var dir3      = '../akademik/models/m_'+mnu3+'.php';
var dir_kel   = 'models/m_'+mnu_kel+'.php';
var dir4      = 'models/m_'+mnu4+'.php';
var dir5      = 'models/m_'+mnu5+'.php';
var contentFR = '';

//epiii : switch panel (form<=>table)
    function switchPN(){
        $('#pendataanFR').toggle('slow');
        $('#pendataanTBL').toggle('slow');
    }

// main function ---
    $(document).ready(function(){
        cmbdepartemen('');
        // $('#panel1').removeAttr('style');
        // $('#pendataanFR').attr('style','display:none;');

                content +='<table>'
                            +'<tr>'
                                +'<td>Departemen</td>'
                                +'<td>: <b id="departemenTD"></b></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Proses Penerimaan</td>'
                                +'<td>: <span id="periodeTD"></span></td>'
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
                            +'</div>'

                            +'<div style="overflow:scroll;height:600px;">'
                            +'<tr>'
                                +'<td colspan="2">Data Pribadi Siswa :</td>'
                            +'</tr>'
                        +'</table>'
                        // +'</div>'
                            //Data Siswa
                        +'<div style="overflow:scroll;height:600px;">'
                        +'<table>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
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
                            //Data Orang Tua
                            +'<tr>'
                                +'<td></td>'
                                +'<td>Ayah</td>'
                                +'<td>Ibu</td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="ayahTD"></span></td>'
                                +'<td><span id="ibuTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Kebangsaan</td>'
                                +'<td>: <span id="kebangsaan_ayahTD"></span></td>'
                                +'<td><span id="kebangsaan_ibuTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'

                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'

                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'

                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Nama</td>'
                                +'<td>: <span id="namaTD"></span></td>'
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
    });
          
    //search action
        $('#departemenS').on('change',function(){
            cmbtahunajaran($(this).val());
        });$('#tahunajaranS').on('change',function (){
            viewTB();
        });$('#kelompokS').on('change',function (){
            viewTB(); 
        })

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#namaS').val('');
            $('#nopendaftaranS').val('');
        });
    }); 
// end of save process ---

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
                }cmbtahunajaran(dt.departemen[0].replid);
            }
        });
    }
//end of combo departemen ---

// combo tahunajaran ---
    function cmbtahunajaran(dep){
        $.ajax({
            url:dir3,
            data:'aksi=cmbtahunajaran&departemen='+dep,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.tahunajaran, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.tahunajaran+' (aktif)</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.tahunajaran+'</option>';
                        }
                    });
                    // viewTB(dep,dt.tahunajaran[0].replid); 
                }
                $('#tahunajaranS').html(out);
                cmbkelompok(dt.tahunajaran[0].replid);

                // viewTB(); 
            }
        });
    }
//end of combo tahunajaran ---

// combo kelompok ---
    function cmbkelompok(thn){
        $.ajax({
            url:dir_kel,
            data:'aksi=cmbkelompok&tahunajaran='+thn,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.kelompok, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.kelompok+' (aktif)</option>';
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
    function simpan(){
        // var urlx ='&aksi=simpan&departemen='+$('#departemenS').val();
        var urlx ='&aksi=simpan';
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
                    +'&nopendaftaranS='+$('#nopendaftaranS').val();
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
                    }
                });
            }else{ 

            }
            // epiii : switch panel
            switchPN();

            // $.ajax({
            //     url : dir,
            //     type: 'post',
            //     data:'aksi=ambiledit&replid='+id,
            //     dataType:'json',
            //     success:function(dt3){
            //         $('#idformH').val(id);
            //         setTimeout(function(){
            //             $('#panel1').toggle(dt3).fadeIn();
            //         },1000);
            //     }
            // });
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
//load  dialog form  ---
    function Modal(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            data:'aksi=ambiledit&replid='+id,
            width: 500,
            padding: 10,
            onShow: function(res){
                var titl,cont;
                    cont= content;
                    titl= 'Data Calon Siswa';
                    // var res = sjax(dir,'aksi=ambiledit&replid='+id);
                    setTimeout(function(){
                        $('#namaTD').html(res.data.nama);
                        $('#nopendaftaranTD').html(res.data.nopendaftaran);
                        $('#departemenTD').html(res.data.departemen);
                        $('#angkatanTD').html(res.data.angkatan);
                    },100);

                $.Dialog.title(titl);
                $.Dialog.content(cont);
            }
        });
    }
// // end of dialog form ---

//     function Modal(typ,id){
//         $.Dialog({
//             shadow: true,
//             overlay: true,
//             draggable: true,
//             width: 500,
//             padding: 10,
//             onShow: function(){
//                 var titl,cont;
//                 if(id=='belum'){ //form mode : belum diterima 
//                     cont= content_stat;
//                     titl= 'Calon Siswa (belum dikonfirmasi)';
//                     var res = sjax(dir,'aksi=ambiledit&subaksi=status&replid='+id);
//                     setTimeout(function(){
//                         $('#namaTD').html(res.data.nama);
//                         // $('#nopendaftaranTD').html(res.data.nopendaftaran);
//                         $('#departemenTD').html(res.data.departemen);
//                         // $('#angkatanTD').html(res.data.angkatan);
//                     },200);
//                 }else{ // form mode : detail calon siswa

//                 }$.Dialog.title(titl);
//                 $.Dialog.content(cont);
//             }
//         });
//     }



//         function cmbkriteria (kriteria) {
//             // alert(1);return false;
//             $.ajax({
//                 url:dir4,   
//                 type:'post',
//                 dataType:'json',
//                 data:'aksi=cmb'+mnu4,
//                 success:function(dt){
//                     var opt='';
//                     if (dt.status!='sukses') {
//                         notif(dt.status,'red');
//                         opt+='<option value="">'+dt.status+'</option>'
//                     }else{
//                         // alert(id);return false;
//                         var opt = '';
//                         $.each(dt.kriteria,function(id,item){
//                             if(kriteria==item.replid)
//                                 opt+='<option selected="selected" value="'+item.replid+'">'+item.kriteria+'</option>'
//                             else
//                                 opt+='<option value="'+item.replid+'">'+item.kriteria+'</option>'
//                         });$('#kriteriaTB').html('<option value="">Pilih Kriteria ..</option>'+opt);
//                     }
//                 },
//             });
//         }

//         function cmbgolongan (golongan) {
//             // alert(1);return false;
//             $.ajax({
//                 url:dir5,   
//                 type:'post',
//                 dataType:'json',
//                 data:'aksi=cmb'+mnu5,
//                 success:function(dt){
//                     var opt='';
//                     if (dt.status!='sukses') {
//                         notif(dt.status,'red');
//                         opt+='<option value="">'+dt.status+'</option>'
//                     }else{
//                         // alert(id);return false;
//                         var opt = '';
//                         $.each(dt.golongan,function(id,item){
//                             if(golongan==item.replid)
//                                 opt+='<option selected="selected" value="'+item.replid+'">'+item.golongan+'</option>'
//                             else
//                                 opt+='<option value="'+item.replid+'">'+item.golongan+'</option>'
//                         });$('#golonganTB').html('<option value="">Pilih Golongan ..</option>'+opt);
//                     }
//                 },
//             });
//         }

//         function cmbagama (agama) {
//             // alert(1);return false;
//             $.ajax({
//                 url:dir,   
//                 type:'post',
//                 dataType:'json',
//                 data:'aksi=cmbagama',
//                 success:function(dt){
//                     var opt='';
//                     if (dt.status!='sukses') {
//                         notif(dt.status,'red');
//                         opt+='<option value="">'+dt.status+'</option>'
//                     }else{
//                         // alert(id);return false;
//                         var opt = '';
//                         $.each(dt.agama,function(id,item){
//                             if(agama==item.replid)
//                                 opt+='<option selected="selected" value="'+item.replid+'">'+item.agama+'</option>'
//                             else{
//                                 if (item.urutan=='3') 
//                                 opt+='<option selected="selected" value="'+item.replid+'">'+item.agama+'</option>'
//                             else 
//                                 opt+='<option value="'+item.replid+'">'+item.agama+'</option>'
//                             }
//                         });$('#agamaTB').html('<option value="">Pilih Agama ..</option>'+opt);
//                     }
//                 },
//             });
//         }

//         function cmbangsuran (angsuran) {
//             // alert(1);return false;
//             $.ajax({
//                 url:dir,   
//                 type:'post',
//                 dataType:'json',
//                 data:'aksi=cmbangsuran',
//                 success:function(dt){
//                     var opt='';
//                     if (dt.status!='sukses') {
//                         notif(dt.status,'red');
//                         opt+='<option value="">'+dt.status+'</option>'
//                     }else{
//                         // alert(id);return false;
//                         var opt = '';
//                         $.each(dt.angsuran,function(id,item){
//                             if(angsuran==item.replid)
//                                 opt+='<option selected="selected" value="'+item.replid+'">'+item.angsuran+'</option>'
//                             else
//                                 opt+='<option value="'+item.replid+'">'+item.angsuran+'</option>'
//                         });$('#angsuranTB').html('<option value="">Pilih angsuran ..</option>'+opt);
//                     }
//                 },
//             });
//         }

//         function hitung(){
//             var pangkal       = $("#uang_pangkalTB").val();
//             var pangkalnet    = $("#uang_pangkalnetTB").val();
//             var angsuran      = $("#angsuranTB").val();
//             var angsuranbulan = $("#angsuranbulanTB").val();
//         }

//         function hitung_diskon(){
//             var disc_subsidi  = $("#diskon_subsidiTB").val();
//             var disc_saudara  = $("#diskon_saudaraTB").val();
//             var disc_tunai    = $("#disc_tunai").val();
//             var disc_tunaiTB  = $("#disc_tunaiTB").val();
//             if(disc_subsidi>0 && disc_saudara>0 && disc_tunaiTB>0){
//             var total_diskon = parseFloat(disc_subsidi)+parseFloat(disc_saudara)+parseFloat(disc_tunaiTB);
//             $("#diskon_totalTB").val(total_diskon);
//             }
//         }

//         $("#diskon_totalTB").keyup(function(){
//             hitung_diskon();
//         });

//     function pagination(page,aksix,subaksi){ 
//         var aksi ='aksi='+aksix+'&subaksi='+subaksi+'&starting='+page;
//         var cari ='';
//         var el,el2;

//         if(subaksi!=''){ // multi paging 
//             el  = '.'+subaksi+'_cari';
//             el2 = '#'+subaksi+'_tbody';
//         }else{ // single paging
//             el  = '.cari';
//             el2 = '#tbody';
//         }

//         $(el).each(function(){
//             var p = $(this).attr('id');
//             var v = $(this).val();
//             cari+='&'+p+'='+v;
//         });

//         $.ajax({
//             url:dir,
//             type:"post",
//             data: aksi+cari,
//             beforeSend:function(){
//                 $(el2).html('<tr><td align="center" colspan="8"><img src="../img/w8loader.gif"></td></tr></center>');
//             },success:function(dt){
//                 setTimeout(function(){
//                     $(el2).html(dt).fadeIn();
//                 },1000);
//             }
//         });
//     }
//end of paging ---
    
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
            thousands:'.', 
            // decimal:',', 
            affixesStay: true
        });
    }
// end of input uang --------------------------

// get uang --------------------------
    function getuang(e) {
        // var x =$(e).maskMoney('unmasked')[0];
        // var x =$(e).val();
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
