var mnu  ='transaksi'; 
var mnu2 ='lokasi'; 
var mnu3 ='departemen'; 
var mnu4 ='tahunajaran'; 
var mnu5 ='tingkat'; 

var dir  ='models/m_'+mnu+'.php';
var dir2 ='models/m_'+mnu2+'.php';
var dir3 ='../akademik/models/m_'+mnu3+'.php';
var dir4 ='../akademik/models/m_'+mnu4+'.php';
var dir5 ='../akademik/models/m_'+mnu5+'.php';

var contentFR ='';
var detilanggaranArr=rekArr=[];
// main function load first 
    $(document).ready(function(){
        $('#li_rekeningS').on('focus',function () {
            autoSuggest('','li_rekening','','');
        });

    //print ---
        $('#ju_cetakBC').on('click',function(){
            printPDF('ju');
        });
        $('#ns_cetakBC').on('click',function(){
            printPDF('ns');
        });
        $('#bb_cetakBC').on('click',function(){
            printPDF('bb');
        });
        $('#lr_cetakBC').on('click',function(){
            printPDF('lr');
        });
        $('#pkb_cetakBC').on('click',function(){
            printPDF('pkb');
        });
        $('#li_cetakBC').on('click',function(){
            printPDF('li');
        });
        $('#optionBC').on('click',function(){
            $('#optionPN').toggle('slow');
        });
        // set default tanggal hari ini 
        $('#hari_iniBC').on('click',function(){ //tgl
            $('#tgl1TB,#tgl2TB').val(getToday());
        });$('#bulan_iniBC').on('click',function(){ //bln
            $('#tgl1TB').val(getFirstDate());
            $('#tgl2TB').val(getLastDate());
        });

    //form content
        contentFR +='<form style="overflow:scroll;height:700px;" autocomplete="off" onsubmit="transSV(this); return false;">'
                        // hidden input
                        +'<input name="idformH" id="idformH" type="hidden">' 
                        +'<input name="detjenistransH" id="detjenistransH" type="hidden">' 
                        +'<input name="subaksiH" id="subaksiH" type="hidden">' 
                        +'<input class="kwitansi_cari" name="nomerH" id="nomerH" type="hidden">' 

                        +'<legend><b>Keterangan Transaksi</b>'
                            +'<span class="place-right">'
                                +'<span id="kwitansiDV" class="size2"><input id="kwitansiCB" checked type="checkbox"> Cetak kwitansi </span>&nbsp;'
                                +'<button hint="Tambah Rekening" class="button primary"><i class="icon-floppy"></i> simpan</button>'
                            +'</span>'
                        +'</legend>'
                        // nomer transaksi
                        +'<h5 class="place-right fg-green" style="font-weight:bold;" id="nomerTB"></h5>'
                        
                        // no bukti (kwitansi)
                        +'<label>No. Bukti </label>'
                        +'<div class="input-control text">'
                            +'<div id="nobuktiDV"></div>'
                            +'<input placeholder="no bukti" name="nobuktiTB" id="nobuktiTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        // tanggal transaksi
                        +'<label>Tanggal</label>'
                        +'<div class="input-control text span2" data-role="datepicker" data-format="dd mmmm yyyy" data-position="bottom" data-effect="slide">'
                            +'<input required type="text" id="tanggalTB" name="tanggalTB">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        // uraian transaksi (optional)
                        +'<label style="display:none;" class="uraianDV">Uraian</label>'
                        +'<div  style="display:none;" class="input-control textarea uraianDV">'
                            +'<textarea placeholder="uraian" name="uraianTB" id="uraianTB"></textarea>'
                        +'</div>'

                        // anggaran (optional:income & outcome)
                        // +'<label style="display:none;" class="detilanggaranDV">Anggaran </label>'
                        // +'<div style="display:none;" class="input-control text detilanggaranDV">'
                        //     +'<input type="hidden" name="detilanggaranV" id="detilanggaranV">'
                        //     +'<input type="hidden" name="detilanggaranH" id="detilanggaranH">'
                        //     +'<input placeholder="pada anggaran" id="detilanggaranTB">'
                        //     +'<button class="btn-clear"></button>'
                        // +'</div>'

                        // rekening kas (optional)
                        +'<label style="display:none;" class="rekkasDV">Rekening Kas/Bank</label>'
                        +'<div style="display:none;" class="input-control text rekkasDV">'
                            +'<input type="hidden" name="rekkassisaH" id="rekkassisaH">'
                            +'<input type="hidden" name="rekkasH" id="rekkasH">'
                            +'<input placeholder="rek. kas / bank" id="rekkasTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // rekening perkiraan 
                        +'<legend style="font-weight:bold;">Rekening <span style="font-weight:bold;" id="reklawanDV"></span> : '
                            +'<a id="addTRBC" href="#" class="place-right button bg-blue fg-white">'
                                +'<i class="icon-plus-2"></i>'
                            +'</a>'
                        +'</legend>'

                        // tabel rekening
                        +'<table class="table hovered bordered striped">'
                            +'<thead id="rekTBL1"></thead>'
                            +'<tbody id="rekTBL"></tbody>'
                            +'<tfoot id="rekTBL3"></tfoot>'
                        +'</table>'
                  +'</form>'; 

        //search button
        $('#juBC').on('click',function(){
            $('#juTR').toggle('slow');
            $('#ju_noS').val('');
            $('#ju_uraianS').val('');
        });       
        // cari TR
        $('#nsBC').on('click',function(){
            $('#nsTR').toggle('slow');
            $('#ns_kodeS').val('');
            $('#ns_namaS').val('');
        });

        //search action ---
        // ju
        $('#ju_noS,#ju_uraianS').on('keydown',function (e){ 
            if(e.keyCode == 13)  viewTB('ju');
        });
        // ns
        $('#ns_kodeS,#ns_namaS').on('keydown',function (e){ 
            if(e.keyCode == 13)  viewTB('ns');
        });

        // set default this month
        $('#tgl1TB').val(getFirstDate());
        $('#tgl2TB').val(getLastDate());
        // jurnal umum :: tampilkan detail jurnal
        $('#ju_detiljurnalCB').on('click',function(){
            $('.uraianCOL').toggle();
        });
        
    // filtering 
        // li : report penerimaan & pengeluaran 
        $('#li_departemenS').on('change',function(){
            cmbtahunajaran('li',$(this).val());
        });
        $('#li_tahunajaranS').on('change',function(){
            cmbtingkat('li',$(this).val());
            cmbthn($(this).val());
        });        
        $('#li_tingkatS').on('change',function(){
            viewTB('li');
        });
        $('#li_tahunS').on('change',function(){
            cmbbln($('#li_tahunajaranS').val(),$(this).val());
        });
        $('#li_bulanS').on('change',function(){
            viewTB('li');
        });
        $('#li_jenisS').on('change',function(){
            jenisLaporan();
            viewTB('li');
        });

        jenisTrans(); // load checkbox jenis transaksi
        jenisLaporan();
        loadAll();
    }); 

// filtering : jenis laporan 
    function jenisLaporan(){
        var u = dir;
        var d = 'aksi=jenislaporan&jenis='+$('#li_jenisS').val();
        ajax(u,d).done(function (dt) {
            var outO=outN='';
            var counter=0;
            var oper=nonOper='';
            $.each(dt.jenisArr,function(id,item){
                if(item.kategori=='o'){ // operasional
                    outO+='<li style="padding-left:20px;">'
                            +'<label>'
                                +'<input name="jenisLaporanCB[]" class="jenisLaporanCB" value="'+item.idrekening+'" onchange="viewTB(\'li\');" checked="checked" type="checkbox"> '
                                    +item.rekening+''
                            +'</label>'
                        +'</li>';
                }else{ // non operasional
                    outN+='<li style="padding-left:20px;">'
                            +'<label>'
                                +'<input name="jenisLaporanCB[]" class="jenisLaporanCB" value="'+item.idrekening+'" onchange="viewTB(\'li\');" checked="checked" type="checkbox"> '
                                    +item.rekening+''
                            +'</label>'
                        +'</li>';
                }
            });
            $('#operUL').html(outO);
            $('#nonOperUL').html(outN);
        });
    }
    //print to PDF -------
    function printPDF(mn){
        var c = par = tok ='',p,v;
        $('.'+mn+'_cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });
        if(mn=='ju'){
            var opt = $('form#filterFR').serialize();
            par+='&jenisAllCB='+$('#jenisAllCB').val();
            tok+=$('#jenisAllCB').val();
            $('.detjenisCB').each(function(id,item){
                if($(this).is(':checked')){
                    par+='&'+$(this).attr('name')+'='+$(this).val();
                    tok+=$(this).val();
                } 
            });
        }else if(mn=='li'){
            var opt = $('form#filterFR2').serialize();
            $('.jenisLaporanCB').each(function(id,item){
                if($(this).is(':checked')){
                    par+='&'+$(this).attr('name')+'='+$(this).val();
                    tok+=$(this).val();
                } 
            });
        }
        var x  = $('#id_loginS').val();
        var token = encode64(x+tok);
        console.log('mn  ='+mn);
        console.log('par  ='+par);
        console.log('token berfore='+x+tok);
        console.log('token after='+token);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }

     function loadAll(){
        viewTB('ju');   // jurnal umum 
        viewTB('ns');   // neraca saldo 
        cmbbukubesar(); // buku besar
        viewTB('nl');   // neraca lajur
        viewTB('ln');   // laporan neraca
        viewTB('lr');   // laba /rugi
        viewTB('pkb');  // posisi kas bank
        viewTB('bt');   // buku tambahan 
        // viewTB('li');   // laporan income (penerimaan siswa)
        // viewTB('lo');   // laporan outcome (pengeluaran)
        viewTB('ls');   // laporan outcome (pengeluaran)
        cmbdepartemen('li','');
    }
    
    // function loadLi() {
    //     viewTB('li');
    // }
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

        if(subaksi=='ju'){
            var opt = $('form#filterFR').serialize();
            cari+='&'+opt;
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

/*view*/
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
            console.log('masuk pencarian param :'+p);
            var v = $(this).val();
            cari+='&'+p+'='+v;
        });

        //filter chcekbox jenis transksi
        var opt = $('form#filterFR').serialize();
        cari+='&'+opt;

        //filter chekcbox penerimaan+pengeluaran 
        var opt2 = $('form#filterFR2').serialize();
        cari+='&'+opt2;
        console.log(opt2);

        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $(el2).html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr>');
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

// generate kode transaksi form (jurnal umum/income/outcome) : syncronous
    function kodeTrans(typ){
        var url  = dir;
        var data = 'aksi=codeGen&subaksi='+typ;
        ajax(url,data).done(function (dt) {
            if(dt.status!='sukses') ret=dt.status;
            else {
                $('#nomerTB').html(dt.kode);
                $('#nomerH').val(dt.kode);
                $('#tanggalTB').val(getToday());
                $('#nomerTB').addClass('fg-'+(typ=='ju'?'blue':(typ=='in_come'?'green':'red'))); // color of no. trans
            } 
        });
    }

/*save (insert & update)*/
    // subaksi : ju , in, out
    function transSV(e){
        var url  = dir;
        var data = $(e).serialize()+'&aksi=simpan&subaksi='+$('#subaksiH').val();
        if($('#subaksiH').val()=='ju') data+='&idDelTR='+idDelTR;
        if(validForm().status!=true){ // tidak valid
            var m = '';
            $.each(validForm().msg,function(id,item){
                m+='<span class="fg-white"><i class="icon-warning"></i> '+item+'</span><br />';
            });notif(m,'red');
        }else{ // valid 
            console.log('masuk simpan');
            ajax(url,data).done(function(dt){
                notif(dt.status,dt.status!='sukses'?'red':'green');
                if(dt.status=='sukses'){
                    if($('#kwitansiCB').prop('checked')) printPDF('kwitansi');
                    $.Dialog.close();
                    $('#rekTBL').html('');
                    loadAll();
                    // viewTB('ju');
                }
            });
        }
    }

/*delete*/
    function del(id){
        var url  = dir;
        var data = 'aksi=hapus&replid='+id;
        if(confirm('melanjutkan untuk menghapus data?'))
        ajax(url,data).done(function(dt){
            notif(dt.status+' menghapus '+dt.terhapus,dt.status!='sukses'?'red':'green');
            if(dt.status=='sukses') viewTB('ju');
        });
    }
    

/*reset form*/
    //jurnal umm   ---
        function ju_resetFR(){
            // $('#idformTB').val('');
            // $('#g_kodeTB').val('');
        }
    //end of grup ---

// input uang --------------------------
    function inputuang(e) {
        $(e).maskMoney({
            precision:0,
            prefix:'Rp. ', 
            thousands:'.', 
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

        
//ganti jenis rekening (debit/kredit)
    function ju_gantiJenisRek(typ,i){
        // if(typ=='ju'){
            if ($('#'+typ+'_jenis'+i+'TB').val()=='') {  // jika jenis tdk dipilih
                $('#'+typ+'_rek'+i+'TB').attr('disabled',true);
                $('#'+typ+'_nominal'+i+'TB').attr('disabled',true);
            }else{ // jika jenis (kredit/debit)
                $('#'+typ+'_rek'+i+'TB').focus();
                $('#'+typ+'_rek'+i+'TB').removeAttr('disabled');
                $('#'+typ+'_nominal'+i+'TB').removeAttr('disabled');
                $('#'+typ+'_rek'+i+'TB').attr('onclick','autoSuggest(\'ju\',\''+typ+'_rek'+i+'\',\'rek\',\'\');');
                $('#'+typ+'_rek'+i+'TB').attr('onfocus','autoSuggest(\'ju\',\''+typ+'_rek'+i+'\',\'rek\',\'\');');
                // $('#'+typ+'_rek'+i+'TB').attr('onclick','autoSuggest(\''+$('#'+typ+'_jenis'+i+'TB').val()+'\',\''+typ+'_rek'+i+'\',\'rek\',\'\');');
                // $('#'+typ+'_rek'+i+'TB').attr('onfocus','autoSuggest(\''+$('#'+typ+'_jenis'+i+'TB').val()+'\',\''+typ+'_rek'+i+'\',\'rek\',\'\');');
            }
        // $('#'+typ+'_rek'+i+'H').val('');
        // $('#'+typ+'_rek'+i+'TB').val('');
        // $('#'+typ+'_nominal'+i+'TB').val('');
    }

// record rekening perkiraan
    var iTR = 1;    
    var idDelTR = [];
    var idAddTR = [];

    function rekTR (typ,n,arr) {
        var tr='';
        var isLoop=true;
        if(typ=='ju'){ // jurnal umum
            if(typeof n=='undefined'){ isLoop=false; n=iTR;}
            for(var i=n; i>=iTR; i--){
                var ke = parseInt(i)-1;
                var idjurnal = (typeof arr!='undefined')?arr[ke].idjurnal:null;
                var idrek    = (typeof arr!='undefined')?arr[ke].idrek:'';
                var rek      = (typeof arr!='undefined')?arr[ke].rek:'';
                var nominal  = (typeof arr!='undefined')?arr[ke].nominal:'';
                var jenis    = (typeof arr!='undefined')?arr[ke].jenis:'';
                
                var mode = (typeof arr!='undefined')?'edit':'add';

                tr+='<tr class="rekTR" id="rekTR_'+ke+'">'
                        // jenis rek
                        +'<td align="center">'
                            +'<input type="hidden" name="ju_mode'+ke+'H" value="'+mode+'" />'
                            +'<input type="hidden" value="'+idjurnal+'" name="ju_idjurnal'+ke+'H" id="ju_idjurnal'+ke+'H">'
                            +'<input type="hidden" class="ju_idTR" value="'+ke+'" name="ju_idTR[]" id="ju_idTR_'+ke+'">'
                            +'<div class="input-control select">'
                                +'<select required onchange="ju_gantiJenisRek(\''+typ+'\','+ke+');" id="ju_jenis'+ke+'TB" name="ju_jenis'+ke+'TB">'
                                    +'<option value="">..pilih..</option>'
                                    +'<option '+(typeof arr=='undefined'?'':(jenis=='d'?'selected':''))+' value="d">Debit</option>'
                                    +'<option '+(typeof arr=='undefined'?'':(jenis=='k'?'selected':''))+' value="k">Kredit</option>'
                                + '</select>'
                            +'</div>' 
                        +'</td>'
                        // rek
                        +'<td align="center">'
                            +'<span class="input-control xsize5 text">'
                                +'<input class="idrek" value="'+idrek+'" id="ju_rek'+ke+'H" name="ju_rek'+ke+'H" type="hidden" />'
                                +'<input value="'+rek+'" required '
                                    // +(typeof arr=='undefined'?'disabled':' onfocus="alert(9999);"')
                                    +(typeof arr=='undefined'?'disabled':' onfocus="autoSuggest(\'ju\',\'ju_rek'+ke+'\',\'rek\',\'rek\',\'\');"')
                                    +' id="ju_rek'+ke+'TB" name="ju_rek'+ke+'TB" placeholder="rekening" type="text" />'
                                // +'<input value="'+rek+'" required '+(typeof arr=='undefined'?'disabled':' onfocus="autoSuggest(\''+jenis+'\',\'ju\','+ke+',\'rek\',\'\');"')+' id="ju_rek'+ke+'TB" name="ju_rek'+ke+'TB" placeholder="rekening" type="text" />'
                                +'<button class="btn-clear"></button>'
                            +'</span>'
                        +'</td>'
                        // nominal
                        +'<td align="center">'
                            +'<div class="input-control text">'
                                +'<input '+(typeof arr=='undefined'?'disabled':'')+' value="'+nominal+'" class="text-right" required name="ju_nominal'+ke+'TB"  id="ju_nominal'+ke+'TB" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);"  placeholder="nominal"/>'
                            +'</div>'
                        +'</td>'
                        // hapus
                        +'<td align="center">'
                            +'<a href="#" onclick="'+(typeof arr!='undefined'?'if(confirm(\'melanjutkan untuk menghapus data?\')) delRekTR('+ke+','+idjurnal+',\'\');':'delRekTR('+ke+','+idjurnal+',\'\')')+'"  class="button"><i class="icon-cancel-2"></i></a>'
                        +'</td>'
                    +'</tr>';
            }
        }else{ // pemasukan / pengeluaran
            if(typeof n=='undefined'){ isLoop=false; n=iTR;}
            jrek='rekitem'; // jenis rekening (incom]e:debit, outcome:kredit)
            // jrek='"aktiva","modal","kewajiban","pendapatan","biaya"'; // jenis rekening (income:debit, outcome:kredit)
            for(var i=n; i>=iTR; i--){
                var ke = parseInt(i);//-1;
                var idjurnal        = (typeof arr!='undefined')?arr.idjurnal:null;
                var iddetilanggaran = (typeof arr!='undefined')?arr.iddetilanggaran:'';
                var detilanggaran   = (typeof arr!='undefined')?arr.detilanggaran:'';
                var idrekitem       = (typeof arr!='undefined')?arr.idrekitem:'';
                var rekitem         = (typeof arr!='undefined')?arr.rekitem:'';
                var nominal         = (typeof arr!='undefined')?arr.nominal:'Rp. 0';
                var uraian          = (typeof arr!='undefined')?arr.uraian:'';
                var mode            = (typeof arr!='undefined')?'edit':'add'; 
                // console.log(jenis);
                    
                tr+='<tr class="rekTR" id="rekTR_'+ke+'">';
                if(typ=='out_come'){
                    // anggaran
                    tr+='<td align="center">'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="'+typ+'_sisaanggaran'+ke+'H" id="'+typ+'_sisaanggaran'+ke+'H" value="'+detilanggaran+'" />'
                            +'<input class="detilanggaran" type="hidden" value="'+iddetilanggaran+'" id="'+typ+'_detilanggaran'+ke+'H" name="'+typ+'_detilanggaran'+ke+'H" />'
                            +'<input onkeyup="validForm2();" id="'+typ+'_detilanggaran'+ke+'TB" name="'+typ+'_detilanggaran'+ke+'TB" value="'+rekitem+'" required  onfocus="autoSuggest(\'\',\''+typ+'_detilanggaran'+ke+'\',\'detilanggaran\',\'\');" onclick="autoSuggest(\'\',\''+typ+'_detilanggaran'+ke+'\',\'detilanggaran\',\'\');" placeholder="anggaran " type="text" />'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                    +'</td>';
                }
                    // rek
                    tr+='<td>'
                            +'<input type="hidden" name="'+typ+'_idTR[]" id="'+typ+'_idTR_'+ke+'" class="'+typ+'_idTR" value="'+ke+'" >'
                            +'<input type="hidden" name="'+typ+'_idjurnal'+ke+'H" id="'+typ+'_idjurnal'+ke+'H" value="'+idjurnal+'" >'
                            +'<input type="hidden" name="'+typ+'_mode'+ke+'H" value="'+mode+'" />'
                           
                            +'<input value="'+idrekitem+'" class="idrek" id="'+typ+'_rek'+ke+'H" name="'+typ+'_rek'+ke+'H" type="hidden" />';
                            if(typ=='out_come'){
                                tr+='<span id="'+typ+'_rek'+ke+'TB">'+rekitem+'</span>';
                            }else{
                                tr+='<span class="input-control xsize3 text">'
                                    +'<input id="'+typ+'_rek'+ke+'TB" value="'+rekitem+'" required  onfocus="autoSuggest(\''+jrek+'\',\''+typ+'_rek'+ke+'\',\'rek\',\'\');" onclick="autoSuggest(\''+jrek+'\',\''+typ+'_rek'+ke+'\',\'rek\',\'\');"   placeholder="rekening" type="text" />';
                                +'</span>';
                            }
                        tr+='</td>'
                        // nominal
                        +'<td>'
                            +'<div class="input-control text">'
                                +'<input onkeyup="rekTotNominal();" class="text-right rekNominal" value="'+nominal+'" required name="'+typ+'_nominal'+ke+'TB"  id="'+typ+'_nominal'+ke+'TB" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);"  placeholder="nominal"/>'
                                +'<span id="nominalInfo'+ke+'"></span>'
                            +'</div>'
                        +'</td>'
                        // uraian
                        +'<td align="center">'
                            +'<div class="input-control text">'
                                +'<input required value="'+uraian+'" placeholder="uraian" name="'+typ+'_uraian'+ke+'TB" id="'+typ+'_uraian'+ke+'TB">'
                            +'</div>'
                        +'</td>'
                        // hapus
                        +'<td align="center">'
                            +'<a href="#" onclick="'+(typeof arr!='undefined'?'if(confirm(\'melanjutkan untuk menghapus data?\')) delRekTR('+ke+','+idjurnal+');':'delRekTR('+ke+','+idjurnal+')')+'"  class="button"><i class="icon-cancel-2"></i></a>'
                        +'</td>'
                    +'</tr>';
            }
        }
    
        if(isLoop) iTR+=n;
        else iTR++;
        return tr; 
    }

  // autosuggest
    function autoSuggest(jenis,el,subaksi,tingkat){
        if(subaksi=='rek'){ //rekening
            var urlx= '?aksi=autocomp&subaksi='+subaksi+(jenis!=''?'&jenis='+jenis:'');
            var col = [{
                    'align':'left',
                    'columnName':'kode',
                    'hide':true,
                    'width':'10',
                    'label':'Kode'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'90',
                    'label':'Rekening'
            }];
        }else if(subaksi=='detilanggaran'){ // anggaran 
            // var urlx= '?aksi=autocomp&subaksi='+subaksi+'&tingkat='+tingkat;
            var urlx= '?aksi=autocomp&subaksi='+subaksi;
            var col =[{
                    'align':'left',
                    'columnName':'nama',
                    'hide':true,
                    'width':'20',
                    'label':'Anggaran'
            },{   
                    'align':'left',
                    'columnName':'kategorianggaran',
                    'width':'10',
                    'label':'Kategori'
            },{   
                    'align':'left',
                    'columnName':'tingkat',
                    'width':'15',
                    'label':'Jenjang'
            },{   
                    'align':'left',
                    'columnName':'rekening',
                    'width':'25',
                    'label':'Rekening'
            },{   
                    'align':'right',
                    'columnName':'sisaBilCur',
                    'width':'15',
                    'label':'Sisa'
            },{   
                    'align':'right',
                    'columnName':'kuotaBilCur',
                    'width':'15',
                    'label':'Kuota'
            }];
        }else if(subaksi=='invoice'){ // invoice (PO_pembelian)
            var urlx= '?aksi=autocomp&subaksi='+subaksi;
            var col = [{
                    'align':'left',
                    'columnName':'noinvoice',
                    'hide':true,
                    'width':'15',
                    'label':'No. Invoice'
                },{   
                    'align':'left',
                    'columnName':'kodesupplier',
                    'width':'8',
                    'label':'Supplier'
                },{   
                    'align':'left',
                    'columnName':'tgl',
                    'width':'10',
                    'label':'Tanggal'
                },{   
                    'align':'left',
                    'columnName':'carabayar',
                    'width':'10',
                    'label':'Bayar'
                },{   
                    'align':'left',
                    'columnName':'total',
                    'width':'20',
                    'label':'Nominal'
            }];
        }else{
            var urlx= '?aksi=autocomp&subaksi='+subaksi+'&kategori='+$('#li_kategoriS').val();
            var col = [{
                    'align':'left',
                    'columnName':'kode',
                    'hide':true,
                    'width':'10',
                    'label':'Kode'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'90',
                    'label':'Rekening'
            }];
        }
        urly = dir+urlx;
        var t= terpilihx = '';
        if(subaksi=='rek'){ // rekening 
            if(rekArr!='' || rekArr!=null){
                t         = rekArr.filter(function(item) { return item !== ''; });
                terpilihx = '&rekArr='+t.toString();
            }
        }else{ // anggaran
            if(detilanggaranArr!='' || detilanggaranArr!=null){
                t         = detilanggaranArr.filter(function(item) { return item !== ''; });
                terpilihx = '&detilanggaranArr='+t.toString();
            }
        }

        $('#'+el+'TB').combogrid({
            debug:true,
            width:'900px',
            colModel: col ,
            url: urly+terpilihx,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                if (subaksi=='rek') { // rekening 
                    $('#'+el+'TB').val(ui.item.kode+' - '+ui.item.nama+' [ Saldo : Rp. '+parseInt(ui.item.saldoSementara).setCurr()  +' ]');
                    $('#'+el+'sisaH').val(ui.item.saldoSementara);
                    collectArr();
                }else if(subaksi=='detilanggaran'){ // anggaran 
                    collectArr();
                    $('#'+el+'TB').val(ui.item.nama+' [ sisa :'+ui.item.sisaBilCur+'  kuota : '+ui.item.kuotaBilCur+' ]');
                    var x = el.substring(22);
                    $('#out_come_sisaanggaran'+x+'H').val(ui.item.sisaBilNum);
                    $('#out_come_rek'+x+'TB').html(ui.item.rekening);
                    $('#out_come_rek'+x+'H').val(ui.item.idrekening);
                }else{ // invoice PO 
                    $('#'+el+'TB').val(ui.item.noinvoice);
                }

                // validasi input (tidak sesuai data dr server)
                    $('#'+el+'TB').on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+el+'H').val()!=''){
                                $('#'+el+'H').val('');
                                $('#'+el+'TB').val('');

                                $('#out_come_sisaanggaran'+(el.substring(22))+'H').val(''); // :: out_come
                                $('#'+el+'sisaH').val(''); // sisa rekening :: in/out/ju/
                                collectArr();
                            }
                        }
                    });

                    $('#'+el+'TB').on('blur,change',function(){
                        if($('#'+el+'H').val()=='') {
                            $('#'+el+'TB').val(''); // :: all 
                            if(subaksi=='out_come'){
                                var x = el.substring(22);
                                $('#out_come_sisaanggaran'+x+'H').val(''); // :: out_come
                                $('#out_come_detilanggaran'+x+'H').val(''); // :: out_come
                            } 
                        }
                    });
                return false;
            }
        });
    }
    //himpun array rekening terpilih
    function collectArr(){
        rekArr=[];
        detilanggaranArr=[];
        if($('#subaksiH').val()=='out_come'){ // outcome saja
            console.log('masuk anggaran ');
            $('.detilanggaran').each(function(id,item){
                detilanggaranArr.push($(this).val());
            });
            console.log(detilanggaranArr);
            return detilanggaranArr;
        }else{ // selain outcome (income,jurnal-umum)
            console.log('masuk income dll');
            $('.idrek').each(function(id,item){
                rekArr.push($(this).val());
            });
            console.log(rekArr);
            return rekArr;
        }
    }

    function validDelRek () {
        var ret={'status':true,'msg':null};
        if($('#subaksiH').val()=='ju' && $('.rekTR').length<=2){
            ret.status=false;
            ret.msg='minimal lengkapi kredit dan debit';
        }else if($('#subaksiH').val()!='ju'){
            if($('.rekTR').length<=1){
                ret.status=false;
                ret.msg='minimal isi 1 rekening';
            }else{
                rekTotNominal();
            }
        }return ret;
    }

// remove TR rekening
    function delRekTR (ke,idjurnal) {
        console.log(validDelRek());
        if(validDelRek().status==false){
            notif(validDelRek().msg,'red');
        }else{
            if(idjurnal!=null) idDelTR.push(idjurnal); //jika ada hapus (jurnal umum)
            $('#rekTR_'+ke).fadeOut('slow',function(){
                $('#rekTR_'+ke).remove();
                
                collectArr();
                console.log('arr terpilih in delrek=>'+rekArr);
            });
            // console.log(idDelTR);
        }
    }

//add TR rekening into an element 
    function addRekTR(typ,n,arr){
        $('#rekTBL').prepend(rekTR(typ,n,arr));
    }
    // function loadFR2(typx,id){
    //     $.Dialog({
    //         shadow: true,
    //         overlay: true,
    //         draggable: true,
    //         width: '100%',
    //         padding: 10,
    //         onShow: function(){
    //             $.Dialog.content(contentFR);
    //             var tr=tr3='';
    //         }
    //     });
    // }

// load form (all)
    function loadFR(typx,id){
        isClosedFR();
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '90%',
            padding: 10,
            onShow: function(){
                $.Dialog.content(contentFR);
                var tr=tr3='';
                setTimeout(function(){
                    $('#detjenistransH').val(typx);
                    if(typx=='ju'){ //ju
                        tr+='<tr style="color:white;"class="info">'
                                +'<th class="text-center">Jenis</th>'
                                +'<th class="text-center">Rek Perkiraan</th>'
                                +'<th class="text-center">Nominal</th>'
                                +'<th class="text-center">Hapus</th>'
                            +'</tr>';
                        $('.uraianDV').removeAttr('style');
                        $('#uraianTB').attr('required',true);
                        // $('#kwitansiCB').removeAttr('checked');
                        if(id==''){ // add 
                            kodeTrans(typx);
                            addRekTR(typx,2);
                            titl ='Tambah  Jurnal Umum ';
                        } else { //edit
                            titl ='Ubah Jurnal Umum';
                            var url  = dir;
                            var data = 'aksi=ambiledit&subaksi='+typx+'&replid='+id;
                            ajax(url,data).done(function (dt) {
                                $('#idformH').val(id);
                                $('#nomerTB').html(dt.transaksiArr.nomer);
                                $('#nomerH').val(dt.transaksiArr.nomer);
                                $('#nobuktiTB').val(dt.transaksiArr.nobukti);
                                $('#tanggalTB').val(dt.transaksiArr.tanggal);
                                $('#uraianTB').val(dt.transaksiArr.uraian);
                                var jurnal = dt.transaksiArr.jurnalArr;
                                var n = jurnal.length;
                                addRekTR(typx,n,jurnal);
                            });
                        }
                    }else{ // in_come / out_come
                        $('.uraianDV').attr('style','display:none;');
                        $('.rekkasDV').removeAttr('style');
                        $('#rekkasTB').attr('required',true);
                        autoSuggest('rekkas','rekkas','rek','');
                        $('#kwitansiDV').removeAttr('style');
                        
                        tr+='<tr style="color:white;"class="info">'
                            +(typx=='out_come'?'<th class="text-center">Detail Anggaran</th>':'')
                            +'<th class="text-center">Rekening</th>'
                            +'<th class="text-center">Nominal</th>'
                            +'<th class="text-center">Uraian</th>'
                            +'<th class="text-center">Hapus</th>'
                        +'</tr>';
                        tr3+='<tr style="color:white;"class="info">'
                                +'<th '+(typx=='out_come'?'colspan="2"':'')+'></th>'
                                +'<th id="totNominalTD" class="text-right">Rp. 0</th>'
                                +'<th colspan="2"></th>'
                            +'</tr>';
                        if(typx=='in_come'){ //income
                            $('#reklawanDV').html(' Pemasukan');
                            if(id=='') { // add
                                kodeTrans(typx);
                                addRekTR(typx,1);
                                titl='Tambah Transaksi Pemasukan';
                            }else{ //edit
                                $('#addTRBC').attr('style','display:none;');
                                titl ='Ubah Transaksi Pemasukan';
                                var url  = dir;
                                var data = 'aksi=ambiledit&subaksi='+typx+'&replid='+id;
                                ajax(url,data).done(function (dt) {
                                    $('#idformH').val(id);
                                    $('#nomerTB').html(dt.transaksiArr.nomer);
                                    $('#nobuktiTB').val(dt.transaksiArr.nobukti);
                                    $('#tanggalTB').val(dt.transaksiArr.tanggal);
                                    $('#rekkasTB').val(dt.transaksiArr.rekkas);
                                    $('#rekkasH').val(dt.transaksiArr.idrekkas);
                                    var income = dt.transaksiArr.income;
                                    addRekTR(typx,1,income);
                                });
                            }
                        }else if(typx=='out_come'){ // outcome 
                            $('.detilanggaranDV').attr('style','display:visible;');
                            $('#detilanggaranTB').attr('required',true);
                            $('#reklawanDV').html(' Pengeluaran');
                            var nobuktiCB='<div class="input-control radio default-style" data-role="input-control">'
                                            +'<label>'
                                                +'<input value="0" onchange="nobuktiFC();" id="nobuktiCB1" name="nobuktiCB" checked type="radio">'
                                                +'<span class="check"></span> no. Nota'
                                            +'</label>'
                                        +'</div>'
                                        +'<div class="input-control radio  default-style" data-role="input-control">'
                                            +'<label>'
                                                +'<input  value="1" onchange="nobuktiFC();" id="nobuktiCB2" name="nobuktiCB" type="radio">'
                                                +'<span class="check"></span> no. Invoice (supplier)'
                                            +'</label>'
                                        +'</div>';
                            $('#nobuktiDV').html(nobuktiCB);
                            autoSuggest('','detilanggaran','detilanggaran','');

                            if(id=='') { // add
                                kodeTrans(typx);
                                addRekTR(typx,1);
                                // console.log('mode add , typxe : '+typx);
                                titl='Tambah Transaksi Pengeluaran';
                            }else{ //edit
                                titl ='Ubah Transaksi Pengeluaran';
                                var url  = dir;
                                var data = 'aksi=ambiledit&subaksi='+typx+'&replid='+id;
                                ajax(url,data).done(function (dt) {
                                    $('#idformH').val(id);
                                    $('#nomerTB').html(dt.transaksiArr.nomer);
                                    $('#detilanggaranTB').val(dt.transaksiArr.detilanggaran);
                                    $('#detilanggaranV').val(dt.transaksiArr.sisaBilNum);
                                    $('#detilanggaranH').val(dt.transaksiArr.iddetilanggaran);
                                    $('#rekkasTB').val(dt.transaksiArr.rekkas);
                                    $('#nobuktiTB').val(dt.transaksiArr.nobukti);
                                    $('#tanggalTB').val(dt.transaksiArr.tanggal);
                                    var outcome= dt.transaksiArr.outcome;
                                    addRekTR(typx,1,outcome);
                                });
                            }
                        }
                    }
                    $('#rekTBL1').html(tr);
                    $('#rekTBL3').html(tr3);
                    $('#subaksiH').val(typx);

                    $('#addTRBC').attr('onclick','addRekTR(\''+typx+'\');');
                    $.Dialog.title('<i class="fg-white icon-'+(id!=''?'pencil':'plus-2')+'"></i> '+titl); 
                },200);
            }
        });
    }

    function nobuktiFC(){
        if($('#nobuktiCB2').prop('checked'))
            $('#nobuktiTB').attr('onfocus','autoSuggest(\'\',\'nobukti\',\'invoice\',\'\');');
        else
            $('#nobuktiTB').removeAttr('onfocus');
    }

    function isClosedFR () {
        if($('.window-overlay').length<=0) {
            iTR=1; // reset rekTR's counter
            idDelTR=[]; // reset rekTR's counter
            rekArr=[]; // reset rekArr's counter
            detilanggaranArr=[]; // reset rekArr's counter
        }
    }

// validasi form sebelum submit
    function validForm() {
        var status = true;
        var out={'status':null,'msg':[]};

        //jurnal umum
        if ($('#subaksiH').val() == 'ju') { 
            var nomDeb = nomKre = 0;
            var pilihDeb = pilihKre = false;
            
            //looping
            $('.ju_idTR').each(function () {
                var jenis = $('#ju_jenis' + $(this).val() + 'TB').val();
                var nominal = getCurr($('#ju_nominal' + $(this).val() + 'TB').val());
                // if (jenis == 'debit') {
                if (jenis == 'd') {
                    pilihDeb = true; // cek terpilih
                    nomDeb += nominal; // cek nominal 
                } else {
                    pilihKre = true;
                    nomKre += nominal;
                }
            });

            // cek : belum pilih jenis 
            if (!pilihDeb || !pilihKre) {
              if (!pilihDeb) out.msg.push('Anda belum memilih debit');
              if (!pilihKre) out.msg.push('Anda belum memilih kredit');
            }else{// cek nominal 
                if(nomDeb==0 || nomKre==0){// nominal harus diisi tdk boleh 0 (nol) 
                    var x = nomKre==0?'Kredit':'Debit';
                    out.msg.push('nominal '+x+' tidak boleh Rp. 0');
                }else if (nomDeb != nomKre) { // total nominal harus sama (jenis=kredit)
                  selisih = 'Rp. '+(Math.abs(nomKre - nomDeb)).setCurr();
                  if (nomKre > nomDeb) out.msg.push('Total kredit melebihi debit ' + selisih);
                  if (nomKre < nomDeb) out.msg.push('Total debit melebihi kredit ' + selisih);
                }
            }
            
            // cek status' valid
            if (out.msg.length==0) out.status=true;
            else out.status=false;
        }else{ // transaksi (in/out)
            if(getCurr($('#totNominalTD').html())==0) out.msg.push('nominal tidak boleh Rp. 0');

            if($('#subaksiH').val() == 'in_come') { // income
                out.status=true;
            }else{ // outcome
                var totRekItem   = getCurr($('#totNominalTD').html());
                var saldoKas     = getCurr($('#rekkassisaH').val());
                var selisihSaldo = saldoKas - totRekItem;
                if (selisihSaldo<0) {
                    out.msg.push('saldo kas kurang Rp. '+Math.abs(selisihSaldo).setCurr());
                }

                // $('.out_come_idTR').each(function(){
                //     var sisaAngggaran   = getCurr($('#out_come_sisaanggaran'+$(this).val()+'H').val());
                //     var nominalRek      = getCurr($('#out_come_nominal'+$(this).val()+'TB').val());
                //     var selisihAnggaran = sisaAngggaran - nominalRek;
                //     if(selisihAnggaran<0)
                //         out.msg.push('Anggaran '+$('#out_come_detilanggaran'+$(this).val()+'TB').val()+' kurang Rp. '+selisihAnggaran.setCurr());
                // });
                if (out.msg.length==0) out.status=true;
                else out.status=false;
            }
        }return out;
    }

    function validForm2(){
        $('.out_come_idTR').each(function(){
            var sisaAngggaran   = getCurr($('#out_come_sisaanggaran'+$(this).val()+'H').val());
            var nominalRek      = getCurr($('#out_come_nominal'+$(this).val()+'TB').val());
            var selisihAnggaran = sisaAngggaran - nominalRek;
            if(selisihAnggaran<0){
                $('#rekTR_'+$(this).val()).addClass('bg-red fg-white');
                $('#nominalInfo'+$(this).val()).html('melebihi anggaran Rp. '+Math.abs(selisihAnggaran).setCurr());
            }else{
                $('#rekTR_'+$(this).val()).removeClass('bg-red fg-white');
                $('#nominalInfo'+$(this).val()).html('');
            }
        });
    }
                // out.msg.push('Anggaran '+$('#out_come_detilanggaran'+$(this).val()+'TB').val()+' kurang Rp. '+selisihAnggaran.setCurr());

    function jenisTrans(){
        var url  = dir;
        var data = 'aksi=jenistrans';
        ajax(url,data).done(function (dt) {
            var out='';
            var counter=0;
            $.each(dt.jenisArr,function(id,item){
                out+='<li class="node">'
                        +'<a href="#"><span class="node-toggle"></span>'+item.jenistrans+'</a>'
                            +'<ul>'
                    $.each(item.detjenisArr, function (id,item) {
                        out+='<li style="padding-left:20px;">'
                                +'<label>'
                                    +'<input class="detjenisCB" onchange="loadAll();" name="detjenisTB['+item.iddetjenis+']" checked="checked" type="checkbox"> '
                                    // +'<input class="detjenisCB" onchange="viewTB(\'ju\')" name="detjenisTB['+item.iddetjenis+']" checked="checked" type="checkbox"> '
                                        +item.detjenistrans+''
                                +'</label>'
                            +'</li>';
                    }); out+='</ul>'
                    +'</li>';
            });$('#jenistransDV').html(out);
        });
    }

    function jenisAll() {
        if($('#jenisAllCB').prop('checked')){
            $('.detjenisCB').each(function(){
                $(this).prop('checked',true);
            });
        }else{
            $('.detjenisCB').each(function(){
                $(this).prop('checked',false);
            });
        }loadAll();
        // viewTB('ju');
    }

    // get total nominal rekening (ex : Rp. 500.000)
    function rekTotNominal () {
        var tot1=0;
        $('.rekNominal').each(function() {
            tot1+=getCurr($(this).val());
            validForm2();
        });$('#totNominalTD').html('Rp. '+tot1.setCurr());

    }

    // currency to number (ex : Rp. 500.000 -> 500000)
    function getCurr(n){  
        var x = Number(n.replace(/[^0-9\,]+/g,""));
        return x;
    }

    // number to currency (ex : 500000 -> 500.000)  
    Number.prototype.setCurr=function(){
        return this.toFixed(0).replace(/(\d)(?=(\d{3})+\b)/g,'$1.');
    }

// combo akun buku besar  ---
    function cmbbukubesar(){
        var url  = dir;
        var data = 'aksi=cmbbukubesar';
        ajax(url,data).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                out+='<option value="">-SEMUA-</option>';
                $.each(dt.bukubesar, function(id,item){
                    out+='<option value="'+item.replid+'"> ['+item.kode+'] '+item.nama+'</option>';
                });
            }
            $('#bb_detilrekeningS').html(out);
            viewTB('bb');
        });
    }

// combo departemen  ---
    function cmbdepartemen(el){
        var u = dir3;
        var d = 'aksi=cmb'+mnu3;
        ajax(u,d).done(function(dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.departemen, function(id,item){
                    out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                });
            }
            $('#'+el+'_departemenS').html('<option value="">-SEMUA-</option>'+out);
            cmbtahunajaran(el,'');
        });
    }

// combo tahunajaran ---
    function cmbtahunajaran(el,dep){
        var u = dir4;
        var d = 'aksi=cmb'+mnu4+(dep!=''?'&departemen='+dep:'');
        ajax(u,d).done(function(dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.tahunajaran.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.tahunajaran, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.tahunajaran+(item.aktif=='1'?' (aktif)':'')+'</option>';
                    });
                }
            }
            if(dep==''){
                $('#'+el+'_tahunajaranS').html('<option value="">-SEMUA-</option>');
                cmbtingkat(el,'');
                cmbthn('');
            }else{
                $('#'+el+'_tahunajaranS').html('<option value="">-SEMUA-</option>'+out);
                cmbtingkat(el,'');
                cmbthn('');
                // cmbthn(dt.tahunajaran[0].replid);
            }
        });
    }
//end of combo tahunajaran ----

// combo tingkat ---
    function cmbtingkat(el,thn){
        u =dir5;
        d ='aksi=cmb'+mnu5+(thn!=''?'&tahunajaran='+thn:'');
        ajax(u,d).done(function(dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.tingkat.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.tingkat, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.keterangan+' ('+item.tingkat+') </option>';
                    });
                }
            }
            if(thn==''){
                $('#'+el+'_tingkatS').html('<option value="">-SEMUA-</option>');
                // viewTB(el);
            }else{
                $('#'+el+'_tingkatS').html('<option value="">-SEMUA-</option>'+out);
                // viewTB(el);
            }
        });
    }
//end of combo tingkat ----

    function cmbthn(thn){
        console.log('t cmthn dr thn ajaran ='+thn);
        u = dir4;
        d ='aksi=cmb'+mnu4+(thn!=''?'&replid='+thn:'');
        ajax(u,d).done(function(dt){
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                var opt='';
                th1 = parseInt(dt.tahunajaran[0].tglmulai.substr(0,4));
                th2 = parseInt(dt.tahunajaran[0].tglakhir.substr(0,4));
                if(thn!=''){ // tahu ajaran terpilih 
                    opt+='<option value="">-Full-</option>'
                        +'<option value="'+th1+'">'+th1+'</option>'
                        +'<option value="'+th2+'">'+th2+'</option>';
                }else{// tahun ajaran kosong
                    opt+='<option value="">-Full-</option>';
                }$('#li_tahunS').html(opt);
                cmbbln(thn,'');
            }
        });
    }

    function cmbbln(t,thn){
        console.log('t = '+t);
        u = dir4;
        d ='aksi=cmb'+mnu4+(t!=''?'&replid='+t:'');
        ajax(u,d).done(function(dt){
            var opt='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                if(t==''){ // tahun ajaran kosong
                    opt+='<option value="">-Full-</option>';
                }else{ // tahun ajaran terpilih
                    if(thn==''){ // tahun kosong
                        opt+='<option value="">-Full-</option>';
                    }else{ // tahun terpilih 
                        var arr=new Array();
                            arr=dt.tahunajaran[0];
                            console.log(dt.tahunajaran);
                        var b1 =parseInt(arr.tglmulai.substr(5,2)); // bulan @tahun awal 
                        var b2 =parseInt(arr.tglakhir.substr(5,2)); // bulan @tahun akhir
                        var t1 =parseInt(arr.tglmulai.substr(0,4)); // tahun @tahun awal 
                        var bln =['Jan','Feb','Mar','Apr','Mei','Jun','Jul','Agu','Sep','Okt','Nov','Des'];
                        
                        opt+='<option value="">-Full-</option>';
                        $.each(bln, function(id,item){
                            disx='';
                            if(thn==t1){ // tahun awal ex : 2014
                                if((id+1)<b1) disx = 'disabled'; // 1,2,3,4,5(disabled) | 6,7,8,9,10,11,12(enabled)
                            }else{ //tahun akhir ex : 2015
                                if((id+1)>b2) disx = 'disabled'; // 8,9,10,11,12(disabled) | 1,2,3,4,5,6,7(enabled)
                            }opt+='<option '+disx+' value="'+(parseInt(id)+1)+'">'+item+'</option>';
                        });
                    }
                }$('#li_bulanS').html(opt);
                viewTB('li');
            }
        });
    }

