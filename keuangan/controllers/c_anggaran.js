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

var a_contentFR = d_contentFR = b_contentFR ='';
    
// main function ---
    $(document).ready(function(){
        //form content
            // anggaran
            a_contentFR += '<form autocomplete="off" onsubmit="anggaranSV();return false;" id="'+mnu+'FR">' 
                            +'<input id="a_idformH" type="hidden">' 
                            
                            +'<label>Departemen</label>'
                            +'<div class="input-control text">'
                                +'<input type="hidden" name="a_departemenH" id="a_departemenH">'
                                +'<input  placeholder="Departemen" readonly required type="text" name="a_departemenTB" id="a_departemenTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'

                            +'<label>Kategori Anggaran</label>'
                            +'<div class="input-control text">'
                                +'<input  placeholder="Kategori Anggaran"  required type="text" name="a_namaTB" id="a_namaTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'

                            +'<label>Rekening</label>'
                            +'<div class="input-control text">'
                                +'<input type="hidden" required id="a_rekeningH" name="a_rekeningH" />'
                                +'<input  placeholder="Rekening" required type="text" name="a_rekeningTB" id="a_rekeningTB">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'

                            +'<label>Keterangan</label>'
                            +'<div class="input-control textarea">'
                                +'<textarea placeholder="keterangan" name="a_keteranganTB" id="a_keteranganTB"></textarea>'
                            +'</div>'
                            
                            +'<div class="form-actions">' 
                                +'<button class="button primary">simpan</button>&nbsp;'
                                +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                            +'</div>'
                        +'</form>';
            //katalog
            d_contentFR +=' <div class="grid">'
                                +'<form autocomplete="off" onsubmit="detilanggaranSV(); return false;" id="detilanggaranFR">' 
                                    +'<input id="d_idformH" type="hidden">' 
                            
		                            // +'<label>Kategori Anggaran</label>'
		                            // +'<div class="input-control text">'
                                        +'<input type="hidden" id="d_kategorianggaranH2" name="d_kategorianggaranH2"/>'
		                                +'<input type="hidden" id="d_tingkatH" name="d_tingkatH"/>'
		                            //     +'<input type="text" disabled name="d_kategorianggaranTB" id="d_kategorianggaranTB">'
		                            //     +'<button class="btn-clear"></button>'
		                            // +'</div>'

                                    // +'<label>Departemen</label>'
                                    // +'<div class="input-control text">'
                                    //     +'<input  placeholder="departemen"  required type="text" name="d_departemenTB" id="d_departemenTB">'
                                    //     +'<button class="btn-clear"></button>'
                                    // +'</div>'
                                    
		                            +'<label>Nama Anggaran</label>'
		                            +'<div class="input-control text">'
		                                +'<input  placeholder="Anggaran"  required type="text" name="d_namaTB" id="d_namaTB">'
		                                +'<button class="btn-clear"></button>'
		                            +'</div>'
		                            
                                    +'<label>Nominal</label>'
                                        +'<div class="input-control text">'
                                        +'<input onfocus="inputuang(this);" onclick="inputuang(this);" placeholder="nominal" required type="text" name="d_nominalTB" id="d_nominalTB">'
                                        +'<button class="btn-clear"></button>'
                                    +'</div>'


		                            +'<label>Keterangan</label>'
		                            +'<div class="input-control textarea">'
		                                +'<textarea placeholder="keterangan" name="d_keteranganTB" id="d_keteranganTB"></textarea>'
		                            +'</div>'
		                            
		                            +'<div class="form-actions">' 
		                                +'<button class="button primary">simpan</button>&nbsp;'
		                                +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
		                            +'</div>'
                                +'</form>'
                        +'</div>';
            cmbdepartemen('filter','');
			// viewTB('anggaran');

        // button action
            //add---------
            $("#a_tambahBC").on('click', function(){ // grup form 
                anggaranFR('');
            });$("#d_tambahBC").on('click', function(){ // katalog
                detilanggaranFR('');
            });

            //print----
            $('#a_cetakBC').on('click',function(){
                printPDF('anggaran');
            });$('#k_cetakBC').on('click',function(){
                printPDF('katalog');
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
                viewTB('anggaran');
            });
            // filtering : textbox
            $('#a_namaS,#a_keteranganS,#a_rekeningS').on('keydown',function (e){ // kode grup
                if(e.keyCode == 13) viewTB('anggaran');
            });

            // detil anggaran 
            /*combo*/ 
            $('#d_tahunajaranS').on('change',function(){
                cmbtingkat('filter',$(this).val());
            });
            $('#d_tingkatS').on('change',function(){
                viewTB('detilanggaran');
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
                $(el2).html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table


    // kategori anggaran ---
/*        function vwAnggaran(){  
            var aksi ='aksi=tampil&subaksi=anggaran';
            var cari ='&a_namaS='+$('#a_namaS').val()
                    +'&a_keteranganS='+$('#a_keteranganS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#anggaran_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    setTimeout(function(){
                        $('#anggaran_tbody').html(dt).fadeIn();
                    },500);
                }
            });
        }
*/    // end of kategori anggaran  ---

    // katalog barang
/*        function vwDetilAnggaran() {
            var aksi ='aksi=tampil&subaksi=detilanggaran&d_kategorianggaranH='+$('#d_kategorianggaranH').val();
            var cari ='&d_namaS='+$('#d_namaS').val()
                        +'&d_departemenS='+$('#d_departemenS').val()
                        +'&d_keteranganS='+$('#d_keteranganS').val();
            $.ajax({
                url : dir,
                type: 'post',
                data: aksi+cari,
                beforeSend:function(){
                    $('#detilanggaran_tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
                },success:function(dt){
                    // $('#d_kategorianggaranH').val(id);
                    // switchPN(2);
                    setTimeout(function(){
                        $('#detilanggaran_tbody').html(dt).fadeIn();
                    },500);
                }
            });
        }   
*/    //end of  katalog barang

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
    
/*form (insert & update)*/
    // form kategori anggaran ---
        function anggaranFR(id){
            gkosongkan();
            $.Dialog({
                shadow: true,
                overlay: true,
                draggable: true,
                width: 500,
                padding: 10,
                onShow: function(){
                    var titlex;
                    if(id==''){  //add mode
                        titlex='<span class="icon-plus-2"></span> Tambah ';
                        setTimeout(function(){
                            $('#a_departemenH').val($('#a_departemenS').val());
                        },500);
                    }else{ // edit mode
                        titlex='<span class="icon-pencil"></span> Ubah';
                        $.ajax({
                            url:dir,
                            data:'aksi=ambiledit&subaksi=anggaran&replid='+id,
                            type:'post',
                            dataType:'json',
                            success:function(dt){
                                $('#a_departemenH').val($('#a_departemenS').val());
                                $('#a_idformH').val(id);
                                $('#a_namaTB').val(dt.nama);
                                $('#a_rekeningH').val(dt.idrekening);
                                $('#a_rekeningTB').val(dt.rekening);
                                $('#a_keteranganTB').val(dt.keterangan);
                            }
                        });//end of  data grup--------------------------
                    }$.Dialog.title(titlex+' '+mnu); // edit by epiii
                    $.Dialog.content(a_contentFR);
                }
            });
            $("#a_rekeningTB").combogrid({
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
                url: dir+'?aksi=autocomp',
                select: function( event, ui ) {
                    $('#a_rekeningH').val(ui.item.replid);
                    $(this).val(ui.item.nama);
                    
                    // validasi input (tidak sesuai data dr server)
                        $(this).on('keyup', function(e){
                            var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                            var keyCode = $.ui.keyCode;
                            if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                                if($('#a_rekeningH').val()!=''){
                                    $('#a_rekeningH').val('');
                                    $('#a_rekeningTB').val('');
                                }
                            }
                        });
                    return false;
                }
            });
        }
    // end of form grup ---

    // form katalog---
        function detilanggaranFR(id){
	        $.Dialog({
	            shadow:true,
	            overlay:true,
	            draggable:true,
	            height:'auto',
	            width:'35%',
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
                                $('#d_kategorianggaranH2').val($('#a_departemenS').val());
                                $('#d_idformH').val(id);
                                $('#d_namaTB').val(dt.data.nama);
                                $('#d_nominalTB').val(dt.data.nominal);
                                $('#d_keteranganTB').val(dt.data.keterangan);
                                // cmbdepartemen(dt.data.kategorianggaran,'form',dt.data.departemen);
                            }
                        });titlex='<span class="icon-pencil"></span> Ubah ';
                    }else{ //add mode
                        titlex='<span class="icon-plus-2"></span> Tambah ';
                        setTimeout(function(){
                            $('#d_tingkatH').val($('#d_tingkatS').val());
                            $('#d_kategorianggaranH2').val($('#a_departemenS').val());
                        },500);
	                }
                	$.Dialog.title(titlex+' '+mnu);
                	$.Dialog.content(d_contentFR);
	            }
	        });
	     //    $("#d_rekeningTB").combogrid({
	     //        debug:true,
	     //        width:'600px',
	     //        colModel: [{
	     //                // 'align':'left',
	     //                'columnName':'kode',
	     //                // 'hide':true,
	     //                'width':'15',
	     //                'label':'KODE'
	     //            },{   
	     //                'align':'left',
	     //                'columnName':'nama',
	     //                'width':'85',
	     //                'label':'NAMA'
	     //            }],
	     //        url: dir+'?aksi=autocomp',
	     //        select: function( event, ui ) {
	     //            $('#d_rekeningH').val(ui.item.replid);
	     //            $(this).val(ui.item.nama);
	                
	     //            // validasi input (tidak sesuai data dr server)
		    //             $(this).on('keyup', function(e){
						// 	var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
						// 	var keyCode = $.ui.keyCode;
						// 	if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
	     //            			if($('#d_rekeningH').val()!=''){
						// 			$('#d_rekeningH').val('');
						// 			$('#d_rekeningTB').val('');
						// 		}
						// 	}
						// });
	     //           	return false;
	     //        }
	     //    });
        }
    // end of form katalog---

/*headinfo*/
    // katalog
        function vwHeadDetilAnggaran (id) {
            $.ajax({
                url:dir,
                type:'post',
                dataType:'json',
                data:'aksi=headinfo&subaksi=detilanggaran&kategorianggaran='+id,
                success:function (dt) {
                    if (dt.status!='sukses') {
                        alert(dt.status+' memuat data header');
                    }else{
                        $('#d_kategorianggaranDV').html(dt.nama);
                        $('#d_keteranganDV').html(dt.keterangan);
                        $('#d_kategorianggaranH').val(id);
		        		cmbtahunajaran('filter',$('#a_departemenS').val());
                        switchPN(2);
                    }
                },
            });
        }
    //end of katalog

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


/*combo box*/
    //tahun buku  ---
        // function cmbtahunbuku(typ,thn){
        //     var replid='';
        //     var tipe = typ;
        //     if(typ='form' && thn!='')
        //         replid='&replid='+thn;

        //     $.ajax({
        //         url:dir2,
        //         data:'aksi=cmb'+mnu2+replid,
        //         dataType:'json',
        //         type:'post',
        //         success:function(dt){
        //             var out='';
        //             if(dt.status!='sukses'){
        //                 out+='<option value="">'+dt.status+'</option>';
        //             }else{
        //                 $.each(dt.tahunbuku, function(id,item){
        //                     if(item.aktif==1)
        //                         out+='<option selected="selected" value="'+item.replid+'">'+item.nama+' (aktif)</option>';
        //                     else
        //                         out+='<option value="'+item.replid+'">'+item.nama+'</option>';
        //                 });
        //                 if(tipe=='form'){
        //                     $('#a_tahunbukuH').val(dt.tahunbuku[0].replid);
        //                     $('#a_tahunbukuTB').val(dt.tahunbuku[0].nama);
        //                 }else{
        //                     $('#a_tahunbukuS').html(out);
        //                     cmbdepartemen('filter','');
        //                 }
        //             }
        //         }
        //     });
        // }
    //end of departemen ---

    // departemen ---
         // cmbdepartemen(id,'filter','');
        function cmbdepartemen(typ,dep){
            var replid = '';
            var tipe   = typ;

            $.ajax({
                url:dir3,
                data:'aksi=cmb'+mnu3+(dep!=''?'&replid='+dep:''),
                dataType:'json',
                type:'post',
                success:function(dt){
                    var out='';
                    if(dt.status!='sukses'){
                        out+='<option value="">'+dt.status+'</option>';
                    }else{
                        $.each(dt.departemen, function(id,item){
                        	out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                        });
                    }
                    if(tipe=='form'){
                        // alert($('#a_kategorianggaranH').val());return false;
                    	$('#a_departemenTB').html(dt.departemen[0].nama);
    	                $('#a_kategorianggaranH2').val($('#a_kategorianggaranH').val());
    	                $('#a_kategorianggaranTB').val($('#a_kategorianggaranDV').html());
                    }else{
                        $('#a_departemenS').html(out);
                        viewTB('anggaran');
                        // cmbtahunajaran('filter',dt.departemen[0].replid );
                    }
                }
            });
        }
    //end of departemen ---

    // combo tahunajaran ---
        function cmbtahunajaran(typ,dep){
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
                        if(dt.tahunajaran.length==0){
                            out+='<option value="">kosong</option>';
                        }else{
                            $.each(dt.tahunajaran, function(id,item){
                                out+='<option value="'+item.replid+'">'+item.tahunajaran+(item.aktif=='1'?' (aktif)':'')+'</option>';
                            });
                        }
                    }
                    if(typ=='filter') {
                        $('#d_tahunajaranS').html(out);
                        cmbtingkat('filter',dt.tahunajaran[0].replid);
                    }else{
                        $('#d_tahunajaranTB').html(dt.tahunajaran[0].tahunajaran);
                    }
                }
            });
        }
    //end of combo tahunajaran ----

    // combo tingkat ---
        function cmbtingkat(typ,thn){
            $.ajax({
                url:dir5,
                data:'aksi=cmb'+mnu5+'&tahunajaran='+thn,
                dataType:'json',
                type:'post',
                success:function(dt){
                    var out='';
                    if(dt.status!='sukses'){
                        out+='<option value="">'+dt.status+'</option>';
                    }else{
                        if(dt.tingkat.length==0){
                            out+='<option value="">kosong</option>';
                        }else{
                            $.each(dt.tingkat, function(id,item){
                                out+='<option value="'+item.replid+'">'+item.keterangan+' ('+item.tingkat+') </option>';
                            });
                        }
                    }
                    if(typ=='filter'){ // filter
                        $('#d_tingkatS').html(out);
                        viewTB('detilanggaran');
                        // vwDetilAnggaran();
                    }else{ // form 
                        $('#d_tingkatTB').html(dt.tingkat[0].tingkat);
                    }
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
        window.open('report/r_'+mn+'.php?token='+token+par,'_blank');
    }
//end of  print to PDF -------

    // ---------------------- //
    // -- created by epiii -- //
    // ---------------------- // 
