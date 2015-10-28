var mnu       = 'detailbiaya';
var mnu2      = 'departemen';
var mnu3      = 'tahunajaran';
var mnu4      = 'detailgelombang';
var mnu5      = 'tingkat';
var mnu6      = 'subtingkat';

var dir       = 'models/m_'+mnu+'.php';
var dir2      = '../akademik/models/m_'+mnu2+'.php';
var dir3      = '../akademik/models/m_'+mnu3+'.php';
var dir4      = '../psb/models/m_'+mnu4+'.php';
var dir5      = '../akademik/models/m_'+mnu5+'.php';
var dir6      = '../akademik/models/m_'+mnu6+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        +'<table class="table">'
                            +'<tr>' 
                                +'<td>Departemen</td>'
                                +'<td id="departemenTD"></td>'
                            +'</tr>'
                            +'<tr>' 
                                +'<td>Tahun Ajaran</td>'
                                +'<td id="tahunajaranTD"></td>'
                            +'</tr>'
                            +'<tr>' 
                                +'<td>Gelombang</td>'
                                +'<td id="gelombangTD"></td>'
                            +'</tr>'
                            +'<tr>' 
                                +'<td>Tingkat</td>'
                                +'<td id="tingkatTD"></td>'
                            +'</tr>'
                            +'<tr>' 
                                +'<td>Sub Tingkat</td>'
                                +'<td id="subtingkatTD"></td>'
                            +'</tr>'
                            +'<tr>' 
                                +'<td>Golongan</td>'
                                +'<td id="golonganTD"></td>'
                            +'</tr>'
                        +'</table>'
                        +'<div id="detilrekeningDV"></div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        cmbdepartemen('filter','');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#departemenS').on('change',function(){
            cmbtahunajaran();
        });$('#tahunajaranS').on('change',function (){
            cmbdetailgelombang();
        });$('#detailgelombangS').on('change',function (){
            cmbtingkat();
        });$('#tingkatS').on('change',function (){
            cmbsubtingkat();
        });$('#subtingkatS').on('change',function (){
            viewTB();
        });
    }); 

// combobox filtering : department
    function cmbdepartemen(){
        var u = dir2;
        var d = 'aksi=cmb'+mnu2;
        ajax(u,d).done(function (dt){
            var opt='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                $.each(dt.departemen, function(id,item){
                    opt+='<option value="'+item.replid+'">'+item.nama+'</option>'
                });
                $('#departemenS').html(opt);
                cmbtahunajaran('filter','');
            }
        });
    }

// combo tahunajaran
    function cmbtahunajaran(){
        var u = dir3;
        var d = 'aksi=cmb'+mnu3;
        ajax(u,d).done(function (dt){
            var opt='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    opt+='<option value="'+item.replid+'">'+item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1)+'</option>'
                });
                $('#tahunajaranS').html(opt);
                cmbdetailgelombang();
            }
        });
    }

// combobox detailgelombang pendaftaran
    function cmbdetailgelombang(){
        var u = dir4;
        var d = 'aksi=cmb'+mnu4+'&tahunajaran='+$('#tahunajaranS').val()+'&departemen='+$('#departemenS').val();
        ajax(u,d).done(function (dt){
            var opt='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                $.each(dt.detailgelombang, function(id,item){
                    opt+='<option value="'+item.replid+'">'+item.gelombang+'</option>';
                }); $('#detailgelombangS').html(opt);
                cmbtingkat();
            }
        });
    }

// combobox tingkat (jenjang)
    function cmbtingkat(){
        var u = dir5;
        var d = 'aksi=cmb'+mnu5+'&departemen='+$('#departemenS').val();
        ajax(u,d).done(function (dt){
            var opt='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                $.each(dt.tingkat, function(id,item){
                    opt+='<option value="'+item.replid+'">'+item.tingkat+'</option>';
                }); $('#tingkatS').html(opt);
                cmbsubtingkat();
            }
        });
    }

// combobox subtingkat (kelas)
    function cmbsubtingkat(){
        var u = dir6;
        var d = 'aksi=cmb'+mnu6+'&tingkat='+$('#tingkatS').val();
        ajax(u,d).done(function (dt){
            var opt='';
            if(dt.status!='sukses'){
                notif(dt.status,'red');
            }else{
                $.each(dt.subtingkat, function(id,item){
                    opt+='<option value="'+item.replid+'">'+item.subtingkat+'</option>';
                }); $('#subtingkatS').html(opt);
                viewTB();
            }
        });
    }

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
        $.ajax({
            url:dir,
            type:'post',
            dataType:'json',
            data:$('form').serialize()+urlx,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="7">'
                        +'<img src="../img/w8loader.gif">'
                    +'</td></tr>'
                    +'<tr><td colspan="7" align="center">'
                        +'<span style="color:white;background-color:green;">Mohon Sabar menunggu proses simpan data</span>'
                    +'</td></tr>');
            },success:function(dt){
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
        console.log('ini subaksi='+subaksi);
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
        console.log('cari='+cari);
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $(el2).html('<tr><td align="center" colspan="7">'
                    +'<img src="../img/w8loader.gif">'
                +'</td></tr>'
                +'<tr><td colspan="7" align="center">'
                    +'<span style="color:white;padding:5px;background-color:orange;">Memuat Data</span>'
                +'</td></tr>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }

// view table ---
    // function viewTB(){
    //     var aksi ='aksi=tampil';
    //     var cari =  '&departemenS='+$('#departemenS').val()
    //                 +'&prosesS='+$('#prosesS').val()
    //                 +'&kelompokS='+$('#kelompokS').val();
    //     $.ajax({
    //         url : dir,
    //         type: 'post',
    //         data: aksi+cari,
    //         beforeSend:function(){
    //             $('#tbody').html('<tr><td align="center" colspan="7">'
    //                 +'<img src="../img/w8loader.gif">'
    //             +'</td></tr>'
    //             +'<tr><td colspan="7" align="center">'
    //                 +'<span style="color:white;padding:5px;background-color:orange;">Memuat Data</span>'
    //             +'</td></tr>');
    //         },success:function(dt){
    //             setTimeout(function(){
    //                 $('#tbody').html(dt).fadeIn();
    //             },1000);
    //         }
    //     });
    // }
// end of view table ---
    
// form ---
    function viewFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                ajax(dir,'aksi=ambiledit&replid='+id).done(function (dt) {
                    if(dt.status!='sukses') notif('red','gagal ambil data');
                    else {
                        $('#departemenTD').html(dt.departemen);
                        $('#tahunajaranTD').html(dt.tahunajaran);
                        $('#tingkatTD').html(dt.tingkat);
                        $('#subtingkatTD').html(dt.subtingkat);
                        $('#golonganTD').html(dt.golongan);
                        var tr='';
                        // $.each(dt.biayaArr, function (id,item) {
                        //     tr+='<label>'+item.biaya+'</label>'
                        //         +'<input data-transform="input-control" type="text">';
                        // });$('#detilrekeningDV').html(tr);
                    }
                });
                $.Dialog.title('Setting Rekening');
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

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
                $(el2).html('<tr><td align="center" colspan="10"><img src="../img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
  
    
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
                    viewTB();
                    cont = '..Berhasil Mengaktifkan '+th+' ..';
                    clr  ='green';
                }notif(cont,clr);
            }
        });
    }
//end of aktifkan process ---


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

// normal ajax 
    function ajax (u,d) {
        return $.ajax({
            url:u,
            data:d,
            dataType:'json',
            type:'post',
        });
    }