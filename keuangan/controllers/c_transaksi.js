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
                        +'<input id="ju_idformH" type="hidden">' 
                        +'<input id="subaksiH" type="text">' 

                        // nomer transaksi
                        +'<label>No. Jurnal : <b id="ju_nomerTB"></b></label>'
                        
                        // no bukti (nota)
                        +'<label>No. Bukti </label>'
                        +'<div class="input-control size4 text">'
                            +'<input placeholder="no bukti" name="ju_nobuktiTB" id="ju_nobuktiTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        // tanggal transaksi
                        +'<label>Tanggal</label>'
                        +'<div class="input-control text span2" data-role="datepicker" data-format="dd mmmm yyyy" data-position="bottom" data-effect="slide">'
                            +'<input required type="text" id="ju_tanggalTB" name="ju_tanggalTB">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        // uraian transaksi
                        +'<label>Uraian</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea required placeholder="uraian" name="ju_uraianTB" id="ju_uraianTB"></textarea>'
                        +'</div>'

                        // rekening perkiraan 
                        +'<legend >Rekening :' 
                            +'<a id="addTRBC" href="#" class="button bg-blue fg-white">'
                                +'<i class="icon-plus-2"></i>'
                            +'</a>'
                        +'</legend>'
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">Jenis</th>'
                                    +'<th class="text-center">Rek Perkiraan</th>'
                                    +'<th class="text-center">Nominal</th>'
                                    +'<th class="text-center">Hapus</th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="rekTBL">'
                            +'</tbody>'
                            +'<tfoot id="legendDet">'
                            +'</tfoot>'
                        +'</table>'

                        +'<div class="form-actions">' 
                            +'<button hint="Tambah Rekening" class="button primary"><i class="icon-floppy"></i> simpan</button>'
                        +'</div>'
                  +'</form>';

    // button action
        //print ---
        $('#ju_cetakBC').on('click',function(){
            printPDF('jurnal');
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
        // default tampilkan jurnal umum 
        viewTB('ju');
        viewTB('ns');
        viewTB('bb');
        viewTB('nl');
        viewTB('lr');
        // juVW();
    }); 
// end of main function ---------

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
                $('#'+typ+'_nomerTB').html(dt.kode);
                $('#'+typ+'_tanggalTB').val(getToday());
            } 
        });
    }

/*save (insert & update)*/
    // subaksi : ju , in, out
    function transSV(e){
        var url  = dir;
        var data = $(e).serialize()+'&aksi=simpan&subaksi='+$('#subaksiH').val();
        if(validForm().status[0]!=true){ // tidak valid
            var m = '';
            $.each(validForm().msg,function(id,item){
                m+='<span class="fg-white"><i class="icon-warning"></i> '+item+'</span><br />';
            });notif(m,'red');
        }else{ // valid 
            ajax(url,data).done(function(dt){
                notif(dt.status,dt.status!='sukses'?'red':'green');
            });
        }
    }

/*delete*/
    //jurnal umum   ---
        function juDel(id){
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
    

//create TR rekening by increment
    /*var iTR=3;
    function rekTRxx(n){
        var ret ='';
        if(n!=0){
            for (var i = 1; i <= n; i++) {
                ret+='<tr class="rekTR" id="rekTR_'+i+'">'
                        +'<td>'
                            +'<input id="ju_rek'+i+'H" name="ju_rek'+i+'H[]" type="hidden" />'
                            +'<span class="input-control text"><input id="ju_rek'+i+'TB" name="ju_rek'+i+'TB[]" placeholder="rekening" type="text" /><button class="btn-clear"></button></span>'
                        +'</td>'
                        +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_debet'+i+'TB[]" type="text" placeholder="nominal debet"/></td>'
                        +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_kredit'+i+'TB[]" type="text"  placeholder="nominal kredit"/></td>'
                        +'<td><a href="#" onclick="delRekTR('+i+');" class="button"><i class="icon-cancel-2"></i></a></td>'
                    +'</tr>';
            }
        }else{
            ret+='<tr class="rekTR" id="rekTR_'+iTR+'">'
                    +'<td>'
                        +'<input id="ju_rek'+iTR+'H" name="ju_rek'+iTR+'H[]" type="hidden" />'
                        +'<span class="input-control text"><input id="ju_rek'+iTR+'TB" name="ju_rek'+iTR+'TB[]" placeholder="rekening" type="text" /><button class="btn-clear"></button></span>'
                    +'</td>'
                    +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_debet'+iTR+'TB[]" type="text" placeholder="nominal debet"/></td>'
                    +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_kredit'+iTR+'TB[]" type="text"  placeholder="nominal kredit"/></td>'
                    +'<td><a href="#" onclick="delRekTR('+iTR+');" class="button"><i class="icon-cancel-2"></i></a></td>'
                +'</tr>';
            iTR++;
        }
        return ret;
    }*/


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
        });var x  = $('#id_loginS').val();
        var token = encode64(x+tok);
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
    function jenisRekGanti(i){
        if ($('#ju_jenis'+i+'TB').val()=='') {  // jika jenis tdk dipilih
            $('#ju_rek'+i+'TB').attr('disabled',true);
            $('#ju_nominal'+i+'TB').attr('disabled',true);
        }else{ // jika jenis (kredit/debit)
            $('#ju_rek'+i+'TB').focus();
            $('#ju_rek'+i+'TB').removeAttr('disabled');
            $('#ju_nominal'+i+'TB').removeAttr('disabled');
            $('#ju_rek'+i+'TB').attr('onclick','autoSuggest(\''+$('#ju_jenis'+i+'TB').val()+'\',\'ju\','+i+');');
            $('#ju_rek'+i+'TB').attr('onfocus','autoSuggest(\''+$('#ju_jenis'+i+'TB').val()+'\',\'ju\','+i+');');
        }
        $('#ju_rek'+i+'H').val('');
        $('#ju_rek'+i+'TB').val('');
        $('#ju_nominal'+i+'TB').val('');
    }

// record rekening perkiraan
    var i = 1;
    function rekTR (typ,n) {
        // alert(typ+','+n);return false;
        var tr='';
        var isLoop=true;
        if(typ=='ju'){ // jurnal umum
            if(typeof n=='undefined'){ 
                isLoop=false; n=i;// alert(n+','+i);
            }
            for(var ke=n; ke>=i; ke--){
                tr+='<tr class="rekTR" id="rekTR_'+ke+'">'
                        // jenis rek
                        +'<td align="center">'
                            +'<input type="hidden" class="ju_idTR" value="'+ke+'" id="ju_idTR_'+ke+'">'
                            +'<div class="input-control select">'
                                +'<select required onchange="jenisRekGanti('+ke+');" id="ju_jenis'+ke+'TB" name="ju_jenis'+ke+'TB">'
                                    +'<option value="">..pilih..</option>'
                                    +'<option value="debit">Debit</option>'
                                    +'<option value="kredit">Kredit</option>'
                                + '</select>'
                            +'</div>'
                        +'</td>'
                        // rek
                        +'<td align="center">'
                            +'<span class="input-control text">'
                                +'<input class="span1" id="ju_rek'+ke+'H" name="ju_rek'+ke+'H" type="hidden" />'
                                +'<input required disabled id="ju_rek'+ke+'TB" name="ju_rek'+ke+'TB" placeholder="rekening" type="text" />'
                                +'<button class="btn-clear"></button>'
                            +'</span>'
                        +'</td>'
                        // nominal
                        +'<td align="center">'
                            +'<div class="input-control text">'
                                +'<input class="text-right" disabled required name="ju_nominal'+ke+'TB"  id="ju_nominal'+ke+'TB" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);"  placeholder="nominal"/>'
                            +'</div>'
                        +'</td>'
                        // hapus
                        +'<td align="center">'
                            +'<a href="#" onclick="delRekTR('+ke+');" class="button"><i class="icon-cancel-2"></i></a>'
                        +'</td>'
                    +'</tr>';
            }
        }else{ // pemasukkan / pengeluaran

        }
    
        if(isLoop) i+=n;
        else i++;
        return tr; 
    }

  // autosuggest
    function autoSuggest(jenis,pre,i){
        $('#'+pre+'_rek'+i+'TB').combogrid({
            debug:true,
            width:'400px',
            colModel: [{
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
            }],url: dir+'?aksi=autocomp&jenis='+jenis,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+pre+'_rek'+i+'H').val(ui.item.replid);
                $('#'+pre+'_rek'+i+'TB').val(ui.item.nama+' ('+ui.item.kode+')');

                // validasi input (tidak sesuai data dr server)
                    $('#'+pre+'_rek'+i+'TB').on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+pre+'_rek'+i+'H').val()!=''){
                                $('#'+pre+'_rek'+i+'H').val('');
                                $('#'+pre+'_rek'+i+'TB').val('');
                            }
                        }
                    });
                return false;
            }
        });
    }

// remove TR rekening
    function delRekTR (e) {
        if(($('.rekTR').length)<=2){
            notif('minimal lengkapi kredit dan debit','red');
        }else{
            $('#rekTR_'+e).fadeOut('slow',function(){
                $('#rekTR_'+e).remove();
            });
        }
    }

//add TR rekening into an element 
    function addRekTR(typ,n){
        $('#rekTBL').prepend(rekTR(typ,n));
    }

// load form (all)
    function loadFR(typ,id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 600,
            padding: 10,
            onShow: function(){
                kodeTrans(typ);
                if(typ=='ju'){ // jurnal umum
                    if(id!='') titl ='Ubah Jurnal Umum';
                    else titl ='Tambah  Jurnal Umum ';
                }else if(typ=='in'){ // transaksi pemasukkan
                    if(id!='') titl ='Ubah Transaksi Pemasukkan';
                    else titl ='Tambah Transaksi Pemasukkan';
                }else{ // transaksi pengeluaran
                    if(id!='') titl ='Ubah Transaksi Pengeluaran';
                    else titl ='Tambah Transaksi Pengeluaran';
                }
                setTimeout(function(){
                    $('#subaksiH').val(typ);
                    $('#addTRBC').attr('onclick','addRekTR(\''+typ+'\');');
                    addRekTR(typ,2);
                },1000);
                $.Dialog.content(contentFR);
                $.Dialog.title('<i class="fg-white icon-'+(id!=''?'pencil':'plus-2')+'"></i> '+titl); 
            }
        });
    }

    function validForm() {
        var status = true;
        var out={'status':[],'msg':[]};
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
            
            // cek pilih 
            if (!pilihDeb || !pilihKre) {
              if (!pilihDeb) out.msg.push('Anda belum memilih debit');
              if (!pilihKre) out.msg.push('Anda belum memilih kredit');
            }
            
            // cek jumlah
            if (nomDeb != nomKre) {
              selisih = 'Rp. '+(Math.abs(nomKre - nomDeb)).setCurr();
              if (nomKre > nomDeb) out.msg.push('Total kredit melebihi debit ' + selisih);
              if (nomKre < nomDeb) out.msg.push('Total debit melebihi kredit ' + selisih);
            }
            
            // cek status' valid
            if (out.msg.length==0) out.status.push(true);
            else out.status.push(false);
        }return out;
    }
    Number.prototype.setCurr=function(){
        return this.toFixed(0).replace(/(\d)(?=(\d{3})+\b)/g,'$1.');
    }

    function getCurr(n){
        var x = n.replace('Rp. ','');
        var y = x.replace('.','');
        return parseInt(y.replace(',',''));
    }




/*function formatDollar(num) {
    var p = num.toFixed(0).split(".");
    var chars = p[0].split("").reverse();
    var newstr = '';
    var count = 0;
    for (x in chars) {
        count++;
        if(count%3 == 1 && count != 1) {
            newstr = chars[x] + ',' + newstr;
        } else {
            newstr = chars[x] + newstr;
        }
    }
    return 'Rp '.newstr + "." + p[1];
}
*/