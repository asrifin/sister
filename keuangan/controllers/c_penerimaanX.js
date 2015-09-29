var mnu   ='penerimaan'; 
var mnu2  ='departemen'; 
var mnu3  ='angkatan'; 
var mnu4  ='proses'; 
var mnu5  ='kelompok'; 
var mnu6  ='tahunajaran'; 
var mnu7  ='tingkat'; 
var mnu8  ='subtingkat'; 
var mnu9  ='kelas'; 
var mnu10 ='semester'; 

var dir   ='models/m_'+mnu+'.php';
var dir2  ='../akademik/models/m_'+mnu2+'.php';
var dir3  ='../akademik/models/m_'+mnu3+'.php';
var dir4  ='../psb/models/m_'+mnu4+'.php';
var dir5  ='../psb/models/m_'+mnu5+'.php';
var dir6  ='../akademik/models/m_'+mnu6+'.php';
var dir7  ='../akademik/models/m_'+mnu7+'.php';
var dir8  ='../akademik/models/m_'+mnu8+'.php';
var dir9  ='../akademik/models/m_'+mnu9+'.php';
var dir10 ='../akademik/models/m_'+mnu10+'.php';

var contentFR ='';
// main function load first 
    $(document).ready(function(){
        cmbdepartemen('filter','');
    // ---------------------
        // event  filter : departemen 
        $('#departemenS').on('change',function(){
            switchPN(curTab());
        });
        // event filter : pendaftaran
        $('#prosesS').on('change',function(){
            cmbkelompok('filter',$(this).val());
        });$('#kelompokS').on('change',function(){
            viewTB(curTab());
        });$('#formulir_statusS').on('change',function(){
            viewTB('formulir');
        });$('#joiningf_statusS').on('change',function(){
            viewTB('joiningf');
        });
        // event filter : dpp 
        $('#angkatanS').on('change',function(){
            viewTB('dpp');
        });$('#dpp_statusS').on('change',function(){
            viewTB('dpp');
        });

        // event filter : spp
        $('#spp_tahunajaranS').on('change',function(){
            cmbtingkat('filter',$(this).val());
        });$('#spp_tingkatS').on('change',function(){
            cmbsubtingkat('filter',$(this).val());
        });$('#spp_subtingkatS').on('change',function(){
            cmbkelas('filter',$(this).val());
        });$('#spp_kelasS').on('change',function(){
            viewTB(curTab());
        });$('#spp_statusS').on('change',function(){
            viewTB('spp');
        });

        // event filtering : semua 
        $('#semua_tahunajaranS').on('change',function (dt){
            cmbsemester($(this).val());
        });$('#semua_semesterS').on('change',function (dt){
            viewTB('belum');
        });
    // --------------------------
    //form content
        contentFR+= '<form  style="overflow:scroll;height:550px;" autocomplete="off" onsubmit="pembayaranSV(this); return false;" id="'+mnu+'FR">'
                       
                        +'<input id="ju_idformH" type="hidden">' 
                        
                        +'<input id="idsiswaH" name="idsiswaH" type="hidden">' 
                        +'<input id="idmodulH" name="idmodulH" type="hidden">' 
                        +'<input id="rekkasH" name="rekkasH" type="hidden">' 
                        +'<input id="rekitemH" name="rekitemH" type="hidden">' 

                        +'<div  data-effect="fade" class="tab-control" data-role="tab-control">'
                            +'<ul class="tabs">'
                                +'<li id="keteranganNAV"><a href="#keteranganTAB">Keterangan </a></li>'
                                +'<li id="rincianNAV"><a href="#rincianTAB">Rincian Biaya</a></li>'
                                +'<li id="pembayaranNAV"><a href="#pembayaranTAB">Pembayaran</a></li>'
                                // +'<li id="pembayaranNAV" class="active"><a href="#pembayaranTAB">Pembayaran</a></li>'
                            +'</ul>'

                            +'<div style="background-color:white;" class="frames">'
                                +'<div class="frame" id="keteranganTAB">'
                                    +'<label><b>Nomor</b></label>'
                                    +'<div class="input-control text">'
                                        +'<input disatype="text" disabled name="nomerTB" id="nomerTB" >'
                                    +'</div>'
                                    
                                    +'<label>Tanggal </label>'
                                    +'<div class="input-control text">'
                                        +'<input disabled type="text" name="tanggalTB" id="tanggalTB">'
                                    +'</div>'
                                    
                                    +'<label>Rekening Kas / Bank</label>'
                                    +'<div class="input-control text">'
                                        +'<input disabled type="text" id="rek1TB" name="rek1TB">'
                                    +'</div>'

                                    +'<label ><b>Pada :</b></label>'
                                    +'<label>Rekening Perkiraan</label>'
                                    +'<div class="input-control text">'
                                        +'<input disabled type="text" id="rek2TB" name="rek2TB">'
                                    +'</div>'

                                    +'<label>Uraian</label>'
                                    +'<div class="input-control textarea">'
                                        +'<textarea readonly name="uraianTB" id="uraianTB"></textarea>'
                                    +'</div>'
                                +'</div>'

                                +'<div class="frame" id="rincianTAB">'
                                    // ALL
                                    +'<label>Nominal</label>'
                                    +'<div class="input-control text4">'
                                        +'<input disabled type="text" id="nominalTB" name="nominalTB">'
                                        +'<span id="statusI"></span>'
                                    +'</div>'
                                    +'<input id="statusTB" type="text" disabled style="display:none;"/>'

                                    // DPP grup
                                    +'<div class="dppgrup" style="display:none;">'
                                        +'<label>Total Diskon</label>'
                                        +'<div class="input-control text">'
                                            +'<input disabled type="text" id="disctotalTB" name="disctotalTB">'
                                        +'</div>'
                                        +'<label>Nominal Net(setelah dipotong diskon)</label>'
                                        +'<div class="input-control text">'
                                            +'<input disabled class="bg-lightTeal" type="text" id="nominalnetTB" name="nominalnetTB">'
                                        +'</div>'
                                        +'<label>Angsuran </label>'
                                        +'<div class="input-control text">'
                                            +'<input disabled type="text" id="jmlangsurTB" name="jmlangsurTB">'
                                        +'</div>'
                                    +'</div>'
                                    //end of untuk DPP grup
                                +'</div>'
                               
                                +'<div class="frame" id="pembayaranTAB">'
                                    // DPP & pendaftaran (joining fee)
                                    +'<div class="dppjoin" style="display:none;">'
                                        +'<label><a id="histBayar" href="#" >Sudah Dibayar <span class="icon-history"></span></a> </label>'
                                        +'<table id="histBayarT" style="display:none;" class="table hovered bordered striped">'
                                            +'<thead>'
                                                +'<tr class="info fg-white">'
                                                    +'<th>Tgl Bayar</th>'
                                                    +'<th>Angsuran</th>'
                                                    // +'<th>hapus</th>'
                                                +'</tr>'
                                            +'</thead>'
                                            +'<tbody id="histBayarTBL">'
                                            +'</tbody>'
                                        +'</table>'
                                        +'<div class="input-control text">'
                                            +'<input  disabled type="text"  class="text-right bg-yellow" id="terbayarTB" name="terbayarTB">'
                                        +'</div>'
                                    +'</div>'

                                    +'<label id="akanbayarLBL">Akan Dibayar </label>'
                                    // DPP
                                    +'<div class="input-control select dppgrup" style="display:none;">'
                                        +'<select class="text-right" name="akanbayarTB" id="akanbayarTB"></select>'
                                        +'<span id="statusI2"></span>'
                                    +'</div>'
                                    // pendaftaran (joining fee)
                                    +'<div class="input-control text joingrup" style="display:none;">'
                                        +'<input class="text-right" placeholder="isi nominal (angka)" name="akanbayar2TB" id="akanbayar2TB" onfocus="inputuang(this);" onclick="inputuang(this);">'
                                        +'<span id="akanbayarI" class="fg-white bg-red"></span>'
                                    +'</div>'   
                                 +'</div>'
    
                            +'</div>'
                        +'</div><br />'


                        +'<div class="form-actions">' 
                            +'<button class="button primary simpanBC">Bayar <span class="icon-floppy"></span></button>&nbsp;'
                            // +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'

                        // // +'<legend>Keterangan </legend>'
                        // +'<div class="balloon bottom">'
                        //     +'<div class="padding20">'
                        //         // +'<label><b>Nomor</b></label>'
                        //         // +'<div class="input-control text">'
                        //         //     +'<input disatype="text" disabled name="nomerTB" id="nomerTB" >'
                        //         // +'</div>'
                                
                        //         // +'<label>Tanggal </label>'
                        //         // +'<div class="input-control text">'
                        //         //     +'<input disabled type="text" name="tanggalTB" id="tanggalTB">'
                        //         // +'</div>'
                                
                        //         // +'<label>Rekening Kas / Bank</label>'
                        //         // +'<div class="input-control text">'
                        //         //     +'<input disabled type="text" id="rek1TB" name="rek1TB">'
                        //         // +'</div>'

                        //         // +'<label ><b>Pada :</b></label>'
                        //         // +'<label>Rekening Perkiraan</label>'
                        //         // +'<div class="input-control text">'
                        //         //     +'<input disabled type="text" id="rek2TB" name="rek2TB">'
                        //         // +'</div>'

                        //         // +'<label>Uraian</label>'
                        //         // +'<div class="input-control textarea">'
                        //         //     +'<textarea readonly name="uraianTB" id="uraianTB"></textarea>'
                        //         // +'</div>'
                        //     +'</div>'
                        // +'</div>'

                        // +'<legend >Rincian Biaya</legend>'
                        // +'<div class="balloon bottom">'
                        //     +'<div class="padding20">'
                        //         // // ALL
                        //         // +'<label>Nominal</label>'
                        //         // +'<div class="input-control text">'
                        //         //     +'<input disabled type="text" id="nominalTB" name="nominalTB">'
                        //         // +'</div>'

                        //         // // DPP grup
                        //         // +'<div class="dppgrup" style="display:none;">'
                        //         //     +'<label>Total Diskon</label>'
                        //         //     +'<div class="input-control text">'
                        //         //         +'<input disabled type="text" id="disctotalTB" name="disctotalTB">'
                        //         //     +'</div>'
                        //         //     +'<label>Nominal Net(setelah dipotong diskon)</label>'
                        //         //     +'<div class="input-control text warning-state">'
                        //         //         +'<input disabled class="bg-orange" type="text" id="nominalnetTB" name="nominalnetTB">'
                        //         //     +'</div>'
                        //         //     +'<label>Angsuran </label>'
                        //         //     +'<div class="input-control text">'
                        //         //         +'<input disabled type="text" id="jmlangsurTB" name="jmlangsurTB">'
                        //         //     +'</div>'
                        //         // +'</div>'
                        //         // //end of untuk DPP grup

                        //     +'</div>'
                        // +'</div>'

                        // +'<legend class="bayargrup" style="display:none;">Pembayaran</legend>'
                        // +'<div class="balloon bottom bayargrup" style="display:none;">'
                        //     +'<div class="padding20">'
                        //         // // DPP & pendaftaran (joining fee)
                        //         // +'<div class="dppjoin" style="display:none;">'
                        //         //     +'<label>Sudah Dibayar </label>'
                        //         //     +'<div class="input-control text">'
                        //         //         +'<input disabled type="text"  class="bg-yellow" id="terbayarTB" name="terbayarTB">'
                        //         //     +'</div>'
                        //         // +'</div>'

                        //         // +'<label>Akan Dibayar </label>'
                        //         // // DPP
                        //         // +'<div class="input-control select dppgrup" style="display:none;">'
                        //         //     +'<select class="bg-lime" name="akanbayarTB" id="akanbayarTB"></select>'
                        //         // +'</div>'
                        //         // // pendaftaran (joining fee)
                        //         // +'<div class="input-control text joingrup" style="display:none;">'
                        //         //     +'<input  placeholder="isi nominal (angka)" name="akanbayar2TB" id="akanbayar2TB" onfocus="inputuang(this);" onclick="inputuang(this);">'
                        //         //     +'<span id="akanbayarI" class="fg-white bg-red"></span>'
                        //         // +'</div>'
                        //     +'</div>'
                        // +'</div>'
                    +'</form>';

    // button action
        //toggle search --- 
        $('#formulir_cariBC').on('click',function(){
            $('#formulirTR').toggle('slow');
            $('#formulir_nopendaftaranS').val('');
            $('#formulir_namaS').val('');
            $('#formulir_daftarS').val('');
        });
        $('#joiningf_cariBC').on('click',function(){
            $('#joiningfTR').toggle('slow');
            $('#joiningf_nopendaftaranS').val('');
            $('#joiningf_namaS').val('');
            $('#joiningf_joiningfS').val('');
        });
        $('#dpp_cariBC').on('click',function(){
            $('#dppTR').toggle('slow');
            $('#nisS').val('');
            $('#nilaiS').val('');
        });
        $('#spp_cariBC').on('click',function(){
            $('#sppTR').toggle('slow');
            $('#spp_nisS').val('');
            $('#spp_nilaiS').val('');
        });
        $('#semua_cariBC').on('click',function(){
            $('#semuaTR').toggle('slow');
            $('#semua_nopendaftaranTR').val('');
            $('#semua_namaS').val('');
        });

        //textbox search ---
        // pendaftaran :: formulir
        $('#formulir_nopendaftaranS,#formulir_namaS,#formulir_daftarS').on('keydown',function (e){ 
            if(e.keyCode == 13) viewTB('formulir');
        });
        // pendaftaran :: joining fee
        $('#joiningf_nopendaftaranS,#joiningf_namaS,#joiningf_joiningfS').on('keydown',function (e){ 
            if(e.keyCode == 13) viewTB('joiningf');
        });
        // dpp 
        $('#nisS,#namaS,#nilaiS,#kuranganS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB('dpp');
        });
        // spp
        $('.spp_cari').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB('spp');
        });
    }); 
// end of main function ---------
    
    function switchPN (par) {
        if(par=='' || par=='pendaftaran'){ // default : pendaftaran => formulir
            cmbproses('filter',$('#departemenS').val());
        }else if(par=='spp'){ // spp
            cmbtahunajaran('filter','spp',$('#departemenS').val());
        }else if(par=='dpp'){ // dpp (uang pangkal)
            cmbangkatan('filter',$('#departemenS').val());
        }else{ // semua
            cmbtahunajaran('filter','semua',$('#departemenS').val());
            console.log('masuk semua');
        }
    }

    function curTab(){
        var str  = $('.level1').find('li.active a').attr('href');
        var str2 = str.replace('TAB','');
        var str3 = str2.replace('#','');
        var out='';
        if(str3=='pendaftaran') {
            x = $('.level2').find('li.active a').attr('href');
            x2 = x.replace('TAB','');
            x3 = x2.replace('#','');
            out=x3;
        }else {
            out = str3;
        }return out;
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

        if(subaksi=='joiningf' || subaksi=='joining fee' || subaksi=='formulir'){
            cari+='&kelompokS='+$('#kelompokS').val();
        }
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
        if(subaksi=='formulir' || subaksi=='joiningf'){
            cari+='&kelompokS='+$('#kelompokS').val();
        }

        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $(el2).html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table

// fungsi AJAX : asyncronous
    function ajax(u,d) {
        return $.ajax({
            url:u,
            type:'post',
            dataType:'json',
            data:d
        });
    }

/*save (insert & update)*/
    function pembayaranSV(e){
        var url  = dir;
        var data = $(e).serialize()+'&aksi=simpan&subaksi='+curTab();
        if($('#akanbayarI').html()!='' || $('#akanbayarI').val()=='Rp. 0'){ 
            return false;
        }else{
            ajax(url,data).done(function (dt) {
                notif(dt.status,(dt.status=='sukses'?'green':'red'));
                if (dt.status=='sukses') {
                    $.Dialog.close();
                    viewTB(curTab());
                }
            });
        }
    }

// form pembayaran 
    // pendaftaran
    function pembayaranFR (typ,sis) {
        ajax(dir,'aksi=ambiledit&subaksi='+typ+'&replid='+sis).done(function(dt){
            if(dt.status!=='sukses') notif('gagal menampilkan data','red');
            else{
                if(typ=='formulir'){ // pendaftaran (formulir)
                    // hidden
                    $('#idsiswaH').val(dt.datax.idsiswa);
                    $('#idmodulH').val(dt.datax.idmodul);
                    $('#rekkasH').val(dt.datax.rekkas);
                    $('#rekitemH').val(dt.datax.rekitem);
                    // display
                    $('#tanggalTB').val(dt.datax.tanggal);
                    $('#nomerTB').val(dt.datax.nomer);
                    $('#rek1TB').val(dt.datax.rek1);
                    $('#rek2TB').val(dt.datax.rek2);
                    $('#uraianTB').val('Pembayaran '+dt.datax.modul+'. \nCalon Siswa : '+dt.datax.siswa+' \nNo. Pendaftaran : '+dt.datax.nopendaftaran);
                    $('#nominalTB').val(dt.datax.nominal);
                    $('#pembayaranNAV').attr('style','display:none;');
                    $('#rincianNAV').addClass('active');
                    if(dt.datax.status=='lunas'){
                        $('.simpanBC').attr('style','display:none;');
                        icon = 'checkmark';
                        clr  = 'green';
                        info = 'lunas';
                    }else{
                        icon = 'minus-2';
                        clr  = 'red';
                        info = 'belum lunas';
                    }var ico ='<i class="icon-'+icon+' on-right on-left" style="background:'+clr+'; color: white; padding: 10px;border-radius: 50%"></i>';
                    $('#statusI').html(ico+'<span style="padding:0px 10px 0px 10px ;" class="fg-white bg-'+clr+'">'+info+'</span>');
                }else if(typ=='joiningf'){ // pendaftaran (joining fee)
                    // hidden
                    $('#idsiswaH').val(dt.datax.idsiswa);
                    $('#idmodulH').val(dt.datax.idmodul);
                    $('#rekkasH').val(dt.datax.rekkas);
                    $('#rekitemH').val(dt.datax.rekitem);
                    // display
                    $('#tanggalTB').val(dt.datax.tanggal);
                    $('#nomerTB').val(dt.datax.nomer);
                    $('#rek1TB').val(dt.datax.rek1);
                    $('#rek2TB').val(dt.datax.rek2);
                    $('#uraianTB').val('Pembayaran '+dt.datax.modul+'. \nCalon Siswa : '+dt.datax.siswa+' \nNo. Pendaftaran : '+dt.datax.nopendaftaran);
                    $('#nominalTB').val(dt.datax.nominal2);
                    // data sudah terbayar 
                    $('#terbayarTB').val(dt.datax.terbayar2);
                    $('.joingrup').attr('style','display:visible;');
                    // $('#akanbayar2TB').attr('max',dt.datax.maxbayar);
                    $('.dppjoin').toggle('slow');
                    $('.bayargrup').toggle('slow');
                    // validasi nominal yg harus dibayar
                    $('#akanbayar2TB').on('keyup',function(){
                        validBayar('#akanbayar2TB','#akanbayarI',dt.datax.maxbayar,dt.datax.maxbayar2);
                    });
                    // cek history pembayaran
                    $('#histBayar').on('click',function(){
                        histBayar(dt.datax.idsiswa);
                    });
                    $('#pembayaranNAV').addClass('active');

                    if(dt.datax.status=='lunas'){
                        $('#akanbayar2TB').attr('style','display:none;');
                        $('.simpanBC').attr('style','display:none;');
                        $('#akanbayarLBL').attr('style','display:none;');
                        icon = 'checkmark';
                        clr  = 'green';
                        info = 'lunas';
                    }else if(dt.datax.status=='kurang'){
                        $('#akanbayar2TB').attr('required',true);
                        icon = 'minus-2';
                        clr  = 'orange';
                        info = 'kurang';
                    }else{ //  belum pernah 
                        $('#akanbayar2TB').attr('required',true);
                        icon = 'minus-2';
                        clr  = 'red';
                        info = 'belum';
                    }
                    var ico ='<i class="icon-'+icon+' on-right on-left" style="background:'+clr+'; color: white; padding: 10px;border-radius: 50%"></i>';
                    $('#statusI').html(ico+'<span style="padding:0px 10px 0px 10px ;" class="fg-white bg-'+clr+'">'+info+'</span>');
                }else if(typ=='dpp'){ // dpp (uang gedung)
                   // hidden
                    $('#idsiswaH').val(dt.datax.idsiswa);
                    $('#idmodulH').val(dt.datax.idmodul);
                    $('#rekkasH').val(dt.datax.rekkas);
                    $('#rekitemH').val(dt.datax.rekitem);
                    // display
                        // info pembayaran 
                        $('#tanggalTB').val(dt.datax.tanggal);
                        $('#nomerTB').val(dt.datax.nomer);
                        $('#rek1TB').val(dt.datax.rek1);
                        $('#rek2TB').val(dt.datax.rek2);
                        $('#uraianTB').val('Pembayaran '+dt.datax.modul+'. \nSiswa : '+dt.datax.siswa+' \nNIS : '+dt.datax.nis);
                        // detail pembayaran (nominal dll)
                        $('#nominalTB').val(dt.datax.nominal);
                        $('#nominalnetTB').val(dt.datax.nominalnet);
                        $('#disctotalTB').val(dt.datax.disctotal);
                        $('#jmlangsurTB').val(dt.datax.jmlangsur+' x '+dt.datax.angsuran);
                        // data sudah terbayar 
                        $('#terbayarTB').val(dt.datax.terbayar);
                        // data akan dibayar
                        cmbakanbayar('dpp',dt.datax.idsiswa);
                    $('.dppgrup').toggle('slow');
                    $('.dppjoin').toggle('slow');
                    // cek history pembayaran
                    $('#histBayar').on('click',function(){
                        histBayar(dt.datax.idsiswa);
                    });

                    $('.bayargrup').toggle('slow');
                    $('#pembayaranNAV').addClass('active');

                    if(dt.datax.status=='lunas'){
                        // $('.simpanBC').attr('style','display:none;');
                        icon = 'checkmark';
                        clr  = 'green';
                        info = 'lunas';
                    }else if(dt.datax.status=='kurang'){
                        icon = 'minus-2';
                        clr  = 'orange';
                        info = 'kurang';
                    }else{
                        icon = 'minus-2';
                        clr  = 'red';
                        info = 'belum';
                    }var ico ='<i class="icon-'+icon+' on-right on-left" style="background:'+clr+'; color: white; padding: 10px;border-radius: 50%"></i>';
                    $('#statusI2').html(ico+'<span style="padding:0px 10px 0px 10px ;" class="fg-white bg-'+clr+'">'+info+'</span>');

                }else{ //spp
                    // hidden
                    $('#idsiswaH').val(dt.datax.idsiswa);
                    $('#idmodulH').val(dt.datax.idmodul);
                    $('#rekkasH').val(dt.datax.rekkas);
                    $('#rekitemH').val(dt.datax.rekitem);
                    // display
                        // info pembayaran 
                        $('#tanggalTB').val(dt.datax.tanggal);
                        $('#nomerTB').val(dt.datax.nomer);
                        $('#rek1TB').val(dt.datax.rek1);
                        $('#rek2TB').val(dt.datax.rek2);
                        $('#uraianTB').val('Pembayaran '+dt.datax.modul+'. \nSiswa : '+dt.datax.siswa+' \nNIS : '+dt.datax.nis);
                        // detail pembayaran (nominal dll)
                        $('#nominalTB').val(dt.datax.nominal);
                    $('#pembayaranNAV').attr('style','display:none;');
                    $('#rincianNAV').addClass('active');
                    if(dt.datax.status=='lunas'){
                        $('.simpanBC').attr('style','display:none;');
                        icon = 'checkmark';
                        clr  = 'green';
                        info = 'lunas';
                    }else{
                        icon = 'minus-2';
                        clr  = 'red';
                        info = 'belum lunas';
                    }var ico ='<i class="icon-'+icon+' on-right on-left" style="background:'+clr+'; color: white; padding: 10px;border-radius: 50%"></i>';
                    $('#statusI').html(ico+'<span style="padding:0px 10px 0px 10px ;" class="fg-white bg-'+clr+'">'+info+'</span>');
                }
            }
        });
        // setTimeout(function(){
            loadModal(typ,contentFR);
        // },500);
    }

    function cmbakanbayar(typ,sis){
        var url  = dir;
      
        var data = 'aksi=cmbakanbayar&siswa='+sis+'&subaksi='+typ;
        ajax(url,data).done(function (dt) {
            var out='';
            if (dt.status=='sukses') {
                $.each(dt.datax, function(id,item){
                    out+='<option value="'+item.idAngsur+'"> '+item.nomAngsur+'</option>';
                });
            }else{
                out+='<option value="">0</option>';
                console.log(dt.status);
                $('.simpanBC').attr('style','display:none;');
            }$('#akanbayarTB').html(out);
        });
    }

    // form pop up
    function loadModal(titl,cont){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                $.Dialog.title(titl+' '+mnu); 
                $.Dialog.content(cont);
            }
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
// end of input uang --------------------------

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

// print to PDF -------
    function printPDF(mn){
        var par='',tok='',p=v='';
        $('.'+mn+'_cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });
        if(mn=='formulir' || mn=='joiningf') {
            par+='&kelompokS='+$('#kelompokS').val();
            tok+=$('#kelompokS').val();
        }
        var x     = $('#id_loginS').val();
        var token = encode64(x+tok);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }

// combo departemen ---
    function cmbdepartemen(typ){
        $.ajax({
            url:dir2,
            data:'aksi=cmb'+mnu2,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.departemen, function(id,item){
                        out+='<option value="'+item.replid+'"> '+item.nama+'</option>';
                    });
                }
                if(typ=='filter'){
                    $('#departemenS').html(out);
                    switchPN('');
                }else{
                    $('#departemenTB').html(out);
                }
            }
        });
    }
//end of combo departemen---
        
// combo tingkat  ---
    function cmbtingkat(typ,thn){
        $.ajax({
            url:dir7,
            data:'aksi=cmb'+mnu7+'&tahunajaran='+thn,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.tingkat, function(id,item){
                        out+='<option value="'+item.replid+'"> '+item.keterangan+'('+item.tingkat+')</option>';
                    });
                    if(typ=='filter'){
                        $('#spp_tingkatS').html(out);
                        cmbsubtingkat('filter',dt.tingkat[0].replid);
                    }else{
                        $('#subtingkatTB').html(out);
                    }
                }
            }
        });
    }
//end of combo tingkat---

// combo subtingkat  ---
    function cmbsubtingkat(typ,tkt){
        $.ajax({
            url:dir8,
            data:'aksi=cmb'+mnu8+'&tingkat='+tkt,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.subtingkat, function(id,item){
                        out+='<option value="'+item.replid+'">Kelas '+item.subtingkat+'</option>';
                    });
                    if(typ=='filter'){
                        $('#spp_subtingkatS').html(out);
                        cmbkelas('filter',dt.subtingkat[0].replid);
                    }else{
                        $('#subtingkatTB').html(out);
                    }
                }
            }
        });
    }
//end of combo subtingkat---

// combo kelas  ---
    function cmbkelas(typ,subt){
        $.ajax({
            url:dir9,
            data:'aksi=cmb'+mnu9+'&subtingkat='+subt,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.kelas, function(id,item){
                        out+='<option value="'+item.replid+'"> '+item.kelas+'</option>';
                    });
                    if(typ=='filter'){
                        $('#spp_kelasS').html(out);
                        viewTB('spp');
                    }else{
                        $('#kelasTB').html(out);
                    }
                }
            }
        });
    }
//end of combo kelas---

// combo tahun ajaran  ---
    // function cmbtahunajaran(typ,dep){
    function cmbtahunajaran(typ,sub,dep){
        var u =dir6;
        var d ='aksi=cmb'+mnu6+'&departemen='+dep;
        ajax(u,d).done(function(dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    if(item.aktif=='1') out+='<option selected="selected" value="'+item.replid+'">'+item.tahunajaran+' (aktif)</option>';
                    else out+='<option value="'+item.replid+'"> '+item.tahunajaran+'</option>';
                });
                if(typ=='filter'){ // filtering 
                    if(sub=='semua') {// semua
                        $('#semua_tahunajaranS').html(out);
                        cmbsemester(dt.tahunajaran[0].replid);
                        console.log('semester masuk semua ');
                    }else{// pendaftaran & spp
                        $('#spp_tahunajaranS').html(out);
                        cmbtingkat('filter',dt.tahunajaran[0].replid);
                    } 
                }else{ // form
                    $('#tahunajaranTB').html(out);
                }
            }
        });
    }

    function cmbsemester(thn){
        var u = dir10;
        var d = 'aksi=cmb'+mnu10+'&tahunajaran='+thn;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.nama, function(id,item){
                    out+='<option  value="'+item.replid+'"> '+item.nama+'</option>';
                });
                $('#semua_semesterS').html(out);
                viewTB('semua');
            }
        });
    }
//end of combo angkatan---

// combo angkatan ---
    function cmbangkatan(typ,dep){
        $.ajax({
            url:dir3,
            data:'aksi=cmb'+mnu3+'&departemen='+dep,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.angkatan, function(id,item){
                        out+='<option value="'+item.replid+'">Angkatan '+item.angkatan+'</option>';
                    });
                    if(typ=='filter'){
                        $('#angkatanS').html(out);
                        viewTB('dpp');
                    }else{
                        $('#angkatanTB').html(out);
                    }
                }
            }
        });
    }
//end of combo angkatan---

// combo proses ---
    function cmbproses(typ,dep){
        $.ajax({
            url:dir4,
            data:'aksi=cmb'+mnu4+'&departemen='+dep,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.proses, function(id,item){
                        if(item.aktif=='1')   
                            out+='<option selected="selected" value="'+item.replid+'">'+item.proses+' (aktif)</option>';
                        else
                            out+='<option value="'+item.replid+'"> '+item.proses+'</option>';
                    });
                }
                if(typ=='filter'){
                    $('#prosesS').html(out);
                    cmbkelompok('filter',dt.proses[0].replid);
                }else{
                    $('#prosesTB').html(out);
                }
            }
        });
    }
//end of combo proses---

// combo kelompok ---
    function cmbkelompok(typ,pros){
        $.ajax({
            url:dir5,
            data:'aksi=cmb'+mnu5+'&proses='+pros,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.kelompok, function(id,item){
                        out+='<option value="'+item.replid+'"> '+item.kelompok+'</option>';
                    });
                }
                if(typ=='filter'){
                    $('#kelompokS').html(out);  
                    // $('#kelompokS').html('<option value="">-SEMUA-</option>'+out);
                    var x =curTab();
                    // alert(x);
                    viewTB(x);
                }else{
                    $('#kelompokTB').html(out);
                }
            }
        });
    }

    function getUang(x){
        var xx = x.replace(/[^0-9]+/g,'');
        return xx;
    }

    function numbValid(e){
        if($(e).val()!=$(e).val().replace(/[^0-9]/g,'')){
            $(e).val($(e).val().replace(/[^0-9]/g,''));
        }
    }

    function validBayar(e1,e2,nom,nom2){
        if(getUang($(e1).val())>nom) $(e2).html('maximal '+nom2);
        else $(e2).html('');
    }

    function histBayar(siswa){
        var url  = dir;
        var data = '&aksi=histBayar&subaksi='+(curTab()=='joiningf'?'joining fee':curTab())+'&siswa='+siswa;
        $('#histBayarTBL').html('<tr><td colspan="2" align="center"><img src="img/w8loader.gif"></td></tr>');
        ajax(url,data).done(function (dt) {
            if (dt.status!='sukses') { //gagal
                notif(dt.status,'red');
            }else{ // sukses
                $('#histBayarT').attr('style','display:visible;');
                var out='';
                if(dt.datax.length==0)
                    out+='<tr><td colspan="2" class="text-center fg-white bg-orange">belum ada angsuran</td></tr>'
                else{
                    $.each(dt.datax,function(id,item){
                        out+='<tr>'
                            +'<td>'+item.tanggal+'</td>'
                            +'<td align="right">'+item.cicilan+'</td>'
                            // +'<td><a href="#" hint="hapus" onclick="alert('+item.replid+');"><span class="icon-remove"></span></a></href="#" td>'
                        +'</tr>'
                    });
                }setTimeout(function(){
                    $('#histBayarTBL').html(out);
                },500);
            }
        });
    }