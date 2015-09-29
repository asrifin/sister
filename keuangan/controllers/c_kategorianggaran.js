var mnu       ='kategorianggaran'; 
var mnu3      ='departemen'; 
var mnu5      ='tingkat'; 

var dir       ='models/m_'+mnu+'.php';
var dir3      ='../akademik/models/m_'+mnu3+'.php';
var dir5      ='../akademik/models/m_'+mnu5+'.php';

var contentFR ='';
    
// main function ---
    $(document).ready(function(){
        // anggaran
        contentFR += '<form style="overflow:scroll;height:500px;" autocomplete="off" onsubmit="simpanSV();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        // Departemen
                        +'<label>Departemen</label>'
                        +'<select data-transform="input-control" onchange="cmbtingkat(\'form\',\'\');" required type="text" id="departemenTB" name="departemenTB"></select>'

                        // Tingkat 
                        +'<label>Tingkat</label>'
                        +'<select data-transform="input-control" required type="text" name="tingkatTB" id="tingkatTB"><option value="">-Pilih Departemen Dahulu-</option></select>'

                        // nama kategori anggaran
                        +'<label>Kategori Anggaran</label>'
                        +'<input  data-transform="input-control" placeholder="Kategori Anggaran" required type="text" name="kategorianggaranTB" id="kategorianggaranTB">'

                        // detilrekening
                        +'<label>Rekening </label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" required id="detilrekeningH" name="detilrekeningH" />'
                            +'<input onfocus="autoSuggest(\'detilrekening\');" placeholder="cari kode / nama rekening" required type="text" name="detilrekeningTB" id="detilrekeningTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // keterangan
                        +'<label>Tujuan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="tujuan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'

                        // button simpan
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';
        cmbdepartemen('filter','');

        $("#d_tambahBC").on('click', function(){ // katalog
            detilanggaranFR('');
        });

        //print----
        $('#cetakBC').on('click',function(){
            printPDF('anggaran');
        });
        $('#cetak2BC').on('click',function(){
            printPDF('anggaran2');
        });$('#k_cetakBC').on('click',function(){
            printPDF('detilanggaran');
        });
        // search box
        $('#kategorianggaranS,#keteranganS,#detilrekeningS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB();
        });//combo box
        $('#departemenS,#tingkatS').on('change',function (){ // kode grup
             viewTB();
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
//end of paging ---

// switch panel
    function switchPN (e) {
        $.each($('.panelx'),function(id,item){
            var ke = id+1;
            if(ke==e){
                $('#panel'+ke).removeAttr('style');
                $('h4').html($(this).attr('title'));
            }else{
                $('#panel'+ke).attr('style','display:none;');
            }
        });
    }
//end of  switch panel

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
                $(el2).html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },500);
            }
        });
    }

/*save (insert & update)*/
    //detil anggaran save ---
        function detilanggaranSV(){
            var urlx ='&aksi=simpan&subaksi=detilanggaran';
            // edit mode
            if($('#d_idformH').val()!=''){
                urlx += '&replid='+$('#d_idformH').val();
            detil}
            // if($('#d_detilrekeningH').val()==''){
            // 	notif('silahkan mengisi "detilRekening" dengan benar');
            // }else{
	            $.ajax({
	                url:dir,
	                cache:false,
	                type:'post',
	                dataType:'json',
	                data:$('#detilanggaranFR').serialize()+urlx,
	                success:function(dt){
	                    if(dt.status!='sukses'){
	                        cont = 'Gagal menyimpan data';
	                        clr  = 'red';
	                    }else{
	                        $.Dialog.close();
	                        // gkosongkan();
                            viewTB('detilanggaran');
	                        // viewTB($('#d_kategorianggaranH').val());
	                        cont = 'Berhasil menyimpan data';
	                        clr  = 'green';
	                    }notif(cont,clr);
	                }
	            });
           // }
        }
    //end kategori anggaran save  ---

    //kategori anggaran save ---
        function simpanSV(){
            var urlx ='&aksi=simpan&subaksi=anggaran';
            // edit mode
            if($('#idformH').val()!=''){
                urlx += '&replid='+$('#idformH').val();
            }
            var u = dir;
            var d = $('form').serialize()+urlx;
            ajax(u,d).done(function (dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    gkosongkan();
                    viewTB();
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            });
        }
    //end kategori anggaran save  ---
    
        function del(id){
            if(confirm('melanjutkan untuk menghapus data?'))
            var u = dir;
            var d ='aksi=hapus&subaksi=anggaran&replid='+id;
            ajax(u,d).done(function (dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    viewTB();
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                }notif(cont,clr);
            });
        }
    //end of kategori anggaran ---
    
  // autosuggest
    function autoSuggest(el){
        var urlx= '?aksi=autocomp';
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
                'label':'detilRekening'
        }];

        urly = dir+urlx;
        $('#'+el+'TB').combogrid({
            debug:true,
            width:'900px',
            colModel: col ,
            url: urly,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                $('#'+el+'TB').val(ui.item.nama+' ( '+ui.item.kode+' )');

                // validasi input (tidak sesuai data dr server)
                    $('#'+el+'TB').on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+el+'H').val()!=''){
                                $('#'+el+'H').val('');
                                $('#'+el+'TB').val('');
                            }
                        }
                    });

                    $('#'+el+'TB').on('blur,change',function(){
                        if($('#'+el+'H').val()=='') {
                            $('#'+el+'TB').val(''); // :: all 
                        }
                    });
                return false;
            }
        });
    }

    // load form (all)
    function loadFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '60%',
            padding: 10,
            onShow: function(){
                $.Dialog.title('<i class="fg-white icon-'+(id!=''?'pencil':'plus-2')+'"></i> '+(id!=''?' Ubah ':' Tambah ')+' Anggaran'); 
                $.Dialog.content(contentFR);
            
                if(id==''){ //tambah
                    cmbdepartemen('form','');
                }else{ // edit
                    var u = dir;
                    var d = 'aksi=ambiledit&replid='+id;
                    ajax(u,d).done(function (dt) {
                        $('#idformH').val(id);
                        $('#kategorianggaranTB').val(dt.kategorianggaran);
                        $('#detilrekeningTB').val(dt.detilrekening);
                        $('#detilrekeningH').val(dt.iddetilrekening);
                        $('#keteranganTB').val(dt.keterangan);
                        cmbdepartemen('form',dt.departemen);
                        cmbtingkat('form',dt.tingkat);
                    });
                }
            }
        });
    }

/*headinfo*/
    // detil anggaran
        function vwHeadDetilAnggaran (id) {
            var u = dir;
            var d = 'aksi=headinfo&subaksi=detilanggaran&kategorianggaran='+id;
            ajax(u,d).done(function(dt){
                if (dt.status!='sukses') {
                    alert(dt.status+' memuat data header');
                }else{
                    $('#d_kategorianggaranH').val(id);
                    $('#d_kategorianggaranDV').html(dt.nama);
                    $('#d_keteranganDV').html(dt.keterangan);
                    $('#d_katanggkuotanumDV').html('Rp. '+parseInt(dt.katAnggKuotaNum).setCurr());
                    $('#d_departemenDV').val(dt.departemen);
                    $('#d_tingkatDV').html(dt.tingkat);
                    $('.tahunBulan1').html(th1);
                    $('.tahunBulan2').html(th2);
                    viewTB('detilanggaran');
                    switchPN(2);
                }
            });
        }

    // unit barang
        function vwHeadBarang (id) {
            $.ajax({
                url:dir,
                type:'post',
                dataType:'json',
                data:'aksi=headinfo&subaksi=barang&katalog='+id,
                success:function (dt) {
                    if (dt.status!='sukses') {
                        notif(dt.status,'red');
                    }else{
                        $('#b_katalogDV').html(dt.data.katalog);
                        $('#b_grupDV').html(dt.data.grup);
                        $('#b_lokasiDV').html(dt.data.lokasi);
                        $('#b_totbarangDV').html(dt.data.totbarang+' unit');
                        $('#b_totasetDV').html('Rp. '+dt.data.totaset+',-');
                        $('#b_susutDV').html(dt.data.susut+' %');
                        $('#b_namaTB').html(dt.data.katalog);
                        var img;
                        if(dt.data.photo2!=''){
                            img='../img/upload/'+dt.data.photo2;
                        }else{
                            img='../img/no_image.jpg';
                        }
                        
                        $('#b_photoIMG').attr('src',img);

                        $('#b_katalogH2').val(id);
                        $('#b_katalogTB').val(dt.data.katalog);
                    }
                },
            });
        }
    //end of unit barang

/*reset form*/
    //grup  ---
        function gkosongkan(){
            $('#idformTB').val('');
            $('#g_kodeTB').val('');
            $('#g_namaTB').val('');
            $('#g_utotalTB').val('');
            $('#g_utersediaTB').val('');
            $('#g_udipinjamTB').val('');
            $('#g_keteranganTB').val('');
        }
    //end of grup ---

    //katalog  ---
        function kkosongkan(){
            $('#k_idformTB').val('');
            $('#k_lokasiTB').val('');
            $('#k_grupTB').val('');
            $('#k_kodeTB').val('');
            $('#k_namaTB').val('');
            $('#k_jenisTB').val('');
            $('#k_susutTB').val('');
            $('#k_photoTB').val('');
        }
    //end of katalog ---

    //barang  ---
        function bkosongkan(){
            $('#k_idformTB').val('');
            $('#b_tempatB').val('');
            $('#b_barkodeTB').val('');
            $('#b_kodeTB').val('');
            $('#b_hargaTB').val('');
            $('#b_kondisiTB').val('');
            $('input[name="b_sumberTB"]').val('');
            $('#b_keteranganTB').val('');
        }
    //end of barang ---

// ajax
    function ajax(u,d){
        return $.ajax({
            url:u,
            data:d,
            dataType:'json',
            type:'post'
        });
    }
// departemen ---
    function cmbdepartemen(typ,dep){
        var u = dir3;
        var d = 'aksi=cmb'+mnu3;
        ajax(u,d).done(function(dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.departemen, function(id,item){
                	out+='<option '+((dep!='' && dep==item.replid)?'selected':'')+' value="'+item.replid+'">'+item.nama+'</option>';
                });
            }
            if(typ=='form'){ //form 
            	$('#departemenTB').html('<option value="">-Pilih Departemen-</option>'+out);
            }else{ // filter
                $('#departemenS').html(out);
                cmbtingkat('filter','');
            }
        });
    }

// combo tingkat ---
    function cmbtingkat(typ,ting){
        u =dir5;
        d ='aksi=cmb'+mnu5+'&departemen='+$('#departemenS').val();
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.tingkat.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.tingkat, function(id,item){
                        out+='<option '+((ting!='' && ting==item.replid)?'selected':'')+' value="'+item.replid+'">'+item.tingkat+' </option>';
                    });
                }
            }
            if(typ=='filter'){ // filter
                $('#tingkatS').html(out);
                viewTB();
            }else{ // form 
                $('#tingkatTB').html('<option value="">-Pilih Tingkat-</option>'+out);
            }
        });
    }
//end of combo tingkat ----

function tempatupdate (e) {
    $('#b_tempatTB').val($(e).val());
    if($('#b_idformH').val()!='') //edit
        kodegenerate($('#b_idformH').val());
    else //add
        kodegenerate('');
}

function jumupdate (e) {
    $('#b_jumbarangTB').val($(e).val());
    if($('#b_idformH').val()!='') //edit
        kodegenerate($('#b_idformH').val());
    else //add
        kodegenerate('');
}

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

// input uang --------------------------
    function inputangka(e) {
        $(e).maskMoney({
            precision:0,
            // affixesStay: true
        });
    }

// get uang --------------------------
    function getuang(e) {
        // var x =$(e).maskMoney('unmasked')[0];
        var x =$(e).val();
        var y = x.replace(/[r\.]/g, '');
        return y;
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

//end of  print to PDF -------
    function printPDF(mn){
        var par='',tok='',p,v;
        $('.'+(mn=='anggaran' || mn=='anggaran2'?'anggaran':mn)+'_cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });var x  = $('#id_loginS').val();
        var token = encode64(x+tok);
        console.log('para = '+par);
        console.log('tok = '+x+tok);
        console.log('token = '+token);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }

// hitung semua
    function hitungAll () {
        jmlHrg();
        totJml();
        totJmlHrg();
    }

// hitung jumlah x harga satuan (@bulan) [horizontal]
    function jmlHrg() {
        var hrgSatuan = getCurr($('#d_hargasatuanTB').val());
        $('.d_idnominal').each(function () {
            var jml    = getCurr($('#d_jml'+$(this).val()+'TB').val());
            var jmlHrg = 'Rp. '+(jml * hrgSatuan).setCurr();
            $('#d_jmlHrg'+$(this).val()+'TD').html(jmlHrg);
        });
    }

// hitung total jumlah [vertikal]
    function totJml(){
        var ret=0;
        $('.d_jml').each(function () {
            var jml = getCurr($(this).val());
            ret+=jml;
        });
        $('#d_totJmlTD').html(ret);
    }

// hitung total dr. (jumlah x harga satuan) [vertikal]   
    function totJmlHrg(){
        var ret=0;
        $('.d_jmlHrg').each(function () {
            var jmlHrg = getCurr($(this).html());
            ret+=jmlHrg;
        });
        $('#d_totJmlHrgTD').html('Rp. '+ret.setCurr());
    }
    
// currency to number (ex : Rp. 500.000 -> 500000)
    function getCurr(n){  
        var x = Number(n.replace(/[^0-9]+/g,""));
        return x;
    }

    // number to currency (ex : 500000 -> 500.000)  
    Number.prototype.setCurr=function(){
        return this.toFixed(0).replace(/(\d)(?=(\d{3})+\b)/g,'$1.');
    }


// detil anggaran  ------------------------------
    var iDetilAnggaranTR = 1;
    var iDetilAnggaranDelTR = [];
    var iDetilAnggaranAddTR = [];
    function detilAnggaranFC(arr){
        var tr='';
        var isLoop=true;
        if(typeof arr=='undefined'){ isLoop=false; n=iDetilAnggaranTR;}
        else{n=arr.length;}

        for(var i=n; i>=iDetilAnggaranTR; i--){
            var ke = parseInt(i)-1;
            var idDetilAnggaran = (typeof arr!='undefined')?arr[ke].replid:'';
            var detilAnggaran   = (typeof arr!='undefined')?arr[ke].detilAnggaran:'';
            var keterangan      = (typeof arr!='undefined')?arr[ke].keterangan:'';

            tr+='<tr class="detilAnggaranTR" id="detilAnggaranTR_'+ke+'">'
                +'<td align="center">'
                    +'<input type="hidden" value="'+ke+'" id="idDetilAnggaran'+ke+'TR" name="idDetilAnggaranTR[]">' // array acuan
                    +'<input type="hidden" value="'+idDetilAnggaran+'" name="idDetilAnggaran'+ke+'TB">'
                    +'<input required placeholder="item anggaran"  name="detilAnggaran'+ke+'TB" id="detilAnggaran'+ke+'TB" value="'+detilAnggaran+'" required type="text" data-transform="input-control">'
                +'</td>'
                +'<td align="center"><input required placeholder="keterangan"  value="'+keterangan+'" name="keterangan'+ke+'TB" id="keterangan'+ke+'TB" type="text" data-transform="input-control"></td>'
                +'<td align="center"><a onclick="'+(idDetilAnggaran!=''?'if(confirm(\'melanjutkan untuk menghapus data?\')) detilAnggaranDel('+ke+',\''+idDetilAnggaran+'\',\'\');':'detilAnggaranDel('+ke+',\''+idDetilAnggaran+'\',\'\')')+'" href="#" class="button bg-white fg-red"><i class="icon-cancel-2"></a></i></td>'
            +'</tr>';
        }
        if(isLoop) iDetilAnggaranTR+=n;
        else iDetilAnggaranTR++;
        $('#detilAnggaranTBL').prepend(tr);
    }

// hapus item(detil anggaran ) yg terpilih
    function detilAnggaranDel(ke,iddetilanggaran){
        console.log('masuk del detil anggarann ');
        if(iddetilanggaran!='') iKontakDDelTR.push(iddetilanggaran); //jika ada hapus DB 
        $('#detilAnggaranTR_'+ke).fadeOut('slow',function(){
            $('#detilAnggaranTR_'+ke).remove();
        });
    } 
