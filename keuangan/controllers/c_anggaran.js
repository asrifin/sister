var mnu       ='anggaran'; 
var mnu2      ='tahunbuku'; 
var mnu3      ='departemen'; 
var mnu4      ='tahunajaran'; 
var mnu5      ='tingkat'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';
var dir3      ='../akademik/models/m_'+mnu3+'.php';
var dir4      ='../akademik/models/m_'+mnu4+'.php';
var dir5      ='../akademik/models/m_'+mnu5+'.php';

var a_contentFR = d_contentFR  ='';
    
// main function ---
    $(document).ready(function(){
        // anggaran
        a_contentFR += '<form autocomplete="off" onsubmit="anggaranSV();return false;" id="'+mnu+'FR">' 
                        // hidden input
                        +'<input id="a_idformH" type="hidden">' 
                        +'<input type="hidden" name="a_departemenH" id="a_departemenH">'
                        
                        // Departemen
                        +'<label>Departemen</label>'
                        +'<div class="input-control select">'
                            +'<select onchange="cmbtahunajaran(\'form\',this.value,\'\');" required type="text" id="a_departemenTB"></select>'
                        +'</div>'

                        // Tahun Ajaran
                        +'<label>Tahun Ajaran</label>'
                        +'<div class="input-control select">'
                            +'<select  onchange="cmbtingkat(\'form\',this.value,\'\');" required type="text" id="a_tahunajaranTB"></select>'
                        +'</div>'

                        // Tingkat 
                        +'<label>Tingkat</label>'
                        +'<div class="input-control select">'
                            +'<select required type="text" name="a_tingkatTB" id="a_tingkatTB"></select>'
                        +'</div>'

                        // nama kategori anggaran
                        +'<label>Kategori Anggaran</label>'
                        +'<div class="input-control text">'
                            +'<input  placeholder="Kategori Anggaran" required type="text" name="a_namaTB" id="a_namaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // rekening
                        +'<label>Rekening</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" required id="a_rekeningH" name="a_rekeningH" />'
                            +'<input onfocus="autoSuggest(\'a_rekening\');" placeholder="Rekening" required type="text" name="a_rekeningTB" id="a_rekeningTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // keterangan
                        +'<label>Tujuan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="tujuan" name="a_keteranganTB" id="a_keteranganTB"></textarea>'
                        +'</div>'
                        
                        // button simpan
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';
        //detail anggaran 
        d_contentFR +=' <div class="grid">'
                            +'<form autocomplete="off" style="overflow:scroll;height:600px;" onsubmit="detilanggaranSV(); return false;" id="detilanggaranFR">' 
                        
                                // hidden 
                                +'<input id="d_idformH" type="hidden">' 
                                +'<input type="hidden" id="d_kategorianggaranH2" name="d_kategorianggaranH2"/>'
                                // +'<input type="hidden" id="d_tingkatH" name="d_tingkatH"/>'
                                
                                // nama anggaran
                                +'<label>Nama Anggaran</label>'
	                            +'<div data-hint="nama anggaran" class="input-control text">'
	                                +'<input placeholder="Anggaran"  required type="text" name="d_namaTB" id="d_namaTB">'
	                                +'<button class="btn-clear"></button>'
	                            +'</div>'

                                // tujuan
                                +'<label>Tujuan</label>'
                                +'<div class="input-control textarea">'
                                    +'<textarea placeholder="tujuan" name="d_keteranganTB" id="d_keteranganTB"></textarea>'
                                +'</div>'

                                +'<label>harga satuan :</label>'
                                +'<div class="input-control text">'
                                    +'<input required onkeyup="hitungAll();" class="text-right" name="d_hargasatuanTB" id="d_hargasatuanTB" placeholder="harga satuan" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                +'</div>'

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
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="7" />'
                                                +'<input class="d_jml text-right" id="d_jml7TB" name="d_jml7TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg7TD">Rp. 0</td>'
                                    +'</tr>'
                                    
                                    // agustus
                                    +'<tr>'
                                        +'<td>agustus</td>'
                                        +'<td>'
                                            +'<div val="8" class="input-control text">'
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="8" />'
                                                +'<input class="d_jml text-right" id="d_jml8TB" name="d_jml8TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg8TD">Rp. 0</td>'
                                    +'</tr>'

                                    // September
                                    +'<tr>'
                                        +'<td>September</td>'
                                        +'<td>'
                                            +'<div val="9" class="input-control text">'
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="9" />'
                                                +'<input class="d_jml text-right" id="d_jml9TB" name="d_jml9TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg9TD">Rp. 0</td>'
                                    +'</tr>'

                                    // Oktober
                                    +'<tr>'
                                        +'<td>Oktober</td>'
                                        +'<td>'
                                            +'<div val="10" class="input-control text">'
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="10" />'
                                                +'<input class="d_jml text-right" id="d_jml10TB" name="d_jml10TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg10TD">Rp. 0</td>'
                                    +'</tr>'

                                    // November
                                    +'<tr>'
                                        +'<td>November</td>'
                                        +'<td>'
                                            +'<div val="11" class="input-control text">'
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="11" />'
                                                +'<input class="d_jml text-right" id="d_jml11TB" name="d_jml11TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg11TD">Rp. 0</td>'
                                    +'</tr>'

                                    // Desember
                                    +'<tr>'
                                        +'<td>Desember</td>'
                                        +'<td>'
                                            +'<div val="12" class="input-control text">'
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="12" />'
                                                +'<input class="d_jml text-right" id="d_jml12TB" name="d_jml12TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg12TD">Rp. 0</td>'
                                    +'</tr>'

                                    // Januari
                                    +'<tr>'
                                        +'<td>Januari</td>'
                                        +'<td>'
                                            +'<div val="1" class="input-control text">'
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="1" />'
                                                +'<input class="d_jml text-right" id="d_jml1TB" name="d_jml1TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg1TD">Rp. 0</td>'
                                    +'</tr>'

                                    // Februari
                                    +'<tr>'
                                        +'<td>Februari</td>'
                                        +'<td>'
                                            +'<div val="2" class="input-control text">'
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="2" />'
                                                +'<input class="d_jml text-right" id="d_jml2TB" name="d_jml2TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg2TD">Rp. 0</td>'
                                    +'</tr>'

                                    // Maret
                                    +'<tr>'
                                        +'<td>Maret</td>'
                                        +'<td>'
                                            +'<div val="3" class="input-control text">'
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="3" />'
                                                +'<input class="d_jml text-right" id="d_jml3TB" name="d_jml3TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg3TD">Rp. 0</td>'
                                    +'</tr>'

                                    // April
                                    +'<tr>'
                                        +'<td>April</td>'
                                        +'<td>'
                                            +'<div val="4" class="input-control text">'
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="4" />'
                                                +'<input class="d_jml text-right" id="d_jml4TB" name="d_jml4TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg4TD">Rp. 0</td>'
                                    +'</tr>'

                                    // Mei
                                    +'<tr>'
                                        +'<td>Mei</td>'
                                        +'<td>'
                                            +'<div val="5" class="input-control text">'
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="5" />'
                                                +'<input class="d_jml text-right" id="d_jml5TB" name="d_jml5TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg5TD">Rp. 0</td>'
                                    +'</tr>'

                                    // Juni
                                    +'<tr>'
                                        +'<td>Juni</td>'
                                        +'<td>'
                                            +'<div val="6" class="input-control text">'
                                                +'<input class="d_idnominal" type="hidden" name="d_idnominalH[]" value="6" />'
                                                +'<input class="d_jml text-right" id="d_jml6TB" name="d_jml6TB" onkeyup="hitungAll();" onfocus="inputangka(this);"  required value="0"  type="text" >'
                                            +'</div>'
                                        +'</td>'
                                        +'<td class="d_jmlHrg" align="right" id="d_jmlHrg6TD">Rp. 0</td>'
                                    +'</tr>'

                                    // total 
                                    +'<tr class="fg-white bg-blue">'
                                        +'<th>Total</th>'
                                        +'<th align="right" id="d_totJmlTD">12</th>'
                                        +'<th align="right" id="d_totJmlHrgTD">Rp. 0</th>'
                                    +'</tr>'
                                +'</table>'

                                // button simpan
	                            +'<div class="form-actions">' 
	                                +'<button class="button primary">simpan</button>&nbsp;'
	                            +'</div>'
                            +'</form>'
                    +'</div>';
        cmbdepartemen('filter','');

        // button action
            //add---------
            $("#a_tambahBC").on('click', function(){ // grup form 
                loadFR('anggaran','');
                // anggaranFR('');
            });$("#d_tambahBC").on('click', function(){ // katalog
                detilanggaranFR('');
            });

            //print----
            $('#a_cetakBC').on('click',function(){
                printPDF('anggaran');
            });$('#a_cetak2BC').on('click',function(){
                printPDF('anggaran2');
            });$('#k_cetakBC').on('click',function(){
                printPDF('detilanggaran');
            });

            // search 
            //kategori anggaran ----
            $('#a_cariBC').on('click',function(){
                $('#a_cariTR').toggle('slow');
                $('#a_namaS').val('');
                $('#a_nominalS').val('');
                $('#a_keteranganS').val('');
            });
            //detil anggaran ----
            $('#k_cariBC').on('click',function(){
                $('#k_cariTR').toggle('slow');
                $('#k_kodeS').val('');
                $('#k_namaS').val('');
                $('#k_keteranganS').val('');
            });
            // barang----
            $('#b_cariBC').on('click',function(){
                $('#b_cariTR').toggle('slow').addClass('info').setTimeout(function(){
                    $('#b_cariTR').removeClass('info');
                },2000);
                $('#b_kodeS').val('');
                $('#b_barkodeS').val('');
                $('#b_namaS').val('');
                $('#b_keteranganS').val('');
            });

        //search action 
            /*kategori anggaran*/
            // filtering : combobox
            $('#a_departemenS').on('change',function(){
                cmbtahunajaran('filter',$(this).val(),'');
            });
            // filtering : textbox
            $('#a_namaS,#a_keteranganS,#a_rekeningS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13) viewTB('anggaran');
            });

            // detil anggaran 
            /*combo*/ 
            $('#a_tahunajaranS').on('change',function(){
                cmbtingkat('filter',$(this).val(),'');
            });
            $('#a_tingkatS').on('change',function(){
                viewTB('anggaran');
            });
            /*textbox*/
            $('#d_namaS,#d_keteranganS,#d_nominalS').on('keydown',function (e){
                if(e.keyCode == 13) viewTB('detilanggaran'); 
            });

            // unit barang
            $('#b_kondisiS').on('change',function(){
                vwBarang($('#b_katalogS').val());
            });
            $('#b_kodeS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogS').val());
            });$('#b_namaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogS').val());
            });$('#b_barkodeS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogS').val());
            });$('#b_sumberS').on('change',function (){ // nama grup
                vwBarang($('#b_katalogS').val());
            });$('#b_hargaS').on('keydown',function (e){ // nama grup
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogS').val());
            });$('#b_kondisiS').on('change',function (){ // nama grup
                vwBarang($('#b_katalogS').val());
            });$('#b_statusS').on('change',function (){ // nama grup
                vwBarang($('#b_katalogS').val());
            });$('#b_keteranganS').on('keydown',function (e){ // keterangan
                if(e.keyCode == 13)
                    vwBarang($('#b_katalogS').val());
            });

        // switch panel
            switchPN(1);
            // back button
            $('#d_kategorianggaranBC').on('click',function(){ // << grup
                viewTB('anggaran');
                switchPN(1);
            });
    }); 
// end of main function ---
    
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
            }
            // if($('#d_rekeningH').val()==''){
            // 	notif('silahkan mengisi "Rekening" dengan benar');
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
        function anggaranSV(){
            var urlx ='&aksi=simpan&subaksi=anggaran';
            // edit mode
            if($('#a_idformH').val()!=''){
                urlx += '&replid='+$('#a_idformH').val();
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
                        gkosongkan();
                        viewTB('anggaran');
                        cont = 'Berhasil menyimpan data';
                        clr  = 'green';
                    }notif(cont,clr);
                }
            });
        }
    //end kategori anggaran save  ---

/*delete*/
    //detil anggaran  ---
        function detilanggaranDel(id){
            if(confirm('melanjutkan untuk menghapus data?'))
            $.ajax({
                url:dir,
                type:'post',
                data:'aksi=hapus&subaksi=detilanggaran&replid='+id,
                dataType:'json',
                success:function(dt){
                    var cont,clr;
                    if(dt.status!='sukses'){
                        cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                        clr  ='red';
                    }else{
                        viewTB('detilanggaran');
                        cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                        clr  ='green';
                    }notif(cont,clr);
                }
            });
        }
    //end of detil  anggaran ---
    
    //kategori anggaran  ---
        function anggaranDel(id){
            if(confirm('melanjutkan untuk menghapus data?'))
            $.ajax({
                url:dir,
                type:'post',
                data:'aksi=hapus&subaksi=anggaran&replid='+id,
                dataType:'json',
                success:function(dt){
                    var cont,clr;
                    if(dt.status!='sukses'){
                        cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                        clr  ='red';
                    }else{
                        viewTB('anggaran');
                        cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                        clr  ='green';
                    }notif(cont,clr);
                }
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
                'label':'Rekening'
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
    function loadFR(typx,id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '100%',
            padding: 10,
            onShow: function(){
                var titl=contenFR='';
                if(typx=='anggaran') {
                    contentFR=a_contentFR;
                    titl+='Anggaran';
                }else{
                    contentFR=d_contentFR;
                    titl+='Detail Anggaran';
                }
                $.Dialog.title('<i class="fg-white icon-'+(id!=''?'pencil':'plus-2')+'"></i> '+(id!=''?' Ubah ':' Tambah ')+titl); 
                $.Dialog.content(contentFR);
            
                if(typx=='anggaran') {
                    if(id==''){ //tambah
                        
                        cmbdepartemen('form','');
                        cmbtahunajaran('form','','');
                        cmbtingkat('form','','');
                    }else{ // edit
                        setTimeout(function(){
                            var u = dir;
                            var d = 'aksi=ambiledit&subaksi=anggaran&replid='+id;
                            ajax(u,d).done(function (dt) {
                                $('#a_idformH').val(id);
                                $('#a_namaTB').val(dt.nama);
                                $('#a_rekeningTB').val(dt.rekening);
                                $('#a_rekeningH').val(dt.idrekening);
                                $('#a_keteranganTB').val(dt.keterangan);
                                cmbdepartemen('form',dt.departemen);
                                cmbtahunajaran('form',dt.departemen,dt.tahunajaran);
                                cmbtingkat('form',dt.tahunajaran,dt.tingkat);
                            });
                        },200);
                    }
                }else{

                } 
            }
        });
    }


/*form (insert & update)*/
    // form katalog---
        function detilanggaranFR(id){
	        $.Dialog({
	            shadow:true,
	            overlay:true,
	            draggable:true,
	            height:'auto',
	            width:450,
	            padding:20,
	            onShow: function(){
	                var titlex;
	                if (id!='') { // edit mode
	                    $.ajax({
	                        url:dir,
	                        data:'aksi=ambiledit&subaksi=detilanggaran&replid='+id,
	                        type:'post',
	                        dataType:'json',
	                        success:function(dt){
                                $('#d_kategorianggaranH2').val($('#d_kategorianggaranH').val());
                                $('#d_idformH').val(id);
                                $('#d_namaTB').val(dt.data.nama);
                                $('#d_keteranganTB').val(dt.data.keterangan);
                                $('#d_hargasatuanTB').val('Rp. '+parseInt(dt.data.hargasatuan).setCurr());
                                $('#d_totJmlTD').html(dt.data.totJml);
                                $('#d_totJmlHrgTD').html('Rp. '+parseInt(dt.data.totJmlHrg).setCurr());
                                $.each(dt.data.nomArr,function(id,item){
                                    var bulan  = item.bulan;
                                    var jml    = item.jml;
                                    var jmlHrg = parseInt(item.jmlHrg);
                                    $('#d_jml'+bulan+'TB').val(jml);
                                    $('#d_jmlHrg'+bulan+'TD').html('Rp. '+jmlHrg.setCurr());
                                });
                            }
                        });titlex='<span class="icon-pencil"></span> Ubah ';
                    }else{ //add mode
                        titlex='<span class="icon-plus-2"></span> Tambah ';
                        setTimeout(function(){
                            $('#d_tingkatH').val($('#d_tingkatS').val());
                            $('#d_kategorianggaranH2').val($('#d_kategorianggaranH').val());
                        },500);
	                }
                	$.Dialog.title(titlex+' '+mnu);
                	$.Dialog.content(d_contentFR);
	            }
	        });
        }
    // end of form katalog---

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
                    $('#d_tahunajaranDV').html(dt.tahunajaran);
                    $('#d_tingkatDV').html(dt.tingkat);
                    var th1 = dt.tahunajaran.substr(0,3);
                    var th2 = dt.tahunajaran.substr(5,8);
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
                	$('#a_departemenTB').html('<option value="">-SEMUA-</option>'+out);
	                // $('#a_kategorianggaranH2').val($('#a_kategorianggaranH').val());
	                // $('#a_kategorianggaranTB').val($('#a_kategorianggaranDV').html());
                }else{ // filter
                    $('#a_departemenS').html('<option value="">-SEMUA-</option>'+out);
                    if(dep==''){// tidak pilih 
                        cmbtahunajaran('filter','');
                        viewTB('anggaran');
                    } else {// pilih 
                        cmbtahunajaran('filter',dep);
                        viewTB('anggaran');
                    } 
                }
            });
        }
    //end of departemen ---

    // combo tahunajaran ---
        function cmbtahunajaran(typ,dep,thn){
            var u = dir4;
            var d = 'aksi=cmb'+mnu4+(dep!=''?'&departemen='+dep:'');
            ajax(u,d).done(function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    if(dt.tahunajaran.length==0){
                        out+='<option value="">kosong</option>';
                    }else{
                        $.each(dt.tahunajaran, function(id,item){
                            out+='<option '+((thn!='' && thn==item.replid)?'selected':'')+' value="'+item.replid+'">'+item.tahunajaran+(item.aktif=='1'?' (aktif)':'')+'</option>';
                        });
                    }
                }
                if(typ=='filter') { // filtering 
                    if(dep==''){ // add
                        $('#a_tahunajaranS').html('<option value="">-SEMUA-</option>');
                        cmbtingkat('filter','');
                    }else{ // edit
                        $('#a_tahunajaranS').html('<option value="">-SEMUA-</option>'+out);
                        cmbtingkat('filter',dt.tahunajaran[0].replid);
                    }
                }else{ //form
                    if(dep!='') // edit
                        $('#a_tahunajaranTB').html('<option value="">-Pilih Tahun Ajaran-</option>'+out);
                    else // add
                        $('#a_tahunajaranTB').html('<option value="">-Pilih Departemen-</option>');
                }
            });
        }
    //end of combo tahunajaran ----

    // combo tingkat ---
        function cmbtingkat(typ,thn,ting){
            u =dir5;
            d ='aksi=cmb'+mnu5+(thn!=''?'&tahunajaran='+thn:'');
            ajax(u,d).done(function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    if(dt.tingkat.length==0){
                        out+='<option value="">kosong</option>';
                    }else{
                        $.each(dt.tingkat, function(id,item){
                            out+='<option '+((ting!='' && ting==item.replid)?'selected':'')+' value="'+item.replid+'">'+item.keterangan+' ('+item.tingkat+') </option>';
                        });
                    }
                }
                if(typ=='filter'){ // filter
                    if(thn==''){
                        $('#a_tingkatS').html('<option value="">-SEMUA-</option>');
                        viewTB('anggaran');
                    }else{
                        $('#a_tingkatS').html('<option value="">-SEMUA-</option>'+out);
                        viewTB('anggaran');
                    }
                }else{ // form 
                    if(thn!='') // edit
                        $('#a_tingkatTB').html('<option value="">-Pilih Tingkat-</option>'+out);
                    else // add
                        $('#a_tingkatTB').html('<option value="">-Pilih Tahun Ajaran-</option>');
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