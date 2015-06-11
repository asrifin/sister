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
        //form content
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
            //katalog
            d_contentFR +=' <div class="grid">'
                                +'<form autocomplete="off" style="overflow:scroll;height:600px;" onsubmit="detilanggaranSV(); return false;" id="detilanggaranFR">' 
                            
                                    // hidden 
                                    +'<input id="d_idformH" type="hidden">' 
                                    +'<input type="hidden" id="d_kategorianggaranH2" name="d_kategorianggaranH2"/>'
	                                +'<input type="hidden" id="d_tingkatH" name="d_tingkatH"/>'
                                    
                                    // nama anggaran
                                    +'<legend>Nama Anggaran</legend>'
		                            +'<div data-hint="nama anggaran" class="input-control text">'
		                                +'<input placeholder="Anggaran"  required type="text" name="d_namaTB" id="d_namaTB">'
		                                +'<button class="btn-clear"></button>'
		                            +'</div>'

                                    // tujuan
                                    +'<label>Tujuan</label>'
                                    +'<div class="input-control textarea">'
                                        +'<textarea placeholder="tujuan" name="d_keteranganTB" id="d_keteranganTB"></textarea>'
                                    +'</div>'
    
                                    // nominal angsuran anggaran
                                    +'<legend>Nominal (@bulan)</legend>'

                                    // ----------------------------------
                                    +'<label>Juli :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[7]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[7]" placeholder="Juli" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'

                                    +'<label>Agustus :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[8]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[8]" placeholder="Agustus" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'

                                    +'<label>September :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[9]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[9]" placeholder="September" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'

                                    +'<label>Oktober :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[10]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[10]" placeholder="Oktober" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'

                                    +'<label>November :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[11]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[11]" placeholder="November" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'

                                    +'<label>Desember :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[12]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[12]" placeholder="Desember" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'


                                    +'<label>Januari :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[1]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[1]" placeholder="Februari" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'
                                    
                                    +'<label>Februari :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[2]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[2]" placeholder="Februari" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'

                                    +'<label>Maret :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[3]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[3]" placeholder="Maret" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'

                                    +'<label>April :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[4]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[4]" placeholder="April" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'

                                    +'<label>Mei :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[5]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[5]" placeholder="Mei" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'

                                    +'<label>Juni :</label>'
                                    +'<div class="input-control text size5">'
                                        +'<input type="hidden" name="d_idnominalTB[6]" />'
                                        +'<input onkeyup="totAnggaran();" class="d_nominal text-right" name="d_nominalTB[6]" placeholder="Juni" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'
                                    // +'<hr />'

                                    // total
                                    +'<legend>Nominal (@tahun)</legend>'
                                    +'<div class="bg-red input-control text">'
                                        +'<input id="d_totNominalTB" onkeyup="perBulanAnggaran();" class="bg-yellow text-right" value="Rp. 0" onfocus="inputuang(this);" onclick="inputuang(this);" type="text" >'
                                    +'</div>'

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
                                $('#d_tingkatH').val($('#d_tingkatS').val());
                                $('#d_kategorianggaranH2').val($('#d_kategorianggaranH').val());
                                $('#d_idformH').val(id);
                                $('#d_namaTB').val(dt.data.nama);
                                $.each(dt.data.nomArr,function(id,item){
                                    console.log(id);
                                    var nom = parseInt(item.nominal);
                                    var idx = parseInt(id)+1;
                                    $('input[name="d_nominalTB['+idx+']"]').val('Rp. '+nom.setCurr());
                                    $('input[name="d_idnominalTB['+idx+']"]').val(item.replid);
                                });
                                $('#d_keteranganTB').val(dt.data.keterangan);
                                $('#d_totNominalTB').val('Rp. '+parseInt(dt.data.totNom).setCurr());
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
                if(typ=='filter') {
                    if(dep==''){
                        $('#a_tahunajaranS').html('<option value="">-SEMUA-</option>');
                        cmbtingkat('filter','');
                    }else{
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
    function getuang(e) {
        // var x =$(e).maskMoney('unmasked')[0];
        var x =$(e).val();
        var y = x.replace(/[r\.]/g, '');
        return y;
    }
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
        console.log('para = '+par);
        console.log('tok = '+x+tok);
        console.log('token = '+token);
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }
//end of  print to PDF -------
    

    // get total nominal rekening (ex : Rp. 500.000)
    function totAnggaran () {
        var tot1=0;
        $('.d_nominal').each(function() {
            tot1+=getCurr($(this).val());
        });$('#d_totNominalTB').val('Rp. '+tot1.setCurr());
        console.log(tot1);
    }

    function  perBulanAnggaran () {
        var x = getCurr($('#d_totNominalTB').val())/12;
        $('.d_nominal').each(function() {
            $(this).val('Rp. '+x.setCurr());
        });
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