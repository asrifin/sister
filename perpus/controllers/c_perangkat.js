var mnu       ='perangkat'; 
var mnu2      ='lokasi'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';

var id_contentFR = barkode_contentFR = info_contentFR = cetak_contentFR ='';

    function switchPN(){
        $('#cetaklabelTBL').toggle('slow');
        $('#labelcetak').toggle('slow');
        $('#cetaklabel').toggle('slow');
    }


// main function load first 
    $(document).ready(function(){

            //Dialog ID
                     

                id_contentFR    +='<div style="overflow:scroll;height:600px;">'
                               +'<form autocomplete="off" onsubmit="simpan();return false;" id="idFR">' 
                                +'<input id="id_formH" type="hidden">' 
                                        +'<table width="700px" class="table hovered bordered striped">'
                                            +'<thead>'
                                                +'<tr style="color:white;"class="info">'
                                                    +'<th width="250"class="text-left">Kode</th>'
                                                    +'<th width="450" class="text-left">Keterangan</th>'
                                                +'</tr>'
                                            +'</thead>'     
                                            +'<tbody id="barangTBL">'
                                                +'<tr>'
                                                    +'<td class="text-justify">[nomorauto(.panjang digit)]</td>'
                                                    +'<td class="text-justify">'
                                                    +'Nomor otomatis (incremental). Panjang digit maksimal 5 karakter dengan penambahan '
                                                    +'angka 0 di depan. Jika panjang digit tidak diberikan atau 0 maka panjang digit sesuai '
                                                    +'angka asli tanpa penambahan angka 0 di depan.<br>'
                                                    +'Contoh:<br>'
                                                    +'[nomorauto.5] untuk nomor otomatis dengan panjang digit lima karakter.'
                                                    +'[nomorauto] untuk nomor otomatis dengan panjang digit sesuai angka asli.' 
                                                    +'</td>'
                                                +'</tr>'
                                                +'<tr>'
                                                    +'<td class="text-justify">[tahun]</td>'
                                                    +'<td class="text-justify">Tahun</td>'
                                                +'</tr>'
                                                +'<tr>'
                                                    +'<td class="text-justify">[kodelokasi]</td>'
                                                    +'<td class="text-justify">Kode lokasi</td>'
                                                +'</tr>'
                                                +'<tr>'
                                                    +'<td class="text-justify">[kodetingkat]</td>'
                                                    +'<td class="text-justify">Kode tingkat koleksi</td>'
                                                +'</tr>'
                                                +'<tr>'
                                                    +'<td class="text-justify">[sumber]</td>'
                                                    +'<td class="text-justify">Sumber item'
                                                    +'Sumber dari pembelian berkode B. <br>Sumber dari hibah/pemberian berkode H.'
                                                    +'</td>'
                                                +'</tr>'
                                            +'</tbody>'

                                            +'<tfoot>'
                                            +'</tfoot>'
                                        +'</table>'
                                    
                                    +'<label>Format</label>'
                                    +'<div class="input-control text size6">'
                                        +'<input  required type="text" name="formatTB" id="formatTB">'
                                        +'<button class="btn-clear"></button>'
                                    +'</div><br>'
                                    +'<div class="input-control checkbox">'
                                        +'<label>'
                                            +'<input type="checkbox" />'
                                            +'<span class="check"></span>'
                                            +'Update nomor ID item ke format baru'
                                        +'</label>'
                                    +'</div>'
                                    +'<div class="form-actions">' 
                                        +'<button class="button primary">simpan</button>&nbsp;'
                                        +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                                    +'</div>'
                        +'</div>';
                        //End div

                barkode_contentFR    +='<div style="overflow:scroll;height:600px;">'
                               +'<form autocomplete="off" onsubmit="simpan();return false;" id="barkodeFR">' 
                                +'<input id="barkode_formH" type="hidden">' 
                                        +'<table width="700px" class="table hovered bordered striped">'
                                            +'<thead>'
                                                +'<tr style="color:white;"class="info">'
                                                    +'<th width="250"class="text-left">Kode</th>'
                                                    +'<th width="450" class="text-left">Keterangan</th>'
                                                +'</tr>'
                                            +'</thead>'     
                                            +'<tbody id="barangTBL">'
                                                +'<tr>'
                                                    +'<td class="text-justify">[nomorauto(.panjang digit)]</td>'
                                                    +'<td class="text-justify">'
                                                    +'Nomor otomatis (incremental). Panjang digit maksimal 5 karakter dengan penambahan '
                                                    +'angka 0 di depan. Jika panjang digit tidak diberikan atau 0 maka panjang digit sesuai '
                                                    +'angka asli tanpa penambahan angka 0 di depan.<br>'
                                                    +'Contoh:<br>'
                                                    +'[nomorauto.5] untuk nomor otomatis dengan panjang digit lima karakter.'
                                                    +'[nomorauto] untuk nomor otomatis dengan panjang digit sesuai angka asli.' 
                                                    +'</td>'
                                                +'</tr>'
                                                +'<tr>'
                                                    +'<td class="text-justify">[tahun]</td>'
                                                    +'<td class="text-justify">Tahun</td>'
                                                +'</tr>'
                                                +'<tr>'
                                                    +'<td class="text-justify">[kodelokasi]</td>'
                                                    +'<td class="text-justify">Kode lokasi</td>'
                                                +'</tr>'
                                                +'<tr>'
                                                    +'<td class="text-justify">[kodetingkat]</td>'
                                                    +'<td class="text-justify">Kode tingkat koleksi</td>'
                                                +'</tr>'
                                                +'<tr>'
                                                    +'<td class="text-justify">[sumber]</td>'
                                                    +'<td class="text-justify">Sumber item'
                                                    +'Sumber dari pembelian berkode B. <br>Sumber dari hibah/pemberian berkode H.'
                                                    +'</td>'
                                                +'</tr>'
                                            +'</tbody>'

                                            +'<tfoot>'
                                            +'</tfoot>'
                                        +'</table>'
                                    
                                    +'<label>Format</label>'
                                    +'<div class="input-control text size6">'
                                        +'<input  required type="text" name="formatTB" id="formatTB">'
                                        +'<button class="btn-clear"></button>'
                                    +'</div><br>'
                                    +'<div class="input-control checkbox">'
                                        +'<label>'
                                            +'<input type="checkbox" />'
                                            +'<span class="check"></span>'
                                            +'Update barkode item ke format baru'
                                        +'</label>'
                                    +'</div>'
                                    +'<div class="form-actions">' 
                                        +'<button class="button primary">simpan</button>&nbsp;'
                                        +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                                    +'</div>'

                        +'</div>';
                        //End div

                info_contentFR  +='<div style="overflow:scroll;height:250px;">'
                                +'<form autocomplete="off" onsubmit="simpan();return false;" id="infoFR">' 
                                    +'<input id="info_formH" type="hidden">' 
                                    +'<label>Judul</label>'
                                    +'<div class="input-control text">'
                                        +'<input required type="text" name="judulTB" id="judulTB">'
                                        +'<button class="btn-clear"></button>'
                                    +'</div>'
                                    +'<label>Deskripsi</label>'
                                    +'<div class="input-control text">'
                                        +'<input required type="text" name="deskripsiTB" id="deskripsiTB">'
                                        +'<button class="btn-clear"></button>'
                                    +'</div>'
                                    +'<div class="form-actions">' 
                                        +'<button class="button primary">simpan</button>&nbsp;'
                                        +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                                    +'</div>'
                                +'</form>';
                            +'</div>';
                            //End div

                cetak_contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                                    +'<input id="idformH" type="hidden">' 
                                    +'<label>Kode</label>'
                                    +'<div class="input-control text">'
                                        +'<input placeholder="kode" required type="text" name="kodeTB" id="kodeTB">'
                                        +'<button class="btn-clear"></button>'
                                    +'</div>'
                                    +'<label>Nama Lokasi</label>'
                                    +'<div class="input-control text">'
                                        +'<input  placeholder="lokasi" required type="text" name="namaTB" id="namaTB">'
                                        +'<button class="btn-clear"></button>'
                                    +'</div>'
                                    +'<label>Alamat</label>'
                                    +'<div class="input-control text">'
                                        +'<input  placeholder="alamat" required type="text" name="alamatTB" id="alamatTB">'
                                        +'<button class="btn-clear"></button>'
                                    +'</div>'
                                    +'<label>Keterangan</label>'
                                    +'<div class="input-control textarea">'
                                        +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                                    +'</div>'
                                    +'<div class="form-actions">' 
                                        +'<button class="button primary">simpan</button>&nbsp;'
                                        +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                                    +'</div>'
                                +'</form>';


        cmblokasi();

    // button action
        //add ---
        $("#idBC").on('click', function(){ 
            idFR('');
        });
        $("#barkodeBC").on('click', function(){ 
            barkodeFR('');
        });
        $("#infoBC").on('click', function(){ 
            infoFR('');
        });
        $("#cetakBC").on('click', function(){ 
            switchPN();
        });
        //print ---
        $('#ju_cetakBC').on('click',function(){
            printPDF('grup');
        });

        //search ---
        $('#memberS').keydown(function (e){
            if(e.keyCode == 13)
                sirkulasiVW();
        });
        $('#barcodeS').keydown(function (e){
            if(e.keyCode == 13)
                sirkulasiVW();
        });$('#judulS').keydown(function (e){
            if(e.keyCode == 13)
                sirkulasiVW();
        });$('#s_judulS').keydown(function (e){
            if(e.keyCode == 13)
                statistikVW();
        });$('#klasifikasiS').keydown(function (e){
            if(e.keyCode == 13)
                statistikVW();
        });

        // set default this month
        $('#tgl1TB').val(getFirstDate());
        $('#tgl2TB').val(getLastDate());

        $('#s_tgl1TB').val(getFirstDate());
        $('#s_tgl2TB').val(getLastDate());
        // jurnal umum :: tampilkan detail jurnal
        // $('#ju_detiljurnalCB').on('click',function(){
        //     $('.uraianCOL').toggle();
        // });

        // search button
        $('#cari_sirkulasiBC').on('click',function(){
            $('#cari_sirkulasiTR').toggle('slow');
            $('#memberS').val('');
            $('#barcodeS').val('');
            $('#judulS').val('');
        });
        $('#cari_statistikBC').on('click',function(){
            $('#cari_statistikTR').toggle('slow');
            $('#s_judulS').val('');
            $('#klasifikasiS').val('');
            $('#pengarangS').val('');
            $('#penerbitS').val('');
        });

        // default tampilkan jurnal umum 
        sirkulasiVW();
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
                $(el2).html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
//end of paging ---

// combo departemen ---
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
                    });(dt.lokasi[0].replid);
                    // $('#barangTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+dt.lokasi[0].replid);
                }$('#lokasiS').html(out);
            }
        });
    }
//end of combo departemen ---

// load form (all)
    function loadFR(titl,cont,inpArr){        
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                $.Dialog.title(titl); 
                // $.Dialog.title(titl+' '+mnu); 
                $.Dialog.content(cont);
                  
                if(inpArr!=null){ // main form : set value fields 
                    $.each(inpArr,function (id,item) {
                       $('#'+id).val(item);
                    });
                }
                // if(rekN>0){// detail form
                //     setTimeout(function(){
                //         $('#ju_rekTBL').append(rekTR(rekN));
                //         autosuggest(pre,rekN);
                //         // autosuggest(cgArr);
                //     },500);
                // }
            }
        });
    }

/* form ID (add & edit) */
    function idFR(id){
        if(id!=''){ // edit mode
            
        }else{ // add  mode
            var titl   ='<i class="icon-plus-2"></i> Edit Format Nomor ID ';
            var inpArr ={"tgl_pinjamTB":getToday(),"tgl_kembaliTB":getLastDate};
            loadFR(titl,id_contentFR,inpArr);
        }

    }

/* form Barkode (add & edit) */
    function barkodeFR(id){
        if(id!=''){ // edit mode
            
        }else{ // add  mode
            var titl   ='<i class="icon-plus-2"></i> Edit Format Barkode item ';
            var inpArr ={"tgl_pinjamTB":getToday(),"tgl_kembaliTB":getLastDate};
            loadFR(titl,barkode_contentFR,inpArr);
        }
    }

/* form Cetak Label (add & edit) */
    function infoFR(id){
        if(id!=''){ // edit mode
            
        }else{ // add  mode
            var titl   ='<i class="icon-plus-2"></i> Edit Cetak Label';
            var inpArr ={"tgl_pinjamTB":getToday(),"tgl_kembaliTB":getLastDate};
            loadFR(titl,info_contentFR,inpArr);
        }
    }

/*view*/
    // Sirkulasi ---
        function sirkulasiVW(){  
            var aksi ='aksi=tampil&subaksi=sirkulasi';
            var cari ='&memberS='+$('#memberS').val()
                     +'&barcodeS='+$('#barcodeS').val();
                     +'&judulS='+$('#judulS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#sirkulasi_tbody').html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    setTimeout(function(){
                        $('#sirkulasi_tbody').html(dt).fadeIn();
                    },1000);
                }
            });
        }

        function statistikVW(){  
            var aksi ='aksi=tampil&subaksi=statistik';
            var cari ='&s_judulS='+$('#s_judulS').val()
                     +'&klasifikasiS='+$('#klasifikasiS').val();
                     +'&pengarangS='+$('#pengarangS').val();
                     +'&penerbitS='+$('#penerbitS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#statistik_tbody').html('<tr><td align="center" colspan="10"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    setTimeout(function(){
                        $('#statistik_tbody').html(dt).fadeIn();
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

        
