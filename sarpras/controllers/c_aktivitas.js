var mnu       ='aktivitas'; 
var mnu2      ='lokasi'; 
var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" style="overflow:scroll;height:600px;" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<label>Lokasi</label>'
                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="lokasiH" id="lokasiH" class="span2">'
                            // +'<input enabled="enabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<input disabled="disabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Tanggal Mulai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input required id="tanggal1TB" name="tanggal1TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                        +'<label>Tanggal Selesai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input id="tanggal2TB" name="tanggal2TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                        +'<label>Aktivitas</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="aktivitas" required type="text" name="aktivitasTB" id="aktivitasTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'

                        // button 
                        +'<legend style="font-weight:bold;">Item  : '
                            +'<a id="addTRBC" onclick="addItemTR();" href="#" class="place-right button bg-blue fg-white">'
                                +'<i class="icon-plus-2"></i>'
                            +'</a>'
                        +'</legend>'

                        // tabel item 
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">Item</th>'
                                    +'<th class="text-center">Jumlah</th>'
                                    +'<th class="text-center">Biaya Satuan (pengajuan)</th>'
                                    +'<th class="text-center">Biaya Total (pengajuan)</th>'
                                    +'<th class="text-center">Biaya Total (Realisasi)</th>'
                                    +'<th class="text-center">Tgl Tagihan</th>'
                                    +'<th class="text-center">Tgl Pelunasan</th>'
                                    +'<th class="text-center">Hapus</th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="itemTBL"></tbody>'
                            +'<tfoot>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th colspan="2" class="text-right">Jumlah :</th>'
                                    +'<th id="totNominal1TD" class="text-right">Rp. 0</th>'
                                    +'<th id="totNominal2TD" class="text-right">Rp. 0</th>'
                                    +'<th id="totNominal3TD" class="text-right">Rp. 0</th>'
                                    +'<th colspan="3"></th>'
                                +'</tr>'
                            +'</tfoot>'
                        +'</table>'
                        
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        /*
        load pertama kali (pilihn salah satu) :
        cmblokasi : bila ada combo box
        viewTB : jika tanpa combo box
        */

        //combo lokasi
        cmblokasi();
        
        //load table // edit by epiii
        // viewTB();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action // edit by epiii
        $('#lokasiS').on('change',function (e){ // change : combo box
                viewTB($('#lokasiS').val());
        });
        // $('#tempatS').on('keydown',function (e){ // keydown : textbox
        //     if(e.keyCode == 13)
        //         // viewTB($('#tempatS').val());
        //         viewTB($('#lokasiS').val());
        // });
        // $('#keteranganS').on('keydown',function (e){ // keydown : textbox
        //     if(e.keyCode == 13)
        //         // viewTB($('#keteranganS').val());
        //         viewTB($('#lokasiS').val());
        // });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            // $('#lokasiS').val('');
            $('#tempatS').val('');
            $('#keteranganS').val('');
        });
    }); 
// end of main function ---

// ghjg
// ghjg
// combo departemen ---
    // function cmblokasi(lok){ edited by epiii
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
                    //panggil fungsi viewTB() ==> tampilkan tabel 
                    viewTB(dt.lokasi[0].replid); 
                }$('#lokasiS').html(out);
            }
        });
    }
//end of combo departemen ---

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
        // edit mode
        if($('#idformH').val()!=''){
            urlx += '&replid='+$('#idformH').val();
        }
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$('form').serialize()+urlx,
            success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    kosongkan();
                    // viewTB($('#aktivitasS').val());
                    viewTB($('#'+mnu2+'S').val()); //value : combo box LOKASI 
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    // function viewTB(nama){          
    function viewTB(lok){ //edit by epiii 
        var aksi ='aksi=tampil';
        var cari ='&lokasiS='+lok
                    +'&aktivitasS='+$('#aktivitasS').val()
                    +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---
    // record rekening perkiraan
    var iTR = 1;    
    var idDelTR = [];
    var idAddTR = [];

    function itemTR (n,arr) {
        var tr='';
        var isLoop=true;
        if(typeof n=='undefined'){ isLoop=false; n=iTR;}
        for(var i=n; i>=iTR; i--){
            var ke = parseInt(i)-1;
            var iditem   = (typeof arr!='undefined')?arr[ke].iditem:null;
            var item     = (typeof arr!='undefined')?arr[ke].item:'';
            var jumlah   = (typeof arr!='undefined')?arr[ke].jumlah:1;
            var biaya    = (typeof arr!='undefined')?arr[ke].biaya:'';
            var biaya2   = (typeof arr!='undefined')?arr[ke].biaya2:'-';
            var tglbayar = (typeof arr!='undefined')?arr[ke].tglbayar:'';
            var tgllunas = (typeof arr!='undefined')?arr[ke].tgllunas:'';
            
            var mode = (typeof arr!='undefined')?'edit':'add';

            tr+='<tr class="itemTR" id="itemTR_'+ke+'">'
                    // item
                    +'<td align="center">'
                        +'<input type="hidden" name="mode'+ke+'H" value="'+mode+'" />'
                        +'<input type="hidden" value="'+iditem+'" name="iditem_'+ke+'H" id="iditem_'+ke+'H">'
                        +'<input type="hidden" class="idTR" value="'+ke+'" name="idTR[]" id="idTR_'+ke+'">'
                        +'<div class="input-control text">'
                            +'<input value="'+item+'" required id="item_'+ke+'TB" name="item_'+ke+'TB">'
                            // +'<button class="btn-clear"></button>'
                        +'</div>' 
                    +'</td>'
                    // jumlah item 
                    +'<td align="center">'
                        +'<div class="input-control text">'
                            +'<input value="'+jumlah+'"  type="number" required min="1" id="jumlah_'+ke+'TB" name="jumlah_'+ke+'TB">'
                        +'</div>' 
                    +'</td>'
                    // biaya satuan (yg diajukan) 
                    +'<td align="center">'
                        +'<span class="input-control text">'
                            +'<input onkeyup="itemTotNominal();" value="'+item+'" required class="text-right itemNominal1" onfocus="inputuang(this);" onclick="inputuang(this);"' 
                                +(biaya2!='-'?'disabled':'')+' id="biaya_'+ke+'TB" name="biaya_'+ke+'TB" >'
                        +'</span>'
                    +'</td>'
                    // biaya total (yg diajukan) 
                    +'<td align="center">'
                        +'<span class="text-right itemNominal2" id="biaya2_'+ke+'TB">'+biaya2+'</span>'
                    +'</td>'
                    // biaya total (realisasi)
                    +'<td align="center">'
                        +'<span class="text-right itemNominal3" id="biaya2_'+ke+'TB">'+biaya2+'</span>'
                    +'</td>'
                    // tgl wajib dibayar
                    +'<td align="center">'
                        +'<div class="input-control text" data-role="datepicker"' 
                            +'data-format="dd mmmm yyyy" data-position="top"'
                            +'data-effect="slide">'
                            +'<input value="'+tglbayar+'" required id="tglbayar_'+ke+'TB" name="tglbayar_'+ke+'TB" type="text">'
                            // +'<button class="btn-date"></button>'
                        +'</div>'
                    +'</td>'
                    // tgl pelunasan
                    +'<td align="center">'
                        +'<div xdisabled class="input-control text" data-role="datepicker"' 
                            +'data-format="dd mmmm yyyy" data-position="top"'
                            +'data-effect="slide">'
                            +'<input xdisabled '+(biaya2=='-'?'disabled':'')+' value="'+tgllunas+'" required id="tgllunas_'+ke+'TB" name="tgllunas_'+ke+'TB" type="text">'
                            // +'<button class="btn-date"></button>'
                        +'</div>'
                    +'</td>'
                    // hapus
                    +'<td align="center">'
                        // +'<a href="">ok</a>'
                        +'<a href="#" onclick="'+(typeof arr!='undefined'?'if(confirm(\'melanjutkan untuk menghapus data?\')) delItemTR('+ke+','+iditem+',\'\');':'delItemTR('+ke+','+iditem+',\'\')')+'"  class="button"><i class="icon-cancel-2"></i></a>'
                    +'</td>'
                +'</tr>';
        }
        console.log(tr);
        if(isLoop) iTR+=n;
        else iTR++;

        return tr; 
    }

//add TR rekening into an element 
    function addItemTR(n,arr){
        $('#itemTBL').prepend(itemTR(n,arr));
    }

// form ---
    function viewFR(id){
        isClosedFR();
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 700,
            padding: 10,
            onShow: function(){
                var titlex;
                setTimeout(function(){
                    if(id==''){  //add mode
                        titlex='<span class="icon-plus-2"></span> Tambah ';
                        var u = dir2;
                        var d = 'aksi=cmblokasi&replid='+$('#lokasiS').val();
                        ajax(u,d).done(function(dt){
                            $('#tanggal1TB').val(getToday());
                            $('#tanggal2TB').val(getToday());
                            $('#lokasiTB').val(dt.lokasi[0].nama);
                            $('#lokasiH').val($('#lokasiS').val());
                            addItemTR(1);
                        });
                    }else{ // edit mode
                        titlex='<span class="icon-pencil"></span> Ubah';
                        $.ajax({
                            url:dir,
                            data:'aksi=ambiledit&replid='+id,
                            type:'post',
                            dataType:'json',
                            success:function(dt){
                                $('#idformH').val(id);
                                // $('#tempatH').val($('#tempatS').val());
                                $('#lokasiH').val($('#lokasiS').val()); // edit by epii
                                $('#lokasiTB').val(dt.lokasi);
                                $('#tanggal1TB').val(dt.tanggal1);
                                $('#tanggal2TB').val(dt.tanggal2);
                                $('#aktivitasTB').val(dt.aktivitas);
                                $('#keteranganTB').val(dt.keterangan);
                            }
                        });
                    }
                },200);
                $.Dialog.title(titlex+' '+mnu); // edit by epiii
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

//paging ---
    function pagination(page,aksix,menux){ 
        var datax = 'starting='+page+'&aksi='+aksix+'&menu='+menux;
        var cari  = '&lokasiS='+$('#lokasiS').val();
                    // +'&tempatS='+$('#tempatS').val()
                    // +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url:dir,
            type:"post",
            data: datax+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }   
//end of paging ---
    
//del process ---
    function del(id){
        if(confirm('melanjutkan untuk menghapus data?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=hapus&replid='+id,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    // viewTB($('#tempatS').val());
                    viewTB($('#'+mnu2+'S').val());
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                }
                notif(cont,clr);
            }
        });
    }
//end of del process ---
    
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
// hjkagj
//reset form ---
    function kosongkan(){
        $('#idformTB').val('');
        $('#tanggal1TB').val('');
        $('#tanggal1TB').val('');
        $('#aktivitasTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 



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

// fungsi AJAX : asyncronous
    function ajax(u,d) {
        return $.ajax({
            url:u,
            type:'post',
            dataType:'json',
            data:d
        });
    }

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

    function isClosedFR () {
        if($('.window-overlay').length<=0) {
            iTR=1; // reset rekTR's counter
            idDelTR=[]; // reset rekTR's counter
            itemArr=[]; // reset itemArr's counter
        }
    }


// remove TR rekening
    function delItemTR (ke,iditem) {
        // console.log(validDelRek());
        if(validDelRek().status==false){
            notif(validDelRek().msg,'red');
        }else{
            if(iditem!=null) idDelTR.push(iditem); //jika ada hapus (jurnal umum)
            $('#itemTR_'+ke).fadeOut('slow',function(){
                $('#itemTR_'+ke).remove();
                itemArrFC();
                console.log('arr terpilih in delitem=>'+itemArr);
            });
            // console.log(idDelTR);
        }
    }

    function itemArrFC(){
        itemArr=[];
        $('.idrek').each(function(id,item){
            itemArr.push($(this).val());
        });return itemArr;
    }

    function validDelRek () {
        var ret={'status':true,'msg':null};
        // if($('#subaksiH').val()=='ju' && $('.rekTR').length<=2){
        //     ret.status=false;
        //     ret.msg='minimal lengkapi kredit dan debit';
        // }else 
        // if($('#subaksiH').val()!='ju'){
            if($('.itemTR').length<=1){
                ret.status=false;
                ret.msg='minimal isi 1 item';
            }else{
                itemTotNominal();
            }
        // }
        return ret;
    }
    // get total nominal rekening (ex : Rp. 500.000)
    function itemTotNominal () {
        var tot1=tot2=tot3=0;
        // jumlah_'+ke+'TB
        $('.itemNominal1').each(function() {
            tot1+=getCurr($(this).val());
        });
        $('.itemNominal2').each(function() {
            tot2+=getCurr($(this).val());
        });
        $('.itemNominal3').each(function() {
            tot3+=getCurr($(this).val());
        });
        $('#totNominal1TD').html('Rp. '+tot1.setCurr());
        $('#totNominal2TD').html('Rp. '+tot2.setCurr());
        $('#totNominal3TD').html('Rp. '+tot3.setCurr());
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


/*save (insert & update)*/
    /*function transSV(e){
        var url  = dir;
        var data = $(e).serialize()+'&aksi=simpan&subaksi='+$('#subaksiH').val();
        if($('#subaksiH').val()=='ju') data+='&idDelTR='+idDelTR;
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
                    if($('#kwitansiCB').prop('checked')) printPDF('kwitansi');
                    $.Dialog.close();
                    $('#rekTBL').html('');
                    loadAll();
                    // viewTB('ju');
                }
            });
        }
    }*/