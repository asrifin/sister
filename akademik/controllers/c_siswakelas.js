var mnu  = 'siswakelas';
var mnu2 = 'departemen';
var mnu3 = 'tahunajaran';
var mnu4 = 'tingkat';
var mnu5 = 'subtingkat';
var mnu6 = 'detailkelas';
var mnu8 = 'kelas';

var dir  = 'models/m_'+mnu+'.php';
var dir2 = 'models/m_'+mnu2+'.php';
var dir3 = 'models/m_'+mnu3+'.php';
var dir4 = 'models/m_'+mnu4+'.php';
var dir5 = 'models/m_'+mnu5+'.php';
var dir6 = 'models/m_'+mnu6+'.php';
var dir8 = 'models/m_'+mnu8+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form style="overflow:scroll;height:550px;"  autocomplete="off" onsubmit="simpanSV();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<table class="table">'
                            // departemen
                            +'<tr>'
                                +'<td class="span2">Departemen <input type="hidden"  class="belum_cari"  id="departemenTB" /></td>'
                                +'<td id="departemenTD"></td>'
                            +'</tr>'

                            // mode`
                            +'<tr>'
                                +'<td>Kriteria</td>'
                                +'<td>: '
                                    +'<div data-role="input-control" class="input-control radio default-style" >'    
                                        +'<label>'
                                            +'<input class="belum_cari"  onclick="modeFC();"  checked value="1" name="modeTB" type="radio" >'
                                            +'<span class="check"></span>'
                                            +'Siswa Baru &nbsp;'
                                        +'</label>'
                                    +'</div>'
                                    +'<div data-role="input-control" class="input-control radio default-style" >'    
                                        +'<label>'
                                            +'<input  class="belum_cari"  onclick="modeFC();" value="2"  name="modeTB" type="radio" >'
                                            +'<span class="check"></span>'
                                            +'Siswa Lama <sub class="fg-blue">(akan naik kelas)</sub>'
                                        +'</label>'
                                    +'</div>'
                                +'</td>'
                            +'</tr>'
                        // asal ------------------------------
                            +'<tr style="display:none;"  class="modenaikTR"><td class="bg-lightTeal" colspan="2">Berasal dari -</td></tr>'
                            // tahun ajaran 
                            +'<tr style="display:none;"  class="modenaikTR">'
                                +'<td>Tahun Ajaran </td>'
                                +'<td id="tahunajaranasalTD"></td>'
                            +'</tr>'
                            // tingkat 
                            +'<tr style="display:none;"  class="modenaikTR">'
                                +'<td>Tingkat</td>'
                                +'<td id="tingkatasalTD"></td>'
                            +'</tr>'
                            // subtingkat tingkat
                            +'<tr style="display:none;"  class="modenaikTR">'
                                +'<td>Sub Tingkat</td>'
                                +'<td id="subtingkatasalTD"></td>'
                            +'</tr>'
                            // detail kelas asal
                            +'<tr style="display:none;" class="modenaikTR">'
                                +'<td>Kelas</td>'
                                +'<td id="kelasasalTD">'
                                    +'<select onchange="viewTB(\'belum\');" data-transform="input-control" class="belum_cari" name="detailkelasasalTB" id="detailkelasasalTB"></select>'
                                +'</td>'
                            +'</tr>'
                        // tujuan  --------------------------------
                            +'<tr><td class="bg-lightTeal"  colspan="2">Akan Masuk ke -</td></tr>'
                            // tahun ajaran 
                            +'<tr>'
                                +'<td>Tahun Ajaran <input  type="hidden"  class="belum_cari"  id="tahunajaranasalTB" /><input  type="hidden"  class="belum_cari"  id="tahunajaranTB" /></td>'
                                +'<td id="tahunajaranTD"></td>'
                            +'</tr>'
                            // tingkat
                            +'<tr>'
                                +'<td>Tingkat <input  type="hidden"  class="belum_cari"  type="text" id="tingkatTB" /></td>'
                                +'<td id="tingkatTD"></td>'
                            +'</tr>'
                            // subtingkat
                            +'<tr>'
                                +'<td>Sub Tingkat '
                                    +'<input type="hidden" name="subtingkatTB" class="belum_cari" type="text" id="subtingkatTB" />'
                                +'</td>'
                                +'<td id="subtingkatTD"></td>' // view 
                            +'</tr>'
                            //detail kelas tujuan
                            +'<tr>'
                                +'<td>Kelas <input class="belum_cari" type="hidden" id="detailkelasTB" name="detailkelasTB" /></td>'
                                +'<td id="kelasTD"></td>'
                            +'</tr>'
                        +'</table>'

                        // +'<div style="overflow:scroll;height:270px;">'
                        +'<div xstyle="overflow:scroll;height:270px;">'
                            +'<table class="table hovered bordered striped">'
                                +'<thead>'
                                    +'<tr style="color:white;"class="info">'
                                        +'<th rowspan="2" class="text-center">'
                                            +'<div class="input-control switch">'
                                                +'<label>'
                                                    +'<input onclick="siswaSelAll(this);" id="siswaAllTB" type="checkbox" />'
                                                    +'<span class="check  "></span>'
                                                +'</label>'
                                            +'</div>'
                                        +'</th>'
                                        +'<th class="text-center">NIS</th>'
                                        +'<th class="text-center">Nama</th>'
                                    +'</tr>'
                                    +'<tr class="info">'
                                        +'<th class="text-center"><input onkeyup="viewTB(\'belum\');" data-transform="input-control"  class="belum_cari" placeholder="NIS" id="belum_nisS" xname="nisS"></th>'
                                        +'<th class="text-center"><input   onkeyup="viewTB(\'belum\');"  data-transform="input-control" class="belum_cari" placeholder="Nama" id="belum_namasiswaS" xname="namasiswaS"></th>'
                                    +'</tr>'
                                +'</thead>'
                                +'<tbody id="belum_tbody"></tbody>'
                            +'</table>'
                        +'</div>'
                        
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';

        cmbdepartemen('filter');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#departemenS').on('change',function(){
            cmbtahunajaran('filter',$(this).val());
        });
        $('#tahunajaranS').on('change',function (){
            cmbtingkat('filter',$('#departemenS').val());
        });
        $('#tingkatS').on('change',function (){
            cmbsubtingkat('filter',$(this).val(),'');
        });
        $('#subtingkatS').on('change',function (){
            cmbdetailkelas('filter',$(this).val(),'');
        });
        $('#detailkelasS').on('change',function (){
            viewTB('aktif');
        });
        $('#aktif_nisS,#aktif_nisnS,#aktif_namasiswaS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB('aktif');
        });
    }); 

// // combo kelas ---
    function cmbdetailkelasasal(){
        console.log('masuk kelas asal');
        var u = dir6;
        var subt = $('#subtingkatasalTD').html();
        var subtingkat = subt.substring(2);

        // var d = 'aksi=cmb'+mnu6+'&modeTB2=&subtingkat='+subtingkat+'&departemen='+$('#departemenS').val()+'&tingkat='+$('#tingkatTB').val()+'&tahunajaran='+$('#tahunajaranS').val();
        var d = 'aksi=cmb'+mnu6+'&modeTB=2&subtingkat='+subtingkat+'&departemen='+$('#departemenS').val()+'&tingkat='+$('#tingkatTB').val()+'&tahunajaranasal='+$('#tahunajaranasalTB').val();
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.detailkelas.length==0) out+='<option value="">kosong</option>';
                else{
                    $.each(dt.detailkelas, function (id,item){
                        out+='<option value="'+item.replid+'">'+item.kelas+'</option>';
                    });
                }$('#detailkelasasalTB').html(out);
                viewTB('belum');
            }
        });
    }

// combo kelas ---
    function cmbdetailkelas(typ,subt,dkls){
        var u=dir6;
        var d= 'aksi=cmb'+mnu6+'&subtingkat='+subt+'&departemen='+$('#departemenS').val()+'&tahunajaran='+$('#tahunajaranS').val()+(dkls!=''?'&replid='+dkls:'');
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.detailkelas.length==0) {out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.detailkelas, function (id,item){
                        out+='<option '+(item.replid==dkls?'selected':'')+' value="'+item.replid+'">'+item.kelas+' (terisi : '+item.terisi+' dr '+item.kapasitas+')</option>';
                    });
                }
                if(typ=='filter'){ //filter 
                    $('#detailkelasS').html(out);
                    viewTB('aktif');
                }else if(typ=='form'){ // form add 
                    $('#detailkelasTB').html('<option value="">-Pilih '+mnu6+'-</option>'+out);
                    $('#kelasTD').html(': '+dt.detailkelas[0].kelas);
                    console.log(dt.detailkelas[0].replid);
                    viewTB('belum');
                }
            }
        });
    }

//save process ---
    function simpanSV(){
        if($('.siswaTB:checked').length==0 ){
            notif('tidak ada siswa terpipilh','red');
        }else{
            var data ='&aksi=simpan';
            var replid = ($('#idformH').val()!='')?'&replid='+$('#idformH').val():'';
            var u = dir;
            var d = $('form').serialize()+data;
            ajax(u,d).done(function (dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    viewTB('aktif');
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            });
        }
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
            var v = p ='';
            if($(this).is('[id]')){
                p = $(this).attr('id');
                v = $(this).val();
                cari+='&'+p+'='+v;
            }else{
                if($(this).is(':checked')) {
                    v = $(this).val();
                    p = $(this).attr('name');
                    cari+='&'+p+'='+v;
                }
            }
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

//load  dialog form  ---
    function viewFR(idsiswa){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '60%',
            height: 600,
            padding: 10,
            onShow: function(){
                var titl,cont;
                $.Dialog.content(contentFR);
                titl='Tambah '+mnu;
                cmbdepartemen('form');
                $('#detailkelasTB').val($('#detailkelasS').val());
                $.Dialog.title(titl);
            }
        });
    }

// // pilih barang yg akan dipinjam ---
    function siswaAdd (id,nisn,nama) {
        //         $('#siswaTBL').html('<tr><td>gjkasfdlkjsadklfjslkdj</td></tr>')
        // return false;
        // alert(9999);return false;
        var tr ='<tr val="'+id+'" class="siswaTR" id="siswaTR_'+id+'">'
                    +'<td>'+nisn+'</td>'
                    +'<td>'+nama+'</td>'
                    +'<td><button onclick="siswaDel('+id+');"><i class="icon-remove"></button></i></td>'
                +'</tr>';
        // alert(tr);return false;
        $('#siswaTBL').append(tr); 

        // alert(tr);
        // siswaArr();
        // $('#siswaTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiS').val()+'&siswa='+siswaArr() );

        // siswaExist();
    }

// end of form ---
    function siswaDel(id){
            $('#siswaTR_'+id).fadeOut('slow',function(){
                $('#siswaTR_'+id).remove();
                // barangExist();
            });
    }

    function siswaExist(){
        // var jumImg = $('.imgTR:visible','#imgTB').length; //hitung jumlah gambar bkeg bukeg  dalam form 
        alert('jumlah tr: '+$('#siswaTBL','.siswaTR').length);return false;
        var tr ='<tr class="warning"><td colspan="3" class="text-center">pilih siswa ..</td></tr>';
        if($('#siswaTBL').html()=='') $('#siswaTBL').html(tr);
        else $('#siswaTBL').html('');
    }
//end of barang record kosong --

//himpun array siswa terpilih
    function siswaArr(){
        var y=[];
        $('.siswaTR').each(function(id,item){
            y.push($(this).attr('val'));
        });return y;
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
    
//del selected process ---
    function delSomeTR(){
        if(confirm('melanjutkan data terplih ?')){
            var u = dir;
            var d = 'aksi=hapus';
            $('.siswakelasTB:checked').each(function(){
                d+='&siswakelasTB[]='+$(this).val();
            });ajax(u,d).done(function (dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                    clr  ='red';
                }else{
                    viewTB('aktif');
                    cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                    clr  ='green';
                }notif(cont,clr);
                isSelectedTR();
            });
        }
    }
    
//del process ---
    function del(id){
        if(confirm('melanjutkan untuk menghapus data?'))
        var u = dir;
        var d = 'aksi=hapus&replid='+id;
        ajax(u,d).done(function (dt){
            var cont,clr;
            if(dt.status!='sukses'){
                cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                clr  ='red';
            }else{
                viewTB('aktif');
                cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                clr  ='green';
            }notif(cont,clr);
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
// end of notifikasi

//reset form ---
    function kosongkan(){
        $('#idformTB').val('');
        $('#tingkatTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

//aktifkan process ---
    function aktifkan(id){
        var th  = $('#'+mnu+'TD_'+id).html();
        var dep = $('#'+mnu2+'S').val();
        //alert('d '+dep);
        //return false;
        if(confirm(' mengaktifkan "'+th+'"" ?'))
        $.ajax({
            url:dir,
            type:'post',
            data:'aksi=aktifkan&replid='+id+'&departemen='+dep,
            dataType:'json',
            success:function(dt){
                var cont,clr;
                if(dt.status!='sukses'){
                    cont = '..Gagal Mengaktifkan '+th+' ..';
                    clr  ='red';
                }else{
                    viewTB($('#departemenS').val());
                    cont = '..Berhasil Mengaktifkan '+th+' ..';
                    clr  ='green';
                }notif(cont,clr);
            }
        });
    }

// combo departemen ---
    function cmbdepartemen(typ){
        var u = dir2;
        var d ='aksi=cmb'+mnu2+(typ=='form'?'&replid='+$('#departemenS').val():'');
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses') out+='<option value="">'+dt.status+'</option>';
            else{
                $.each(dt.departemen, function(id,item){
                    out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                });
            }
            if(typ=='filter'){ // filter (search)
                $('#departemenS').html(out);
                cmbtahunajaran('filter');
            }else{ // form (edit & add)
                $('#departemenTD').html(': '+dt.departemen[0].nama);
                cmbtahunajaran('form');
                $('#departemenTB').val($('#departemenS').val());
            }
        });
    }

// combo tahunajaran ---
    function cmbtahunajaran(typ){
        var u= dir3;
        var d='aksi=cmb'+mnu3+(typ=='form'?'&replid='+$('#tahunajaranS').val():'');
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.tahunajaran.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.tahunajaran, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1)+'</option>';
                    });
                }
                if(typ=='filter'){ // filter (search)
                    $('#tahunajaranS').html(out);
                    cmbtingkat('filter',$('#departemenS').val());
                }else{ // form (edit & add)
                // asal
                    var t11 = dt.tahunajaran[0].tahunajaransblm;
                    var t22 = parseInt(t11)+1;
                    $('#tahunajaranasalTB').val(dt.tahunajaran[0].idtahunajaransblm);
                    $('#tahunajaranasalTD').html(': '+t11+' - '+t22);
                // tujuan
                    var t1 = dt.tahunajaran[0].tahunajaran;
                    var t2 = parseInt(t1)+1;
                    $('#tahunajaranTB').val($('#tahunajaranS').val());
                    $('#tahunajaranTD').html(': '+t1+' - '+t2);
                // tingkat asal & tujuan 
                    cmbtingkat('form',$('#departemenS').val());
                }
            }
        });
    }

// cmbo golongan 
    function cmbtingkat(typ,dept) {
        var d = 'aksi=cmb'+mnu4+'&departemen='+dept+(typ=='form'?'&replid='+$('#tingkatS').val():'');
        ajax(dir4,d).done(function (dt){
            var out='';
            if (dt.status!='sukses') {
                notif(dt.status,'red');
                out+='<option value="">'+dt.status+'</option>'
            }else{
                $.each(dt.tingkat,function (id,item){
                    out+='<option value="'+item.replid+'">'+item.tingkat+'</option>'
                });
                if(typ=='form') {
                    $('#tingkatasalTD').html(': '+dt.tingkat[0].tingkat);
                    $('#tingkatTD').html(': '+dt.tingkat[0].tingkat);
                    cmbsubtingkat('form',dt.tingkat[0].replid);
                    $('#tingkatTB').val($('#tingkatS').val());
                    if(dt.tingkat[0].nsubtingkat=='1') $('input[name="modeTB"][value="2"]').attr('disabled',true);
                    else $('input[name="modeTB"][value="2"]').removeAttr('disabled');
                }else {
                    $('#tingkatS').html(out);
                    cmbsubtingkat('filter',dt.tingkat[0].replid);
                }
            }
        });
    }   

// combo subtingkat ---
    function cmbsubtingkat(typ,ting){
        var u=dir5;
        var d= 'aksi=cmbsubtingkat&tingkat='+ting+(typ=='form'?'&replid='+$('#subtingkatS').val():'');
        ajax(u,d).done(function (dt) {
            var out='<select id="subtingkatTB" name="subtingkatTB">';
            if(dt.status!='sukses') out+='<option value="">'+dt.status+'</option>';
            else{
                $.each(dt.subtingkat, function(id,item){
                    out+='<option value="'+item.replid+'">'+item.subtingkat+'</option>';
                });
            }out+='</select>';
            if(typ=='filter'){
                $('#subtingkatS').html(out);
                cmbdetailkelas('filter',dt.subtingkat[0].replid,'');
            }else{ // form 
                $('#subtingkatasalTD').html(': '+(parseInt(dt.subtingkat[0].subtingkat)-1)); // view : asal subtingkat (naik kelas) 
                $('#subtingkatTD').html(': '+dt.subtingkat[0].subtingkat); // view : tujuan subtingkat (siswa baru)
                $('#subtingkatTB').val($('#subtingkatS').val());  // hidden : 
                // if(dt.subtingkat[0].subtingkat=='1') $('#modeTB2').attr('disabled',true);
                if(dt.subtingkat[0].subtingkat=='1') $('input[name="modeTB"][value="2"]').attr('disabled',true);
                else $('input[name="modeTB"][value="2"]').removeAttr('disabled');
                // else $('#modeTB2').removeAttr('disabled');

                cmbdetailkelas('form',dt.subtingkat[0].replid,$('#detailkelasS').val());
                // viewTB('belum');
            }
        });
    }

// ajax jquery (mode : asyncronous) ---
    function ajax(u,d){
        return $.ajax({
            url:u,
            data:d,
            type:'post',
            dataType:'json'
        });
    }

    function isSelectedTR(){
        if($('.siswakelasTB').length>0){ // ada
            if($('.siswakelasTB:checked').length>0){ // ada
                $('#siswakelasAllTB').attr('checked',true);
                $('#hapussemuaBC').removeAttr('style');
            }else{ // tidak ada 
                $('#siswakelasAllTB').removeAttr('checked');
                $('#hapussemuaBC').attr('style','display:none');
            }
        }
    }

    function siswakelasSelAll(e){ //*
        // isSelectedTR();
        if($(e).is(':checked')){
            $('#hapussemuaBC').removeAttr('style');
            $('.siswakelasTR').addClass('bg-lightTeal');
            $('.siswakelasTB').prop('checked',true);
        }else{
            $('#hapussemuaBC').attr('style','display:none');
            $('.siswakelasTR').removeClass('bg-lightTeal');
            $('.siswakelasTB').removeAttr('checked');
        }
    }

    function siswaSelAll(e){ //*
        if($(e).is(':checked')){
            $('.siswaTR').addClass('bg-lightTeal');
            $('.siswaTB').prop('checked',true);
        }else{
            $('.siswaTR').removeClass('bg-lightTeal');
            $('.siswaTB').removeAttr('checked');
        }
    }

    function siswakelasSelTR(e){ //@
        if($('#siswakelas'+e+'TB').is(':checked')){
            $('#siswakelas'+e+'TR').addClass('bg-lightTeal');
        }else{
            $('#siswakelas'+e+'TR').removeClass('bg-lightTeal');
        }isSelectedTR();
    }
    function siswaSelTR(e){ //@
        if($('#siswa'+e+'TB').is(':checked')){
            $('#siswa'+e+'TR').addClass('bg-lightTeal');
        }else{
            $('#siswa'+e+'TR').removeClass('bg-lightTeal');
        }
    }

    function modeFC(){
        if($('input[type="radio"]:checked').val()=='1'){ // siswa baru 
            $('.modenaikTR').attr('style','display:none;');
            viewTB('belum');
        }else{ // naik kelas
            $('.modenaikTR').removeAttr('style');
            cmbdetailkelasasal();
        }
    }