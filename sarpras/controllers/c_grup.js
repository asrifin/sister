var mnu       ='grup'; 
var mnu2      ='lokasi'; 
var mnu3      ='katalog'; 
var mnu4      ='jenis'; 
var mnu5      ='barang'; 
var mnu6      ='kondisi'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';
var dir3      ='models/m_'+mnu3+'.php';
var dir4      ='models/m_'+mnu4+'.php';
var dir5      ='models/m_'+mnu5+'.php';
var dir6      ='models/m_'+mnu6+'.php';

var g_contentFR = k_contentFR = b_contentFR ='';

// main function ---
    $(document).ready(function(){
        //form content
            // grup
            g_contentFR += '<form autocomplete="off" onsubmit="grupSV(); return false;" id="'+mnu+'FR">' 
                            +'<input id="g_idformH" type="hidden">' 
                            
                            +'<label>Lokasi</label>'
                            +'<div class="input-control text">'
                                +'<input  type="hidden" name="g_lokasiH" id="g_lokasiH" class="span2">'
                                +'<input disabled="disabled" name="g_lokasiTB" id="g_lokasiTB" class="span2">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'
                            
                            +'<label>Kode</label>'
                            +'<div class="input-control text">'
                                +'<input required maxlength="3" placeholder="kode" name="g_kodeTB" id="g_kodeTB" class="span1">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'
                            
                            +'<label>Nama</label>'
                            +'<div class="input-control text">'
                                +'<input  placeholder="nama"  required type="text" name="g_namaTB" id="g_namaTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'

                            +'<label>Keterangan</label>'
                            +'<div class="input-control textarea">'
                                +'<textarea placeholder="keterangan" name="g_keteranganTB" id="g_keteranganTB"></textarea>'
                            +'</div>'
                            
                            +'<div class="form-actions">' 
                                +'<button class="button primary">simpan</button>&nbsp;'
                                +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                            +'</div>'
                        +'</form>';
            //katalog
            k_contentFR +=' <div class="grid">'
                                +'<form class="span12" autocomplete="off" onsubmit="katalogSV(); return false;" id="'+mnu+'FR">' 
                                    +'<input id="k_idformH" type="hidden">' 
                                    // lokasi , keterangan
                                    +'<div class="row">'
                                        +'<div class="span5"> '
                                            +'<label>Lokasi</label>'
                                            +'<div class="input-control text">'
                                                +'<input disabled="disabled" name="k_lokasiTB" id="k_lokasiTB">'
                                                +'<button class="btn-clear"></button>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div class="span5">'
                                            +'<label>Keterangan</label>'
                                            +'<div class="input-control text">'
                                                +'<input placeholder="keterangan" name="k_keteranganTB" id="k_keteranganTB">'
                                                // +'<textarea placeholder="keterangan" name="g_keteranganTB" id="g_keteranganTB"></textarea>'
                                            +'</div>'
                                        +'</div>'
                                    +'</div>'
                                    
                                    // grup , gambar
                                    +'<div class="row">'
                                        +'<div class="span5">'
                                            +'<label>Grup Barang</label>'
                                            +'<div class="input-control text">'
                                                +'<input type="hidden" name="k_grupH2" id="k_grupH2">'
                                                +'<input disabled placeholder="Grup Barang" name="k_grupTB" id="k_grupTB">'
                                                +'<button class="btn-clear"></button>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div class="span5"> '
                                            +'<label>Gambar Barang</label>'
                                            +'<div class="input-control file info-state" data-role="input-control">'
                                                +'<input id="k_photoTB" name="k_photoTB" type="file">'
                                                +'<button class="btn-file"></button>'
                                            +'</div>'
                                        +'</div>'
                                    +'</div>'

                                    // +'<div class="tile">'
                                    //     +'<div class="tile-content image">'
                                    //         +'<img src="images/author.jpg">'
                                    //     +'</div>'
                                    //     +'<div class="brand">'
                                    //         +'<span class="label fg-white">Images</span>'
                                    //         +'<span class="badge bg-orange">12</span>'
                                    //     +'</div>'
                                    // +'</div>'

                                    // kode
                                    +'<div class="row">'
                                        +'<div class="span5">'
                                            +'<label>Kode Katalog</label>'
                                            +'<div class="input-control text">'
                                                +'<input maxlength="3" class="span1" placeholder="kode"  required type="text" name="k_kodeTB" id="k_kodeTB">'
                                                +'<button class="btn-clear"></button>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div class="span5"> '
                                        +'</div>'
                                    +'</div>'

                                    // Nama
                                    +'<div class="row">'
                                        +'<div class="span5">'
                                            +'<label>Nama</label>'
                                            +'<div class="input-control text">'
                                                +'<input placeholder="nama"  required type="text" name="k_namaTB" id="k_namaTB">'
                                                +'<button class="btn-clear"></button>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div class="span5"> '
                                        +'</div>'
                                    +'</div>'

                                    // Jenis
                                    +'<div class="row">'
                                        +'<div class="span5">'
                                            +'<label>Jenis</label>'
                                            +'<div class="input-control select">'
                                                +'<select required name="k_jenisTB" id="k_jenisTB"><option value="">Pilih Jenis Barang</option></select>'
                                            +'</div>'
                                        +'</div>'
                                        // +'<div class="span5"> '
                                        //     +'<label>Penyusutan</label>'
                                        //     +'<div class="input-control text">'
                                        //         +'<input class="span1" placeholder="susut"  required type="text" name="k_susutTB" id="k_susutTB">'
                                        //         +'<button class="btn-clear"></button> % per tahun'
                                        //     +'</div>'
                                        // +'</div>'
                                    +'</div>'

                                    // Penyusutan
                                    +'<div class="row">'
                                        +'<div class="span5">'
                                            +'<label>Penyusutan</label>'
                                            +'<div class="input-control text">'
                                                +'<input class="span1" placeholder="susut"  required type="text" name="k_susutTB" id="k_susutTB">'
                                                +'<button class="btn-clear"></button>&nbsp;&nbsp;% per tahun'
                                            +'</div>'
                                        +'</div>'
                                        // +'<div class="span5"> '
                                        //     +'<label>Penyusutan</label>'
                                        //     +'<div class="input-control text">'
                                        //         +'<input class="span1" placeholder="susut"  required type="text" name="k_susutTB" id="k_susutTB">'
                                        //         +'<button class="btn-clear"></button> % per tahun'
                                        //     +'</div>'
                                        // +'</div>'
                                    +'</div>'

                                    +'<div class="row">'
                                        +'<div class="span5"> '
                                            +'<div class="form-actions">' 
                                                +'<button class="button primary">simpan</button>&nbsp;'
                                                +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                                            +'</div>'
                                        +'</div>'
                                    +'</div>'
                                +'</form>'
                        +'</div>';
            // barang
            b_contentFR += '<form autocomplete="off" onsubmit="barangSV();return false;" id="'+mnu5+'FR">' 
                            +'<input id="b_idformH" type="hidden">' 

                            +'<label>Lokasi</label>'
                            +'<div class="input-control text">'
                                +'<input  type="hidden" name="b_katalogH" id="b_katalogH">'
                                +'<input disabled="disabled" name="b_katalogTB" id="b_katalogTB" class="span2">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'
                            
                            +'<label>Jumlah Unit Baru</label>'
                            +'<div class="input-control text">'
                                +'<input placeholder="jumlah" name="b_jumbarangTB" id="b_jumbarangTB" class="span2">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'
                            
                            +'<label>Kode</label>'
                            +'<div class="input-control text">'
                                +'<input  placeholder="kode"  required type="text" name="b_kodeTB" id="b_kodeTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'

                            +'<label>Barcode</label>'
                            +'<div class="input-control text">'
                                +'<input required type="text" name="b_barkodeTB" id="b_barkodeTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'

                            +'<label>Sumber</label>'
                            +'<div class="input-control text">'
                                +'<input required type="radio" name="sumberTB" id="sumberTB1">'
                                +'<input required type="radio" name="sumberTB" id="sumberTB2">'
                                +'<input required type="radio" name="sumberTB" id="sumberTB3">'
                            +'</div>'

                            +'<label>Harga</label>'
                            +'<div class="input-control text">'
                                +'<input required type="text" name="b_hargaTB" id="b_hargaTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'

                            +'<label>Kondisi</label>'
                            +'<div class="input-control select">'
                                +'<select required name="b_kondisiTB" id="b_kondisiTB"></select>'
                            +'</div>'

                            +'<label>Keterangan</label>'
                            +'<div class="input-control textarea">'
                                +'<textarea placeholder="keterangan" name="b_keteranganTB" id="b_keteranganTB"></textarea>'
                            +'</div>'

                            +'<div class="input-control file info-state" data-role="input-control">'
                                +'<input id="k_photoTB" name="k_photoTB" type="file">'
                                +'<button class="btn-file"></button>'
                            +'</div>'

                            +'<div class="form-actions">' 
                                +'<button class="button primary">simpan</button>&nbsp;'
                                +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                            +'</div>'
                        +'</form>';

        //combo
            //grup : lokasi
            cmblokasi();

            //barang : kondisi
            cmbkondisi();

        // button action
            //add
            $("#g_tambahBC").on('click', function(){ // grup form 
                grupFR('');
            });$("#k_tambahBC").on('click', function(){ // katalog
                katalogFR('');
            });$("#b_tambahBC").on('click', function(){ // barang
                barangFR('');
            });
            //edit 
            $('#b_ubahBC').on('click',function(){
                katalogFR($('#b_katalogH1').val());
            });

            // search
            //grup
            $('#g_cariBC').on('click',function(){
                $('#g_cariTR').toggle('slow');
                $('#g_kodeS').val('');
                $('#g_namaS').val('');
                $('#g_utotalS').val('');
                $('#g_utersediaS').val('');
                $('#g_udipinjamS').val('');
                $('#g_keteranganS').val('');
            });
            //katalog
            $('#k_cariBC').on('click',function(){
                $('#k_cariTR').toggle('slow');
                $('#k_kodeS').val('');
                $('#k_namaS').val('');
                $('#k_keteranganS').val('');
            });
            // barang
            $('#b_cariBC').on('click',function(){
                $('#b_cariTR').toggle('slow');
                $('#b_kodeS').val('');
                $('#b_barkodeS').val('');
                $('#b_namaS').val('');
                $('#b_keteranganS').val('');
            });


        //search action 
            // grup barang
            $('#g_lokasiS').on('change',function (e){ // lokasi
                vwGrup($('#g_lokasiS').val());
            });$('#g_kodeS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_namaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_utotalS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_utersediaS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_udipinjamS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_totasetS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });$('#g_keteranganS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrup($('#g_lokasiS').val());
            });

            // katalog barang
            $('#k_kodeS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13)
                    vwKatalog($('#g_lokasiS').val());
            });$('#k_namaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwKatalog($('#g_lokasiS').val());
            });$('#k_keteranganS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwKatalog($('#g_lokasiS').val());
            });

            // unit barang
            $('#b_kondisiS').on('change',function(){
                vwBarang($('#b_katalogH1').val());
            });
            $('#b_kodeS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogH1').val());
            });$('#b_namaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogH1').val());
            });$('#b_barkodeS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogH1').val());
            });$('#b_sumberS').on('change',function (){ // nama grup
                vwBarang($('#b_katalogH1').val());
            });$('#b_hargaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogH1').val());
            });$('#b_kondisiS').on('change',function (){ // nama grup
                vwBarang($('#b_katalogH1').val());
            });$('#b_statusS').on('change',function (){ // nama grup
                vwBarang($('#b_katalogH1').val());
            });$('#b_keteranganS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogH1').val());
            });

        // switch panel
            switchPN(1);
            // back button
            $('#k_grupBC').on('click',function(){ // << grup
                cmblokasi();
                switchPN(1);
            });$('#b_katalogBC').on('click',function(){ // << katalog
                vwKatalog($('#g_lokasiS').val());
                switchPN(2);
            });
    }); 
// end of main function ---

//paging ---
    function pagination(page,aksix,subaksi){ 
        // var aksi ='aksi=tampil&subaksi=grup';
        var aksi ='aksi=tampil&subaksi='+subaksi;
        if(typeOf(subaksi)==undefined){
            subaksi='grup';
        }

        // var datax = 'starting='+page+'&aksi='+aksix+'&subaksi=grup';
        var datax   = 'starting='+page+'&aksi='+aksix+'&subaksi='+subaksi;
        var cari    ='&lokasiS='+lok
                    +'&b_sumberS='+$('#b_sumberS').val()
                    +'&g_kodeS='+$('#g_kodeS').val()
                    +'&g_namaS='+$('#g_namaS').val()
                    +'&g_keteranganS='+$('#g_keteranganS').val();
        $.ajax({
            // url:dir,
            url:'m_'+subaksi+'.php',
            type:"post",
            data: datax+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
//end of paging ---

// switch panel
    function switchPN (e) {
        // alert(e);return false;
        $.each($('.panelx'),function(id,item){
            var ke = id+1;
            if(ke==e){
                $('#panel'+ke).removeAttr('style');
                $('h4').html($(this).attr('title'));
            }else{
                $('#panel'+ke).attr('style','display:none;');
            }
        });
    }
//end of  switch panel

/*view*/
    // grup ---
        function vwGrup(lok){  
            var aksi ='aksi=tampil&subaksi=grup';
            var cari ='&lokasiS='+lok
                    +'&g_kodeS='+$('#g_kodeS').val()
                    +'&g_namaS='+$('#g_namaS').val()
                    +'&g_keteranganS='+$('#g_keteranganS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#g_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    setTimeout(function(){
                        $('#g_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }
    // end of grup  ---

    // katalog barang
        function vwKatalog(id) {
            var aksi ='aksi=tampil&subaksi=katalog&grup='+id;
            var cari ='&k_kodeS='+$('#k_kodeS').val()
                    +'&k_namaS='+$('#k_namaS').val()
                    +'&k_keteranganS='+$('#k_keteranganS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#k_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    // alert(id);return false;
                    $('#k_grupH1').val(id);
                    switchPN(2);
                    vwHeadKatalog(id);
                    setTimeout(function(){
                        $('#k_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }   
    //end of  katalog barang

    // barang
        function vwBarang(id) {
            switchPN(3);
            var aksi ='aksi=tampil&subaksi=barang&katalog='+id;
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
                    $('#b_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    $('#b_katalogH1').val(id);
                    vwHeadBarang(id);
                    switchPN(3);
                    setTimeout(function(){
                        $('#b_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }   
    //end of barang

/*save (insert & update)*/
    //grup ---
        function grupSV(){
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

    //katalog ---
        function katalogSV(){
            var urlx ='&aksi=simpan&subaksi=katalog';
            // edit mode
            if($('#k_idformH').val()!=''){
                urlx += '&replid='+$('#k_idformH').val();
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
                        kkosongkan();
                        vwKatalog($('#k_grupH1').val());
                        cont = 'Berhasil menyimpan data';
                        clr  = 'green';
                    }notif(cont,clr);
                }
            });
        }
    //end of katalog ---

    //Barang ---
        function barangSV(){
            var urlx ='&aksi=simpan&subaksi=barang';
            // edit mode
            if($('#b_idformH').val()!=''){
                urlx += '&replid='+$('#b_idformH').val();
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
                        kkosongkan();
                        vwBarang($('#b_katalogH1').val());
                        cont = 'Berhasil menyimpan data';
                        clr  = 'green';
                    }notif(cont,clr);
                }
            });
        }
    //end of Barang ---

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
    
    //katalog ---
        function katalogDel(id){
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
                        vwKatalog($('#g_lokasiS').val());
                        cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                        clr  ='green';
                    }notif(cont,clr);
                }
            });
        }
    //end of katalog ---

/*form (insert & update)*/
    // form grup ---
        function grupFR(id){
            gkosongkan();
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
                        // cmb jenis -------------------------------------
                        $.ajax({
                            url:dir2,
                            dataType:'json',
                            type:'post',
                            data:'aksi=cmblokasi&replid='+$('#g_lokasiS').val(),
                            success:function(dt){
                                $('#g_lokasiTB').val('['+dt.lokasi[0].kode+'] '+dt.lokasi[0].nama);
                                $('#g_lokasiH').val($('#g_lokasiS').val());
                            }
                        });
                    }else{ // edit mode
                        titlex='<span class="icon-pencil"></span> Ubah';
                        // cmb jenis -------------------------------------
                        $.ajax({
                            url:dir2,
                            dataType:'json',
                            type:'post',
                            data:'aksi=cmblokasi&replid='+$('#g_lokasiS').val(),
                            success:function(dt){
                                // data grup---------------------------------
                                $.ajax({
                                    url:dir,
                                    data:'aksi=ambiledit&subaksi=grup&replid='+id,
                                    type:'post',
                                    dataType:'json',
                                    success:function(dt2){
                                        $('#g_idformH').val(id);
                                        $('#g_lokasiH').val($('#g_lokasiS').val()); 
                                        $('#g_lokasiTB').val('['+dt.lokasi[0].kode+'] '+dt.lokasi[0].nama); 
                                        $('#g_kodeTB').val(dt2.kode);
                                        $('#g_namaTB').val(dt2.nama);
                                        $('#g_keteranganTB').val(dt2.keterangan);
                                    }
                                });//end of  data grup--------------------------
                            }
                        });//end of cmb jenis ----------------------------------
                    }$.Dialog.title(titlex+' '+mnu); // edit by epiii
                    $.Dialog.content(g_contentFR);
                }
            });
        }
    // end of form grup ---

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
                                });
                                $('#k_jenisTB').html('<option value="">Pilih Jenis</option>'+opt);
                                $('#k_lokasiTB').val($('#k_lokasiDV').html());
                                $('#k_grupH2').val($('#k_grupH1').val());
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
                                    $('#k_grupH2').val($('#k_grupH1').val());
                                    $('#k_lokasiTB').val($('#k_lokasiDV').html());
                                    $('#k_grupTB').val($('#k_grupDV').html());
                                    $('#k_kodeTB').val(dt.data.kode);
                                    $('#k_namaTB').val(dt.data.nama);
                                    $('#k_susutTB').val(dt.data.susut);
                                    $('#k_keteranganTB').val(dt.data.keterangan);
                                    
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
                        // alert(dt.status+' memuat data header');
                    }else{
                        $('#b_katalogDV').html(dt.data.katalog);
                        $('#b_grupDV').html(dt.data.grup);
                        $('#b_lokasiDV').html(dt.data.lokasi);
                        $('#b_totbarangDV').html(dt.data.totbarang+' unit');
                        $('#b_totasetDV').html('Rp. '+dt.data.totaset+',-');
                        $('#b_susutDV').html(dt.data.susut+' %');
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
                        vwGrup(dt.lokasi[0].replid); 
                    }
                    // alert(out);
                    $('#g_lokasiS').html(out);
                }
            });
        }
    //end of departemen ---

    // Kondisi
        function cmbkondisi () {
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
                            opt+='<option value="'+item.replid+'">'+item.nama+'</option>'
                        });$('#b_kondisiS').html('<option value="">-Semua-</option>'+opt);
                        // vwBarang(katalog,dt.jenis[0].nama);
                        vwBarang(katalog);
                    }
                },
            });
        }
    // end of Kondisi
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

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
