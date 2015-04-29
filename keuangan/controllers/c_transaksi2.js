
var mnu       ='transaksi'; 
var mnu2      ='lokasi'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';

var ju_contentFR = k_contentFR = b_contentFR ='';
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
        ju_contentFR +='<form id="ju" style="overflow:scroll;height:600px;" autocomplete="off" onsubmit="transSV(this); return false;">'
                        +'<input id="ju_idformH" type="hidden">' 

                        +'<label>No. Jurnal</label>'
                        +'<div class="input-control size4 text">'
                            +'<input readonly name="ju_nomerTB" id="ju_nomerTB" >'
                        +'</div>'
                        
                        +'<label>No. Bukti </label>'
                        +'<div class="input-control size4 text">'
                            +'<input placeholder="no bukti" name="ju_nobuktiTB" id="ju_nobuktiTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Tanggal</label>'
                        +'<div class="input-control text span2" data-role="datepicker" data-format="dd mmmm yyyy" data-position="bottom" data-effect="slide">'
                            +'<input required type="text" id="ju_tanggalTB" name="ju_tanggalTB">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        +'<div input-control checkbox" >'
                            +'<label>'
                                // +'<input onclick="$(\'#uraianDV\').toggle();" type="checkbox" />'
                                +'<span class="check"></span>'
                                +' Uraian' 
                            +'</label>'
                        +'</div>'
                        // +'<label>Uraian</label>'
                        +'<div xstyle="display:none;" id="uraianDV" class="input-control textarea">'
                            +'<textarea required placeholder="uraian" name="ju_uraianTB" id="ju_uraianTB"></textarea>'
                        +'</div>'

                        //rek. perkiraan 
                        +'<legend >Rekening :' 
                            // +'<a onclick="addRekTR(\'ju_rekTBL\');return false;" href="#" class="button" >'
                            // +'<i class="icon-plus"></i></a>'
                        +'</legend>'
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">Rek Perkiraan</th>'
                                    +'<th class="text-center">Tipe</th>'
                                    +'<th class="text-center">Nominal</th>'
                                    // +'<th class="text-center"></th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="ju_rekTBL">'
                                //1
                                +'<tr>'
                                    +'<td>'
                                        +'<input  value="1"  id="ju_rekH" name="ju_rekH[]" type="hidden" />'
                                        +'<input id="ju_rek1H" name="ju_rek1H" type="hidden" />'
                                        +'<span class="input-control text">'
                                            +'<input id="ju_rek1TB" name="ju_rek1TB" placeholder="rekening" type="text" />'
                                            +'<button class="btn-clear"></button>'
                                        +'</span>'
                                    +'</td>'
                                    +'<td><input value="debit" readonly name="ju_jenis1TB" id="ju_jenis1TB"type="text"/></td>'
                                    +'<td><input value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);"  name="ju_nominal1TB" type="text"  placeholder="nominal"/></td>'
                                +'</tr>'
                                //2
                                +'<tr>'
                                    +'<td>'
                                        +'<input  value="2"  id="ju_rekH" name="ju_rekH[]" type="hidden" />'
                                        +'<input id="ju_rek2H" name="ju_rek2H" type="hidden" />'
                                        +'<span class="input-control text">'
                                            +'<input id="ju_rek2TB" name="ju_rek2TB" placeholder="rekening" type="text" />'
                                            +'<button class="btn-clear"></button>'
                                        +'</span>'
                                    +'</td>'
                                    +'<td><input value="kredit" readonly name="ju_jenis2TB" id="ju_jenis2TB"type="text"/></td>'
                                    +'<td><input value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);"  name="ju_nominal2TB" type="text"  placeholder="nominal"/></td>'
                                +'</tr>'
                                //3
                                +'<tr>'
                                    +'<td>'
                                        +'<input  value="3"  id="ju_rekH" name="ju_rekH[]" type="hidden" />'
                                        +'<input id="ju_rek3H" name="ju_rek3H" type="hidden" />'
                                        +'<span class="input-control text">'
                                            +'<input id="ju_rek3TB" name="ju_rek3TB" placeholder="rekening" type="text" />'
                                            +'<button class="btn-clear"></button>'
                                        +'</span>'
                                    +'</td>'
                                    +'<td><input value="debit" readonly name="ju_jenis3TB" id="ju_jenis3TB"type="text"/></td>'
                                    +'<td><input value="Rp. 0"  onfocus="inputuang(this);" onclick="inputuang(this);"  name="ju_nominal3TB" type="text"  placeholder="nominal"/></td>'
                                +'</tr>'
                                //4
                                +'<tr>'
                                    +'<td>'
                                        +'<input value="4" id="ju_rekH" name="ju_rekH[]" type="hidden" />'
                                        +'<input id="ju_rek4H" name="ju_rek4H" type="hidden" />'
                                        +'<span class="input-control text">'
                                            +'<input id="ju_rek4TB" name="ju_rek4TB" placeholder="rekening" type="text" />'
                                            +'<button class="btn-clear"></button>'
                                        +'</span>'
                                    +'</td>'
                                    +'<td><input value="kredit" readonly name="ju_jenis4TB" id="ju_jenis4TB"type="text"/></td>'
                                    +'<td><input value="Rp. 0"  onfocus="inputuang(this);" onclick="inputuang(this);"  name="ju_nominal4TB" type="text"  placeholder="nominal"/></td>'
                                +'</tr>'
                            +'</tbody>'
                            +'<tfoot id="legendDet">'
                            +'</tfoot>'
                        +'</table>'

                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

    // button action
        //add ---
        $("#ju_addBC").on('click', function(){ 
            juFR('');
        });
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
// end of view table

        // function juVW(){  
        //     var aksi ='aksi=tampil&subaksi=ju';
        //     var cari ='&ju_noS='+$('#ju_noS').val()
        //              +'&ju_uraianS='+$('#ju_uraianS').val();
        //     $.ajax({
        //         url : dir,
        //         type: 'post',
        //         data: aksi+cari,
        //         beforeSend:function(){
        //             $('#ju_tbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
        //         },success:function(dt){
        //             setTimeout(function(){
        //                 $('#ju_tbody').html(dt).fadeIn();
        //             },1000);
        //         }
        //     });
        // }

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
                $('#'+typ+'_nomerTB').val(dt.kode);
                $('#'+typ+'_tanggalTB').val(getToday());
            } 
        });
    }

/*save (insert & update)*/
    // tipe : ju , in, out
    function transSV(e){
        var url  = dir;
        var data = $(e).serialize()+'&aksi=simpan&subaksi='+$(e).attr('id');
        ajax(url,data).done(function(dt){
            notif(dt.status,dt.status!='sukses'?'red':'green');
        });
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
    function addRekTR(e){
        $('#'+e).append(rekTR(0));
        setTimeout(function() {
            autosuggest();
        },500);
    }

// load form (all)
    // function loadFR(titl,cont,cgArr,inpArr,rekN){
    // loadFR(titl,ju_contentFR);
    function loadFR(typ,titl,cont){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 600,
            padding: 10,
            onShow: function(){
                kodeTrans(typ);
                // comboSuggest('ju_rek1TB','ju_rek1H','debit');
                // comboSuggest('ju_rek2TB','ju_rek2H','kredit');
                // alert(getToday());
                // $('#'+typ+'_tanggalTB').val('okoko');
                // $('#'+typ+'_tanggalTB').val(getToday());
                $.Dialog.title(titl+' '+mnu); 
                $.Dialog.content(cont);
            }
        });

        // COMBOGRID
        // rek 1
        $('#ju_rek1TB').combogrid({
            debug:true,
            width:'600px',
            colModel: [{
                    'align':'left',
                    'columnName':'kode',
                    // 'hide':true,
                    'width':'15',
                    'label':'Kode'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'85',
                    'label':'Nama'
            }],
            url: dir+'?aksi=autocomp&jenis=debit',
            select: function( event, ui ) {
                $('#ju_rek1H').val(ui.item.replid);
                $('#ju_rek1TB').val(ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $(this).on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#ju_rek1H').val()!=''){
                                $('#ju_rek1H').val('');
                                $('#ju_rek1TB').val('');
                            }
                        }
                    });
                return false;
            }
        }); 
        // rek 2
        $('#ju_rek2TB').combogrid({
            debug:true,
            width:'600px',
            colModel: [{
                    'align':'left',
                    'columnName':'kode',
                    // 'hide':true,
                    'width':'15',
                    'label':'Kode'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'85',
                    'label':'Nama'
            }],
            url: dir+'?aksi=autocomp&jenis=kredit',
            select: function( event, ui ) {
                $('#ju_rek2H').val(ui.item.replid);
                $('#ju_rek2TB').val(ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $(this).on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#ju_rek2H').val()!=''){
                                $('#ju_rek2H').val('');
                                $('#ju_rek2TB').val('');
                            }
                        }
                    });
                return false;
            }
        }); 
        // rek 3
        $('#ju_rek3TB').combogrid({
            debug:true,
            width:'600px',
            colModel: [{
                    'align':'left',
                    'columnName':'kode',
                    // 'hide':true,
                    'width':'15',
                    'label':'Kode'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'85',
                    'label':'Nama'
            }],
            url: dir+'?aksi=autocomp&jenis=debit',
            select: function( event, ui ) {
                $('#ju_rek3H').val(ui.item.replid);
                $('#ju_rek3TB').val(ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $(this).on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#ju_rek3H').val()!=''){
                                $('#ju_rek3H').val('');
                                $('#ju_rek3TB').val('');
                            }
                        }
                    });
                return false;
            }
        }); 
        // rek 4
        $('#ju_rek4TB').combogrid({
            debug:true,
            width:'600px',
            colModel: [{
                    'align':'left',
                    'columnName':'kode',
                    // 'hide':true,
                    'width':'15',
                    'label':'Kode'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'85',
                    'label':'Nama'
            }],
            url: dir+'?aksi=autocomp&jenis=kredit',
            select: function( event, ui ) {
                $('#ju_rek4H').val(ui.item.replid);
                $('#ju_rek4TB').val(ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $(this).on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#ju_rek4H').val()!=''){
                                $('#ju_rek4H').val('');
                                $('#ju_rek4TB').val('');
                            }
                        }
                    });
                return false;
            }
        }); 

    }
    function comboSuggest(x,y,typ){ // hidden , display
        return $('#'+x).combogrid({
            debug:true,
            width:'600px',
            colModel: [{
                    // 'align':'left',
                    'columnName':'kode',
                    // 'hide':true,
                    'width':'15',
                    'label':'KODE'
                },{   
                    'align':'left',
                    'columnName':'nama',
                    'width':'85',
                    'label':'NAMA'
            }],
            url: dir+'?aksi=autocomp&jenis='+typ,
            select: function( event, ui ) {
                $('#'+y).val(ui.item.replid);
                $(this).val(ui.item.nama);
                
                // validasi input (tidak sesuai data dr server)
                    $(this).on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+y).val()!=''){
                                $('#'+y).val('');
                                $('#'+x).val('');
                            }
                        }
                    });
                return false;
            }
        }); 
    }
/* form jurnal umum (add & edit) */
    function juFR(id){
        if(id!=''){ // edit mode
            
        }else{ // add  mode
            var titl ='<i class="icon-plus-2"></i> Tambah ';
            loadFR('ju',titl,ju_contentFR);
        }
    }

//create TR rekening by increment
    var iTR=3;
    function rekTR(n){
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
    }


// autosuggest (all)
    // function autosuggest(id){
        // $.each(id,function(index,val){
            // $('#'+val+'TB').combogrid({
    function autosuggest(pre,n){
        for(var i=1;i<=n; i++){
            // alert(pre+'_'+i);
            // return false;
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
                    }],
                url: dir+'?aksi=autocomp',
                select: function( event, ui ) { // event setelah data terpilih 
                    // alert(ui.item.nama);return false;
                    $('#'+pre+'_rek'+i+'H').val(ui.item.replid);
                    $('#'+pre+'_rek'+i+'TB').val(ui.item.nama+' ('+ui.item.kode+')      ');
                    // $('#'+val+'H').val(ui.item.replid);
                    // $('#'+val+'TB').val(ui.item.nama+' ('+ui.item.kode+')      ');
                    // return false;
                }
            });
        }
        // });
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
            // allowNegative: true, 
            thousands:'.', 
            // decimal:',', 
            affixesStay: true
        });
    }
// end of input uang --------------------------

// get uang --------------------------
    // function getuang(e) {
    //     // var x =$(e).maskMoney('unmasked')[0];
    //     var x =$(e).val();
    //     var y = x.replace(/[r\.]/g, '');
    //     return y;
    // }
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

        
// function kodeTrans(typ){
    //     var data ='aksi=codeGen&subaksi=transNo&tipe='+typ;
    //     ajaxFC(dir,data).done(function(res){
    //         $('#'+typ+'_nomerTB').val(res.kode);
    //     });
    // }    
    // ---------------------- //
    // -- created by epiii -- //
    // ---------------------- // 

    // jQuery(document).ready(function(){
    //     // $.each(elm,function(id,item){
    //         // $("#"+item+'TB').on('keyup', function(e){
    //         $('#ju_rek1TB').on('keyup', function(e){
    //             var key     = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
    //             var keyCode = $.ui.keyCode;
    //             if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.DOWN) {
    //                 $('#ju_rek1TB').val('');
    //             }
    //         });
    //     // });
    // });



                    // $("#"+val+'TB').on('keyup', function(e){
                    //     var key     = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                    //     var keyCode = $.ui.keyCode;
                    //     if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.DOWN) {
                    //         // alert('terhapus');
                    //         $('#'+val+'H').val('');
                    //         $('#'+val+'TB').val('');
                    //     }
                    // });
