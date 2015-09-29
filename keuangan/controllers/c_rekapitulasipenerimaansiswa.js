var mnu  = 'rekapitulasisiswa';
var mnu2 = 'departemen';
var mnu3 = 'tahunajaran';

var dir  = 'models/m_'+mnu+'.php';
var dir2  = '../akademik/models/m_'+mnu2+'.php';
var dir3  = '../akademik/models/m_'+mnu3+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        cmbdepartemen('filter','');
        viewTB();
        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });
        $('#cetakBC').on('click',function(){
            printPDF();
        });

        //search action
        $('#tahunajaranS,#departemenS').on('change',function(){
            viewTB();
        });
        $('#golonganS,#keteranganS').keydown(function(e){
            if(e.keyCode==13) viewTB();
        });

        // search button
        // $('#cariBC').on('click',function(){
        //     $('#cariTR').toggle('slow');
        //     $('#kodeS').val('');
        //     $('#tingkatS').val('');
        //     $('#keteraganS').val('');
        // });
    }); 
// end of save process ---

//save process ---
    function simpan(){
        // var urlx ='&aksi=simpan&departemen='+$('#departemenS').val();
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
                    viewTB($('#departemenS').val());
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
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                if (id!='') { // edit mode
                    var u = dir;
                    var d = 'aksi=ambiledit&replid='+id;
                    ajax(u,d).done(function (dt){
                        var out;
                        $('#idformH').val(id);
                        $('#golonganTB').val(dt.golongan);
                        $('#keteranganTB').val(dt.keterangan);
                    });
                    titlex='<span class="icon-pencil"></span> Ubah ';
                }else{
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                }
                $.Dialog.title(titlex+' '+mnu);
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
                    viewTB($('#departemenS').val());
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
//
function ajax(u,d){
    return $.ajax({
        url:u,
        data:d,
        type:'post',
        dataType:'json'
    });
}

// urutan tabel
    function urutFC (e) {
        var u = dir;
        var d ='aksi=urutan&replid1='+$(e).attr('replid1')+'&urutan2='+$(e).val();
        ajax(u,d).done(function  (dt) {
            var cont,clr;
            if(dt.status!='sukses'){
                cont = '..Gagal Merubah urutan ';
                clr  ='red';
            }else{
                viewTB();
                cont = '..Berhasil Merubah Urutan ';
                clr  ='green';
            }notif(cont,clr);
        });
    }


// combo departemen ---
    function cmbdepartemen(typ,dep){
        var u = dir2;
        var d ='aksi=cmb'+mnu2;
        ajax(u,d).done(function (dt){
            var out='';
            if(dt.status!='sukses') out+='<option value="">'+dt.status+'</option>';
            else{
                $.each(dt.departemen, function(id,item){
                    out+='<option '+(dep==item.replid?'selected':'')+' value="'+item.replid+'">'+item.nama+'</option>';
                });
            }
            if(typ=='filter'){ // filter (search)
                $('#departemenS').html(out);
                cmbtahunajaran('filter','');
            }else{ // form (edit & add)
                $('#departemenTB').html('<option value="">-Pilih Departemen-</option>'+out);
            }
        });
    }

// combo tahunajaran ---
    function cmbtahunajaran(typ,thn){
        var u= dir3;
        var d='aksi=cmb'+mnu3;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.tahunajaran.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.tahunajaran, function(id,item){
                        out+='<option '+(thn==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1)+'</option>';
                    });
                }
                if(typ=='filter'){ // filter (search)
                    $('#tahunajaranS').html(out);
                    viewTB();
                }else{ // form (edit & add)
                    $('#tahunajaranTB').html('<option value="">-Pilih Tahun Ajaran-</option>'+out);
                }
            }
        });
    }
//end of combo tingkat ---


// cmbo golongan 
    function cmbtingkatZ(tipe,ting,dept) {
        // console.log('ini ingkat ='+ting);
        var dep=typeof dept=='string'?dept:$('#departemen'+(tipe=='filter'?'S':'TB')).val();
        var d = 'aksi=cmb'+mnu4+'&departemen='+dep;
        ajax(dir4,d).done(function (dt){
            var opt='';
            if (dt.status!='sukses') {
                notif(dt.status,'red');
                opt+='<option value="">'+dt.status+'</option>'
            }else{
                var opt = '';
                $.each(dt.tingkat,function (id,item){
                    opt+='<option '+(ting==item.replid?'selected':'')+' value="'+item.replid+'">'+item.tingkat+'</option>'
                });
                if(tipe=='form') $('#tingkatTBZ').html('<option value="">-Pilih Tingkat-</option>'+opt);
                else {
                    $('#tingkatS').html(opt);
                    viewTB('siswa');
                }
            }
        });
    }   


//end of  print to PDF -------
    function printPDF(){
        var par='',tok='',p,v;
        // var el ='.'+(typeof mn=='undefined'?'':mn+'_')+'cari';
        $('.cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });

        var x  = $('#id_loginS').val();
        var token = encode64(x+tok);
        console.log('para = '+par);
        console.log('tok = '+x+tok);
        console.log('token = '+token);
        window.open('report/r_rekapitulasisiswa.php?token='+token+par,'_blank');
    }
