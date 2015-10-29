var mnu  ='rekapitulasipenerimaansiswa'; 
var mnu2 ='departemen'; 
var mnu3 ='biaya'; 
var mnu6 ='tahunajaran'; 
var mnu7 ='tingkat'; 
var mnu8 ='subtingkat'; 
var mnu9 ='kelas'; 

var dir  ='models/m_'+mnu+'.php';
var dir2 ='../akademik/models/m_'+mnu2+'.php';
var dir3 ='models/m_'+mnu3+'.php';
var dir6 ='../akademik/models/m_'+mnu6+'.php';
var dir7 ='../akademik/models/m_'+mnu7+'.php';
var dir8 ='../akademik/models/m_'+mnu8+'.php';
var dir9 ='../akademik/models/m_'+mnu9+'.php';

var contentFR = contentFR2 ='';
// main function load first 
    $(document).ready(function(){
        cmbdepartemen();
        contentFR+= '<form  style="overflow:scroll;height:500px;" autocomplete="off" onsubmit="simpanSV(this); return false;" id="'+mnu+'FR">'
                        +'<input class="kwitansipenerimaansiswa_cari" id="idsiswabiayaTB" name="idsiswabiayaTB" type="hidden">' 
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

        $('#departemenS').change(function (){
            cmbtahunajaran();
        });$('#tahunajaranS').change(function (){
            cmbbiaya();
        });$('#biayaS').change(function (){
            viewTB('rekapitulasipenerimaansiswa');
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
            par+='&idpembayaran='+idx;
            tok+=idx;
        }
        var x     = $('#id_loginS').val();
        var token = encode64(x+tok);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }

// combo departemen ---
    function cmbdepartemen(){
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
            $('#departemenS').html(out);
            cmbtahunajaran();
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
                    viewTB('rekapitulasipenerimaansiswa');
                    // cmbsubtingkat('filter');
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
    function cmbbiaya(){
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
                $('#biayaS').html(out);
                viewTB('rekapitulasipenerimaansiswa');
            }
        });
    }

// combo tahun ajaran  ---
    function cmbtahunajaran(){
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
                $('#tahunajaranS').html(out);
                cmbbiaya();
            }
        });
    }
//end of combo tahun ajaran---
    function getUang(x){
        var xx = x.replace(/[^0-9]+/g,'');
        return xx;
    }


    // number to currency (ex : 500000 -> 500.000)  
    Number.prototype.setCurr=function(){
        return this.toFixed(0).replace(/(\d)(?=(\d{3})+\b)/g,'$1.');
    }


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