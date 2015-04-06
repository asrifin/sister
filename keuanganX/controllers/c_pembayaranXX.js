var mnu  ='pembayaran'; 
var mnu2 ='departemen'; 
var mnu3 ='angkatan'; 
var mnu4 ='proses'; 
var mnu5 ='kelompok'; 

var dir  ='models/m_'+mnu+'.php';
var dir2 ='../akademik/models/m_'+mnu2+'.php';
var dir3 ='../akademik/models/m_'+mnu3+'.php';
var dir4 ='../psb/models/m_'+mnu4+'.php';
var dir5 ='../psb/models/m_'+mnu5+'.php';

var pembayaran_contentFR = k_contentFR = b_contentFR ='';
// main function load first 
    $(document).ready(function(){
        // default tampilkan jurnal umum 
        cmbdepartemen('filter','');
        // switchPN('pendaftaran');

        $('#departemenS').on('change',function(){
            switchPN();
        });

        // $('.tabs li a').on('click',function(){
        //     switchPN($(this).attr('href'));
        // });
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
        pembayaran_contentFR += '<form  style="overflow:scroll;height:600px;" autocomplete="off" onsubmit="juSV(this); return false;" id="'+mnu+'FR">'
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
                            +'<a onclick="addRekTR(\'ju_rekTBL\');return false;" href="#" class="button" >'
                            +'<i class="icon-plus"></i></a>'
                        +'</legend>'
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">Rek Perkiraan</th>'
                                    +'<th class="text-center">Debet</th>'
                                    +'<th class="text-center">Kredit</th>'
                                    +'<th class="text-center"></th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="ju_rekTBL">'
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
            printPDF('grup');
        });
        //search ---
        $('#ju_noS,#ju_uraianS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) juVW();
        });

        // set default this month
        $('#tgl1TB').val(getFirstDate());
        $('#tgl2TB').val(getLastDate());
        // jurnal umum :: tampilkan detail jurnal
        $('#ju_detiljurnalCB').on('click',function(){
            $('.uraianCOL').toggle();
        });
    }); 
// end of main function ---------
    
    function switchPN (par) {
        // alert(par+' ok '); return false;
        if(par==''){
            cmbproses('filter','');
        }else{

        }
        // alert(par);
        // var tabs = ['pembayaran','dpp','spp'];
        // alert(par);
        // alert(curTab());
        
    }

    function curTab(par){
        var str3 = '';
        if(par!=''){
            var str = $('.tabs').find('li.active a').attr('href');
            var str2 = str.replace('TAB','');
            var str3 = str2.replace('#','');
        }else{
            var str2 = par.replace('TAB','');
            var str3 = str2.replace('#','');
        }return str3;
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
    // ju ---
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
        function viewTB(subaksi){
            var aksi ='aksi=tampil&subaksi='+subaksi;
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
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#'+subaksi+'_tbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    setTimeout(function(){
                        $('#'+subaksi+'_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }

// fungsi AJAX : asyncronous
    function ajaxFC (u,d) {
        return $.ajax({
            url:u,
            type:'post',
            dataType:'json',
            data:d
        });
    }

// generate kode transaksi form (jurnal umum/income/outcome) : syncronous
    function kodeTrans(typ){
        var ret;
        $.ajax({
            url:dir,
            type:'post',
            async:false,
            dataType:'json',
            data :'aksi=codeGen&subaksi=transNo&tipe='+typ,
            success:function(dt){
                if(dt.status!='sukses')
                    ret=dt.status;
                else
                    ret=dt.kode;
            }
        });return ret;
    }

/*save (insert & update)*/
    //jurnal umum  ---
    function juSV(e){
        var url  = dir;
        var data = $(e).serialize()+'&aksi=simpan&subaksi=ju';
        // edit mode
        if($('#ju_idformH').val()!='')
            url += '&replid='+$('#ju_idformH').val();
        // alert(ajaxFC(url,'post','json',data));
        var exec = ajaxFC(url,'post','json',data);
        alert();
        // if(exec){
        //     res=exec.status;
        // }else{
        //     notif()
        // }            

        
        // $.ajax({
        //     url:dir,
        //     cache:false,
        //     type:'post',
        //     dataType:'json',
        //     data:$('form').serialize()+urlx,
        //     success:function(dt){
        //         if(dt.status!='sukses'){
        //             cont = 'Gagal menyimpan data';
        //             clr  = 'red';
        //         }else{
        //             $.Dialog.close();
        //             gkosongkan();
        //             vwGrup($('#g_lokasiS').val());
        //             cont = 'Berhasil menyimpan data';
        //             clr  = 'green';
        //         }notif(cont,clr);
        //     }
        // });
        // return false;
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
/* form jurnal umum (add & edit) */
    function juFR(id){
        if(id!=''){ // edit mode
            
        }else{ // add  mode
            // var cgArr  =['ju_rek1','ju_rek2','ju_rek3','ju_rek4'];
            // loadFR(titl,pembayaran_contentFR,cgArr,inpArr,2);
            var titl   ='<i class="icon-plus-2"></i> Tambah ';
            var inpArr ={"ju_tanggalTB":getToday(),"ju_nomerTB":kodeTrans('ju')};
            loadFR(titl,pembayaran_contentFR,inpArr,2,'ju');
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

// load form (all)
    // function loadFR(titl,cont,cgArr,inpArr,rekN){
    function loadFR(titl,cont,inpArr,rekN,pre){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                $.Dialog.title(titl+' '+mnu); 
                $.Dialog.content(cont);
                  
                if(inpArr!=null){ // main form : set value fields 
                    $.each(inpArr,function (id,item) {
                       $('#'+id).val(item);
                    });
                // }if(cgArr!=null){// detail form
                // }if(!isNaN(rekN) && rekN>0){// detail form
                }if(rekN>0){// detail form
                    setTimeout(function(){
                        $('#ju_rekTBL').append(rekTR(rekN));
                        autosuggest(pre,rekN);
                        // autosuggest(cgArr);
                    },500);
                }
            }
        });
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
                    if(typ=='filter'){
                        $('#departemenS').html(out);
                        switchPN('');
                    }else{
                        $('#departemenTB').html(out);
                    }
                }
            }
        });
    }
//end of combo departemen---
        
// combo angkatan ---
    function cmbangkatan(typ,ang){
        $.ajax({
            url:dir3,
            data:'aksi=cmb'+mnu3,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.angkatan, function(id,item){
                        if(ang==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'"> '+item.nama+'</option>';
                    });
                    if(typ=='filter'){
                        $('#angkatanS').html(out);
                        cmbproses('filter',dt.angkatan[0].replid,'');
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
                        if(ang==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'"> '+item.nama+'</option>';
                    });
                    if(typ=='filter'){
                        $('#prosesS').html(out);
                        cmbkelompok('filter',dt.proses[0].replid,'');
                    }else{
                        $('#prosesTB').html(out);
                    }
                }
            }
        });
    }
//end of combo proses---

// combo kelompok ---
    function cmbkelompok(typ,kel){
        $.ajax({
            url:dir5,
            data:'aksi=cmb'+mnu5,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.kelompok, function(id,item){
                        if(kel==item.replid)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                        else
                            out+='<option value="'+item.replid+'"> '+item.nama+'</option>';
                    });
                    if(typ=='filter'){
                        $('#kelompokS').html(out);
                        cmbkelompok('filter',dt.kelompok[0].replid,'');
                    }else{
                        $('#kelompokTB').html(out);
                    }
                }
            }
        });
    }
//end of combo kelompok---

