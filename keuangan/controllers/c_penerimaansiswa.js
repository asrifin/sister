var mnu  ='penerimaansiswa'; 
var mnu2 ='departemen'; 
var mnu3 ='biaya'; 
var mnu6 ='tahunajaran'; 
var mnu7 ='tingkat'; 
var mnu8 ='subtingkat'; 
var mnu9 ='kelas'; 
var mnu10 ='viabayar'; 

var dir  ='models/m_'+mnu+'.php';
var dir2 ='../akademik/models/m_'+mnu2+'.php';
var dir3 ='models/m_'+mnu3+'.php';
var dir6 ='../akademik/models/m_'+mnu6+'.php';
var dir7 ='../akademik/models/m_'+mnu7+'.php';
var dir8 ='../akademik/models/m_'+mnu8+'.php';
var dir9 ='../akademik/models/m_'+mnu9+'.php';
var dir10 ='../keuangan/models/m_'+mnu10+'.php';

var contentFR = contentFR2 ='';
// main function load first 
    $(document).ready(function(){
        cmbdepartemen('filter');
        //form content
        contentFR2+= '<div  style="overflow:scroll;height:500px;">'
                        +'<table class="table">'
                            +'<tr>'
                                +'<td><b>Departemen</b></td>'
                                +'<td id="departemen2TD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td><b>Tahun Ajaran</b></td>'
                                +'<td id="tahunajaran2TD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td><b>Nama</b></td>'
                                +'<td id="namasiswa2TD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td><b>Kelas</b> </td>'
                                +'<td id="kelas2TD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td><b>NIS</b> </td>'
                                +'<td id="nis2TD"></td>'
                            +'</tr>'
                        +'</table>'
                        +'<div id="buttonDV"></div>'
                    +'</div>';

        contentFR+= '<form  style="overflow:scroll;height:500px;" autocomplete="off" onsubmit="simpanSV(this); return false;" id="'+mnu+'FR">'
                        +'<input class="kwitansipenerimaansiswa_cari" id="idsiswabiayaTB" name="idsiswabiayaTB" type="hidden">' 
                        +'<input id="idtahunajaranH" name="idtahunajaranH" type="hidden">' 
                        
                        // info header 
                        +'<table class="table">'
                            +'<tr>'
                                +'<td><b>Nama</b> </td>'
                                +'<td id="namasiswaTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td><b>Kelas</b> </td>'
                                +'<td id="kelasTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td><b>NIS</b> </td>'
                                +'<td id="nisTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td><b>Biaya</b> </td>'
                                +'<td id="biayaTD"></td>'
                            +'</tr>'
                            +'<tr id="tanggalTR">'
                                +'<td><b>Tanggal</b> </td>'
                                +'<td>'
                                    +'<div class="input-control text span2" data-role="datepicker" data-format="dd mmmm yyyy" data-position="bottom" data-effect="slide">'
                                        +'<input required type="text" id="tanggalTB" name="tanggalTB">'
                                        +'<button class="btn-date"></button>'
                                    +'</div>'
                                +'</td>'
                            +'</tr>'
                        +'</table>'

                        +'<table class="table bordered ">'
                            // header -------------------------
                            +'<tr class="bg-blue fg-white">'
                                +'<th>ITEM</th>'
                                +'<th>VALUE</th>'
                                +'<th>TOTAL</th>'
                            +'</tr>'
                            // harus dibayar  ---------------------------
                            +'<tr>'
                                +'<td class="bg-lightTeal" colspan="2"><b>Yang Harus dibayar</b> </td>'
                                +'<td class="bg-lightTeal"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Sebelum Diskon</td>'
                                +'<td class="text-right" id="biayaAwalTD"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Total Diskon</td>'
                                +'<td class="text-right" id="totalDiskonTD"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Cara Bayar </td>'
                                +'<td id="caraBayarTD"></td>'
                                +'<td></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Via (Rule) </td>'
                                +'<td id="viaBayarTD"></td>'
                                +'<td></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td colspan="2">* Setelah Diskon (Nett)</td>'
                                +'<td style="font-weight:bold;"  class="bg-yellow fg-white text-right" id="biayaNettTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td colspan="4"></td>'
                            +'</tr>'
                            // Angsuran  ---------------------------
                            +'<tr class="angsuranTR">'
                                +'<td class="bg-lightTeal"  colspan="2"><b>Angsuran</b> </td>'
                                +'<td class="bg-lightTeal"></td>'
                            +'</tr>'
                            +'<tr class="angsuranTR">'
                                +'<td>* Jumlah Angsuran</td>'
                                +'<td id="angsuranTD" class="text-right"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr class="angsuranTR">'
                                +'<td>* Nominal Angsuran</td>'
                                +'<td id="angsuranNominalTD" class="text-right"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr class="angsuranTR">'
                                +'<td colspan="4"></td>'
                            +'</tr>'

                            // Sudah Dibayar  ---------------------------
                            +'<tr class="sudahBayarTR">'
                                +'<td  class="bg-lightTeal"  colspan="3"><b>Sudah Dibayar</b> '
                                    +'<a href="#" onclick="histBayarFC()" class="place-right button fg-white bg-green"><i class="icon-history"></i></a>'
                                +'</td>'
                            +'</tr>'
                            +'<tr class="sudahBayarTR" xstyle="display:none;">'
                                +'<td  class="bg-lightTeal" colspan="3" id="histBayarTD">'
                                    // tabel history bayar
                                +'</td>'
                            +'</tr>'

                            +'<tr class="sudahBayarTR" id="terbayarAngsuranKeTR">'
                                +'<td>* Angsuran ke - </td>'
                                +'<td class="text-right" id="terbayarAngsurankeRuleTD"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr class="sudahBayarTR">'
                                +'<td>* Sejumlah Nominal </td>'
                                +'<td class="text-right" id="terbayarBaruTD"></td>'
                                +'<td cxlass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr class="sudahBayarTR">'
                                +'<td>* Total (Terbayar) </td>'
                                +'<td></td>'
                                +'<td style="font-weight:bold;" class="text-right fg-white bg-yellow" id="terbayarTotalTD"></td>'
                            +'</tr>' 
                            +'<tr class="sudahBayarTR">'
                                +'<td colspan="4"></td>'
                            +'</tr>'

                            // akan  Dibayar  ---------------------------
                            +'<tr class="akanBayarTR">'
                                +'<td  class="bg-lightTeal"  colspan="2"><b>Akan Dibayar</b> </td>'
                                +'<td class="bg-lightTeal"></td>'
                            +'</tr>'
                            +'<tr class="angsuranTR akanBayarTR">'
                                +'<td>* Angsuran ke - </td>'
                                +'<td class="text-right" id="akanBayarkeTD"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr class="akanBayarTR">'
                                +'<td>* Via (de facto) </td>'
                                +'<td><select required name="viaBayarTB" id="viaBayarTB" data-transform="input-control"></select></td>'
                                +'<td></td>'
                            +'</tr>'
                            +'<tr class="akanBayarTR">'
                                +'<td colspan="2">* Nominal <input type="hidden" id="kuranganAngsuranTB" /></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            // nominal bayar 1
                            +'<tr class="akanBayarTR" id="pasTR">'
                                +'<td><label class="place-right"><input onclick="pilihAkanBayarJenis();" id="akanBayarJenisTB1" checked value="1" name="akanBayarJenisTB" type="radio" > Pas  </label> </td>'
                                +'<td class="text-right" id="akanBayarNominalTD"></td>'
                                +'<td xclass="bg-yellow"><input id="akanBayarNominalTB1" type="hidden" name="akanBayarNominalTB1" /></td>'
                            +'</tr>'
                            // nominal bayar 2
                            +'<tr class="akanBayarTR angsuranTR">'
                                +'<td><label class="place-right"><input onclick="pilihAkanBayarJenis();"  id="akanBayarJenisTB2" type="radio" value="2" name="akanBayarJenisTB"> Krg. dari Angsuran </label> </td>'
                                +'<td><div class="input-control text">'
                                    +'<input id="akanBayarNominalTB2"  onkeyup="akanBayarSisaFC();" name="akanBayarNominalTB2" disabled onfocus="inputuang(this);" placeholder="masukkan nominal" type="text" class="text-right"></div>'
                                    +'<div id="akanBayarNotif"></div>'
                                    +'<div>Sisa Kurangan : <span id="akanBayarKuranganTD" class="place-right">Rp. 0</span></div>'
                                +'</td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr class="akanBayarTR">'
                                +'<td></td>'
                                +'<td></td>'
                                +'<td style="font-weight:bold;" id="akanBayarNominalTotTD" class="bg-yellow fg-white text-right"></td>'
                            +'</tr>'                            
                            +'<tr class="akanBayarTR">'
                                +'<td colspan="4"></td>'
                            +'</tr>'

                            // yang belum  Dibayar  ---------------------------
                            +'<tr class="belumBayarTR angsuranTR">'
                                +'<td  class="bg-lightTeal"  colspan="2"><b>yang Belum Dibayar</b> </td>'
                                +'<td class="bg-lightTeal"></td>'
                            +'</tr>'
                            +'<tr class="belumBayarTR angsuranTR">'
                                +'<td>* Angsuran </td>'
                                +'<td id="belumBayarAngsurankeTD" class="text-right"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr class="belumBayarTR angsuranTR">'
                                +'<td>* Total Nominal</td>'
                                +'<td></td>'
                                +'<td style="font-weight:bold;" id="belumBayarNominalTotTD" class="text-right bg-yellow fg-white"></td>'
                            +'</tr>'

                        +'</table>'

                        +'<div class="form-actions">' 
                            +'<button id="simpanBC" class="button primary">Bayar <span class="icon-floppy"></span></button>&nbsp;'
                        +'</div>'

                    +'</form>';

        $('#nisS,#namasiswaS,#nisnS,#nopendaftaranS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB('penerimaansiswa');
        });
        $('#statusS').change(function (){
            viewTB('penerimaansiswa');
        });
    }); 

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
                $(el2).html('<tr><td align="center" colspan="9"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
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
        if(subaksi=='formulir' || subaksi=='joiningf'){
            cari+='&kelompokS='+$('#kelompokS').val();
        }

        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $(el2).html('<tr><td align="center" colspan="9"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }

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
    function simpanSV(e){
        if(confirm('Anda yakin membayar ?')){
            var url  = dir;
            var data = $(e).serialize()+'&aksi=simpan';
            ajax(url,data).done(function (dt) {
                notif(dt.status,(dt.status=='sukses'?'green':'red'));
                if (dt.status=='sukses') {
                    printPDF('kwitansipenerimaansiswa',dt.idpembayaran);
                    $.Dialog.close();
                    viewTB('penerimaansiswa');
                }
            });
        }
    }

    // form pop up
    function viewFR2(idsiswa){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '33%',
            padding: 10,
            onShow: function(){
                ajax(dir,'aksi=invoiceView&replid='+idsiswa+'&tahunajaran='+$('#tahunajaranS').val()).done(function (dt){
                    $('#namasiswa2TD').html(': '+dt.namasiswa);
                    $('#nis2TD').html(': '+dt.nis);
                    $('#kelas2TD').html(': '+dt.kelas);
                    $('#tahunajaran2TD').html(': '+dt.tahunajaran);
                    $('#departemen2TD').html(': '+dt.departemen);
                    var button='';
                    $.each(dt.biayaArr, function (id,item) {
                        statusBayar  = item.statusBayar;
                        biayaKurang = 'Rp. '+(parseInt(item.biayaKurang).setCurr());
                        if(statusBayar=='lunas'){ //lunas 
                            info  = 'Lunas';
                            color ='green';
                            icon  ='checkmark';
                            func  ='';
                        }else if(statusBayar=='belum'){ //blum
                            info  = 'Belum';
                            color ='red';
                            icon  ='cancel-2';
                            func  ='onclick="printPDF(\'invoicepenerimaansiswa\','+item.idsiswabiaya+');"';
                        }else{ // kurg
                            info  = biayaKurang;
                            color ='yellow';
                            icon  ='minus-2';
                            func  ='onclick="printPDF(\'invoicePenerimaanSiswa\','+item.idsiswabiaya+');"';
                        }
                        
                        button+='<input type="hidden" id="idsiswabiayaTB" value="'+item.idsiswabiaya+'" />'
                                +'<button '+func+' class="shortcut fg-white bg-'+color+'">'
                                    +'<i class="icon-'+icon+'"></i>'
                                    +item.biaya
                                    +'<small class="bg-'+color+' fg-white"><b>'+info+'</b></small>'
                                +'</button>&nbsp;';
                    });$('#buttonDV').html(button);
                });$.Dialog.title('Invoice'); 
                $.Dialog.content(contentFR2);
            }
        });
    }

    // form pop up
    function viewFR(idsiswa){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '40%',
            padding: 10,
            onShow: function(){
                var u = dir ;
                var d = 'aksi=ambiledit&replid='+idsiswa+'&biaya='+$('#biayaS').val()+'&subtingkat='+$('#subtingkatS').val();
                ajax(u,d).done(function (dt){
                    if(dt.status!='sukses') notif(dt.status,'red'); 
                    else {
                        $('#idtahunajaranH').val($('#tahunajaranS').val());
                    // save action (button)
                        if(dt.datax.lunasTotalAngsuran){
                            $('#simpanBC').attr('style','display:none;'); 
                            $('#terbayarTotalTD').removeClass('bg-yellow').addClass('bg-green'); 
                            $('#tanggalTR').attr('style','display:none;');
                        } 
                    // info header 
                        $('#tanggalTB').val(getToday());
                        $('#idsiswabiayaTB').val(dt.datax.idsiswabiaya);
                        $('#namasiswaTD').html(': '+dt.datax.namasiswa);
                        $('#kelasTD').html(': '+dt.datax.kelas);
                        $('#nisTD').html(': '+dt.datax.nis);
                        $('#biayaTD').html(': '+dt.datax.biaya);
                    // harus bayar 
                        var biayaNett = parseInt(getUang(dt.datax.biayaNett));
                        $('#biayaAwalTD').html(dt.datax.biayaAwal);
                        $('#totalDiskonTD').html(dt.datax.totalDiskon);
                        $('#biayaNettTD').html(dt.datax.biayaNett);
                        $('#caraBayarTD').html(dt.datax.isAngsur2=='1'?'Angsur':'Kontan');
                        cmbviabayar('rule',dt.datax.viabayar);
                        cmbviabayar('facto',dt.datax.viabayar);
                    // angsuran 
                        if(dt.datax.isAngsur2=='0') {
                            $('.angsuranTR').attr('style','display:none;');
                            $('#terbayarAngsuranKeTR').attr('style','display:none;');
                        }else $('.angsuranTR').removeAttr('style');

                        $('#angsuranTD').html(dt.datax.angsuran+' x');
                        $('#angsuranNominalTD').html('@ '+dt.datax.angsuranNominal);
                    // sudah terbayar 
                        var isAngsur2     = dt.datax.isAngsur2;
                        var terbayarTotal = parseInt(getUang(dt.datax.terbayarTotal));
                        var tbyrke        = dt.datax.terbayarAngsurankeRule;
                        var aknbyrke      = dt.datax.akanBayarke;
                            var angsurNom    = parseInt(getUang(dt.datax.angsuranNominal));
                            var kuranganAngs = parseInt(dt.datax.kuranganAngsuran);
                        var krgNomInfo=krgKeInfo='';
                        var akanBayarTot=0;

                        if(dt.datax.lunasTotalAngsuran){ // lunas TOTAL
                            console.log('masuk lunas totoal angsuran');
                            $('.akanBayarTR').attr('style','display:none;');
                            $('.belumBayarTR').attr('style','display:none;');
                        }else{ // belum lunas TOTAL
                            if(!dt.datax.lunasPerAngsuran){ // kurang per @ANGSURAN
                                console.log('..... angsuran kurang');
                                krgNomInfo = '</br><span class="fg-red">( - Rp. '+(dt.datax.kuranganAngsuran.setCurr())+' )';
                                krgKeInfo  = '</br><span class="fg-red">( kurangan ) </span>';
                                akanBayarTot+=kuranganAngs;
                                $('#akanBayarNominalTB2').val('Rp. '+dt.datax.kuranganAngsuran.setCurr());
                                $('#akanBayarJenisTB1').attr('disabled',true);
                                $('#akanBayarJenisTB2').attr('checked',true);
                                $('#akanBayarNominalTB2').removeAttr('disabled');
                                $('#pasTR').attr('style','display:none');
                                // var terbayarTotal = parseInt(dt.datax.terbayarTotal);
                                var akanBayar     = kuranganAngs;
                                var belumBayarNominalTot = biayaNett - (terbayarTotal+akanBayar);
                                $('#belumBayarNominalTotTD').html('Rp. '+(belumBayarNominalTot).setCurr());
                            }else{ // LUNAS per @angsuran
                                console.log('..... @angsuran lunas');
                                akanBayarTot+=angsurNom;
                            }
                        }
                        $('#kuranganAngsuranTB').val(akanBayarTot); // max nominal untuk membayar
                        $('#terbayarAngsurankeRuleTD').html(tbyrke);
                        $('#terbayarBaruTD').html(dt.datax.terbayarBaru+krgNomInfo);
                        $('#terbayarTotalTD').html(dt.datax.terbayarTotal);
                   // akan bayar
                        $('#akanBayarNominalTB1').val('Rp. '+(angsurNom).setCurr());
                        $('#akanBayarkeTD').html(dt.datax.akanBayarke+krgKeInfo);
                        $('#akanBayarNominalTD').html(dt.datax.angsuranNominal);
                        $('#akanBayarNominalTotTD').html('Rp. '+(akanBayarTot.setCurr()));
                    // belum bayar
                        var belumBayarNominalTot = biayaNett-(terbayarTotal+akanBayarTot);
                        $('#belumBayarNominalTotTD').html('Rp. '+(belumBayarNominalTot.setCurr()));
                        $('#belumBayarAngsurankeTD').html(dt.datax.belumBayarAngsuranke+' x');
                    }
                });
                $.Dialog.title('Pembayaran Siswa'); 
                $.Dialog.content(contentFR);
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
    function printPDF(mn,idx){
        var par='',tok='',p=v='';
        $('.'+mn+'_cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });
        // if(mn=='kwitansipenerimaansiswa') {
        if(idx!='') {
            if(mn=='kwitansipenerimaansiswa') par+='&idpenerimaansiswa='+idx;
            else  par+='&idsiswabiaya='+idx;
            
            tok+=idx;
        }
        var x     = $('#id_loginS').val();
        var token = encode64(x+tok);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }

// combo departemen ---
    function cmbdepartemen(typ){
        var u = dir2;
        var d = 'aksi=cmb'+mnu2;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.departemen, function(id,item){
                    out+='<option value="'+item.replid+'"> '+item.nama+'</option>';
                });
            }
            if(typ=='filter') {
                $('#departemenS').html(out);
                cmbtahunajaran('filter');
            }else $('#departemenTB').html(out);
        });
    }
//end of combo departemen---
        
// combo tingkat  ---
    function cmbtingkat(typ){
        var u = dir7;
        var d = 'aksi=cmb'+mnu7+'&departemen='+$('#departemenS').val();
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tingkat, function(id,item){
                    out+='<option value="'+item.replid+'">'+item.tingkat+'</option>';
                });
                if(typ=='filter'){
                    $('#tingkatS').html(out);
                    cmbsubtingkat('filter');
                }else{
                    $('#subtingkatTB').html(out);
                }
            }
        });
    }
//end of combo tingkat---

// combo subtingkat  ---
    function cmbsubtingkat(typ,tkt){
        var u = dir8;
        var d = 'aksi=cmb'+mnu8+'&tingkat='+$('#tingkatS').val();
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.subtingkat, function(id,item){
                    out+='<option value="'+item.replid+'">'+item.subtingkat+'</option>';
                });
                if(typ=='filter'){
                    $('#subtingkatS').html(out);
                    cmbbiaya('filter');
                }else{
                    $('#subtingkatTB').html(out);
                }
            }
        });
    }

// combo biaya  ---
    function cmbbiaya(typ){
        var u = dir3;
        var d = 'aksi=cmb'+mnu3;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.biaya, function(id,item){
                    out+='<option value="'+item.replid+'">'+item.biaya+'</option>';
                });
                if(typ=='filter'){
                    $('#biayaS').html(out);
                    viewTB('penerimaansiswa');
                }else{
                    $('#biayaTB').html(out);
                }
            }
        });
    }

// combo tahun ajaran  ---
    function cmbtahunajaran(typ){
        console.log('masuk tahu ajaran ');
        var u= dir6;
        var d = 'aksi=cmb'+mnu6;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    var ta = item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1);
                    out+='<option '+(item.aktif=='1'?'selected':'')+' value="'+item.replid+'">'+ta+'</option>';
                });
                if(typ=='filter'){
                    $('#tahunajaranS').html(out);
                    cmbtingkat('filter',dt.tahunajaran[0].replid);
                }else{
                    $('#tahunajaranTB').html(out);
                }
            }
        });
    }
//end of combo tahun ajaran---
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

    function histBayarFC(){
        if($('#histBayarTD').html()!='') $('#histBayarTD').html('');
        else{
            var url  = dir;
            var data = '&aksi=histBayar&siswabiaya='+$('#idsiswabiayaTB').val();
            $('#histBayarTD').html('<tr><td colspan="2" align="center"><img src="img/w8loader.gif"></td></tr>');
            ajax(url,data).done(function (dt) {
                if (dt.status!='sukses') notif(dt.status,'red'); //gagal
                else{ // sukses
                    var out='<table class="table bordered striped bg-green fg-white ">'
                            +'<thead>'
                                +'<tr>'
                                    +'<th>no.</th>'
                                    +'<th>Tanggal</th>'
                                    +'<th>Nominal</th>'
                                    +'<th>Aksi</th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody class="text-center">';
                    if(dt.datax.length==0) out+='<tr><td colspan="4" class="text-center fg-white bg-orange">belum pernah membayar</td></tr>'
                    else{
                        $.each(dt.datax,function (id,item){
                            out+='<tr class="bg-lime">'
                                    +'<td>'+item.angsuranKe+'</td>'
                                    +'<td>'+item.tanggal+'</td>'
                                    +'<td>'+item.nominal+'</td>'
                                    +'<td>'
                                        +'<a data-hint="batalkan" onclick="del('+item.replid+');" class="button bg-white fg-green"><i class="icon-cancel-2"></i></a>&nbsp;'
                                        +'<a data-hint="kwitansi" onclick="printPDF(\'kwitansipenerimaansiswa\','+item.replid+');" class="button bg-white fg-green"><i class="icon-libreoffice"></i></a>'
                                    +'</td>'
                                +'</tr>';
                        });
                            out+='</tbody>'
                            +'<tfoot>'
                                +'<tr>'
                                    +'<th colspan="2" align="right">Total Terbayar </th>'
                                    +'<th id="histBayarTotTD">'+dt.totNominal+'</th>'
                                +'</tr>'
                            +'</tfoot>'
                        +'</table>';
                    }$('#histBayarTD').html(out);
                }
            });
        }
    }
    
    function pilihAkanBayarJenis () {
        $('#akanBayarNominalTB2').val('');
        $('#akanBayarKuranganTD').html('');
        $('#akanBayarNotif').html('');
        if($('#akanBayarJenisTB1').is(':checked')){
            $('#akanBayarNominalTB2').attr('disabled',true).removeAttr('required');
            $('#akanBayarNominalTotTD').html($('#akanBayarNominalTB1').val());
        }else{
            $('#akanBayarNominalTB2').attr('required',true).removeAttr('disabled');
            $('#akanBayarNominalTotTD').html($('#akanBayarNominalTB1').val());
        }belumBayarFC();
    }

    function akanBayarSisaFC() {
        var bayarNominal =getUang($('#akanBayarNominalTB2').val());
        var angsuranNominal = parseInt(getUang($('#angsuranNominalTD').html()));
        if($('#kuranganAngsuranTB').val()<angsuranNominal){ // ada tunggakan angsuran yang kurang
            maxbyr  = parseInt($('#kuranganAngsuranTB').val()); // 9.212.500
            kuranganNominal = maxbyr - bayarNominal;
            if(kuranganNominal<0) $('#akanBayarNotif').html('<span align="justify" class="fg-white bg-red ">Max Rp. '+(parseInt(maxbyr).setCurr())+'</span>');
            else $('#akanBayarNotif').html('');
        }else{ // tifak ada tunggakan angsuran yg kurang 
            maxbyr = angsuranNominal;
            kuranganNominal = maxbyr - bayarNominal; 
            if(kuranganNominal<=0) $('#akanBayarNotif').html('<span align="justify" class="fg-white bg-red ">Max Rp. '+(parseInt(maxbyr).setCurr())+'</span>');
            else $('#akanBayarNotif').html('');
        }$('#akanBayarKuranganTD').html(parseInt(kuranganNominal).setCurr());
        $('#akanBayarNominalTotTD').html('Rp. '+parseInt(bayarNominal).setCurr());
        belumBayarFC();
    }

    function belumBayarFC () {
        var biayaNett=parseInt(getUang($('#biayaNettTD').html()));
        var terbayarTotal=parseInt(getUang($('#terbayarTotalTD').html()));
        var akanBayarNominalTot=parseInt(getUang($('#akanBayarNominalTotTD').html()));
        var belumBayarNominalTot=biayaNett - (terbayarTotal+akanBayarNominalTot); 
        console.log('nett='+biayaNett);
        console.log('telah terbayar='+terbayarTotal);
        console.log('akan terbayar='+akanBayarNominalTot);
        console.log('belum bayar='+belumBayarNominalTot);
        $('#belumBayarNominalTotTD').html('Rp. '+(belumBayarNominalTot.setCurr()));
    }
    // number to currency (ex : 500000 -> 500.000)  
    Number.prototype.setCurr=function(){
        return this.toFixed(0).replace(/(\d)(?=(\d{3})+\b)/g,'$1.');
    }


// cmbo viabayar 
    function cmbviabayar(typ,via) {
        var d = 'aksi=cmb'+mnu10+(typ=='rule'?'&replid='+via:'');
        ajax(dir10,d).done(function (dt){
            var out='';
            if (dt.status!='sukses') {
                notif(dt.status,'red');
                out+='<option value="">'+dt.status+'</option>'
            }else{
                $.each(dt.viabayar,function (id,item){
                    out+='<option '+(via==item.replid?'selected':'')+' value="'+item.replid+'">'+item.viabayar+'</option>'
                });
                if(typ=='rule') {
                    $('#viaBayarTD').html(dt.viabayar[0].viabayar);
                }else {
                    $('#viaBayarTB').html(out);
                }
            }
        });
    }   

//    4.882.000
//      600.000
//    5.482.000

// left pad (replace with 0)
    function lpadZero (n, length){
        var str = (n > 0 ? n : -n) + "";
        var zeros = "";
        for (var i = length - str.length; i > 0; i--)
            zeros += "0";
        zeros += str;
        return n >= 0 ? zeros : "-" + zeros;
    }

    function validUang () {
        //TODO
    }

/*about date*/ 
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
        // var dob  ='2015-09-16';
    function tgl_indo5(str){
        var m = monthFormat(parseInt(str.substring(7,5)));
        var d = str.substring(8);
        var y = str.substring(0,4);
        return d+' '+m+' '+y;
    }
    // console.log(tgl_indo5(dob));    }


//date format -----------------
    function dateFormatx(typ,d,m,y){
        if(typ=='id') // 25 Dec 2014
            return d+' '+m+' '+y;
        else // 2014-12-25
            return y+'-'+m+'-'+d;
    }

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

    function del(idx){
        if(confirm('hapus data ?'))
        ajax(dir,'aksi=hapus&replid='+idx).done(function (dt){
            if(dt.status!='sukses') notif(dt.status,'red');
            else{
                notif(dt.status,'green');
                $('#histBayarTD').html('');histBayarFC();
                viewTB('penerimaansiswa');
                $.Dialog.close();
            }
        });
    }