var mnu       ='aktivitas'; 
var mnu2      ='lokasi'; 
var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 
                        +'<label>Lokasi</label>'
                        +'<div class="input-control text">'
                            +'<input  type="hidden" name="lokasiH" id="lokasiH" class="span2">'
                            // +'<input enabled="enabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<input disabled="disabled" name="lokasiTB" id="lokasiTB" class="span2">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        
                        +'<label>Tanggal Mulai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input required id="tanggal1TB" name="tanggal1TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                        +'<label>Tanggal Selesai</label>'
                        +'<div class="input-control text" data-role="datepicker"'
                            +'data-format="dd mmmm yyyy"'
                            +'data-effect="slide">'
                            +'<input id="tanggal2TB" name="tanggal2TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                        +'<label>Aktivitas</label>'
                        +'<div class="input-control text">'
                            +'<input placeholder="aktivitas" required type="text" name="aktivitasTB" id="aktivitasTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Keterangan</label>'
                        +'<div class="input-control textarea">'
                            +'<textarea placeholder="keterangan" name="keteranganTB" id="keteranganTB"></textarea>'
                        +'</div>'

                        // button 
                        +'<legend style="font-weight:bold;">Item  : '
                            +'<a id="addTRBC" href="#" class="place-right button bg-blue fg-white">'
                                +'<i class="icon-plus-2"></i>'
                            +'</a>'
                        +'</legend>'

                        // tabel item 
                        +'<table class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">Item</th>'
                                    +'<th class="text-center">Biaya yg diajukan</th>'
                                    +'<th class="text-center">Biaya yg disetujui</th>'
                                    +'<th class="text-center">Tgl Wajib Bayar</th>'
                                    +'<th class="text-center">Tgl Pelunasan</th>'
                                    +'<th class="text-center">Hapus</th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="itemTBL"></tbody>'
                        +'</table>'
                        
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        /*
        load pertama kali (pilihn salah satu) :
        cmblokasi : bila ada combo box
        viewTB : jika tanpa combo box
        */

        //combo lokasi
        cmblokasi();
        
        //load table // edit by epiii
        // viewTB();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //search action // edit by epiii
        $('#lokasiS').on('change',function (e){ // change : combo box
                viewTB($('#lokasiS').val());
        });
        // $('#tempatS').on('keydown',function (e){ // keydown : textbox
        //     if(e.keyCode == 13)
        //         // viewTB($('#tempatS').val());
        //         viewTB($('#lokasiS').val());
        // });
        // $('#keteranganS').on('keydown',function (e){ // keydown : textbox
        //     if(e.keyCode == 13)
        //         // viewTB($('#keteranganS').val());
        //         viewTB($('#lokasiS').val());
        // });

        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            // $('#lokasiS').val('');
            $('#tempatS').val('');
            $('#keteranganS').val('');
        });
    }); 
// end of main function ---

// ghjg
// ghjg
// combo departemen ---
    // function cmblokasi(lok){ edited by epiii
    function cmblokasi(){
        $.ajax({
            url:dir2,
            data:'aksi=cmblokasi',
            dataType:'json',
            type:'post',
            success:function(dt){
                var out='';
                if(dt.status!='sukses'){
                    out+='<option value="">'+dt.status+'</option>';
                }else{
                    $.each(dt.lokasi, function(id,item){
                        out+='<option value="'+item.replid+'">['+item.kode+'] '+item.nama+'</option>';
                    });
                    //panggil fungsi viewTB() ==> tampilkan tabel 
                    viewTB(dt.lokasi[0].replid); 
                }$('#lokasiS').html(out);
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
                    // viewTB($('#aktivitasS').val());
                    viewTB($('#'+mnu2+'S').val()); //value : combo box LOKASI 
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
            }
        });
    }
//end of save process ---

// view table ---
    // function viewTB(nama){          
    function viewTB(lok){ //edit by epiii 
        var aksi ='aksi=tampil';
        var cari ='&lokasiS='+lok
                    +'&aktivitasS='+$('#aktivitasS').val()
                    +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $('#tbody').html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table ---
    // record rekening perkiraan
    var iTR = 1;    
    var idDelTR = [];
    var idAddTR = [];

    function itemTR (n,arr) {
        var tr='';
        var isLoop=true;
        if(typeof n=='undefined'){ isLoop=false; n=iTR;}
        for(var i=n; i>=iTR; i--){
            var ke = parseInt(i)-1;
            var iditem   = (typeof arr!='undefined')?arr[ke].iditem:null;
            var item     = (typeof arr!='undefined')?arr[ke].item:'';
            var biaya    = (typeof arr!='undefined')?arr[ke].biaya:'';
            var biaya2   = (typeof arr!='undefined')?arr[ke].biaya2:'';
            var tglbayar = (typeof arr!='undefined')?arr[ke].tglbayar:'';
            var tgllunas = (typeof arr!='undefined')?arr[ke].tgllunas:'';
            
            var mode = (typeof arr!='undefined')?'edit':'add';

            tr+='<tr class="rekTR" id="rekTR_'+ke+'">'
                    // item
                    +'<td align="center">'
                        +'<input type="hidden" name="mode'+ke+'H" value="'+mode+'" />'
                        // +'<input type="hidden" value="'+id+'" name="iditem_'+ke+'H" id="iditem_'+ke+'H">'
                        +'<input type="hidden" class="idTR" value="'+ke+'" name="idTR[]" id="idTR_'+ke+'">'
                        +'<div class="input-control text">'
                            +'<input required id="item_'+ke+'TB" name="item_'+ke+'TB">'
                        +'</div>' 
                    +'</td>'
                    // biaya yg diajukan 
                    +'<td align="center">'
                        +'<span class="input-control text">'
                            +'<input value="'+item+'" required onfocus="inputuang(this);" onclick="inputuang(this);"' 
                                +((biaya2>0 || biaya2!='')?'disabled':'')+' id="biaya_'+ke+'TB" name="biaya_'+ke+'TB" >'
                            +'<button class="btn-clear"></button>'
                        +'</span>'
                    +'</td>'
                    // biaya yg disetujui 
                    +'<td align="center">'
                        +'<span id="biaya2_'+ke+'TB" class="input-control text">'+biaya2+'</span>'
                    +'</td>'
                    // tgl wajib dibayar
                    +'<td align="center">'
                        +'<div class="input-control text" data-role="datepicker"' 
                            +'data-format="dd mmmm yyyy" data-position="top"'
                            +'data-effect="slide">'
                            +'<input value="'+tglbayar+'" required id="tglbayar_'+ke+'TB" name="tglbayar_'+ke+'TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                    +'</td>'
                    // tgl pelunasan
                    +'<td align="center">'
                        +'<div class="input-control text" data-role="datepicker"' 
                            +'data-format="dd mmmm yyyy" data-position="top"'
                            +'data-effect="slide">'
                            +'<input  value="'+tgllunas+'" required id="tgllunas_'+ke+'TB" name="tgllunas_'+ke+'TB" type="text">'
                            +'<button class="btn-date"></button>'
                        +'</div>'
                    +'</td>'
                    // hapus
                    +'<td align="center">'
                        // +'<a href="#" onclick="'+(typeof arr!='undefined'?'if(confirm(\'melanjutkan untuk menghapus data?\')) delItemTR('+ke+','+idjurnal+',\'\');':'delItemTR('+ke+','+idjurnal+',\'\')')+'"  class="button"><i class="icon-cancel-2"></i></a>'
                    +'</td>'
                +'</tr>';
        }
        if(isLoop) iTR+=n;
        else iTR++;
        return tr; 
    }

//add TR rekening into an element 
    function addItemTR(n,arr){
        // console.log(itemTR(n,arr));return false;
        // $('#itemTBL').prepend('<tr><td>1</td><td>2</td><td>3</td><td>4</td><td>5</td><td></td></tr>');
        $('#itemTBL').prepend(itemTR(n,arr));
    }

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
                if(id==''){  //add mode
                    // alert('halooo');
                    titlex='<span class="icon-plus-2"></span> Tambah ';
                    var u = dir2;
                    var d = 'aksi=cmblokasi&replid='+$('#lokasiS').val();
                    ajax(u,d).done(function(dt){
                        $('#tanggal1TB').val(getToday());
                        $('#tanggal2TB').val(getToday());
                        $('#lokasiTB').val(dt.lokasi[0].nama);
                        $('#lokasiH').val($('#lokasiS').val());
                    });
                    addItemTR(1);
                }else{ // edit mode
                    titlex='<span class="icon-pencil"></span> Ubah';
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(dt){
                            $('#idformH').val(id);
                            // $('#tempatH').val($('#tempatS').val());
                            $('#lokasiH').val($('#lokasiS').val()); // edit by epii
                            $('#lokasiTB').val(dt.lokasi);
                            $('#tanggal1TB').val(dt.tanggal1);
                            $('#tanggal2TB').val(dt.tanggal2);
                            $('#aktivitasTB').val(dt.aktivitas);
                            $('#keteranganTB').val(dt.keterangan);
                        }
                    });
                }
                $.Dialog.title(titlex+' '+mnu); // edit by epiii
                $.Dialog.content(contentFR);
            }
        });
    }
// end of form ---

//paging ---
    function pagination(page,aksix,menux){ 
        var datax = 'starting='+page+'&aksi='+aksix+'&menu='+menux;
        var cari  = '&lokasiS='+$('#lokasiS').val();
                    // +'&tempatS='+$('#tempatS').val()
                    // +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url:dir,
            type:"post",
            data: datax+cari,
            beforeSend:function(){
                $('#tbody').html('<tr><td align="center" colspan="4"><img src="img/w8loader.gif"></td></tr></center>');
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
        $('#tanggal1TB').val('');
        $('#tanggal1TB').val('');
        $('#aktivitasTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---

    // ---------------------- //
    // -- created by rovi  -- //
    // ---------------------- // 



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
// tanggal pertama bulan ini : dd mm yyyy 
    function getFirstDate() {
        return dateFormatx('id','01',monthFormat(mm),yyyy);
    }
// tanggal terakhir bulan ini  : dd mm yyyy
    function getLastDate() {
        var dd = lastDate(mm,yyyy);
        return dateFormatx('id',dd,monthFormat(mm),yyyy);
    }

// fungsi AJAX : asyncronous
    function ajax(u,d) {
        return $.ajax({
            url:u,
            type:'post',
            dataType:'json',
            data:d
        });
    }

