var mnu  ='jenislaporan'; 
var dir  ='models/m_'+mnu+'.php';
var contentFR ='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form autocomplete="off" onsubmit="simpan();return false;" id="'+mnu+'FR">' 
                        +'<input id="idformH" type="hidden">' 

                        +'<label>Rekening</label>'
                        +'<div>'
                            +'<div class="input-control text" >'
                                +'<input type="hidden" name="rekeningH" id="rekeningH" />'
                                +'<input onfocus="autoSuggest(\'rekening\');" required placeholder="rekening" name="rekeningTB" id="rekeningTB" type="text">'
                                +'<button class="btn-clear"></button>'
                            +'</div>'
                        +'</div>'    

                        +'<label>Kategori</label>'
                        +'<div>'
                            +'<div class="input-control select" >'
                                +'<select required name="kategoriTB" id="kategoriTB">'
                                    +'<option value="">-Pilih Kategori-</option>'
                                    +'<option class="bg-gray fg-white" value="o">Operasional</option>'
                                    +'<option  class="bg-steel fg-white"  value="n">Non Operasional</option>'
                                +'</select>'
                            +'</div>'
                        +'</div>'        

                        +'<label>Jenis Transaksi</label>'
                        +'<div>'
                            +'<div class="input-control select" >'
                                +'<select required name="jenisTB" id="jenisTB">'
                                    +'<option value="">-Pilih Jenis Transaksi-</option>'
                                    +'<option class="fg-white bg-green" value="in">Penerimaan</option>'
                                    +'<option  class="fg-white bg-red"  value="out">Pengeluaran</option>'
                                +'</select>'
                            +'</div>'
                        +'</div>'                        

                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        viewTB();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        //cari ----
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#rekeningS').val('');
            $('#jenisS').val('');
            $('#ketegoriS').val('');
        });

        //search action // edit by epiii
        $('#rekeningS').on('keydown',function (e){
            if(e.keyCode == 13) viewTB();
        });
        $('#kategoriS,#jenisS').on('change',function(){
            viewTB();
        });
       
    }); 

// autosuggest
    function autoSuggest(el){
        var urlx= '?aksi=autocomp';
        var col = [{
                'align':'left',
                'columnName':'kode',
                'hide':true,
                'width':'8',
                'label':'Kode'
            },{   
                'align':'left',
                'columnName':'nama',
                'width':'92',
                'label':'Rekening'
        }];

        $('#'+el+'TB').combogrid({
            debug:true,
            width:'900px',
            colModel: col ,
            url: dir+urlx,
            select: function( event, ui ) { // event setelah data terpilih 
                $('#'+el+'H').val(ui.item.replid);
                $('#'+el+'TB').val(ui.item.kode+' - '+ui.item.nama);

                // validasi input (tidak sesuai data dr server)
                    $('#'+el+'TB').on('keyup', function(e){
                        var key = e.charCode ? e.charCode : e.keyCode ? e.keyCode : 0;
                        var keyCode = $.ui.keyCode;
                        if(key != keyCode.ENTER && key != keyCode.LEFT && key != keyCode.RIGHT && key != keyCode.UP && key != keyCode.DOWN ) {
                            if($('#'+el+'H').val()!=''){
                                $('#'+el+'H').val('');
                                $('#'+el+'TB').val('');
                            }
                        }
                    });

                    $('#'+el+'TB').on('blur,change',function(){
                        if($('#'+el+'H').val()=='') {
                            $('#'+el+'TB').val(''); // :: all 
                        }
                    });
                return false;
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
                    cont = 'Berhasil menyimpan data';
                    clr  = 'green';
                    viewTB();
                }notif(cont,clr);
            }
        });
    }

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
                        $('#rekeningH').val(dt.idrekening);
                        $('#rekeningTB').val(dt.rekening);
                        $('#kategoriTB').val(dt.kategori);
                        $('#jenisTB').val(dt.jenis);
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

//reset form ---
    function kosongkan(){
        $('#idformTB').val('');
        $('#namaTB').val('');
        $('#keteranganTB').val('');
    }
