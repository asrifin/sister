// <<<<<<< HEAD
// var mnu       = 'kelompok';
// var mnu2      = 'departemen';
// var mnu3      = 'proses';
// var dir       = 'models/m_'+mnu+'.php';
// var dir2      = '../akademik/models/m_'+mnu2+'.php';
// var dir3      = 'models/m_'+mnu3+'.php';
// =======
var mnu  = 'kelompok';
var mnu6 = 'departemen';
var mnu7 = 'tahunajaran';

var dir  = 'models/m_'+mnu+'.php';
var dir6 = '../akademik/models/m_'+mnu6+'.php';
var dir7 = '../akademik/models/m_'+mnu7+'.php';

// >>>>>>> 16b10b67bc3832dcc38dadb0a4a395994316b3a9
var contentFR = '';

// main function ---
    $(document).ready(function(){
        cmbdepartemen('filter','');
        contentFR += '<div style="overflow:scroll;height:550px;"  class="">'
                        +'<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 

                        +'<input id="departemenH" name="departemenH" type="hidden">' 
                        // tahun ajaran 
                        +'<label>Tahun Ajaran</label>'
                        +'<div class="input-control select">'
                            +'<select id="tahunajaranTB"name="tahunajaranTB"></select>'
                        +'</div>'

                        //kelompok
                        +'<label>Kelompok</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="kelompok" required type="text" name="kelompokTB" id="kelompokTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'

                        // tgl mulai
                        +'<label>Tanggal Mulai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input required id="tglmulaiTB" name="tglmulaiTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        // tgl selesai
                        +'<label>Tanggal Selesai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input required id="tglselesaiTB" name="tglselesaiTB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'

                        // keterngan
                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'
                        
                        // button
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';
                    +'</div>'

        $("#tambahBC").on('click', function(){
            viewFR('');
        });

    /*filtering*/
        // combo
        $('#departemenS').on('change',function(){
            cmbtahunajaran('filter',$(this).val());
        });$('#tahunajaranS').on('change',function (){
            cmbsubtingkat('filter',$(this).val());
        });
        //textbox
        $('#kelompokS,#keteranganS').keydown(function (e){
            if(e.keyCode == 13) viewTB();
        });

        // button actions 
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#kelasS').val('');
            $('#waliS').val('');
        });
    }); 

// combo tahunajaran ---
    function cmbtahunajaran(typ,thn){
        var u = dir7;
        var d ='aksi=cmb'+mnu7+(thn!=''?'&replid='+thn:'');
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.tahunajaran, function(id,item){
                    out+='<option '+(thn!='' && thn==item.replid?'selected':'')+' value="'+item.replid+'">'+item.tahunajaran+'</option>';
                });
            }
            if(typ=='filter'){
                $('#tahunajaranS').html(out);
                viewTB();
            }else{
                $('#tahunajaranTB').html('<option value="">-Pilih Tahun Ajaran-</option>'+out);
            }
        });
    }

// combo departemen ---
    function cmbdepartemen(typ,dep){
        var u = dir6;
        var d ='aksi=cmb'+mnu6+(dep!=''?'&replid='+dep:'');
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                $.each(dt.departemen, function(id,item){
                    out+='<option '+(dep!='' && dep==item.replid?'selected':'')+' value="'+item.replid+'">'+item.nama+'</option>';
                });
            }
            if(typ=='filter'){
                $('#departemenS').html(out);
                cmbtahunajaran('filter','');
            }else{
                $('#departemenH').val(dt.departemen[0].replid);
            }
        });
    }

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
        $.Dialog({
            shadow:true,
            overlay:true,
            draggable:true,
            height:'auto',
            width:'35%',
            padding:20,
            onShow: function(){
                $.Dialog.content(contentFR);
                $('#tahunajaranTB').focus();
                var titlex;
                if (id!=''){ // edit
                    ajax(dir,'aksi=ambiledit&replid='+id).done(function  (dt) {
                        $('#idformH').val(id);
                        $('#kelompokTB').val(dt.kelompok);
                        $('#keteranganTB').val(dt.keterangan);
                        cmbdepartemen('form',dt.departemen);
                        cmbtahunajaran('form',dt.tahunajaran);
                    });
                }else{ // add
                    cmbdepartemen('form','');
                    cmbtahunajaran('form','');
                }
                $('#tglmulaiTB').val(getToday());
                $('#tglselesaiTB').val(getToday());
                $.Dialog.title(titlex+' '+mnu);
            }
        });
    }
// end of form ---

  // autosuggest
    function autoSuggest(jenis,el,subaksi,tingkat){
        var urlx= '?aksi=autocomp&subaksi='+subaksi+(jenis!=''?'&jenis='+jenis:'');
        var col = [{
                'align':'left',
                'columnName':'kode',
                'hide':true,
                'width':'10',
                'label':'Kode'
            },{   
                'align':'left',
                'columnName':'nama',
                'width':'90',
                'label':'Rekening'
        }];
        urly = dir+urlx;
        $('#'+el+'TB').combogrid({
            debug:true,
            width:'750px',
            colModel: col ,
            url: urly,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                $('#'+el+'TB').val(ui.item.nama+' ( '+ui.item.kode+' )');
                var arr = rekArrFC();
                var str = arr.toString();

                // validasi input (tidak sesuai data dr server)
                    $('#'+el+'TB').on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+el+'H').val()!=''){
                                $('#'+el+'H').val('');
                                $('#'+el+'TB').val('');
            
                                var str = rekArr.toString();
                                console.log('terpilih in auto 2 =>'+str+' arr=> '+rekArr);
                                if(subaksi=='out_come') $('#detilanggaranV').val(''); // :: out_come
                            }
                        }
                    });
                    $('#'+el+'TB').on('blur,change',function(){
                        if($('#'+el+'H').val()=='') {
                            $('#'+el+'TB').val(''); // :: all 
                            if(subaksi=='out_come') $('#detilanggaranV').val(''); // :: out_come
                        }
                    });
                return false;
            }
        });
    }


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
        $('#keteranganTB').val('');
    }
//end of reset form ---

    function ajax (u,d) {
        return $.ajax({
            url:u,
            data:d,
            dataType:'json',
            type:'post',
        });
    }


// left pad (replace with 0)
    function lpadZero (n, length){
        var str = (n > 0 ? n : -n) + "";
        var zeros = "";
        for (var i = length - str.length; i > 0; i--)
            zeros += "0";
        zeros += str;
        return n >= 0 ? zeros : "-" + zeros;
    }

    function validUang () {
        //TODO
    }

/*about date*/ 
// get month format -------------
    function monthFormat(mon){
        switch(mon){
            case 1:return 'Jan';break;
            case 2:return 'Feb';break;
            case 3:return 'Mar';break;
            case 4:return 'Apr';break;
            case 5:return 'May';break;
            case 6:return 'Jun';break;
            case 7:return 'Jul';break;
            case 8:return 'Aug';break;
            case 9:return 'Sep';break;
            case 10:return 'Oct';break;
            case 11:return 'Nov';break;
            case 12:return 'Dec';break;
        }
    }

//date format -----------------
    function dateFormatx(typ,d,m,y){
        if(typ=='id') // 25 Dec 2014
            return d+' '+m+' '+y;
        else // 2014-12-25
            return y+'-'+m+'-'+d;
    }

//global u/ tanggal --------
    var now  = new Date();
    var dd   = now.getDate();
    var mm   = now.getMonth()+1;
    var yyyy = now.getFullYear();

//tanggal terakhir : dd
    function lastDate(m,y){
        return 32 - new Date(y, (m-1), 32).getDate();
    }
// tanggal hari ini : dd mm yyyy
    function getToday() {
        // function addLeadingZeros (n, length){
        return dateFormatx('id',lpadZero(dd,2),monthFormat(mm),yyyy);
    }
