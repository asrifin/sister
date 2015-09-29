var mnu  ='penerimaansiswa'; 
var mnu2 ='departemen'; 
var mnu3 ='biaya'; 
var mnu6 ='tahunajaran'; 
var mnu7 ='tingkat'; 
var mnu8 ='subtingkat'; 
var mnu9 ='kelas'; 

var dir  ='models/m_'+mnu+'.php';
var dir2 ='../akademik/models/m_'+mnu2+'.php';
var dir3 ='../psb/models/m_'+mnu3+'.php';
var dir6 ='../akademik/models/m_'+mnu6+'.php';
var dir7 ='../akademik/models/m_'+mnu7+'.php';
var dir8 ='../akademik/models/m_'+mnu8+'.php';
var dir9 ='../akademik/models/m_'+mnu9+'.php';

var contentFR ='';
// main function load first 
    $(document).ready(function(){
        cmbdepartemen('filter');
        //form content
        contentFR+= '<form  style="overflow:scroll;height:500px;" autocomplete="off" onsubmit="simpanSV(this); return false;" id="'+mnu+'FR">'
                        +'<input id="ju_idformH" type="hidden">' 
                        +'<input id="idsiswaH" name="idsiswaH" type="hidden">' 
                        +'<input id="idmodulH" name="idmodulH" type="hidden">' 
                        +'<input id="rekkasH" name="rekkasH" type="hidden">' 
                        +'<input id="rekitemH" name="rekitemH" type="hidden">' 

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
                        +'</table>'

                        +'<table class="table bordered ">'
                            // header -------------------------
                            +'<tr class="bg-blue fg-white">'
                                +'<th>ITEM</th>'
                                +'<th>NOMINAL</th>'
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
                                +'<td colspan="2">* Setelah Diskon (Nett)</td>'
                                +'<td style="font-weight:bold;"  class="bg-yellow fg-white text-right" id="biayaNettTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td colspan="4"></td>'
                            +'</tr>'
                            // Angsuran  ---------------------------
                            +'<tr>'
                                +'<td  class="bg-lightTeal"  colspan="2"><b>Angsuran</b> </td>'
                                +'<td class="bg-lightTeal"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Jumlah Angsuran</td>'
                                +'<td id="angsuranTD" class="text-right"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Nominal Angsuran</td>'
                                +'<td id="angsuranNominalTD" class="text-right"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td colspan="4"></td>'
                            +'</tr>'
                            // Sudah Dibayar  ---------------------------
                            +'<tr>'
                                +'<td  class="bg-lightTeal"  colspan="2"><b>Sudah Dibayar</b> </td>'
                                +'<td class="bg-lightTeal"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Angsuran ke - </td>'
                                +'<td class="text-right" id="terbayarAngsurankeTD"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Sejumlah Nominal </td>'
                                +'<td class="text-right" id="terbayarBaruTD"></td>'
                                +'<td cxlass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Total (Terbayar) </td>'
                                +'<td></td>'
                                +'<td style="font-weight:bold;" class="text-right fg-white bg-yellow" id="terbayarTotalTD"></td>'
                            +'</tr>' 
                            +'<tr>'
                                +'<td colspan="4"></td>'
                            +'</tr>'

                            // akan  Dibayar  ---------------------------
                            +'<tr>'
                                +'<td  class="bg-lightTeal"  colspan="2"><b>Akan Dibayar</b> </td>'
                                +'<td class="bg-lightTeal"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Angsuran ke - </td>'
                                +'<td class="text-right" id="akanBayarkeTD"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td colspan="2">* Nominal Angsuran </td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td colspan="4"></td>'
                            +'</tr>'
                            // nominal bayar 1
                            +'<tr>'
                                +'<td><label class="place-right"><input onclick="pilihAkanBayarJenis();" id="akanBayarJenisTB1" checked value="1" name="akanBayarJenisTB" type="radio" > Pas Angsuran </label> </td>'
                                +'<td class="text-right" id="akanBayarNominalTD"></td>'
                                +'<td xclass="bg-yellow"><input id="akanBayarNominalTB1" type="hidden" name="akanBayarNominalTB1" /></td>'
                            +'</tr>'
                            // nominal bayar 2
                            +'<tr>'
                                +'<td><label class="place-right"><input  onclick="pilihAkanBayarJenis();"  id="akanBayarJenisTB2" type="radio" value="2" name="akanBayarJenisTB"> Krg. dari Angsuran </label> </td>'
                                +'<td><div class="input-control text">'
                                    +'<input id="akanBayarNominalTB2"  onkeyup="akanBayarSisaFC();" name="akanBayarNominalTB2" disabled onfocus="inputuang(this);" placeholder="masukkan nominal" type="text" class="text-right"></div>'
                                    +'<div id="akanBayarNotif"></div>'
                                    +'<div>Sisa Kurangan : <span id="akanBayarKuranganTD" class="place-right">Rp. 0</span></div>'
                                +'</td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td></td>'
                                +'<td></td>'
                                +'<td style="font-weight:bold;" id="akanBayarNominalTotTD" class="bg-yellow fg-white text-right"></td>'
                            +'</tr>'                            
                            +'<tr>'
                                +'<td colspan="4"></td>'
                            +'</tr>'

                            // yang belum  Dibayar  ---------------------------
                            +'<tr>'
                                +'<td  class="bg-lightTeal"  colspan="2"><b>yang Belum Dibayar</b> </td>'
                                +'<td class="bg-lightTeal"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Angsuran </td>'
                                +'<td id="belumBayarAngsurankeTD" class="text-right"></td>'
                                +'<td xclass="bg-yellow"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>* Total Nominal</td>'
                                +'<td></td>'
                                +'<td style="font-weight:bold;" id="belumBayarNominalTotTD" class="bg-yellow fg-white"></td>'
                            +'</tr>'
                        +'</table>'

                        +'<div class="form-actions">' 
                            +'<button class="button primary simpanBC">Bayar <span class="icon-floppy"></span></button>&nbsp;'
                        +'</div>'

                       
                    +'</form>';

        $('#nisS,#namasiswaS,#nisnS,#nopendaftaranS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB();
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
                $(el2).html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
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
                $(el2).html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr></center>');
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
                        // info header 
                        $('#namasiswaTD').html(': '+dt.datax.namasiswa);
                        $('#kelasTD').html(': '+dt.datax.kelas);
                        $('#nisTD').html(': '+dt.datax.nis);
                        $('#biayaTD').html(': '+dt.datax.biaya);
                        // detail pembayaran 
                        $('#biayaAwalTD').html(dt.datax.biayaAwal);
                        $('#totalDiskonTD').html(dt.datax.totalDiskon);
                        $('#biayaNettTD').html(dt.datax.biayaNett);
                        //angsuran 
                        $('#angsuranTD').html(dt.datax.angsuran+' x');
                        $('#angsuranNominalTD').html('@ '+dt.datax.angsuranNominal);
                        //sudah terbayar 
                        $('#terbayarAngsurankeTD').html(dt.datax.terbayarAngsuranke);
                        $('#terbayarBaruTD').html(dt.datax.terbayarBaru);
                        $('#terbayarTotalTD').html(dt.datax.terbayarTotal);
                        // akan bayar
                        $('#akanBayarkeTD').html(dt.datax.akanBayarke);
                        $('#akanBayarNominalTB1').val(dt.datax.angsuranNominal);
                        $('#akanBayarNominalTD').html(dt.datax.angsuranNominal);
                        $('#akanBayarNominalTotTD').html(dt.datax.angsuranNominal);
                        // belum bayar
                        $('#belumBayarNominalTotTD').html(dt.datax.belumBayarNominalTot);
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
                    viewTB();
                }else{
                    $('#biayaTB').html(out);
                }
            }
        });
    }

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
    function pilihAkanBayarJenis () {
        $('#akanBayarNominalTB2').val('');
        $('#akanBayarKuranganTD').html('');
        $('#akanBayarNotif').html('');
        if($('#akanBayarJenisTB1').is(':checked')){
            $('#akanBayarNominalTB2').attr('disabled',true).removeAttr('required');
            $('#akanBayarNominalTotTD').html($('#akanBayarNominalTB1').val());
        }else{
            $('#akanBayarNominalTB2').attr('required',true).removeAttr('disabled');
        }
        belumBayarFC();
    }
    function akanBayarSisaFC() {
        var bayarNominal =getUang($('#akanBayarNominalTB2').val());
        var angsuranNominal = parseInt(getUang($('#angsuranNominalTD').html()));
        var kuranganNominal = angsuranNominal - bayarNominal; 
        if(kuranganNominal<=0){
            $('#akanBayarNotif').html('<span align="justify" class="fg-white bg-red ">Max Rp. '+(parseInt(angsuranNominal).setCurr())+'</span>');
        }else{
            $('#akanBayarNotif').html('');
        }
        $('#akanBayarKuranganTD').html(parseInt(kuranganNominal).setCurr());
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


//    4.882.000
//      600.000
//    5.482.000