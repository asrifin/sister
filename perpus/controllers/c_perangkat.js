var mnu       ='perangkat'; 
var mnu2      ='lokasi'; 

var dir       ='models/m_'+mnu+'.php';
var dir2      ='models/m_'+mnu2+'.php';

var contentFR ='';

// main function load first 
    $(document).ready(function(){
        enabledButton();
        cmblokasi();
        $('#lokasiS').on('change',function(){
            autoSug($('#labelTB'),$(this).val());
        });

        contentFR +='<form id="detSettingFR" style="overflow:scroll;height:600px;" autocomplete="off" onsubmit="detSettingSV(); return false;">' 
                        +'<input name="kunciH" id="kunciH"  type="hidden">' 
                        // list detail setting 
                        +'<table width="100%" class="table hovered bordered striped">'
                            +'<thead>'
                                +'<tr style="color:white;"class="info">'
                                    +'<th class="text-center">Pilih</th>'
                                    +'<th class="text-center">Urutan</th>'
                                    +'<th class="text-center">Kode</th>'
                                    +'<th class="text-center">Nilai</th>'
                                    +'<th class="text-center">Keterangan</th>'
                                +'</tr>'
                            +'</thead>'     
                            +'<tbody id="detSettingTBL"></tbody>'
                            +'<tfoot></tfoot>'
                        +'</table>'
                        // result detail setting
                        +'<label>Hasil</label>'
                        +'<div class="input-control text">'
                            +'<input style="font-weight:bold;" class="fg-white bg-green" readonly type="text" name="hasilTB" id="hasilTB">'
                        +'</div>'
                        +'<button >simpan</button>'
                    +'</form>';
       
    // button action
        $("#cetaklabel").on('click', function(){ 
            switchPN();
        });
        $('#cetak_barcodeBC').on('click',function(){
            printPDF('barcode'); /*epiii*/
        });

        // search button
        $('#cari_sirkulasiBC').on('click',function(){
            $('#cari_sirkulasiTR').toggle('slow');
            $('#memberS').val('');
            $('#barcodeS').val('');
            $('#judulS').val('');
        });
        $('#cari_statistikBC').on('click',function(){
            $('#cari_statistikTR').toggle('slow');
            $('#s_judulS').val('');
            $('#klasifikasiS').val('');
            $('#pengarangS').val('');
            $('#penerbitS').val('');
        });

        // default view (all)
        settingVW('idfmt',1);
        settingVW('bcfmt',1);
        settingVW('titfmt',1);
        settingVW('desfmt',1);
    }); 

// @ view setting (@kunci)
    function settingVW(kunci,mode){  
        var u = dir;
        var d ='aksi=tampil&subaksi=setting&kunci='+kunci;
        ajax(u,d).done(function(dt){
            if(mode=='1'){// setting mode
                $('#'+kunci+'TB').val(dt.row);
            }else{// detail setting mode
                $('#kunciH').val(kunci);
                $('#hasilTB').val(dt.row);
            }
        });
    }

// load pop up : detail setting  
    function loadFR(typ){        
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: 700,
            padding: 10,
            onShow: function(){
                detSettingVW(typ);
                settingVW(typ,2);
                $.Dialog.content(contentFR);
                $.Dialog.title('Edit Content'); 
            }
        });
    }

// view list : detail setting 
    function detSettingVW (typ){
        var u = dir;
        var d ='aksi=tampil&subaksi=detSetting&kunci='+typ;
        $('#detSettingTBL').html('<img align="center" src="img/w8loader.gif">');
        setTimeout(function(){
            ajax(u,d).done(function (dt) {
                var tbl=''; n=dt.data.length;
                $.each(dt.data,function(id,item){
                    var btn;
                    tbl+='<tr>'
                        +'<td>'
                            +'<input type="hidden" name="detSettingH[]" value="'+item.replid+'" />'
                            +'<input onchange="detSettingSV();" name="isActive_'+item.replid+'TB" '+(item.isActive=='1'?'checked':'')+' type="checkbox" />'
                        +'</td>'
                        +'<td>'
                            +'<div class="input-control select">'
                                +'<select onchange="detSettingSV();" name="urut_'+item.replid+'TB" id="urutTB_'+item.replid+'">';
                                for(var i=1; i<=n; i++){
                                    tbl+='<option '+(i==item.urut?'selected':'')+' value="'+i+'">'+i+'</option>';
                                }tbl+='</select>'
                            +'</div>'
                        +'</td>'
                        +'<td>['+item.nilai+']</td>'
                        +'<td>'
                            +(item.isEdit=='1'?'<div required class="input-control text"><input name="nilai2_'+item.replid+'TB" type="text" value="'+item.nilai2+'"/></div>':'-auto-')
                        +'</td>'
                        +'<td align="justify">'+item.keterangan+'</td>'
                    +'</tr>';
                });$('#detSettingTBL').html(tbl);
            });
        },500);
    }

// update detail setting
    function detSettingSV(){
        var typ=$('#kunciH').val();
        var u = dir;
        var d = $('#detSettingFR').serialize()+'&aksi=simpan';
        ajax(u,d).done(function(dt){
            notif(dt.status, dt.status=='sukses'?'green':'red');
            if(dt.status=='sukses') {
                settingVW(typ,1);
                settingVW(typ,2);
                detSettingVW(typ);
            }
        });   
    }
    function switchPN(){
        $('#cetak').toggle('slow');
        $('#labelcetak').toggle('slow');
        $('#cetaklabel').toggle('slow');
    }

    /*epiii*/
    function  autoSug (el,lok) {
        $(el).combogrid({
            debug:true,
            width:'550px',
            colModel: [{
                    'align':'left',
                    'columnName':'barkode',
                    'hide':true,
                    'width':'25',
                    'label':'Barkode'
                },{   
                    'align':'left',
                    'columnName':'callnumber',
                    'width':'20',
                    'label':'Callnumber'
                },{   
                    'align':'left',
                    'columnName':'judul',
                    'width':'25',
                    'label':'Judul'
                }],
            url: dir+'?aksi=autocomp&lokasi='+lok, /*epiii*/
            select: function( event, ui ) { 
                bukuAdd(ui.item.replid,ui.item.barkode,ui.item.callnumber,ui.item.judul);
                $(el).val('');
                return false;
            }
        }); //End autocomplete    
    }

    // hapus buku terpilih
    function bukuDel(id){
        $('#bukuTR_'+id).fadeOut('slow',function(){
            $('#bukuTR_'+id).remove();
            $('#labelTB').combogrid('option','url', dir+'?aksi=autocomp&lokasi='+$('#lokasiS').val()+'&terpilihArr='+bukuArr().toString()); /*epiii*/
            enabledButton(); /*epiii*/
        });
    }

// pilih buku yang akan dicetak ---
    function bukuAdd (id,barkode,callnumber,judul) {
        var tr ='<tr val="'+id+'" class="bukuTR" id="bukuTR_'+id+'">'
                    +'<td>'+barkode+'</td>'
                    +'<td>'+callnumber+'</td>'
                    +'<td>'+judul+'</td>'
                    +'<td><button onclick="bukuDel('+id+');"><i class="icon-remove"></button></i></td>'
                +'</tr>';
        $('#bukuTBL').prepend(tr); 
        bukuArr();
        $('#labelTB').combogrid('option','url', dir+'?aksi=autocomp&lokasi='+$('#lokasiS').val()+'&terpilihArr='+bukuArr().toString()); /*epiii*/
        enabledButton();
    }
        
//himpun array buku terpilih
    function bukuArr(){
        var y=[];
        $('.bukuTR').each(function(id,item){
            y.push($(this).attr('val'));
        });return y;
    }

// main function ---------
    function enabledButton () {
        if(bukuArr().length>0) $('#cetak_barcodeBC').removeAttr('disabled');
        else $('#cetak_barcodeBC').attr('disabled',true);
    }

    function cmblokasi(lok){
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
                        out+='<option value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }$('#lokasiS').html(out);
                autoSug($('#labelTB'),$('#lokasiS').val());
            }
        });
    }

// fungsi AJAX : asyncronous
    function ajax (u,d) {
        return $.ajax({
            url:u,
            type:'post',
            dataType:'json',
            data:d
        });
    }

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

// left pad (replace with 0)
    function lpadZero (n, length){
        var str = (n > 0 ? n : -n) + "";
        var zeros = "";
        for (var i = length - str.length; i > 0; i--)
            zeros += "0";
        zeros += str;
        return n >= 0 ? zeros : "-" + zeros;
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

    function printPDF(mn){
        var par='',tok='',p,v,menu=mn;
        $('.'+menu+'_cari').each(function(){
            p=$(this).attr('id');
            v=$(this).val();
            par+='&'+p+'='+v;
            tok+=v;
        });

        var x     = $('#id_loginS').val();
        var buku  = bukuArr();              /*epiii*/
        var buku2 = buku.toString();        /*epiii*/
        var token = encode64(x+tok+buku2);  /*epiii*/
        window.open('report/r_'+mn+'.php?token='+token+par+'&bukuArr='+bukuArr(),'_blank'); 
    }