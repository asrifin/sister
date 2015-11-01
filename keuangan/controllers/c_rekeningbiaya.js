var mnu  = 'rekeningbiaya';
var mnu2 = 'jenistagihan';
var mnu3 = 'biaya';
var mnu4 = 'departemen';
var mnu5 = 'tahunajaran';
var mnu6 = 'kategorirekening';

var dir  = 'models/m_'+mnu+'.php';
var dir2 = 'models/m_'+mnu2+'.php';
var dir3 = 'models/m_'+mnu3+'.php';
var dir4 = '../akademik/models/m_'+mnu4+'.php';
var dir5 = '../akademik/models/m_'+mnu5+'.php';
var dir6 = 'models/m_'+mnu6+'.php';
var contentFR = '';
// main function ---
    $(document).ready(function(){
        cmbdepartemen('filter','');
        contentFR += '<form  style="overflow:scroll;height:560px;" autocomplete="off" onsubmit="simpan();return false;">' 
                        +'<input name="idformH" id="idformH" type="hidden">' 

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
                                +'<td>Biaya</td>'
                                +'<td id="biayaTD"></td>'
                            +'</tr>'
                        +'</table>'

                        // rekening
                        +'<a class="button fg-white bg-blue" href="#" onclick="DetilRekeningFC(1,\'\');"><i class="icon-plus-2"></i></a>'
                        +'<table class="table striped">'
                            +'<thead>'
                                +'<tr class="fg-white bg-blue">'
                                    +'<th>Rekening</th>'
                                    +'<th>kategori</th>'
                                    +'<th>Saldo</th>'
                                    +'<th>Jenis</th>'
                                    +'<th>Hapus</th>'
                                +'</tr>'
                            +'</thead>'
                            +'<tbody id="DetilRekeningTBL"></tbody>'
                        +'</table>'
                        // button
                        +'<div class="form-actions">' 
                            +'<button id="simpanBC" class="button primary">simpan</button>&nbsp;'
                        +'</div>'
                    +'</form>';

        //search action
        $('#departemenS,#tahunajaranS').on('change',function (){
            viewTB();
        });
        $('#biayaS,#detilrekeningS').on('keydown',function (e){
            if(e.keyCode==13) viewTB();
        });
    }); 
// end of save process ---

// combo kategorirekening ---
    // function cmbkategorirekening(el,kat){
    //     var u= dir6;
    //     var d='aksi=cmb'+mnu6;
    //     ajax(u,d).done(function (dt) {
    //         var out='';
    //         if(dt.status!='sukses'){
    //             out+='<option value="">'+dt.status+'</option>';
    //         }else{
    //             if(dt.kategorirekening.length==0){
    //                 out+='<option value="">kosong</option>';
    //             }else{
    //                 $.each(dt.kategorirekening, function(id,item){
    //                     out+='<option '+(kat==item.replid?' selected ':'')+' value="'+item.replid+'">'+item.nama+'</option>';
    //                 });
    //             }$('#kategoriRekening'+el+'TB').html('<option value="">-Pilih-</option>'+out);
    //         }
    //     });
    // }
// combo tahunajaran ---
    function cmbtahunajaran(typ,thn){
        var u= dir5;
        var d='aksi=cmb'+mnu5+(thn!=''?'&replid='+thn:'');
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
                    var th1 = dt.tahunajaran[0].tahunajaran;
                    var th2 = parseInt(th1)+1;
                    $('#tahunajaranTD').text(': '+th1+' - '+th2);
                }
            }
        });
    }

// combo departmen ---
    function cmbdepartemen(typ,thn){
        var u= dir4;
        var d='aksi=cmb'+mnu4;
        ajax(u,d).done(function (dt) {
            var out='';
            if(dt.status!='sukses'){
                out+='<option value="">'+dt.status+'</option>';
            }else{
                if(dt.departemen.length==0){
                    out+='<option value="">kosong</option>';
                }else{
                    $.each(dt.departemen, function(id,item){
                        out+='<option  value="'+item.replid+'">'+item.nama+'</option>';
                    });
                }
                if(typ=='filter'){ // filter (search)
                    $('#departemenS').html(out);
                    cmbtahunajaran('filter','');
                }else{ // form (edit & add)
                    $('#departemenTD').html(': '+dt.departemen[0].nama);
                }
            }
        });
    }

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan&iDetilRekeningDelTR='+iDetilRekeningDelTR;
        $.ajax({
            url:dir,
            cache:false,
            type:'post',
            dataType:'json',
            data:$('form').serialize()+urlx,
            beforeSend:function(){
                $('#simpanBC').html('<img src="img/w8loader.gif">');
            },success:function(dt){
                if(dt.status!='sukses'){
                    cont = 'Gagal menyimpan data';
                    clr  = 'red';
                }else{
                    $.Dialog.close();
                    viewTB();
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                }notif(cont,clr);
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
                $(el2).html('<tr><td align="center" colspan="5"><img src="img/w8loader.gif"></td></tr></center>');
            },success:function(dt){
                setTimeout(function(){
                    $(el2).html(dt).fadeIn();
                },1000);
            }
        });
    }
// end of view table

//load  dialog form  ---
    function viewFR(id){
        isClosedFR();
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            width: '70%',
            padding: 10,
            onShow: function(){
                var titl,cont;
                if(id!=''){ //form mode : edit 
                    titl= 'Ubah '+mnu;
                    var u =dir;
                    var d ='aksi=ambiledit&replid='+id;
                    ajax(u,d).done(function(r){
                        $('#idformH').val(id);
                        cmbdepartemen('form',r.departemen);
                        cmbtahunajaran('form',r.tahunajaran);
                        $('#biayaTD').html(': '+r.biaya);
                        DetilRekeningFC(r.detilRekeningArr.length,r.detilRekeningArr);
                    });
                }
                $.Dialog.title(titl);
                $.Dialog.content(contentFR);
                $('#biayaTB').focus();
            }
        });
    }
// end of dialog form ---

// ajax jquery (mode : asyncronous) ---
    function ajax(u,d){
        return $.ajax({
            url:u,
            data:d,
            type:'post',
            dataType:'json'
        });
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
                }notif(cont,clr);
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

// autosuggest
    function autoSuggest(el,idx){
        var urlx= '?aksi=autocomp&tahunajaran='+$('#tahunajaranS').val();
        var col = [{
                'align':'left',
                'columnName':'kode',
                'hide':true,
                'width':'10',
                'label':'Kode'
            },{   
                'align':'left',
                'columnName':'kategoriRekening',
                'width':'20',
                'label':'Kategori'
            },{   
                'align':'left',
                'columnName':'detilRekening',
                'width':'40',
                'label':'Rekening'
        }];

        urly = dir+urlx;
        $('#'+el+idx+'TB').combogrid({
            debug:true,
            width:'900px',
            colModel: col ,
            url: urly,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+idx+'H').val(ui.item.replid);
                $('#'+el+idx+'TB').val(ui.item.kode+' - '+ui.item.detilRekening);
                $('#kategoriRekening'+idx+'TD').html(ui.item.kategoriRekening);
                $('#saldoRekening'+idx+'TD').html(ui.item.saldoRekening);

                // validasi input (tidak sesuai data dr server)
                    $('#'+el+idx+'TB').on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+el+idx+'H').val()!=''){
                                $('#'+el+idx+'H').val('');
                                $('#'+el+idx+'TB').val('');
                            }
                        }
                    });

                    $('#'+el+'TB').on('blur,change',function(){
                        if($('#'+el+idx+'H').val()=='') {
                            $('#'+el+idx+'TB').val(''); // :: all 
                        }
                    });
                return false;
            }
        });
    }

// rekening  ------------------------------
    var iDetilRekeningTR = 1;
    var iDetilRekeningDelTR = [];
    var iDetilRekeningAddTR = [];
    function DetilRekeningFC(nn,arr){
        var tr='';
        var isLoop=true;
        if(arr.length==0 || arr==''){
            if(nn==0) n=2;
            else n=iDetilRekeningTR;
            isLoop=false; 
        }else{
            n=arr.length;
        }

        for(var i=n; i>=iDetilRekeningTR; i--){
            var ke = parseInt(i)-1;
            var idDetilRekeningBiaya = (arr.length!=0)?arr[ke].idDetilRekeningBiaya:'';
            var idDetilRekening      = (arr.length!=0)?arr[ke].idDetilRekening:'';
            var kategoriRekening     = (arr.length!=0)?arr[ke].kategoriRekening:'';
            var detilRekening        = (arr.length!=0)?arr[ke].detilRekening:'';
            var saldoRekening        = (arr.length!=0)?'Rp. '+(parseInt(arr[ke].saldoRekening).setCurr()):'';
            var jenisRekening        = (arr.length!=0)?arr[ke].jenisRekening:'';

            tr+='<tr class="DetilRekeningTR" id="DetilRekeningTR_'+ke+'">'
            //detil rekening
                +'<td>'
                    +'<input placeholder="cari rekening" onfocus="autoSuggest(\'detilRekening\','+ke+');" value="'+detilRekening+'" id="detilRekening'+ke+'TB" required type="text" data-transform="input-control">'
                    +'<input type="hidden" value="'+idDetilRekening+'" name="detilRekening'+ke+'H" id="detilRekening'+ke+'H" />'
                    +'<input type="hidden" value="'+ke+'" id="idDetilRekening'+ke+'TR" name="idDetilRekeningTR[]">' // array acuan
                    +'<input type="hidden" value="'+idDetilRekeningBiaya+'" id="idDetilRekeningBiaya'+ke+'H" name="idDetilRekeningBiaya'+ke+'H">' // array acuan
                +'</td>'
            //kategori
                +'<td id="kategoriRekening'+ke+'TD">'+kategoriRekening+'</td>'
                    // +'<select class="kategoriRekening" id="kategoriRekening'+ke+'TB" name="kategoriRekening'+ke+'TB" data-transform="input-control"></select>'
            //saldo rekening
                +'<td align="right" id="saldoRekening'+ke+'TD">'+saldoRekening+'</td>'
            //jenis (debit/kredit)
                +'<td>'
                    +'<select required align="center" id="jenisRekening'+ke+'TB" name="jenisRekening'+ke+'TB" data-transform="input-control">'
                        +'<option value="">-Pilih-</option>'
                        +'<option '+(jenisRekening=='d'?'selected':'')+' value="d">Debit</option>'
                        +'<option '+(jenisRekening=='k'?'selected':'')+' value="k">Kredit</option>'
                    +'</select>'
                +'</td>'
            // button hapus
                +'<td align="center">'
                    +'<a onclick="'+(idDetilRekening!=''?'if(confirm(\'melanjutkan untuk menghapus data?\')) DetilRekeningDel('+ke+',\''+idDetilRekeningBiaya+'\');':'DetilRekeningDel('+ke+',\''+idDetilRekeningBiaya+'\')')+'" '
                        +'href="#" class="button bg-white fg-red">'
                        +'<i class="icon-cancel-2"></i>'
                    +'</a>'
                +'</td>'
            +'</tr>';
        }
        $('#DetilRekeningTBL').prepend(tr);

        if(isLoop) {iDetilRekeningTR+=n;}
        else {iDetilRekeningTR++;}
    }
// end of : kontak darurat ------------------------------

// hapus DetilRekeningarurat terpilih
    function DetilRekeningDel(ke,idDetilRekening){
        if($('.DetilRekeningTR').length<=2){
            notif('minimal 2 akun rekening','red');
        }else{
            if(idDetilRekening!='') iDetilRekeningDelTR.push(idDetilRekening); //jika ada hapus DB 
            $('#DetilRekeningTR_'+ke).fadeOut('slow',function(){
                $('#DetilRekeningTR_'+ke).remove();
            });
        }
    }

// close pop up _ form 
    function isClosedFR () {
        if($('.window-overlay').length<=0) {
            iDetilRekeningTR=1; 
            iDetilRekeningDelTR=[]; 
        }
    }

    // currency to number (ex : Rp. 500.000 -> 500000)
    function getCurr(n){  
        var x = Number(n.replace(/[^0-9\,]+/g,""));
        return x;
    }

    // number to currency (ex : 500000 -> 500.000)  
    Number.prototype.setCurr=function(){
        return this.toFixed(0).replace(/(\d)(?=(\d{3})+\b)/g,'$1.');
    }

