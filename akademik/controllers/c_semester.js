var mnu       = 'semester';
var mnu2      = 'departemen';
var mnu3      = 'tahunajaran';
var dir       = 'models/m_'+mnu+'.php';
var dir2      = 'models/m_'+mnu2+'.php';
var dir3      = 'models/m_'+mnu3+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        cmbtahunajaran('filter','');

        contentFR += '<form style="overflow:scroll;height:500px;" autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        // Tahun Ajaran
                        +'<label>Tahun Ajaran</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="tahunajaranH" id="tahunajaranH">'
                            +'<input disabled type="text" name="tahunajaranTB" id="tahunajaranTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        // Semester
                        +'<label>Semester</label>'
                        +'<div>'
                            +'<div class="input-control radio margin3" >'
                                +'<label>'
                                    +'<input value="1" required type="radio" name="semesterTB" />'
                                    +'<span class="check"></span>'
                                    +'Ganjil'
                                +'</label>'
                                +'<label>'
                                    +'<input value="2" required type="radio" name="semesterTB" />'
                                    +'<span class="check"></span>'
                                    +'Genap'
                                +'</label>'
                            +'</div>'
                        +'</div>'

                        // tanggal mulai 
                        +'<label>Tanggal Mulai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input placeholder="tanggal mulai" required id="tglMulaiTB" name="tglMulaiTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        // tanggal selesai 
                        +'<label>Tanggal Selesai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input  placeholder="tanggal selesai" required id="tglSelesaiTB" name="tglSelesaiTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';


        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#tahunajaranS').on('change',function (){
            viewTB();
        });$('#departemenS').on('change',function(){
            cmbtahunajaran($(this).val());
        });$('#tingkatS').keydown(function(e){
            if(e.keyCode==13)
                viewTB();
        });$('#keteranganS').keydown(function(e){
            if(e.keyCode==13)
                viewTB();
        });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#tingkatS').val('');
            $('#keteraganS').val('');
        });
    }); 
// end of save process ---

// combo tahunajaran ---
    function cmbtahunajaran(typ,thn){
        u=dir3;
        d='aksi=cmbtahunajaran'+(thn!=''?'&replid='+thn:'');
        ajax(u,d).done(function(dt){
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    out+='<option '+(item.repld==thn?'selected':'')+' value="'+item.replid+'">'+item.tahunajaran+' - '+(parseInt(item.tahunajaran)+1)+'</option>';
                });
            }
            if(typ=='filter'){ // filter
                $('#tahunajaranS').html(out);
                viewTB();
            }else{ // form
                $('#tahunajaranTB').val(dt.tahunajaran[0].tahunajaran);
                $('#tahunajaranH').val(dt.tahunajaran[0].replid);
            }
        });
    }
//end of combo tahunajaran ---

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
        if($('#idformH').val()!='') urlx += '&replid='+$('#idformH').val();

        var u = dir;
        var d =$('form').serialize()+urlx;
        ajax(u,d).done(function(dt){
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
        });
    }
//end of save process ---

// view table ---
    function viewTB(subaksi){
        var aksi ='aksi=tampil';
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
                $(el2).html('<tr><td align="center" colspan="6"><img src="img/w8loader.gif"></td></tr>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }

// // form ---
    function viewFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '90%',
            padding: 10,
            onShow: function(){
                var titlex;
                var u = dir;
                var d = 'aksi=ambiledit&replid='+id;
                if(id!=''){ // edit
                    ajax(u,d).done(function(dt){
                        $('#idformH').val(id);
                        $('#tahunajaranH').val($('#tahunajaranS').val());
                        $('#tahunajaranTB').val(dt.tahunajaran);
                        $('#tglMulaiTB').val(dt.tglMulai);
                        $('#tglSelesaiTB').val(dt.tglSelesai);
                        $.each($('input[name="semesterTB"]'),function(){
                            if(dt.semester==$(this).val())
                                $(this).attr('checked',true);
                        })
                    });
                }else{ // add
                    $('#tahunajaranH').val($('#tahunajaranS').val());
                    cmbtahunajaran('form',$('#tahunajaranS').val());
                }
                $.Dialog.title(titlex+' '+mnu);
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

//paging ---
    // function pagination(page,aksix,menux){
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
        u=dir;
        d='aksi=hapus&replid='+id;
        ajax(u,d).done(function(dt){
            var cont,clr;
            if(dt.status!='sukses'){
                cont = '..Gagal Menghapus '+dt.terhapus+' ..';
                clr  ='red';
            }else{
                viewTB();
                cont = '..Berhasil Menghapus '+dt.terhapus+' ..';
                clr  ='green';
            }notif(cont,clr);
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
        $('#'+mnu+'TB').val('');
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

// ajax async.
function ajax (u,d) {
    return $.ajax({
        url:u,
        data:d,
        dataType:'json',
        type:'post'
    });
}