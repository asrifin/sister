var mnu  ='saldorekening'; 
var mnu2 ='tahunajaran'; 
var mnu3 ='kategorirekening'; 

var dir  ='models/m_'+mnu+'.php';
var dir2 ='../akademik/models/m_'+mnu2+'.php';
var dir3 ='models/m_'+mnu3+'.php';

var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        // header 
                        +'<table class="table">'
                            +'<tr>'
                                +'<td class="span2">Tahun</td>'
                                +'<td id="tahunajaranTD"></td>'
                            +'</tr><tr>'
                                +'<td>Kategori Rekening</td>'
                                +'<td id="kategorirekeningTD"></td>'
                            +'</tr><tr>'
                                +'<td>Rekening</td>'
                                +'<td id="detilrekeningTD"></td>'
                            +'</tr><tr>'
                                +'<td>Jenis</td>'
                                +'<td id="jenisTD"></td>'
                            +'</tr>'
                        +'</table>'
                        
                        // saldo
                        +'<label>Saldo</label>'
                        +'<input data-transform="input-control" onclick="inputuang(this);" onfocus="inputuang(this);" placeholder="saldo" type="text" name="nominalTB" id="nominalTB">'

                        // button 
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        cmbkategorirekening();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action // edit by epiii
        $('#kategorirekeningS,#tahunajaranS').on('change',function (){ viewTB();});
        $('#kodeS,#namaS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13) viewTB();
        });
    }); 

// combo departemen ---
    function cmbkategorirekening(){
        var u= dir3;
        var d= 'aksi=cmb'+mnu3;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.kategorirekening, function(id,item){
                    out+='<option value="'+item.replid+'">['+item.kode+'] '+item.nama+'</option>';
                });$('#kategorirekeningS').html('<option value="">--Semua Kategori Rekening--</option>'+out);
                cmbtahunajaran();
            }
        });
    }
//end of combo departemen ---

// combo tahun buku  ---
    function cmbtahunajaran(){
        var u= dir2;
        var d= 'aksi=cmb'+mnu2;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tahunajaran, function (id,item){
                    var ta = item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1); 
                    out+='<option '+(item.aktif==1?'selected':'')+' value="'+item.replid+'">'+ta+'</option>';
                });
                $('#tahunajaranS').html(out);
                viewTB(); 
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
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                    viewTB();
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
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
                $(el2).html('<tr><td align="center" colspan="9"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table

    // function viewTB(){ 
    //     var aksi ='aksi=tampil';
    //     var cari ='&kategorirekeningS='+$('#kategorirekeningS').val()
    //             +'&kodeS='+$('#kodeS').val()
    //             +'&namaS='+$('#namaS').val()
    //             +'&tahunajaranS='+$('#tahunajaranS').val();
    //             // +'&nominalS='+$('#nominalS').val();
    //     $.ajax({
    //         url : dir,
    //         type: 'post',
    //         data: aksi+cari,
    //         beforeSend:function(){
    //             $('#tbody').html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr></center>');
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
                var titlex='<span class="icon-pencil"></span> Ubah';
                var u =dir;
                var d = 'aksi=ambiledit&replid='+id;
                ajax(u,d).done(function (dt){
                    $('#idformH').val(id);
                    $('#tahunajaranTD').html(': '+dt.tahunajaran+' - '+(parseInt(dt.tahunajaran)+1));
                    $('#kategorirekeningTD').html(': '+dt.kategorirekening);
                    $('#detilrekeningTD').html(': ['+dt.kode+'] '+dt.nama);
                    $('#jenisTD').html(': '+dt.jenis);
                    $('#nominalTB').val(dt.nominal);
                });
                $.Dialog.title(titlex+' '+mnu); // edit by epiii
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
                $(el2).html('<tr><td align="center" colspan="9"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
//end of paging ---

    // function pagination(page,aksix,menux){ 
    //     var datax = 'starting='+page+'&aksi='+aksix+'&menu='+menux;
    //     var cari  = '&kategoriS='+$('#kategoriS').val();
    //                 // +'&tempatS='+$('#tempatS').val()
    //                 // +'&keteranganS='+$('#keteranganS').val();
    //     $.ajax({
    //         url:dir,
    //         type:"post",
    //         data: datax+cari,
    //         beforeSend:function(){
    //             $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
    //         },success:function(dt){
    //             setTimeout(function(){
    //                 $('#tbody').html(dt).fadeIn();
    //             },1000);
    //         }
    //     });
    // }   
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
        $('#kodeTB').val('');
        $('#rekeningTB').val('');
        // $('#aktivitasTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

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

    function ajax(u,d){
        return $.ajax({
            url:u,
            data:d,
            type:'post',
            dataType:'json'
        });
    }