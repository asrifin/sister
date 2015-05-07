var mnu  ='transaksi'; 
var mnu2 ='lokasi'; 

var dir  ='models/m_'+mnu+'.php';
var dir2 ='models/m_'+mnu2+'.php';

var contentFR ='';
// main function load first 
    $(document).ready(function(){
        $('#optionBC').on('click',function(){
            $('#optionPN').toggle('slow');
        });
        $('#hari_iniBC').on('click',function(){
            $('#tgl1TB,#tgl2TB').val(getToday());
        });
        $('#bulan_iniBC').on('click',function(){
            $('#tgl1TB').val(getFirstDate());
            $('#tgl2TB').val(getLastDate());
        });
    //form content
        contentFR +='<form style="overflow:scroll;height:700px;" autocomplete="off" onsubmit="transSV(this); return false;">'
                        // hidden input
                        +'<input name="idformH" id="idformH" type="hidden">' 
                        +'<input name="detjenistransH" id="detjenistransH" type="hidden">' 
                        +'<input name="subaksiH" id="subaksiH" type="hidden">' 

                        +'<legend><b>Keterangan Transaksi</b>'
                            +'<button hint="Tambah Rekening" class="place-right button primary"><i class="icon-floppy"></i> simpan</button>'
                        +'</legend>'
                        // nomer transaksi
                        +'<h5 class="place-right fg-green" style="font-weight:bold;" id="nomerTB"></h5>'
                        
                        // no bukti (nota)
                        +'<label>No. Bukti </label>'
                        +'<div class="input-control text">'
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

                        // rekening kas (optional)
                        +'<label style="display:none;" class="rekkasDV">Rekening Kas/Bank</label>'
                        +'<div style="display:none;" class="input-control text rekkasDV">'
                            +'<input type="hidden" name="rekkasH" id="rekkasH">'
                            +'<input placeholder="rek. kas / bank" name="rekkasTB" id="rekkasTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // anggaran (optional:income & outcome)
                        +'<label style="display:none;" class="detilanggaranDV">Anggaran </label>'
                        +'<div style="display:none;" class="input-control text detilanggaranDV">'
                            +'<input type="hidden" name="detilanggaranV" id="detilanggaranV">'
                            +'<input type="hidden" name="detilanggaranH" id="detilanggaranH">'
                            +'<input placeholder="pada anggaran" name="detilanggaranTB" id="detilanggaranTB">'
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

    // button action
        //print ---
        $('#ju_cetakBC').on('click',function(){
            printPDF('ju');
        });
        $('#ns_cetakBC').on('click',function(){
            printPDF('neracasaldo');
        });
        //search button
        $('#juBC').on('click',function(){
            $('#juTR').toggle('slow');
            $('#ju_noS').val('');
            $('#ju_uraianS').val('');
        });
        //search ---
        $('#ju_noS,#ju_uraianS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) //juVW();
            viewTB('ju');
        });

        // set default this month
        $('#tgl1TB').val(getFirstDate());
        $('#tgl2TB').val(getLastDate());
        // jurnal umum :: tampilkan detail jurnal
        $('#ju_detiljurnalCB').on('click',function(){
            $('.uraianCOL').toggle();
        });
        
        jenisTrans();
        loadAll();
        // default tampilkan jurnal umum 
        // viewTB('ju');
        // viewTB('ns');
        // viewTB('bb');
        // viewTB('nl');
        // viewTB('lr');
    }); 
// end of main function ---------

     function loadAll(){
        viewTB('ju');
        viewTB('ns');
        viewTB('bb');
        viewTB('nl');
        viewTB('lr');
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

        if(subaksi=='ju'){
            var opt = $('form#optionPN').serialize();
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
            var v = $(this).val();
            cari+='&'+p+'='+v;
        });

        if(subaksi=='ju'){
            var opt = $('form#optionPN').serialize();
            cari+='&'+opt;
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

// generate kode transaksi form (jurnal umum/income/outcome) : syncronous
    function kodeTrans(typ){
        var url  = dir;
        var data = 'aksi=codeGen&subaksi='+typ;
        ajax(url,data).done(function (dt) {
            if(dt.status!='sukses') ret=dt.status;
            else {
                $('#nomerTB').html(dt.kode);
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
        if($('#subaksiH').val()=='ju') data+=+'&idDelTR='+idDelTR;
        if(validForm().status!=true){ // tidak valid
            var m = '';
            $.each(validForm().msg,function(id,item){
                m+='<span class="fg-white"><i class="icon-warning"></i> '+item+'</span><br />';
            });notif(m,'red');
        }else{ // valid 
            console.log('ok');
            ajax(url,data).done(function(dt){
                notif(dt.status,dt.status!='sukses'?'red':'green');
                if(dt.status=='sukses'){
                    $.Dialog.close();
                    $('#rekTBL').html('');
                    viewTB('ju');
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

//end of  print to PDF -------
    function printPDF(mn){
        var par='',tok='',p,v;
        $('.'+mn+'_cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });

        if(mn=='ju'){
            var opt = $('form#optionPN').serialize();
            par+='&jenisAllCB='+$('#jenisAllCB').val();
            tok+=$('#jenisAllCB').val();
            $('.detjenisCB').each(function(id,item){
                if($(this).is(':checked')){
                    par+='&'+$(this).attr('name')+'='+$(this).val();
                    tok+=$(this).val();
                } 
            });
            par+='&tgl1TB='+$('#tgl1TB').val()+'&tgl2TB='+$('#tgl2TB').val();
            tok+=$('#tgl1TB').val()+$('#tgl2TB').val();
        }

        // return false;
        var x  = $('#id_loginS').val();
        // alert(x+tok);
        var token = encode64(x+tok);
        console.log('val ='+x+tok);
        console.log('par ='+par);
        console.log('token ='+token);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
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
                $('#'+typ+'_rek'+i+'TB').attr('onclick','autoSuggest(\''+$('#'+typ+'_jenis'+i+'TB').val()+'\',\''+typ+'_rek'+i+'\',\'rek\',\'\');');
                $('#'+typ+'_rek'+i+'TB').attr('onfocus','autoSuggest(\''+$('#'+typ+'_jenis'+i+'TB').val()+'\',\''+typ+'_rek'+i+'\',\'rek\',\'\');');
            }
        // }else{ // in / out 
        //     $('#'+typ+'_rek'+i+'TB').attr('onclick','autoSuggest(\'debit\',\''+typ+'\','+i+');');
        //     $('#'+typ+'_rek'+i+'TB').attr('onfocus','autoSuggest(\'debit\',\''+typ+'\','+i+');');
        // }
        $('#'+typ+'_rek'+i+'H').val('');
        $('#'+typ+'_rek'+i+'TB').val('');
        $('#'+typ+'_nominal'+i+'TB').val('');
    }

// record rekening perkiraan
    var iTR = 1;    
    var idDelTR = [];
    var idAddTR = [];

    function rekTR (typ,n,arr) {
        console.log(arr);
        var tr='';
        var isLoop=true;
        if(typ=='ju'){ // jurnal umum
            if(typeof n=='undefined'){ isLoop=false; n=iTR;}

            for(var ke=n; ke>=iTR; ke--){
                var idjurnal = (typeof arr!='undefined')?arr[ke-1].idjurnal:null;
                var idrek    = (typeof arr!='undefined')?arr[ke-1].idrek:'';
                var rek      = (typeof arr!='undefined')?arr[ke-1].rek:'';
                var nominal  = (typeof arr!='undefined')?arr[ke-1].nominal:'';
                var jenis    = (typeof arr!='undefined')?arr[ke-1].jenis:'';
                
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
                                    +'<option '+(typeof arr=='undefined'?'':(jenis=='debit'?'selected':''))+' value="debit">Debit</option>'
                                    +'<option '+(typeof arr=='undefined'?'':(jenis=='kredit'?'selected':''))+' value="kredit">Kredit</option>'
                                + '</select>'
                            +'</div>' 
                        +'</td>'
                        // rek
                        +'<td align="center">'
                            +'<span class="input-control size5 text">'
                                +'<input value="'+idrek+'" id="ju_rek'+ke+'H" name="ju_rek'+ke+'H" type="hidden" />'
                                +'<input value="'+rek+'" required '+(typeof arr=='undefined'?'disabled':' onfocus="autoSuggest(\''+jenis+'\',\'ju\','+ke+',\'rek\',\'\');"')+' id="ju_rek'+ke+'TB" name="ju_rek'+ke+'TB" placeholder="rekening" type="text" />'
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
                            +'<a href="#" onclick="'+(typeof arr!='undefined'?'if(confirm(\'melanjutkan untuk menghapus data?\')) delRekTR('+ke+','+idjurnal+');':'delRekTR('+ke+','+idjurnal+')')+'"  class="button"><i class="icon-cancel-2"></i></a>'
                        +'</td>'
                    +'</tr>';
            }
        }else{ // pemasukkan / pengeluaran
            if(typeof n=='undefined'){ isLoop=false; n=iTR;}

            jrek=typ=='out_come'?'kredit':'debit'; // jenis rekening (income:debit, outcome:kredit)
            for(var ke=n; ke>=iTR; ke--){
                var idjurnal = (typeof arr!='undefined')?arr[ke-1].idjurnal:null;
                var idrek    = (typeof arr!='undefined')?arr[ke-1].idrek:'';
                var rek      = (typeof arr!='undefined')?arr[ke-1].rek:'';
                var nominal  = (typeof arr!='undefined')?arr[ke-1].nominal:'Rp. 0';
                var uraian   = (typeof arr!='undefined')?arr[ke-1].uraian:'';
                
                var mode     = (typeof arr!='undefined')?'edit':'add'; 
                
                tr+='<tr class="rekTR" id="rekTR_'+ke+'">'
                        // rek
                        +'<td align="center">'
                            +'<input type="hidden" name="'+typ+'mode'+ke+'H" value="'+mode+'" />'
                            +'<input type="hidden" value="'+idjurnal+'" name="'+typ+'_idjurnal'+ke+'H" id="'+typ+'_idjurnal'+ke+'H">'
                            +'<input type="hidden" class="'+typ+'_idTR" value="'+ke+'" name="'+typ+'_idTR[]" id="'+typ+'_idTR_'+ke+'">'
                            +'<span class="input-control size5 text">'
                                +'<input value="'+idrek+'" id="'+typ+'_rek'+ke+'H" name="'+typ+'_rek'+ke+'H" type="hidden" />'
                                +'<input value="'+rek+'" required  onfocus="autoSuggest(\''+jrek+'\',\''+typ+'_rek'+ke+'\',\'rek\',\'\');" onclick="autoSuggest(\''+jrek+'\',\''+typ+'_rek'+ke+'\',\'rek\',\'\')" id="'+typ+'_rek'+ke+'TB" name="'+typ+'_rek'+ke+'TB" placeholder="rekening" type="text" />'
                                +'<button class="btn-clear"></button>'
                            +'</span>'
                        +'</td>'
                        // nominal
                        +'<td>'
                            +'<div class="input-control text">'
                                +'<input onkeyup="rekTotNominal();" class="text-right rekNominal" value="'+nominal+'" required name="'+typ+'_nominal'+ke+'TB"  id="'+typ+'_nominal'+ke+'TB" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);"  placeholder="nominal"/>'
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
            var urlx= '?aksi=autocomp&subaksi='+subaksi+'&jenis='+jenis;
            var col = [{
                    'align':'left',
                    'columnName':'kode',
                    'hide':true,
                    'width':'20',
                    'label':'Kode'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'60',
                    'label':'Rekening'
            }];
        }else{ // anggaran 
            var urlx= '?aksi=autocomp&subaksi='+subaksi+'&tingkat='+tingkat;
            var col =[{
                    'align':'left',
                    'columnName':'nama',
                    'hide':true,
                    'width':'40',
                    'label':'Anggaran'
            },{   
                    'align':'left',
                    'columnName':'kategorianggaran',
                    'width':'20',
                    'label':'Kategori'
            },{   
                    'align':'right',
                    'columnName':'sisaBilCur',
                    'width':'20',
                    'label':'Sisa'
            },{   
                    'align':'right',
                    'columnName':'kuotaBilCur',
                    'width':'20',
                    'label':'Nominal'
            }];
        }
        $('#'+el+'TB').combogrid({
            debug:true,
            width:'700px',
            colModel: col ,
            url: dir+urlx,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                if (subaksi=='rek') { // rekening 
                    $('#'+el+'TB').val(ui.item.nama+' ( '+ui.item.kode+' )');
                }else{ // anggaran 
                    $('#'+el+'TB').val(ui.item.nama+' [ sisa :'+ui.item.sisaBilCur+'  kuota : '+ui.item.kuotaBilCur+' ]');
                    $('#detilanggaranV').val(getCurr(ui.item.sisaBilNum));
                }

                // validasi input (tidak sesuai data dr server)
                    $('#'+el+'TB').on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+el+'H').val()!=''){
                                $('#'+el+'H').val('');
                                $('#'+el+'TB').val('');
                                if(subaksi=='out_come') $('#detilanggaranV').val(''); // :: out_come
                            }
                        }
                    });
                    $('#'+el+'TB').on('blur,change',function(){
                        if($('#'+el+'H').val()=='') {
                            $('#'+el+'TB').val(''); // :: all 
                            if(subaksi=='out_come') $('#detilanggaranV').val(''); // :: out_come
                        }
                    });
                return false;
            }
        });
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
                alert('okokok');
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
            if(idjurnal!=null) idDelTR.push(idjurnal); //jika ada hapu jurnal 
            $('#rekTR_'+ke).fadeOut('slow',function(){
                $('#rekTR_'+ke).remove();
            });
        }
    }

//add TR rekening into an element 
    function addRekTR(typ,n,arr){
        $('#rekTBL').prepend(rekTR(typ,n,arr));
    }

// load form (all)
    function loadFR(typx,id){
        isClosedFR();
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 800,
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
                        if(id==''){ // add 
                            kodeTrans(typx);
                            addRekTR(typx,2);
                            titl ='Tambah  Jurnal Umum ';
                        }else { //edit
                            titl ='Ubah Jurnal Umum';
                            var url  = dir;
                            var data = 'aksi=ambiledit&subaksi='+typx+'&replid='+id;
                            ajax(url,data).done(function (dt) {
                                $('#idformH').val(id);
                                $('#nomerTB').html(dt.transaksiArr.nomer);
                                $('#nobuktiTB').val(dt.transaksiArr.nobukti);
                                $('#tanggalTB').val(dt.transaksiArr.tanggal);
                                $('#uraianTB').val(dt.transaksiArr.uraian);
                                var jurnal = dt.transaksiArr.jurnalArr;
                                // console.log(jurnal);
                                addRekTR(typx,jurnal.length,jurnal);
                            });
                        }
                    }else{ // in_come / out_come
                        $('.uraianDV').attr('style','display:none;');
                        $('.rekkasDV').removeAttr('style');
                        $('#rekkasTB').attr('required',true);
                        autoSuggest('debit','rekkas','rek','');
                        
                        tr+='<tr style="color:white;"class="info">'
                                +'<th class="text-center">Rekening</th>'
                                +'<th class="text-center">Nominal</th>'
                                +'<th class="text-center">Uraian</th>'
                                +'<th class="text-center">Hapus</th>'
                            +'</tr>';
                        tr3+='<tr style="color:white;"class="info">'
                                +'<th></th>'
                                +'<th id="totNominalTD" class="text-right">Rp. 0</th>'
                                +'<th colspan="2"></th>'
                            +'</tr>';
                        if(typx=='in_come'){ //income
                            $('#reklawanDV').html(' Pemasukkan');
                            if(id=='') { // add
                                kodeTrans(typx);
                                addRekTR(typx,1);
                                titl='Tambah Transaksi Pemasukkan';
                            }else{ //edit
                                titl ='Ubah Transaksi Pemasukkan';
                                var url  = dir;
                                var data = 'aksi=ambiledit&subaksi='+typx+'&replid='+id;
                                ajax(url,data).done(function (dt) {
                                    $('#idformH').val(id);
                                    $('#nomerTB').html(dt.transaksiArr.nomer);
                                    $('#nobuktiTB').val(dt.transaksiArr.nobukti);
                                    $('#tanggalTB').val(dt.transaksiArr.tanggal);
                                    var income = dt.transaksiArr.incomeArr;
                                    addRekTR(typx,income.length,income);
                                });
                            }
                        }else if(typx=='out_come'){ // outcome 
                            console.log('masuk '+typx);
                            $('.detilanggaranDV').attr('style','display:visible;');
                            $('#detilanggaranTB').attr('required',true);
                            $('#reklawanDV').html(' Pengeluaran');

                            if(id=='') { // add
                                autoSuggest('','detilanggaran','detilanggaran','');
                                kodeTrans(typx);
                                addRekTR(typx,1);
                                console.log('mode add , typxe : '+typx);
                                titl='Tambah Transaksi Pengeluaran';
                            }else{ //edit
                                titl ='Ubah Transaksi Pengeluaran';
                                var url  = dir;
                                var data = 'aksi=ambiledit&subaksi='+typx+'&replid='+id;
                                ajax(url,data).done(function (dt) {
                                    $('#idformH').val(id);
                                    $('#nomerTB').html(dt.transaksiArr.nomer);
                                    $('#nobuktiTB').val(dt.transaksiArr.nobukti);
                                    $('#tanggalTB').val(dt.transaksiArr.tanggal);
                                    var income = dt.transaksiArr.incomeArr;
                                    addRekTR(typx,income.length,income);
                                });
                            }
                        }
                    }
                    $('#rekTBL1').html(tr);
                    $('#rekTBL3').html(tr3);
                    $('#subaksiH').val(typx);

                    // $('#totNominalTD').html('Rp. '+totNominal);
                    $('#addTRBC').attr('onclick','addRekTR(\''+typx+'\');');
                    // addRekTR(typ,2);
                    $.Dialog.title('<i class="fg-white icon-'+(id!=''?'pencil':'plus-2')+'"></i> '+titl); 
                },200);
            }
        });

    }

    function isClosedFR () {
        if($('.window-overlay').length<=0) {
            iTR=1; // reset rekTR's counter
            idDelTR=[]; // reset rekTR's counter
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
                if (jenis == 'debit') {
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
                var tot=getCurr($('#totNominalTD').html());
                var sisa=$('#detilanggaranV').val();
                if(tot>sisa) out.msg.push('melebihi sisa anggaran');
                console.log('sisa'+sisa);
                console.log('tot'+tot);
                
                if (out.msg.length==0) out.status=true;
                else out.status=false;
            }
        }return out;
    }

    function jenisTrans(){
        var url  = dir;
        var data = 'aksi=jenistrans';
        ajax(url,data).done(function (dt) {
            var out='';
            $.each(dt.jenisArr,function(id,item){
                out+='<li class="node">'
                        +'<a href="#"><span class="node-toggle"></span>'+item.jenistrans+'</a>'
                            +'<ul>'
                    $.each(item.detjenisArr, function (id,item) {
                        out+='<li style="padding-left:20px;">'
                                +'<label>'
                                    +'<input class="detjenisCB" onchange="viewTB(\'ju\')" name="detjenisTB['+item.iddetjenis+']" checked="checked" type="checkbox"> '
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
        }viewTB('ju');
    }

    // get total nominal rekening (ex : Rp. 500.000)
    function rekTotNominal () {
        var tot1=0;
        $('.rekNominal').each(function() {
            tot1+=getCurr($(this).val());
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
