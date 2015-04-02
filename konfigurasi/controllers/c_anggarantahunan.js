var mnu  ='anggarantahunan'; 
var dir  ='models/m_'+mnu+'.php';

var mnu2 ='tahunbuku'; 
var dir2 ='models/m_'+mnu2+'.php';

var mnu3 ='departemen'; 
var dir3 ='../akademik/models/m_'+mnu3+'.php';

var mnu4 ='anggaran'; 
var dir4 ='models/m_'+mnu4+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 

                        +'<label>Departemen</label>'
                        +'<div>'
                            +'<div class="input-control size3 text" >'
                                +'<input disabled name="departemenTB" id="departemenTB" type="text">'
                            +'</div>'
                        +'</div>'    

                        +'<label>Tahun Buku</label>'
                        +'<div>'
                            +'<div class="input-control size2 text" >'
                                +'<input disabled name="tahunbukuTB" id="tahunbukuTB" type="text">'
                            +'</div>'
                        +'</div>'                        

                        +'<label>Kategori Anggaran</label>'
                        +'<div>'
                            +'<div class="input-control size4 text" >'
                                +'<input disabled name="kategorianggaranTB" id="kategorianggaranTB" type="text">'
                            +'</div>'
                        +'</div>'                

                        +'<label>Detil Anggaran</label>'
                        +'<div>'
                            +'<div class="input-control size4 text" >'
                                +'<input disabled name="detilanggaranTB" id="detilanggaranTB" type="text">'
                            +'</div>'
                        +'</div>'                

                        +'<label>Rekening</label>'
                        +'<div>'
                            +'<div class="input-control size3 text" >'
                                +'<input disabled name="rekeningTB" id="rekeningTB" type="text">'
                            +'</div>'
                        +'</div>'

                        +'<label>Nominal</label>'
                        +'<div>'
                            +'<div class="input-control size3 text" >'
                                +'<input onclick="inputuang(this);" placeholder="nominal" type="text" name="nominalTB" id="nominalTB">'
                            +'</div>'
                        +'</div>'
                        
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

        //cari ----
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#kodeS').val('');
            $('#namaS').val('');
            $('#keteranganS').val('');
        });
        //search action // edit by epiii
        $('#departemenS,#tahunbukuS,#kategorianggaranS').on('change',function (e){ // change : combo box
            viewTB();
        });
        $('#kodeS,#namaS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13)
                viewTB();
        });
       
    }); 
// end of main function ---
// 
// combo departemen ---
    function cmbdepartemen(typ,dep){
        var depart ='';
        if(dep!='') 
            depart = '&replid='+dep;
        $.ajax({
            url:dir3,
            data:'aksi=cmb'+mnu3+depart,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    if(dt.departemen.length==0)
                        out+='<option value="">kosong</option>';
                    else{
                        $.each(dt.departemen, function(id,item){
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                        });
                    }    
                }
                if(typ=='form'){ //form
                    $('#departemenTB').text(dt.departemen[0].nama);
                }else{// filtering
                    $('#departemenS').html(out);
                    cmbtahunbuku('filter','');
                } 
            }
        });
    }
//end of combo departemen ----


// combo departemen ---
    function cmbkategorianggaran(typ,kat){
        $.ajax({
            url:dir4,
            data:'aksi=cmbkategori'+mnu4,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.kategorianggaran, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }

                if(typ=='form'){ //form
                    $('#kategorianggaranTB').html(dt.kategorianggaran[0].nama);
                }else{// filtering
                    $('#kategorianggaranS').html(out);
                    viewTB();
                } 

            }
        });
    }
//end of combo departemen ---

// combo tahun buku  ---
    function cmbtahunbuku(typ,thn){
        $.ajax({
            url:dir2,
            data:'aksi=cmb'+mnu2,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.tahunbuku, function(id,item){
                        if(item.aktif==1)
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+' (aktif)</option>';
                        else
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }

                if(typ=='form'){ //form
                    $('#tahunbukuTB').html(dt.tahunbuku[0].nama);
                }else{// filtering
                    $('#tahunbukuS').html(out);
                    cmbkategorianggaran('filter','');
                } 

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
    function viewTB(){ 
        var aksi ='aksi=tampil';
        var cari ='&kategorianggaranS='+$('#kategorianggaranS').val()
                +'&departemenS='+$('#departemenS').val()
                +'&tahunbukuS='+$('#tahunbukuS').val()
                +'&rekeningS='+$('#rekeningS').val()
                +'&namaS='+$('#namaS').val()
                +'&nominalS='+$('#nominalS').val();

        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
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
                $.ajax({
                    url:dir,
                    data:'aksi=ambiledit&replid='+id,
                    type:'post',
                    dataType:'json',
                    success:function(dt){
                        $('#idformH').val(id);
                        $('#kategorianggaranTB').val(dt.kategorianggaran);
                        $('#tahunbukuTB').val(dt.tahunbuku);
                        $('#departemenTB').val(dt.departemen);
                        $('#detilanggaranTB').val(dt.detilanggaran);
                        $('#rekeningTB').val(dt.rekening);
                        $('#namaTB').val(dt.nama);
                        $('#nominalTB').val(dt.nominal);
                    }
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
                $(el2).html('<tr><td align="center" colspan="8"><img src="img/w8loader.gif"></td></tr></center>');
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
// end of input uang --------------------------

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 
