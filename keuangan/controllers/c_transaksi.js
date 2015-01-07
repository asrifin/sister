var mnu       ='transaksi'; 
var mnu2      ='lokasi'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';

var ju_contentFR = k_contentFR = b_contentFR ='';
// main function ---
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

// main function load first 
    $(document).ready(function(){
        $('#okBC').on('click',function(){
            // juNO(1);
        });
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
            ju_contentFR += '<form  style="overflow:scroll;height:600px;" autocomplete="off" onsubmit="juSV(this); return false;" id="'+mnu+'FR">' 
                            +'<input id="ju_idformH" type="hidden">' 

                            +'<label>No. Jurnal</label>'
                            +'<div class="input-control text">'
                                +'<input readonly name="ju_nomerTB" id="ju_nomerTB" class="span4">'
                                +'<button class="btn-clear"></button>'
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
                            +'<legend >Rekening :</legend>'
                            +'<table class="table hovered bordered striped">'
                                +'<thead>'
                                    +'<tr style="color:white;"class="info">'
                                        +'<th class="text-center">Rek Perkiraan</th>'
                                        +'<th class="text-center">Debet</th>'
                                        +'<th class="text-center">Kredit</th>'
                                    +'</tr>'
                                +'</thead>'
                                +'<tbody id="ju_rekTBL">'
                                    +'<tr data-hint="wasem" xdata-position="left">'
                                        +'<td>'
                                            +'<input id="ju_rek1H" name="ju_rekH[]" type="hidden" />'
                                            +'<span class="input-control text"><input id="ju_rek1TB" name="ju_rekTB[]" placeholder="rekening" type="text" /><button class="btn-clear"></button></span>'
                                        +'</td>'
                                        +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_debetTB[]" type="text" placeholder="nominal debet"/></td>'
                                        +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_kreditTB[]" type="text"  placeholder="nominal kredit"/></td>'
                                    +'</tr>'
                                    +'<tr>'
                                        +'<td>'
                                            +'<input id="ju_rek2H" type="hidden" />'
                                            +'<span class="input-control text"><input id="ju_rek2TB" placeholder="rekening" type="text" /><button class="btn-clear"></button></span>'
                                        +'</td>'
                                        +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_debetTB[]" type="text" placeholder="nominal debet"/></td>'
                                        +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_kreditTB[]" type="text"  placeholder="nominal kredit"/></td>'
                                    +'</tr>'
                                    +'<tr>'
                                        +'<td>'
                                            +'<input id="ju_rek3H" type="hidden" />'
                                            +'<span class="input-control text"><input id="ju_rek3TB" placeholder="rekening" type="text" /><button class="btn-clear"></button></span>'
                                        +'</td>'
                                        +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_debetTB[]" type="text" placeholder="nominal debet"/></td>'
                                        +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_kreditTB[]" type="text"  placeholder="nominal kredit"/></td>'
                                    +'</tr>'
                                    +'<tr>'
                                        +'<td>'
                                            +'<input id="ju_rek4H" type="hidden" />'
                                            +'<span class="input-control text"><input id="ju_rek4TB" placeholder="rekening" type="text" /><button class="btn-clear"></button></span>'
                                        +'</td>'
                                        +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_debetTB[]" type="text" placeholder="nominal debet"/></td>'
                                        +'<td><input value="Rp. 0" onfocus="inputuang(this);" name="ju_kreditTB[]" type="text"  placeholder="nominal kredit"/></td>'
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
            //add---------
            $("#ju_addBC").on('click', function(){ 
                juFR('');
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
            //ju----
            $('#juBC').on('click',function(){
                $('#juTR').toggle('slow');
                $('#g_kodeS').val('');
                $('#g_udipinjamS').val('');
                $('#g_keteranganS').val('');
            });


        //search action 
            // grup barang
            $('#g_lokasiS').on('change',function (e){ // lokasi
                vwGrup($('#g_lokasiS').val());
            });
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
        // default tampilkan jurnal umum 
            juVW();
    }); 
// end of main function ---------
    
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

// generate kode transaksi ------- 
    function kodeTrans(typ){
        var ret;
        $.ajax({
            url:dir,
            async:false,
            dataType:'json',
            type:'post',
            data:'aksi=codeGen&subaksi=transNo&tipe='+typ,
            success:function(dt){ret=dt.kode;}
        });return ret;
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
        return dateFormatx('id',dd,monthFormat(mm),yyyy);
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
        function juVW(){  
            var aksi ='aksi=tampil&subaksi=ju';
            var cari ='&ju_noS='+$('#ju_noS').val()
                     +'&ju_uraianS='+$('#ju_uraianS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#ju_tbody').html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    setTimeout(function(){
                        $('#ju_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }

        function ajaxFC (u,t,dt,d) {
            var ret;
            $.ajax({
                url:u,
                type:t,
                dataType:dt,
                data:d,
                async:false,
                success:function(res){
                    ret=res;
                },error: function(jqXHR, textStatus, errorThrown){
                    ret=textStatus;
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
            alert(ajaxFC(url,'post','json',data));
            
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
    //end grup  ---

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
    
    // form jurnal umum (add & edit)
        function juFR(id){
            if(id!=''){ // edit mode
                
            }else{ // add  mode
                var cgArr  =['ju_rek1','ju_rek2','ju_rek3','ju_rek4'];
                var inpArr ={"ju_tanggalTB":getToday(),"ju_nomerTB":kodeTrans('ju')};
                loadFR('judul form',ju_contentFR,cgArr,inpArr);
            }
        }

    // load form (all)
        function loadFR(titl,cont,cgArr,inpArr){
            $.Dialog({
                shadow: true,
                overlay: true,
                draggable: true,
                width: 500,
                padding: 10,
                onShow: function(){
                    $.Dialog.title(titl+' '+mnu); 
                    $.Dialog.content(cont);
                    if(cgArr!=null){
                        setTimeout(function(){
                            autosuggest(cgArr);
                            if(inpArr!=null){
                                $.each(inpArr,function (id,item) {
                                   $('#'+id).val(item);
                                });
                            }
                        },1000);
                    }
                }
            });
        }
    // end of load form (all)

    // autosuggest (all)
        function autosuggest(el){
            $.each(el,function(index,val){
                $('#'+val+'TB').combogrid({
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
                        $('#'+val+'H').val(ui.item.replid);
                        $('#'+val+'TB').val(ui.item.nama+' ('+ui.item.kode+')      ');

                        // $("#"+val+'TB').on('keyup', function(e){
                        //     var key     = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        //     var keyCode = $.ui.keyCode;
                        //     if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.DOWN) {
                        //         // alert('terhapus');
                        //         $('#'+val+'H').val('');
                        //         $('#'+val+'TB').val('');
                        //     }
                        // });
                        return false;
                    }
                });
            });
        }
    //end of autosuggest (all)

/*reset form*/
    //jurnal umm   ---
        function ju_resetFR(){
            $('#idformTB').val('');
            $('#g_kodeTB').val('');
        }
    //end of grup ---

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
                        //panggil fungsi vwGrup() ==> tampilkan tabel 
                        // alert(dt.lokasi[0].replid);return false;
                        vwGrup(dt.lokasi[0].replid); 
                    }
                    // alert(out);
                    $('#g_lokasiS').html(out);
                }
            });
        }
    //end of departemen ---
    
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

    function validUang () {

    }
    
    // ---------------------- //
    // -- created by epiii -- //
    // ---------------------- // 
