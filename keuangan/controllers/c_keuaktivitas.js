var mnu       ='keuaktivitas'; 
var mnu2      ='lokasi'; 
var mnu3      ='transaksi'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='../sarpras/models/m_'+mnu2+'.php';
var dir3      ='../keuangan/models/m_'+mnu3+'.php';

var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" style="overflow:scroll;height:600px;" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<table>'
                            +'<tr>'
                                +'<td style="font-weight:bold;">Lokasi </td>'
                                +'<td >: <span id="lokasiTB"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td style="font-weight:bold;">Aktivitas </td>'
                                +'<td >: <span id="aktivitasTB"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td style="font-weight:bold;">Tanggal Mulai </td>'
                                +'<td >: <span id="tanggal1TB"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td style="font-weight:bold;">Tanggal Selesai </td>'
                                +'<td >: <span id="tanggal2TB"></span></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td style="font-weight:bold;">Keterangan </td>'
                                +'<td >: <span id="keteranganTB"></span></td>'
                            +'</tr>'

                            +'<tr>'
                                +'<td style="font-weight:bold;">Tanggal Tagihan </td>'
                                +'<td >: <span id="tgltagihanTB"></span></td>'
                            +'</tr>'

                            +'<tr>'
                                +'<td style="font-weight:bold;">History Pelunasan </td>'
                                +'<td >: <span id=""></span><a target="_blank" href="/sister/keuangan/transaksi">(lihat laporan sarpras)</a></td>'
                            +'</tr>'

                        +'</table>'
                        // // kas / bank
                        // +'<label>Rekening KAS/BANK :</label>'
                        // +'<div class="input-control text">'
                        //     +'<input placeholder="kas kas" required type="text" name="rekkasTB" id="rekkasTB">'
                        //     +'<button class="btn-clear"></button>'
                        // +'</div>'
                        // // rek item
                        // +'<label>Rekening KAS/BANK :</label>'
                        // +'<div class="input-control text">'
                        //     +'<input placeholder="rek tujuan" required type="text" name="rekitemTB" id="rekitemTB">'
                        //     +'<button class="btn-clear"></button>'
                        // +'</div>'
                        // // anggaran
                        // +'<label>Anggaran :</label>'
                        // +'<div class="input-control text">'
                        //     +'<input placeholder="anggaran" required type="text" name="detilanggaranTB" id="detilanggaranTB">'
                        //     +'<button class="btn-clear"></button>'
                        // +'</div>'

                        // tabel item 
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    // +'<th class="text-center">Tgl-Tagihan</th>'
                                    // +'<th class="text-center">Tgl-Pelunasan</th>'
                                    +'<th class="text-center">Item</th>'
                                    +'<th class="text-center">Jumlah</th>'
                                    +'<th class="text-center">Biaya Satuan</th>'
                                    +'<th class="text-center">Biaya Total</th>'
                                    // +'<th class="text-center">Biaya Total</th>'
                                    
                                    // +'<th class="text-center">Rekening-Kas </th>'
                                    // +'<th class="text-center">Rekening-Item </th>'
                                    // +'<th class="text-center">Anggaran </th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="itemTBL"></tbody>'
                            +'<tfoot>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-right">Jumlah :</th>'
                                    +'<th class="text-right"></th>'
                                    +'<th id="totNominal1TD" class="text-right">Rp. 0</th>'
                                    +'<th id="totNominal2TD" class="text-right">Rp. 0</th>'
                                    // +'<th id="totNominal3TD" class="text-right">Rp. 0</th>'
                                    // +'<th colspan="3"></th>'
                                +'</tr>'
                            +'</tfoot>'
                        +'</table>'
                        
                        // +'<div class="form-actions">' 
                        //     +'<button class="button primary">simpan</button>&nbsp;'
                        //     +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        // +'</div>'
                    +'</form>';

        //combo lokasi
        cmblokasi();
        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action // edit by epiii
        $('#lokasiS').on('change',function (e){ // change : combo box
            viewTB();
        });
        $('#aktivitasS,#keteranganS').on('keydown',function (e){ // keydown : textbox
            if(e.keyCode == 13) viewTB();
        });
        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#aktivitasS').val('');
            $('#keteranganS').val('');
        });
    }); 
// end of main function ---

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
                    });
                }
                $('#lokasiS').html(out);
                viewTB(); 
            }
        });
    }
//end of combo departemen ---

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan&idDelTR='+idDelTR;
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
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari ='&lokasiS='+$('#lokasiS').val()
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
            var iditem    = (typeof arr!='undefined')?arr[ke].iditem:null;
            var item      = (typeof arr!='undefined')?arr[ke].item:'';
            var jumlah    = (typeof arr!='undefined')?arr[ke].jumlah:1;
            var biayaSat  = (typeof arr!='undefined')?arr[ke].biayaSat:0;
            var biayaTot  = (typeof arr!='undefined')?arr[ke].biayaTot:0;
            var biayaTot2 = (typeof arr!='undefined')?arr[ke].biayaTot2:0;
            var tglbayar  = (typeof arr!='undefined')?arr[ke].tglbayar:'';
            var tgllunas  = (typeof arr!='undefined')?arr[ke].tgllunas:'';

            var idrekkas   = (typeof arr!='undefined')?arr[ke].idrekkas:null;
            var idrekitem  = (typeof arr!='undefined')?arr[ke].idrekkas:null;
            var rekkas     = (typeof arr!='undefined')?arr[ke].rekkas:null;
            var rekitem    = (typeof arr!='undefined')?arr[ke].rekitem:null;
            var anggaran   = (typeof arr!='undefined')?arr[ke].anggaran:null;
            var anggaran   = (typeof arr!='undefined')?arr[ke].anggaran:null;
            var idanggaran = (typeof arr!='undefined')?arr[ke].idanggaran:null;

            var id  = (typeof arr!='undefined')?arr[ke].tgllunas:'';
            console.log(biayaSat);
            var mode = (typeof arr!='undefined')?'edit':'add';

            tr+='<tr  class="itemTR id="itemTR_'+ke+'">'
            // tr+='<tr  class="itemTR '+(biayaTot2!=0?'bg-lightTeal':'bg-amber')+'" id="itemTR_'+ke+'">'
                // tgl wajib dibayar
                    // +'<td align="left">'+tglbayar+'</td>'
                // tgl pelunasan
                    // +'<td align="center">'+tgllunas+'</td>'
                // item
                    +'<td>'
                        +'<input type="hidden" name="mode'+ke+'H" value="'+mode+'" />'
                        +'<input type="hidden" class="iditem" value="'+iditem+'" name="iditem_'+ke+'H" id="iditem_'+ke+'H">'
                        +'<input type="hidden" class="idTR" value="'+ke+'" name="idTR[]" id="idTR_'+ke+'">'
                        +item
                    +'</td>'
                // jumlah item 
                    +'<td align="right">'+jumlah+'</td>'
                // biaya satuan (yg diajukan) 
                    +'<td align="right">Rp. '+biayaSat.setCurr()+'</td>'
                // biaya total (yg diajukan) 
                    +'<td align="right"><span class="text-right itemNominal2" id="biayaTot2_'+ke+'TB">Rp. '+biayaTot.setCurr()+'</span></td>'
                // biaya total (realisasi)
                    // +'<td align="right">'
                    //     +'<div class="input-control text">'
                    //         +'<input required id="biaya2_'+ke+'TB" name="biaya2_'+ke+'TB" onfocus="inputuang(this);" onkeyup="itemTotNominal();" class="itemNominal3 text-right" id="biayaTot2_'+ke+'TB" value="Rp. '+biayaTot2.setCurr()+'">'
                    //     +'</div>'
                    // +'</td>'
                // Rek kas 
                    // +'<td align="right">'
                    //     +'<div class="input-control text">'
                    //             +'<input class="idrekkas" value="'+idrekkas+'" id="idrekkas'+ke+'H" name="idrekkas'+ke+'H" type="hidden" />'
                    //             +'<input value="'+rekkas+'" required '
                    //                 +(typeof arr=='undefined'?'disabled':' onfocus="autoSuggest(\'rekkas'+ke+'\',\'rek\',\'rek\',\'\');"')
                    //                 +' id="rekkas'+ke+'TB" name="rekkas'+ke+'TB" placeholder="rekening kas/bank" type="text" />'
                    //             +'<button class="btn-clear"></button>'
                    //     +'</div>'
                    // +'</td>'
                    // Rek item 
                    // +'<td align="right">'
                    //     +'<div class="input-control text">'
                    //             +'<input class="idrekitem" value="'+idrekitem+'" id="idrekitem'+ke+'H" name="idrekitem'+ke+'H" type="hidden" />'
                    //             +'<input value="'+rekitem+'" required '
                    //                 +(typeof arr=='undefined'?'disabled':' onfocus="autoSuggest(\'rekitem'+ke+'\',\'rek\',\'rek\',\'\');"')
                    //                 +' id="rekitem'+ke+'TB" name="rekitem'+ke+'TB" placeholder="rekening kas/bank" type="text" />'
                    //             +'<button class="btn-clear"></button>'
                    //     +'</div>'
                    // +'</td>'
                    //anggaran  
                    // +'<td align="right">'
                    //     +'<div class="input-control text">'
                    //         +'<input type="hidden" name="detilanggaranV" id="detilanggaranV">'
                    //         +'<input  value="'+idanggaran+'"  type="hidden" name="detilanggaranH" id="detilanggaranH">'
                    //         +'<input value="'+anggaran+'" placeholder="pada anggaran" id="detilanggaranTB">'
                    //         +'<button class="btn-clear"></button>'
                    //     +'</div>'
                    // +'</td>'

                +'</tr>';
        }
        // console.log(tr);
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
            width: '90%',
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
                                $('#lokasiH').val($('#lokasiS').val()); // edit by epii
                                $('#lokasiTB').html(dt.lokasi);
                                $('#tanggal1TB').html(dt.tanggal1);
                                $('#tanggal2TB').html(dt.tanggal2);
                                $('#tgltagihanTB').html(dt.tgltagihan);
                                $('#aktivitasTB').html(dt.aktivitas);
                                $('#keteranganTB').html(dt.keterangan);
                                var t1=t2=t3=0;
                                $.each(dt.itemArr,function(id,item){
                                    t1+=parseInt(item.biayaSat);
                                    t2+=parseInt(item.biayaTot);
                                    t3+=parseInt(item.biayaTot2);
                                });
                                $('#totNominal1TD').html('Rp. '+t1.setCurr());
                                $('#totNominal2TD').html('Rp. '+t2.setCurr());
                                $('#totNominal3TD').html('Rp. '+t3.setCurr());
                                var n = dt.itemArr.length;
                                addItemTR(n,dt.itemArr);
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
        console.log('id item ='+iditem);
        if(validDelRek().status==false){
            notif(validDelRek().msg,'red');
        }else{
            if(iditem!=null) {
                idDelTR.push(iditem);
            } 

            //jika ada hapus (jurnal umum)
            $('#itemTR_'+ke).fadeOut('slow',function(){
                $('#itemTR_'+ke).remove();
                itemArrFC();
                console.log('arr terpilih in delitem=>'+idDelTR);
            });
            // console.log(idDelTR);
        }
    }

    function itemArrFC(){
        itemArr=[];
        $('.iditem').each(function(id,item){
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
        var tot3=0;
        $('.itemNominal3').each(function() {
            tot3+=getCurr($(this).val());
        });
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

  // autosuggest
    function autoSuggest(jenis,el,subaksi){
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
        }else{ // anggaran 
            // var urlx= '?aksi=autocomp&subaksi='+subaksi+'&tingkat='+tingkat;
            var urlx= '?aksi=autocomp&subaksi='+subaksi;
            var col =[{
                    'align':'left',
                    'columnName':'nama',
                    'hide':true,
                    'width':'30',
                    'label':'Anggaran'
            },{   
                    'align':'left',
                    'columnName':'kategorianggaran',
                    'width':'15',
                    'label':'Kategori'
            },{   
                    'align':'left',
                    'columnName':'tingkat',
                    'width':'25',
                    'label':'Jenjang'
            },{   
                    'align':'right',
                    'columnName':'sisaBilCur',
                    'width':'15',
                    'label':'Sisa'
            },{   
                    'align':'right',
                    'columnName':'kuotaBilCur',
                    'width':'15',
                    'label':'Nominal'
            }];
        }
        urly = dir3+urlx;
        var t= terpilihx = '';
        if(rekArr!='' || rekArr!=null){
            t         = rekArr.filter(function(item) { return item !== ''; });
            terpilihx = '&terpilihArr='+t.toString();
        }

        $('#'+el+'TB').combogrid({
            debug:true,
            width:'750px',
            colModel: col ,
            url: urly+terpilihx,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                if (subaksi=='rek') { // rekening 
                    $('#'+el+'TB').val(ui.item.nama+' ( '+ui.item.kode+' )');
                    var arr = rekArrFC();
                    var str = arr.toString();
                    console.log('terpilih in auto 1 =>'+str);
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
            
                                var str = rekArr.toString();
                                console.log('terpilih in auto 2 =>'+str+' arr=> '+rekArr);
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
