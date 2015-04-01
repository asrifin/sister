var mnu       = 'rpp2';
var mnu2      = 'departemen';
var mnu3      = 'tahunajaran';
var mnu4      = 'semester';
var mnu5      = 'tingkat';
var mnu6      = 'subtingkat';
var mnu7      = 'pelajaran';
var dir       = 'models/m_'+mnu+'.php';
var dir2      = '../akademik/models/m_'+mnu2+'.php';
var dir3      = '../akademik/models/m_'+mnu3+'.php';
var dir4      = '../akademik/models/m_'+mnu4+'.php';
var dir5      = '../akademik/models/m_'+mnu5+'.php';
var dir6      = '../akademik/models/m_'+mnu6+'.php';
var dir7      = '../akademik/models/m_'+mnu7+'.php';
var contentFR = '';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        
                        +'<label>Departemen</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="departemenH" id="departemenH">'
                            +'<input disabled type="text" name="departemenTB" id="departemenTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Tahun Ajaran</label>'
                        +'<div class="input-control text">'
                            +'<input type="hidden" name="tahunajaranH" id="tahunajaranH">'
                            +'<input disabled type="text" name="tahunajaranTB" id="tahunajaranTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Tingkat</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="tingkat" oninvalid="this.setCustomValidity(\'isi dulu gan\');" required type="text" name="tingkatTB" id="tingkatTB">'
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

        // combo departemen
        cmbdepartemen();
        // cmbdepartemen(false,'');

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action
        $('#departemenS').on('change',function(){
            cmbtahunajaran($(this).val());
        });
        $('#tahunajaranS').on('change',function (){
            cmbsemester($(this).val());
        });
        $('#semesterS').on('change',function(){ /*epiii*/
            cmbtingkat($('#tahunajaranS').val());
        });
        $('#tingkatS').on('change',function(){ /*epiii*/
            cmbsubtingkat($(this).val());
        });
        $('#subtingkatS').on('change',function(){ /*epiii*/
            cmbpelajaran($('#tahunajaranS').val());
        });
        $('#pelajaranS').on('change',function(){ /*epiii*/
            viewTB();
        });
        // $('#tingkatS').keydown(function(e){
        //     cmbtahunajaran('filter',$(this).val(),'');
        // });$('#subtingkatS').keydown(function(e){
        //     cmbtingkat('filter',$(this).val(),'');
        // });$('#semesterS').keydown(function(e){
        //     cmbtahunajaran('filter',$(this).val(),'');
        // });$('#pelajaranS').keydown(function(e){
        //     viewTB();
        // });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#tingkatS').val('');
            $('#keteraganS').val('');
        });
    }); 
// end of save process ---

// combo departemen ---
    function cmbdepartemen(){
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
                    $('#departemenS').html(out);
                }cmbtahunajaran(dt.departemen[0].replid);
            }
        });
    }
//end of combo departemen ---

// combo tahunajaran ---
    function cmbtahunajaran(dep){
        $.ajax({
            url:dir3,
            data:'aksi=cmbtahunajaran&departemen='+dep,
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
                    // viewTB(dep,dt.tahunajaran[0].replid); 
                    $('#tahunajaranS').html(out); /*epiii*/
                    cmbsemester(dt.tahunajaran[0].replid); /*epiii*/
                }
                // $('#tahunajaranS').html(out);
                // cmbsemester(dt.tahunajaran[0].replid,false,null);
            }
        });
    }
//end of combo tahunajaran ---
// combo semester ---
    function cmbsemester(thn){
        $.ajax({
            url:dir4,
            data:'aksi=cmbsemester&tahunajaran='+thn,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.nama, function(id,item){
                        if(item.aktif=='1'){
                            out+='<option selected="selected" value="'+item.replid+'">'+item.nama+' (aktif)</option>';
                        }else{
                            out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                        }
                    });
                    // viewTB(dep,dt.semester[0].replid); 
                    $('#semesterS').html(out); /*epiii*/
                    cmbtingkat($('#tahunajaranS').val()); /*epiii*/
                }
                // $('#semesterS').html(out);
                // cmbtingkat(dt.nama[0].replid,false,null);
            }
        });
    }
//end of combo tahunajaran ---
// combo tingkat ---
    // function cmbtingkat(){
    function cmbtingkat(thn){ /*epiii*/
        $.ajax({
            url:dir5,
            // data:'aksi=cmbtingkat',
            data:'aksi=cmbtingkat&tahunajaran='+thn, /*epiii*/
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.tingkat, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.tingkat+'</option>';
                    });
                    $('#tingkatS').html(out);
                    cmbsubtingkat(dt.tingkat[0].replid); /*epiii*/
                }
                // cmbsubtingkat(dt.tingkat[0].replid);
                // $('#tingkatS').html(out);
                // viewTB();
                // cmbsubtingkat(dt.tingkat[0].replid,false,null);
            }
        });
    }
//end of combo tingkat ---
// combo subtingkat ---
    function cmbsubtingkat(tkt){
        $.ajax({
            url:dir6,
            data:'aksi=cmbsubtingkat&tingkat='+tkt,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.nama, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.subtingkat+'</option>'; /*epiii */
                        // out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                    $('#subtingkatS').html(out);
                    cmbpelajaran($('#tahunajaranS').val()); /*epiii*/
                }
                // cmbsubsubtingkat(dt.subtingkat[0].replid);
                // $('#subtingkatS').html(out);
                 // cmbpelajaran(dt.nama[0].replid,false,null);
            }
        });
    }
//end of combo subtingkat ---
// combo pelajaran ---
    function cmbpelajaran(thn){
        $.ajax({
            url:dir7,
            data:'aksi=cmbpelajaran&tahunajaran='+thn,
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.pelajaran, function(id,item){
                        out+='<option value="'+item.replid+'">'+item.nama+'</option>'; /*epiii */
                        // out+='<option value="'+item.replid+'">'+item.pelajaran+'</option>';
                    });
                    $('#pelajaranS').html(out);
                    viewTB(); /*epiii*/ 
                }
                // cmbsubpelajaran(dt.pelajaran[0].replid);
                // $('#pelajaranS').html(out);
                // viewTB(); 
            }
        });
    }
//end of combo subtingkat ---

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
    function viewTB(){
        var aksi ='aksi=tampil';
        var cari = '&pelajaranS='+$('#pelajaranS').val()
                    +'&tingkatS='+$('#tingkatS').val()
                    +'&subtingkatS='+$('#subtingkatS').val()
                    +'&departemenS='+$('#departemenS').val()
                    +'&tahunajaranS='+$('#tahunajaranS').val()
                    +'&semesterS='+$('#semesterS').val();
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
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 500,
            padding: 10,
            onShow: function(){
                var titlex;
                // form :: departemen (disabled field) -----------------------------
                    $.ajax({
                        url:dir2,
                        data:'aksi=cmb'+mnu2+'&replid='+$('#departemenS').val(),
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#departemenH').val($('#departemenS').val());
                            $('#tahunajaranH').val($('#tahunajaranS').val());
                            var out;
                            if(dt.status!='sukses'){
                                out=dt.status;
                            }else{
                                out=dt.departemen[0].nama;
                            }$('#departemenTB').val(out);
                        // form :: tahun ajaran (disabled field) --------------
                            $.ajax({
                                url:dir3,
                                data:'aksi=cmbtahunajaran&departemen='+$('#departemenS').val()+'&replid='+$('#tahunajaranS').val(),
                                dataType:'json',
                                type:'post',
                                success:function(dt2){
                                    var out2;
                                    if(dt.status!='sukses'){
                                        out2=dt2.status;
                                    }else{
                                        out2=dt2.tahunajaran[0].tahunajaran;
                                    }$('#tahunajaranTB').val(out2);
                                    
                                    if (id!='') { // edit mode
                                    // form :: edit :: tampilkan data 
                                        $.ajax({
                                            url:dir,
                                            data:'aksi=ambiledit&replid='+id,
                                            type:'post',
                                            dataType:'json',
                                            success:function(dt3){
                                                $('#idformH').val(id);
                                                $('#tingkatTB').val(dt3.tingkat);
                                                $('#keteranganTB').val(dt3.keterangan);
                                            }
                                        });
                                    // end of form :: edit :: tampilkan data 
                                        titlex='<span class="icon-pencil"></span> Ubah ';
                                    }else{ //add mode
                                        titlex='<span class="icon-plus-2"></span> Tambah ';
                                    }
                                }
                            });
                        //end of  form :: tahun ajaran (disabled field) --------------
                        }
                    });
                //end of form :: departemen (disabled field) -----------------------------
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

    // ---------------------- //
    // -- created by epiii -- //
    // ---------------------- //