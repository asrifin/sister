var mnu       ='grupmodul'; 
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
                                +'<form enctype="multipart/form-data" class="span12" autocomplete="off" onsubmit="katalogSV(); return false;" id="'+mnu3+'FR">' 
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
                                    
                                    // nama grup barang , gambar
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
                                            // +'<div class="input-control file info-state" data-role="input-control">'
                                                +'<input type="hidden" id="k_photoH"/>'
                                            +'<div id="k_photoDV" class="input-control file" data-role="input-control">'
                                                +'<input onchange="PreviewImage(this);" id="k_photoTB" name="k_photoTB" type="file">'
                                                +'<button class="btn-file"></button>'
                                            +'</div>'
                                            +'<img width="150" id="previmg" src="../img/no_image.jpg" >'
                                        +'</div>'
                                    +'</div>'

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
            b_contentFR +=''
                        +'<form  autocomplete="off" onsubmit="barangSV();return false;" id="'+mnu5+'FR">' 
                            +'<input id="b_idformH" type="hidden">' 
                            +'<input id="b_katalogH2" type="hidden" name="b_katalogH2">' 
                            
                            // +'<div class="grid show-grid span10">'
                            +'<div class="grid span10">'
                                 +'<div class="row">'

                                    +'<div class="span4">'
                                        // Nama
                                        +'<label>Nama Barang</label>'
                                        +'<div class="input-control text">'
                                            +'<input disabled type="text" id="b_katalogTB" name="b_katalogTB">'
                                        +'</div>'
                                        // tempat
                                        +'<label>Tempat</label>'
                                        +'<div class="input-control select">'
                                            +'<select onchange="tempatupdate(this);" required name="b_tempatTB" id="b_tempatTB"></select>'
                                        +'</div>'
                                        // jumlah
                                        +'<label class="jumbarang">Jumlah Unit Baru</label>'
                                        +'<div class="input-control text size1 jumbarang">'
                                            +'<input onchange="jumupdate(this);" onkeyup="jumupdate(this);" type="number" min="1" max="100" maxlength="3" value="1" placeholder="jumlah"  required type="text" name="b_jumbarangTB" id="b_jumbarangTB">'
                                            // +'<input onkeyup="kodegenerate();" type="number" min="1" max="100" maxlength="3" value="1" placeholder="jumlah"  required type="text" name="b_jumbarangTB" id="b_jumbarangTB">'
                                        +'</div>'
                                        // barkode
                                        +'<label>Barkode (Auto)</label>'
                                        +'<div class="input-control text size1">'
                                            +'<input type="hidden" name="b_urutH" id="b_urutH">'
                                            +'<input disabled type="text" name="b_barkodeTB" id="b_barkodeTB">'
                                        +'</div>'
                                        // kode
                                        +'<label>Kode (Auto)</label>'
                                        +'<div class="input-control text">'
                                            +'<input disabled type="text" name="b_kodeTB" id="b_kodeTB">'
                                        +'</div>'

                                        // +'<input onkeyup="return inputuang(this);" placeholder="harga" type="text" name="b_hargaTB" id="b_hargaTB"/>'
                                        // +'<input type="text" id="demo3"  data-symbol="R$ " data-thousands="." data-decimal=","  />'
                                        // harga
                                        +'<label>Harga</label>'
                                        +'<div class="input-control text">'
                                            +'<input xonblur="getuang(this);" onclick="inputuang(this);" placeholder="Harga" type="text" name="b_hargaTB" id="b_hargaTB">'
                                            +'<button class="btn-clear"></button>'
                                        +'</div>'
                                        // kondisi
                                        +'<label>Kondisi Barang</label>'
                                        +'<div class="input-control select">'
                                            +'<select required name="b_kondisiTB" id="b_kondisiTB"></select>'
                                        +'</div>'
                                    +'</div>'

                                    +'<div class="span4">'
                                        // sumber
                                        +'<label>Sumber</label>'
                                        +'<div>'
                                            +'<div class="input-control radio margin3" >'
                                                +'<label>'
                                                    +'<input value="0" required type="radio" name="b_sumberTB" />'
                                                    +'<span class="check"></span>'
                                                    +'Beli'
                                                +'</label>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div>'
                                            +'<div class="input-control radio margin3" >'
                                                +'<label>'
                                                    +'<input  value="1" required type="radio" name="b_sumberTB"/>'
                                                    +'<span class="check"></span>'
                                                    +'Pemberian'
                                                +'</label>'
                                            +'</div>'
                                        +'</div>'
                                        +'<div>'
                                            +'<div class="input-control radio">'
                                                +'<label>'
                                                    +'<input  value="2" required type="radio" name="b_sumberTB"/>'
                                                    +'<span class="check"></span>'
                                                    +'Membuat Sendiri'
                                                +'</label>'
                                            +'</div>'
                                        +'</div>'
                                        // keterangan
                                        +'<label>Keterangan</label>'
                                        +'<div class="input-control textarea">'
                                            +'<textarea placeholder="Keterangan" name="b_keteranganTB" id="b_keteranganTB"></textarea>'
                                        +'</div>'
                                    +'</div>'   

                                +'</div>'
                            +'</div>'
                            // form button 
                            +'<div class="form-actions">' 
                                +'<button class="button primary">simpan</button>&nbsp;'
                                +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                            +'</div>'
                        +'</form>';
        //combo
            //grup modul
            vwGrupModul();            
            // cmblokasi();

            //barang : kondisi
            // cmbkondisi('search','');

        // button action
            //add---------
            $("#g_tambahBC").on('click', function(){ // grup form 
                grupFR('');
            });$("#k_tambahBC").on('click', function(){ // katalog
                katalogFR('');
            });$("#b_tambahBC").on('click', function(){ // barang
                barangFR('');
            });
            //edit------- 
            $('#b_ubahBC').on('click',function(){
                katalogFR($('#b_katalogS').val());
            });
            //print----
            $('#g_cetakBC').on('click',function(){
                printPDF('grup');
            });$('#k_cetakBC').on('click',function(){
                printPDF('katalog');
            });$('#b_cetakBC').on('click',function(){
                printPDF('barang');
            });

            // search 
            //grup----
            $('#g_cariBC').on('click',function(){
                $('#g_cariTR').toggle('slow');
                $('#g_kodeS').val('');
                $('#g_namaS').val('');
                $('#g_utotalS').val('');
                $('#g_utersediaS').val('');
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
                vwGrupModul($('#g_lokasiS').val());
            });$('#g_kodeS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13)
                    vwGrupModul($('#g_lokasiS').val());
            });$('#g_namaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwGrupModul($('#g_lokasiS').val());
            });$('#g_utotalS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrupModul($('#g_lokasiS').val());
            });$('#g_utersediaS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrupModul($('#g_lokasiS').val());
            });$('#g_udipinjamS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrupModul($('#g_lokasiS').val());
            });$('#g_totasetS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrupModul($('#g_lokasiS').val());
            });$('#g_keteranganS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrupModul($('#g_lokasiS').val());
            });

            // katalog barang
            $('#k_kodeS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13)
                    vwModul($('#m_grupmodulS').val());
            });$('#k_namaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwModul($('#m_grupmodulS').val());
            });$('#k_keteranganS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwModul($('#m_grupmodulS').val());
            });

            // unit barang
            $('#b_kondisiS').on('change',function(){
                vwGrupMenu($('#b_katalogS').val());
            });
            $('#b_kodeS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13)
                    vwGrupMenu($('#b_katalogS').val());
            });$('#b_namaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwGrupMenu($('#b_katalogS').val());
            });$('#b_barkodeS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwGrupMenu($('#b_katalogS').val());
            });$('#b_sumberS').on('change',function (){ // nama grup
                vwGrupMenu($('#b_katalogS').val());
            });$('#b_hargaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwGrupMenu($('#b_katalogS').val());
            });$('#b_kondisiS').on('change',function (){ // nama grup
                vwGrupMenu($('#b_katalogS').val());
            });$('#b_statusS').on('change',function (){ // nama grup
                vwGrupMenu($('#b_katalogS').val());
            });$('#b_keteranganS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwGrupMenu($('#b_katalogS').val());
            });

        // switch panel
            switchPN(1);
            // back button
            $('#m_grupmodulBC').on('click',function(){ // << grup
                vwGrupModul();
                switchPN(1);
            });$('#b_katalogBC').on('click',function(){ // << katalog
                // vwModul($('#g_lokasiS').val());
                vwModul($('#m_grupmodulS').val());
                switchPN(2);
            });
    }); 
// end of main function ---
    
    
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

// switch panel
    function switchPN (e) {
        $.each($('.panelx'),function(id,item){
            var ke = id+1;
            // alert(ke);
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
    // grup modul---
        function vwGrupModul(lok){  
            var aksi ='aksi=tampil&subaksi=grupmodul';
            var cari ='&gm_grupmodulS='+$('#gm_grupmodulS').val()
                        +'&gm_sizeS='+$('#gm_sizeS').val();

            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#gm_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    setTimeout(function(){
                        $('#gm_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }
    // end of grup  ---

    // menu 
        function vwMenu(id) {
            var aksi ='aksi=tampil&subaksi=menu&mn_grupmenuS='+id;
            var cari ='&mn_linkS='+$('#mn_linkS').val()
                    +'&mn_menuS='+$('#mn_menuS').val()
                    +'&mn_iconS='+$('#mn_iconS').val()
                    +'&mn_sizeS='+$('#mn_sizeS').val()
                    +'&mn_keteranganS='+$('#mn_keteranganS').val();

            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#mn_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    // $('#mn_grupmodulS').val(id);
                    switchPN(3);
                    vwHeadMenu(id);
                    setTimeout(function(){
                        $('#mn_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }   
    //end of  modul

    // modul 
        function vwModul(id) {
            var aksi ='aksi=tampil&subaksi=modul&m_grupmodulS='+id;
            var cari ='&m_linkS='+$('#m_linkS').val()
                    +'&m_modulS='+$('#m_modulS').val()
                    +'&m_warnaS='+$('#m_warnaS').val()
                    +'&m_iconS='+$('#m_iconS').val()
                    +'&m_sizeS='+$('#m_sizeS').val()
                    +'&m_keteranganS='+$('#m_keteranganS').val();

            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#m_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    $('#m_grupmodulS').val(id);
                    switchPN(2);
                    vwHeadModul(id);
                    setTimeout(function(){
                        $('#m_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }   
    //end of  modul

    // Grup Menu
        function vwGrupMenu(id) {
            switchPN(3);
            var aksi ='aksi=tampil&subaksi=grupmenu&gmn_modulS='+id;
            var cari ='&gmn_grupmenuS='+$('#gmn_grupmenuS').val()
                     +'&gmn_sizeS='+$('#gmn_sizeS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#gmn_tbody').html('<tr><td align="center" colspan="9"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    $('#gmn_modulS').val(id);
                    vwHeadGrupMenu(id);
                    switchPN(3);
                    setTimeout(function(){
                        $('#gmn_tbody').html(dt).fadeIn();
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
                        vwGrupModul($('#g_lokasiS').val());
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
                        vwGrupMenu($('#b_katalogS').val());
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
                        vwModul($('#m_grupmodulS').val());
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
                        vwGrupModul($('#g_lokasiS').val());
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
                        vwModul($('#m_grupmodulS').val());
                        cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                        clr  ='green';
                    }notif(cont,clr);
                }
            });
        }
    //end of katalog ---

    //barang ---
        function barangDel(id){
            if(confirm('melanjutkan untuk menghapus data?'))
            $.ajax({
                url:dir,
                type:'post',
                data:'aksi=hapus&subaksi=barang&replid='+id,
                dataType:'json',
                success:function(dt){
                    var cont,clr;
                    if(dt.status!='sukses'){
                        cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                        clr  ='red';
                    }else{
                        vwGrupMenu($('#b_katalogS').val());
                        cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                        clr  ='green';
                    }notif(cont,clr);
                }
            });
        }
    //end of barang ---

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
                                });$('#k_jenisTB').html('<option value="">Pilih Jenis</option>'+opt);
                                $('#k_lokasiTB').val($('#k_lokasiDV').html());
                                $('#k_grupH2').val($('#m_grupmodulS').val());
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
                                    $('#k_grupH2').val($('#m_grupmodulS').val());
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
                        vwHeadGrupMenu($('#b_katalogS').val());
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
        function vwHeadModul (id) {
            $.ajax({
                url:dir,
                type:'post',
                dataType:'json',
                data:'aksi=headinfo&subaksi=modul&id_grupmodul='+id,
                success:function (dt) {
                    if (dt.status!='sukses') {
                        alert(dt.status+' memuat data header');
                    }else{
                        $('#m_grupmodulDV').html(dt.grupmodul);
                    }
                },
            });
        }
    //end of katalog

    // unit grup menu
        function vwHeadGrupMenu (id) {
            $.ajax({
                url:dir,
                type:'post',
                dataType:'json',
                data:'aksi=headinfo&subaksi=grupmenu&id_grupmenu='+id,
                success:function (dt) {
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                    }else{
                        $('#gmn_modulDV').html(': '+dt.data.modul+' ('+dt.data.keterangan+')');
                        $('#gmn_modulS').val(id);
                    }
                },
            });
        }
    //end of grup menu
    
    //menu
        function vwHeadMenu (id) {
            $.ajax({
                url:dir,
                type:'post',
                dataType:'json',
                data:'aksi=headinfo&subaksi=menu&id_grupmenu='+id,
                success:function (dt) {
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                    }else{
                        $('#gmn_menuDV').html(dt.data.grupmenu);
                        $('#gmn_menuS').val(id);
                    }
                },
            });
        }
    //end of menu

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
                        //panggil fungsi vwGrupModul() ==> tampilkan tabel 
                        // alert(dt.lokasi[0].replid);return false;
                        vwGrupModul(dt.lokasi[0].replid); 
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
