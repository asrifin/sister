var mnu       ='opac';
var dir       ='models/m_'+mnu+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<div class="span10">'
                            +'<table>'
                                +'<tr>'
                                    +'<input type="hidden" id="k_photoH"/>'
                                    +'<td rowspan="4"> <img width="150" id="previmg" src="../img/no_image.jpg" ><br></td>'
                                    // +'<td rowspan="4"><span id="photoTD"></span></td>'
                                +'</tr>'
                                +'<tr>'
                                    +'<td class="span6"><b id="judulTD">judul</b></td>'
                                +'</tr>'
                                +'<tr>'
                                    +'<td>By <span id="pengarangTD"></span> </td>'
                                +'</tr>'
                            +'</table>'
                        +'</div>'
                        +'<table>'
                            +'<tr>'
                                +'<td>Klasifikasi</td>'
                                +'<td class="span3">: <span id="kode_klasTD"></span> <span id="klasifikasiTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Pengarang</td>'
                                +'<td>: <span id="pengarang2TD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Callnumber</td>'
                                +'<td>: <span id="callnumberTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Penerjemah</td>'
                                +'<td>: <span id="penerjemahTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Editor</td>'
                                +'<td>: <span id="editorTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Terbitan</td>'
                                +'<td>: <span id="terbitanTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>ISBN</td>'
                                +'<td>: <span id="isbnTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>ISSN</td>'
                                +'<td>: <span id="issnTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Bahasa</td>'
                                +'<td>: <span id="bahasaTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Seri</td>'
                                +'<td>: <span id="seriTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Volume</td>'
                                +'<td>: <span id="volumeTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Edisi</td>'
                                +'<td>: <span id="edisiTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Jenis Koleksi</td>'
                                +'<td>: <span id="koleksiTD"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Tersedia</td>'
                                +'<td>: <span id="tersediaTD"></span>  Item</td>'
                            +'</tr>'
                        +'</table>';

        //combo departemen
        // cmbdepartemen();
        
        //load table
        viewTB();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        // $('#kodeS').keydown(function (e){
        //     if(e.keyCode == 13)
        //         viewTB();
        // });$('#namaS').keydown(function (e){
        //     if(e.keyCode == 13)
        //         viewTB();
        // });$('#alamatS').keydown(function (e){
        //     if(e.keyCode == 13)
        //         viewTB();
        // });$('#keteranganS').keydown(function (e){
        //     if(e.keyCode == 13)
        //         viewTB();
        // });

        // // search button
        // $('#cariBC').on('click',function(){
        //     $('#cariTR').toggle('slow');
        //     $('#kodeS').val('');
        //     $('#namaS').val('');
        //     $('#alamatS').val('');
        //     $('#keteranganS').val('');
        // });
    }); 
// end of main function ---

//save process ---
    function simpan(){
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
                    viewTB($('#lokasiS').val());
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(kode){
        var aksi ='aksi=tampil';
        // edit by epiii
        // var cari = '&kodeS='+$('#kodeS').val()
        //             +'&namaS='+$('#namaS').val()
        //             +'&alamatS='+$('#alamatS').val()
        //             +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            // data: aksi,
            data: aksi, //edit by epiii
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                    // $('#tbody').delay(4000).fadeIn().html(data);
                },1000);
            }
        });
    }
// end of view table ---

// form ---
    function viewFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                    titlex='OPAC';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            var img;
                            if(dt.photo2!='' && dt.photo2!=null){//ada gambar
                                img='../img/upload/'+dt.photo2;
                            }else{
                                img='../img/no_image.jpg';
                            }
                            $('#k_photoH').html(dt.photo2);
                            $('#pengarangTD').html(dt.pengarang);
                            $('#pengarang2TD').html(dt.pengarang);
                            $('#kode_klasTD').html(dt.kode_klas);
                            $('#klasifikasiTD').html(dt.klasifikasi);
                            $('#callnumberTD').html(dt.callnumber);
                            $('#penerjemahTD').html(dt.penerjemah);
                            $('#editorTD').html(dt.editor);
                            $('#terbitanTD').html(dt.penerbit);
                            $('#isbnTD').html(dt.isbn);
                            $('#issnTD').html(dt.issn);
                            $('#bahasaTD').html(dt.bahasa);
                            $('#seriTD').html(dt.seri);
                            $('#edisiTD').html(dt.edisi);
                            $('#koleksiTD').html(dt.jenisbuku);
                            $('#tersediaTD').html(dt.tersedia);
                        }
                    });
                $.Dialog.title(titlex);
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

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
                    viewTB($('#lokasiS').val());
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
        $('#kodeTB').val('');
        $('#namaTB').val('');
        $('#alamatTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---
