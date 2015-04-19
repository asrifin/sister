var mnu       = 'kelas';
var mnu2      = 'departemen';
var mnu3      = 'tahunajaran';
var mnu4      = 'tingkat';
var mnu5      = 'subtingkat';

var dir       = 'models/m_'+mnu+'.php';
var dir2      = 'models/m_'+mnu2+'.php';
var dir3      = 'models/m_'+mnu3+'.php';
var dir4      = 'models/m_'+mnu4+'.php';
var dir5      = 'models/m_'+mnu5+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<div style="overflow:scroll;height:600px;"  class="">'
                         + '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        +'<label>Departemen</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="departemenH" id="departemenH">'
                            +'<input disabled type="text" name="departemenTB" id="departemenTB">'
                        +'</div>'
                        
                        +'<label>Tahun Ajaran</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="tahunajaranH" id="tahunajaranH">'
                            +'<input disabled type="text" name="tahunajaranTB" id="tahunajaranTB">'
                        +'</div>'
                        
                        +'<label>Tingkat</label>'
                        +'<div class="input-control text">'
                            +'<input disabled type="text" name="tingkatTB" id="tingkatTB">'
                        +'</div>'
                        
                        +'<label>Sub Tingkat</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="subtingkatH" id="subtingkatH">'
                            +'<input disabled type="text" name="subtingkatTB" id="subtingkatTB">'
                        +'</div>'

                        +'<legend>Cari Wali Kelas </legend>'
                        +'<div class="balloon bottom">'
                            +'<div class="padding20">'
                                +'<div class="input-control text">'
                                    +'<input placeholder="kode/nama pegawai" id="guruTB">'
                                    +'<input  type="text" name="guruH" id="guruH" >'
                                    +'<button class="btn-clear"></button>'
                                +'</div>'
                                +'<label>NIP</label>'
                                +'<div class="input-control text">'
                                    +'<input disabled="disabled" placeholder="kode" id="nipTB">'
                                    +'<button class="btn-clear"></button>'
                                +'</div>'
                                +'<label>Nama</label>'
                                +'<div class="input-control text">'
                                    +'<input disabled="disabled" placeholder="nama wali" id="waliTB">'
                                    +'<button class="btn-clear"></button>'
                                +'</div>'
                            +'</div>'                                
                        +'</div>'                                

                        +'<label>Kapasitas</label>'
                        +'<div class="input-control text">'
                            +'<input class="span1" placeholder="kapasitas" required type="text" name="kapasitasTB" id="kapasitasTB">'
                            +'<button class="btn-clear"></button> siswa'
                        +'</div>'

                        +'<label>Kelas</label>'
                        +'<div class="input-control text">'
                            +'<input class="span2" placeholder="kelas" required type="text" name="kelasTB" id="kelasTB">'
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
                    +'</div>'

        // combo departemen
        cmbdepartemen('filter','');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

    /*filtering*/
        // combo
        $('#departemenS').on('change',function(){
            cmbtahunajaran('filter',$(this).val());
        });$('#tahunajaranS').on('change',function (){
            cmbtingkat('filter',$(this).val());
        });$('#tingkatS').on('change',function (){
            cmbsubtingkat('filter',$(this).val());
        });$('#subtingkatS').on('change',function (){
            viewTB(); 
        })
        //textbox
        $('#kelasS,#waliS').keydown(function (e){
            if(e.keyCode == 13) viewTB();
        });

        // button actions 
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#kelasS').val('');
            $('#waliS').val('');
        });


    }); 
// end of save process ---

// combo departemen ---
    function cmbdepartemen(typ,dep){
        $.ajax({
            url:dir2,
            data:'aksi=cmbdepartemen'+(dep!=''?'&replid='+dep:''),
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
                if(typ=='filter'){
                    $('#departemenS').html(out);
                    cmbtahunajaran('filter',$('#departemenS').val(),'');
                }else{
                    $('#departemenTB').val(dt.departemen[0].nama);
                }
            }
        });
    }
//end of combo departemen ---

// combo tahunajaran ---
    function cmbtahunajaran(typ,dep,thn){
        $.ajax({
            url:dir3,
            data:'aksi=cmbtahunajaran&'+(dep!=''?'departemen='+dep:'replid='+thn),
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.tahunajaran, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.tahunajaran+' (aktif)</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.tahunajaran+'</option>';
                        }
                    });
                }
                if(typ=='filter'){
                    $('#tahunajaranS').html(out);
                    cmbtingkat('filter',$('#tahunajaranS').val(),'');
                }else{
                    $('#tahunajaranTB').val(dt.tahunajaran[0].tahunajaran);
                }
            }
        });
    }
//end of combo tahunajaran ---

// combo tingkat ---
    function cmbtingkat(typ,thn,ting){
        $.ajax({
            url:dir4,
            data:'aksi=cmbtingkat&'+(thn!=''?'tahunajaran='+thn:'replid='+ting),
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.tingkat, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.keterangan+' ('+item.tingkat+')</option>';
                    });
                }
                if(typ=='filter'){
                    $('#tingkatS').html(out);
                    cmbsubtingkat('filter',$('#tingkatS').val(),'');
                }else{
                    $('#tingkatTB').val(dt.tingkat[0].keterangan);
                }
            }
        });
    }
//end of combo tingkat ---

// combo subtingkat ---
    function cmbsubtingkat(typ,ting,sub){
        $.ajax({
            url:dir5,
            data:'aksi=cmbsubtingkat&'+(ting!=''?'tingkat='+ting:'replid='+sub),
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.subtingkat, function(id,item){
                        out+='<option value="'+item.replid+'">Kelas '+item.subtingkat+'</option>';
                    });
                }
                if(typ=='filter'){
                    $('#subtingkatS').html(out);
                    viewTB();
                }else{
                    // $('#subtingkatH').val($('#subtingkatS').val());
                    // $('#subtingkatH').val(dt.subtingkat[0].subtingkat);
                    $('#subtingkatTB').val('Kelas '+dt.subtingkat[0].subtingkat);
                }
            }
        });
    }
//end of combo tahunajaran ---


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
                    viewTB();
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }
                notif(cont,clr);
            }
        });
    }
//end of save process ---

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
                },1000);
            }
        });
    }
// end of view table

// form ---
    function viewFR(id){
        var thn = $('#tahunajaranS').val();
        $.Dialog({
            shadow:true,
            overlay:true,
            draggable:true,
            height:'auto',
            width:'35%',
            padding:20,
            onShow: function(){
                var titlex;
                // alert($('#subtingaktS').val());
                cmbdepartemen('form',$('#departemenS').val());      
                cmbtahunajaran('form','',$('#tahunajaranS').val());      
                cmbtingkat('form','',$('#tingkatS').val());      
                cmbsubtingkat('form','',$('#subtingkatS').val());      
                setTimeout(function(){
                    $('#subtingkatH').val($('#subtingkatS').val());
                },1000);
                if (id!=''){ // edit
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            $('#guruH').val(dt.datax.idwali);
                            $('#kelasTB').val(dt.datax.kelas);
                            $('#kapasitasTB').val(dt.datax.kapasitas);
                            $('#waliTB').val(dt.datax.nama);
                            $('#nipTB').val(dt.datax.nip);
                            $('#keteranganTB').val(dt.datax.keterangan);
                        }
                    });
                }
                $.Dialog.title(titlex+' '+mnu);
                $.Dialog.content(contentFR);
            }
        });
        $("#guruTB").combogrid({
            debug:true,
            width:'400px',
            colModel: [{
                    'align':'left',
                    'columnName':'nip',
                    'hide':true,
                    'width':'25',
                    // 'width':'8',
                    'label':'NIP'
                },{   
                    'align':'left',
                    'columnName':'wali',
                    'width':'40',
                    'label':'Wali Kelas'
                }],
            url: dir+'?aksi=autocomp&tahunajaran='+thn,
            // url: dir+'?aksi=autocomp&lokasi='+lok+'&barang='+barangArr(),
            // $('#barangTB').combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiTB').val() );
            select: function( event, ui ) {
                $('#guruH').val(ui.item.replid);
                $('#nipTB').val(ui.item.nip);
                $('#waliTB').val(ui.item.wali);
                // barangAdd(ui.item.replid,ui.item.kode,ui.item.nama);
                $('#guruTB').combogrid( "option", "url", dir+'?aksi=autocomp&tingkat='+$('#tingkatS').val() );
                return false;
            }
        });
    }
// end of form ---

//paging ---
     function pagination(page,aksix){
        var datax = 'starting='+page+'&aksi='+aksix;
         var cari = '&departemenS='+$('#departemenS').val()
                    +'&tahunajaranS='+$('#tahunajaranS').val()
                    +'&tingkatS='+$('#tingkatS').val();
        $.ajax({
            url:dir,
            type:"post",
            data: datax+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
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
                    viewTB();
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

//reset form ---
    function kosongkan(){
        $('#idformTB').val('');
        $('#tingkatTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

//aktifkan process ---
    // function aktifkan(id){
    // 	var th  = $('#'+mnu+'TD_'+id).html();
    // 	var dep = $('#'+mnu2+'S').val();
    // 	//alert('d '+dep);
    // 	//return false;
    //     if(confirm(' mengaktifkan "'+th+'"" ?'))
    //     $.ajax({
    //         url:dir,
    //         type:'post',
    //         data:'aksi=aktifkan&replid='+id+'&departemen='+dep,
    //         dataType:'json',
    //         success:function(dt){
    //             var cont,clr;
    //             if(dt.status!='sukses'){
    //                 cont = '..Gagal Mengaktifkan '+th+' ..';
    //                 clr  ='red';
    //             }else{
    //                 viewTB($('#departemenS').val());
    //                 cont = '..Berhasil Mengaktifkan '+th+' ..';
    //                 clr  ='green';
    //             }notif(cont,clr);
    //         }
    //     });
    // }
//end of aktifkan process ---

    // ---------------------- //
    // -- created by rovi -- //
    // ---------------------- //