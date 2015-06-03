var mnu       = 'alumni';
var mnu2      = 'departemen';
var mnu3      = 'tahunlulus';
var dir       = 'models/m_'+mnu+'.php';
var dir2      = 'models/m_'+mnu2+'.php';
var dir3      = 'models/m_'+mnu3+'.php';
var contentAdd=contentEdit='';

// main function ---
    $(document).ready(function(){
            contentAdd+='<div style="overflow:scroll;height:500px;"  class="">'
                   +'<legend>Data Siswa</legend>'
                        +'<div class="input-control text">'
                            +'<input placeholder="nisn/nama siswa" id="siswaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">nisn</th>'
                                    +'<th class="text-center">siswa</th>'
                                    +'<th class="text-center">Aksi</th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="siswaTBL">'
                            +'</tbody>'
                                // +'<tr class="warning"><td colspan="3" class="text-center">Silahkan pilih siswa.. </td></tr>'
                            +'<tfoot>'
                            +'</tfoot>'
                        +'</table>'

                    // +'<legend>Data Peminjaman</legend>'
                    +'<form onsubmit="simpan();return false;" autocomplete="off"><input id="idformH" type="hidden">' 
                        +'<label>Departemen</label>'
                        +'<div class="input-control select">'
                            +'<select onchange="cmbtahunlulus2(\'form\',this.value,\'\');" name="departemenTB" id="departemenTB"></select>'
                        +'</div>'

                        +'<label>Tahun Lulus</label>'
                        +'<div class="input-control select span3">'
                            +'<select  name="tahunlulusTB" id="tahunlulusTB"></select>'
                        +'</div>'
                        
                        // +'<label>Keterangan</label>'
                        // +'<div class="input-control textarea">'
                        //     +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        // +'</div>'

                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'

                    +'</form>'
                +'</div>';
                contentEdit+='<div style="overflow:scroll;height:500px;"  class="">'
                        +'<legend>Data Alumni</legend>'
                        +'<form onsubmit="simpan();return false;" autocomplete="off"><input id="idformH" type="hidden">' 
                        +'<label>NISN</label>'
                        +'<div class="input-control text">'
                            +'<input disabled id="nisnTB" name="nisnTB">'
                            // +'<input  type="hidden" name="nisnH" id="nisnH" >'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Nama Siswa</label>'
                        +'<div class="input-control text">'
                            +'<input disabled id="siswa2TB" name="siswa2TB">'
                            +'<input  type="hidden" name="siswaH" id="siswaH" >'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Tahun Lulus</label>'
                        +'<div class="input-control select span3">'
                            +'<input disabled name="tahunlulusTB" id="tahunlulusTB"></select>'
                            +'<input  type="hidden" name="tahunlulusH" id="tahunlulusH" >'
                        +'</div>'

                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                        +'</form>'

        // contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
        //                 +'<input id="idformH" type="hidden">' 
                        
        //                 +'<label>Departemen</label>'
        //                 +'<div class="input-control select">'
        //                     +'<select onchange="cmbtahunlulus2(\'form\',this.value,\'\');" name="departemenTB" id="departemenTB"></select>'
        //                 +'</div>'
                        
        //                 +'<label>Cari Siswa</label>'
        //                 +'<div class="input-control text">'
        //                     +'<input placeholder="kode/nama siswa" id="sisTB">'
        //                     +'<input  type="hidden" name="sisH" id="sisH" >'
        //                     +'<button class="btn-clear"></button>'
        //                 +'</div>'
        //                 +'<label>nisn</label>'
        //                 +'<div class="input-control text">'
        //                     +'<input disabled="disabled" placeholder="nisn" id="nisnTB">'
        //                     +'<button class="btn-clear"></button>'
        //                 +'</div>'
        //                 +'<label>nama</label>'
        //                 +'<div class="input-control text">'
        //                     +'<input disabled="disabled" placeholder="nama" id="siswaTB">'
        //                     +'<button class="btn-clear"></button>'
        //                 +'</div>'  
                        
        //                 +'<label>Tahun Lulus</label>'
        //                 +'<div class="input-control select span3">'
        //                     +'<select  name="tahunlulusTB" id="tahunlulusTB"></select>'
        //                 +'</div>'
                        
        //                 +'<label>Keterangan</label>'
        //                 +'<div class="input-control textarea">'
        //                     +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
        //                 +'</div>'
                        
        //                 +'<div class="form-actions">' 
        //                     +'<button class="button primary">simpan</button>&nbsp;'
        //                     +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
        //                 +'</div>'
        //             +'</form>';

        // combo departemen
        cmbdepartemen('filter','');
        // cmbdepartemen(false,'');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#departemenS').on('change',function(){
            cmbtahunlulus2('filter',$(this).val(),'');
        });
        $('#tahunlulusS').on('change',function (){
            viewTB();
        });
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#nisnS').val('');
            $('#namaS').val('');
            $('#keteranganS').val('');
        });
        $('#nisnS,#namaS,#keteranganS').on('keydown',function (e){ // kode grup
            if(e.keyCode == 13)
                viewTB();
        });
        // form        
        // $('#departemenTB').on('change',function(){
        //     cmbtahunlulus2('filter',$(this).val(),'');
        // });
    }); 
// end of save process ---

// combo departemen ---
    // function cmbdepartemen(dep){
    function cmbdepartemen(typ,dep){
        $.ajax({
            url:dir2,
            data:'aksi=cmbdepartemen',
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
                    if(typ=='filter'){ // filtering/ searching
                        $('#departemenS').html(out);
                        cmbtahunlulus2('filter',dt.departemen[0].replid,'');
                    }else{ //form
                        $('#departemenTB').html(out);
                    }
                }
            }
        });
    }
//end of combo departemen ---

// // combo tahunlulus ---
//     function cmbtahunlulus(dep,hun,idhun){
//         // console.log(dep+','+hun+','+idhun);
//         // return false;
//         var select='',tb;
//         if(hun){// form
//             tb='#tahunlulusTB';
//         }else{// search
//             tb='#tahunlulusS';
//             select+='<option value="">---------- Semua ----------</option>';
//             // if ($('#tahunlulusS').val()!='') {
//             //     tl=''
//             // };
//         }
//         $.ajax({
//             url:dir3,
//             data:'aksi=cmbtahunlulus&departemen='+dep,
//             dataType:'json',
//             type:'post',
//             success:function(dt){
//                 var out='';
//                 if(dt.status!='sukses'){
//                     out+='<option value="">'+dt.status+'</option>';
//                 }else{
//                     $.each(dt.nama, function(id,item){
//                         if(idhun==item.replid)
//                             out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
//                         else
//                             out+='<option value="'+item.replid+'">'+item.nama+'</option>';
//                     });
//                 }$(tb).html((dt.nama==null?'':select)+out);
//                 if(!hun) viewTB();
//             }
//         });
//     }
// //end of combo tahunlulus ----

// combo tahunlulus2 ---
    function cmbtahunlulus2(typ,dep,hun){
        $.ajax({
            url:dir3,
            data:'aksi=cmbtahunlulus&departemen='+dep,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    if(dt.nama.length==0)
                        out+='<option value="">kosong</option>';
                    else{
                        $.each(dt.nama, function(id,item){
                            if(item.replid==hun)
                                out+='<option selected="selected" value="'+item.replid+'">'+item.nama+'</option>';
                            else
                                out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                        });
                    }    
                }
                if(typ=='form'){ //form
                    $('#tahunlulusTB').html(out);
                }else{// filtering
                    $('#tahunlulusS').html(out);
                    viewTB();
                } 
            }
        });
    }
//end of combo tahunlulus2 ----

//save process ---
    function simpan(){
        var data ='&aksi=simpan';
        $.each(siswaArr(),function(id,item){
            data+='&siswa[]='+item;  
        });
        if($('#idformH').val()=='' && siswaArr().length<=0){ //add mode
            $('#siswaTB').focus();
            return false;
        }else{ // jika valid siap --> simpan
            var replid = ($('#idformH').val()!='')?'&replid='+$('#idformH').val():'';
            $.ajax({
                url:dir,
                data:$('form').serialize()+data+replid,
                cache:false,
                type:'post',
                dataType:'json',
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
                    }notif(cont,clr);
                    viewTB();
                }
            });
        }
    }
//end of save process ---

// view table ---
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari = '&tahunlulusS='+$('#tahunlulusS').val()
                    +'&departemenS='+$('#departemenS').val()
                    +'&nisnS='+$('#nisnS').val()
                    +'&namaS='+$('#namaS').val()
                    +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="7"><img src="img/w8loader.gif"></td></tr></center>');
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
        var pel=$('#tahunlulusS').val();
        $.Dialog({
            shadow:true,
            overlay:true,
            draggable:true,
            height:'auto',
            width:'35%',
            padding:20,
            onShow: function(){
                var titlex;
                var contentFR;
                $('#departemenH').val($('#departemenS').val());
                $('#tahunlulusH').val($('#tahunlulusS').val());
                if (id!='') { // edit mode
                    // alert('masuk edit'); return false;
                    titlex='<span class="icon-pencil"></span> Ubah ';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            // $('#departemenTB').val(dt.departemen);
                            $('#nisnTB').val(dt.nisn); 
                            $('#tahunlulusTB').val(dt.tahunlulus); 
                            $('#tahunlulusH').val(dt.idtahunlulus); 
                            $('#siswa2TB').val(dt.siswa); 
                            $('#siswaH').val(dt.siswak); 
                            $('#keteranganTB').val(dt.ket);
                            // cmbdepartemen('form',$('#departemenS').val());
                            // cmbtahunlulus2('form',dt.iddepartemen,dt.idtahunlulus);
                        }
                    });contentFR=contentEdit;
                }else{ //add mode
                   titlex='<span class="icon-plus-2"></span> Tambah ';
                    $.ajax({
                        url:dir2,
                        data:'aksi=cmbdepartemen',
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            cmbdepartemen('form',$('#departemenS').val());
                            cmbtahunlulus2('form',$('#tahunlulusS').val());
                        }
                    });
                    contentFR=contentAdd;
                }
                $.Dialog.title(titlex+' '+mnu);
                $.Dialog.content(contentFR);

                $("#siswaTB").combogrid({
                    debug:true,
                    width:'400px',
                    colModel: [{
                            'align':'left',
                            'columnName':'nisn',
                            'hide':true,
                            'width':'55',
                            'label':'NISN'
                        },{   
                            'columnName':'nama',
                            'width':'40',
                            'label':'NAMA'
                        }],
                    // url: dir+'?aksi=autocomp',
                    url: dir+'?aksi=autocomp&tahunlulus='+pel,
                    select: function( event, ui ) { // event setelah data terpilih 
                        // $('#gruruH').val(ui.item.replid);
                        
                        siswaAdd(ui.item.replid,ui.item.nisn,ui.item.nama);
                        // alert(ui.item.replid);
                        
                        // $('#barangTB').combogrid( "option", "url", dir+'?aksi=autocomp&tahunlulus='+pel+'&siswa='+siswaArr() );
                        // $(this).combogrid( "option", "url", dir+'?aksi=autocomp&lokasi='+$('#lokasiTB').val() );
                            // $('#siswaTB').combogrid( "option", "url", dir+'?aksi=autocomp');
                        return false;
                    }
                    
                });

            }
        });
}
// pilih barang yg akan dipinjam ---
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
        if($('#siswaTBL').html()=='')
            $('#siswaTBL').html(tr);
        else
            $('#siswaTBL').html('');
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
                    viewTB($('#departemenS').val());
                    cont = '..Berhasil Mengaktifkan '+th+' ..';
                    clr  ='green';
                }notif(cont,clr);
            }
        });
    }
//end of aktifkan process ---

    // ---------------------- //
    // -- created by rovi -- //
    // ---------------------- //