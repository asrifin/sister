var mnu  ='anggarantahunan'; 
var mnu2 ='kategorianggaran'; 
var mnu3 ='departemen'; 
var mnu4 ='detilanggaran'; 
var mnu5 ='tingkat'; 
var mnu6 ='tahunajaran'; 

var dir  ='models/m_'+mnu+'.php';
var dir2 ='models/m_'+mnu2+'.php';
var dir3 ='../akademik/models/m_'+mnu3+'.php';
var dir4 ='../akademik/models/m_'+mnu4+'.php';
var dir5 ='../akademik/models/m_'+mnu5+'.php';
var dir6 ='../akademik/models/m_'+mnu6+'.php';

var contentFR ='';
    
// main function ---
    $(document).ready(function(){
        // anggaran
        contentFR += '<form style="overflow:scroll;height:500px;" autocomplete="off" onsubmit="simpanSV();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                         // header 
                        +'<table class="table xbordered">'
                            +'<tr>'
                                +'<td class="size2">Departemen</td>'
                                +'<td id="departemenTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Tingkat</td>'
                                +'<td id="tingkatTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Kategori Anggaran </td>'
                                +'<td id="kategorianggaranTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Tahun Ajaran </td>'
                                +'<td id="tahunajaranTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Detil Anggaran </td>'
                                +'<td id="detilanggaranTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Keterangan </td>'
                                +'<td id="keteranganTD"></td>'
                            +'</tr>'
                            +'<tr>'
                                +'<td>Harga Satuan </td>'
                                +'<td>'
                                    +'<input onkeyup="hitungAll();" placeholder="harga satuan " onfocus="inputuang(this);" name="hargasatuanTB" id="hargasatuanTB" data-transform="input-control"  type="text" />'
                                +'</td>'
                            +'</tr>'
                        +'</table>'

                        // +'<label>Harga Satuan</label>'

                        // nominal anggaran 
                        +'<table class="table hovered bordered striped">'
                                // header
                                +'<tr class="fg-white bg-blue">'
                                    +'<th>Bulan</th>'
                                    +'<th>Jumlah</th>'
                                    +'<th>Harga Total</th>'
                                +'</tr>'
                                
                            // list 
                                // Juli
                                +'<tr>'
                                    +'<td>Juli</td>'
                                    +'<td>'
                                        +'<div val="7" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="7" />'
                                            +'<input class="jml text-right" id="jml7TB" name="jml7TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg7TD">Rp. 0</td>'
                                +'</tr>'
                                
                                // agustus
                                +'<tr>'
                                    +'<td>agustus</td>'
                                    +'<td>'
                                        +'<div val="8" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="8" />'
                                            +'<input class="jml text-right" id="jml8TB" name="jml8TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg8TD">Rp. 0</td>'
                                +'</tr>'

                                // September
                                +'<tr>'
                                    +'<td>September</td>'
                                    +'<td>'
                                        +'<div val="9" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="9" />'
                                            +'<input class="jml text-right" id="jml9TB" name="jml9TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg9TD">Rp. 0</td>'
                                +'</tr>'

                                // Oktober
                                +'<tr>'
                                    +'<td>Oktober</td>'
                                    +'<td>'
                                        +'<div val="10" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="10" />'
                                            +'<input class="jml text-right" id="jml10TB" name="jml10TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg10TD">Rp. 0</td>'
                                +'</tr>'

                                // November
                                +'<tr>'
                                    +'<td>November</td>'
                                    +'<td>'
                                        +'<div val="11" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="11" />'
                                            +'<input class="jml text-right" id="jml11TB" name="jml11TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg11TD">Rp. 0</td>'
                                +'</tr>'

                                // Desember
                                +'<tr>'
                                    +'<td>Desember</td>'
                                    +'<td>'
                                        +'<div val="12" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="12" />'
                                            +'<input class="jml text-right" id="jml12TB" name="jml12TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg12TD">Rp. 0</td>'
                                +'</tr>'

                                // Januari
                                +'<tr>'
                                    +'<td>Januari</td>'
                                    +'<td>'
                                        +'<div val="1" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="1" />'
                                            +'<input class="jml text-right" id="jml1TB" name="jml1TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg1TD">Rp. 0</td>'
                                +'</tr>'

                                // Februari
                                +'<tr>'
                                    +'<td>Februari</td>'
                                    +'<td>'
                                        +'<div val="2" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="2" />'
                                            +'<input class="jml text-right" id="jml2TB" name="jml2TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg2TD">Rp. 0</td>'
                                +'</tr>'

                                // Maret
                                +'<tr>'
                                    +'<td>Maret</td>'
                                    +'<td>'
                                        +'<div val="3" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="3" />'
                                            +'<input class="jml text-right" id="jml3TB" name="jml3TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg3TD">Rp. 0</td>'
                                +'</tr>'

                                // April
                                +'<tr>'
                                    +'<td>April</td>'
                                    +'<td>'
                                        +'<div val="4" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="4" />'
                                            +'<input class="jml text-right" id="jml4TB" name="jml4TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg4TD">Rp. 0</td>'
                                +'</tr>'

                                // Mei
                                +'<tr>'
                                    +'<td>Mei</td>'
                                    +'<td>'
                                        +'<div val="5" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="5" />'
                                            +'<input class="jml text-right" id="jml5TB" name="jml5TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg5TD">Rp. 0</td>'
                                +'</tr>'

                                // Juni
                                +'<tr>'
                                    +'<td>Juni</td>'
                                    +'<td>'
                                        +'<div val="6" class="input-control text">'
                                            +'<input class="idnominal" type="hidden" name="idnominalH[]" value="6" />'
                                            +'<input class="jml text-right" id="jml6TB" name="jml6TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                        +'</div>'
                                    +'</td>'
                                    +'<td class="jmlHrg" align="right" id="jmlHrg6TD">Rp. 0</td>'
                                +'</tr>'

                                // total 
                                +'<tr class="fg-white bg-blue">'
                                    +'<th>Total</th>'
                                    +'<th align="right" id="totJmlTD">12</th>'
                                    +'<th align="right" id="totJmlHrgTD">Rp. 0</th>'
                                +'</tr>'
                            +'</table>'

                        // button simpan
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';
        cmbdepartemen('filter','');

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
        $('#keteranganS,#detilanggaranS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB();
        });//combo box
        $('#tahunajaranS').on('change',function (){ // kode grup
            viewTB();
        });
        $('#kategorianggaranS').on('change',function (){ // kode grup
            cmbtahunajaran('filter','')
        });
        $('#departemenS,#tingkatS').on('change',function (){ // kode grup
             cmbkategorianggaran('filter','');
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
                viewTB();
                cont = 'Berhasil menyimpan data';
                clr  = 'green';
            }notif(cont,clr);
        });
    }
    
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

    // load form 
    function viewFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '40%',
            padding: 10,
            onShow: function(){
                $.Dialog.title('<i class="fg-white icon-'+(id!=''?'pencil':'plus-2')+'"></i> '+(id!=''?' Ubah ':' Tambah ')+' Anggaran'); 
                $.Dialog.content(contentFR);
            
                var u = dir;
                var d = 'aksi=ambiledit&replid='+id;
                ajax(u,d).done(function (dt) {
                    $('#idformH').val(id);
                    cmbdepartemen('form',dt.departemen);
                    cmbtahunajaran('form',dt.tahunajaran);
                    cmbtingkat('form',dt.tingkat);
                    cmbkategorianggaran('form',dt.kategorianggaran);
                    $('#detilanggaranTD').html(': '+dt.detilanggaran);
                    $('#keteranganTD').html(': '+dt.keterangan);
                    $('#hargasatuanTB').val(dt.hargasatuan);
                    $('#totJmlTD').html(dt.totJml);
                    $('#totJmlHrgTD').html(dt.totJmlHrg);

                    $.each(dt.nominalArr,function (id,item){
                        $('#jml'+item.bulan+'TB').val(item.jml);
                        $('#jmlHrg'+item.bulan+'TD').html(item.jmlHrg);
                    })
                });
            }
        });
    }


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
        var d = 'aksi=cmb'+mnu3+(dep!=''?'&replid='+dep:'');
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
                $('#departemenTD').html(': '+dt.departemen[0].nama);
                cmbtingkat('form','');
            }else{ // filter
                $('#departemenS').html(out);
                cmbtingkat('filter','');
            }
        });
    }

// combo kategorianggaran ---
    function cmbkategorianggaran(typ,ting){
        u =dir2;
        d ='aksi=cmb'+mnu2+'&departemen='+$('#departemenS').val()+'&tingkat='+$('#tingkatS').val();
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.kategorianggaran.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.kategorianggaran, function(id,item){
                        out+='<option '+((ting!='' && ting==item.replid)?'selected':'')+' value="'+item.replid+'">'+item.kategorianggaran+' </option>';
                    });
                }
            }
            if(typ=='filter'){ // filter
                $('#kategorianggaranS').html(out);
                cmbtahunajaran('filter','');
            }else{ // form 
                $('#kategorianggaranTD').html(': '+dt.kategorianggaran[0].kategorianggaran);
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
                cmbkategorianggaran('filter','');
            }else{ // form 
                $('#tingkatTD').html(': '+dt.tingkat[0].tingkat);
                cmbkategorianggaran('form','');
            }
        });
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

// tahunajaran ---
    function cmbtahunajaran(typ,thn){
        var u = dir6;
        var d = 'aksi=cmb'+mnu6+(thn!=''?'&eplid='+thn:'');
        ajax(u,d).done(function(dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    var ta = item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1);
                    out+='<option '+((thn!='' && thn==item.replid)?'selected':'')+' value="'+item.replid+'">'+ta+'</option>';
                });
            }
            if(typ=='form'){ //form 
                var t = dt.tahunajaran[0].tahunajaran;
                var ta =t+' - '+(parseInt(t)+1);
                $('#tahunajaranTD').html(': '+ta);
            }else{ // filter
                $('#tahunajaranS').html(out);
                viewTB();
            }
        });
    }
    function inputuang(e) {
        $(e).maskMoney({
            precision:0,
            prefix:'Rp. ', 
            thousands:'.', 
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
// hitung semua
    function hitungAll () {
        jmlHrg();
        totJml();
        totJmlHrg();
    }

// hitung jumlah x harga satuan (@bulan) [horizontal]
    function jmlHrg() {
        var hrgSatuan = getCurr($('#hargasatuanTB').val());
        $('.idnominal').each(function () {
            var jml    = getCurr($('#jml'+$(this).val()+'TB').val());
            var jmlHrg = 'Rp. '+(jml * hrgSatuan).setCurr();
            $('#jmlHrg'+$(this).val()+'TD').html(jmlHrg);
        });
    }

// hitung total jumlah [vertikal]
    function totJml(){
        var ret=0;
        $('.jml').each(function () {
            var jml = getCurr($(this).val());
            ret+=jml;
        });
        $('#totJmlTD').html(ret);
    }

// hitung total dr. (jumlah x harga satuan) [vertikal]   
    function totJmlHrg(){
        var ret=0;
        $('.jmlHrg').each(function () {
            var jmlHrg = getCurr($(this).html());
            ret+=jmlHrg;
        });
        $('#totJmlHrgTD').html('Rp. '+ret.setCurr());
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
