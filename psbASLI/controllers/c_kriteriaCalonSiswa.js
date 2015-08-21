var dir='models/m_kriteriaCalonSiswa.php';
var contentFR='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form onsubmit="simpan();return false;" id="kriteriaFR">' 
                        +'<input  id="idformH" type="hidden">' 
                        +'<label>Kriteria</label>'
                        +'<div class="input-control text">'
                            +'<input required type="text" placeholder="kriteria" name="kriteriaTB" id="kriteriaTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>keterangan</label>'
                        +'<div class="input-control text">'
                            +'<input required type="text" name="keteranganTB" id="keteranganTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        //load table
        viewTB();

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
        });

        $('#kriteriaS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });$('#keteranganS').keydown(function (e){
            if(e.keyCode == 13)
                viewTB();
        });
        // $('#alamatS').keydown(function (e){


        // search button
        $('#cariBC').on('click',function(){
            $('#cariTR').toggle('slow');
            $('#golonganS').val('');
            $('#keteranganS').val('');
        });

    }); 
// end of main function ---

//save process ---
    function simpan(){
        var urlx ='&aksi=simpan';
        // edit mode
        if($('#idformH').val()!=''){
            urlx += '&replid='+$('#idformH').val();
        }
        $.ajax({
            url:dir,
            type:'post',
            dataType:'json',
            data:$('form').serialize()+urlx,
            success:function(data){
                if(data.status!='sukses'){
                    alert(data.status);
                }else{
                    $.Dialog.close();
                    kosongkan();
                    viewTB();
                }
            }
        });
    }
//end of save process ---

// view table ---
    function viewTB(){
        $('#tbody').html('<img src="../img/loading82.gif"> ');
        var aksi ='aksi=tampil';
        var cari = '&kriteriaS='+$('#kriteriaS').val()
                    +'&keteranganS='+$('#keteranganS').val();
        $.ajax({
            url : dir,
            type: 'post',
            data: aksi+cari,
            // data: $('#cariFR').serialize(),
            success:function(data){
                $('#tbody').html('<img src="img/loading82.gif">').fadeOut();
                $('#tbody').hide().html(data).fadeIn(1000);
            }
        });
    }
// end of view table ---

// add form ---
    function viewFR(id){
        $.Dialog({
            shadow: true,
            overlay: true,
            draggable: true,
            icon: '<span class="icon-plus-2"></span>',
            title: 'Draggable window',
            width: 500,
            padding: 10,
            content: 'This Window is draggable by caption.',
            onShow: function(){
                var titlex;
                if(id==''){  //add mode
                    titlex='Tambah ';
                }else{ // edit mode
                    titlex='Ubah '; 
                    $.ajax({
                        url:dir,
                        data:'aksi=ambiledit&replid='+id,
                        type:'post',
                        dataType:'json',
                        success:function(data){
                            $('#idformH').val(id);
                            $('#kriteriaTB').val(data.kriteria);
                            $('#keteranganTB').val(data.keterangan);
                        }
                    });
                }$.Dialog.title(titlex+"Kriteria");
                $.Dialog.content(contentFR);
            }
        });
    }
// end of add form ---

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
                $(el2).html('<tr><td align="center" colspan="8"><img src="../img/w8loader.gif"></td></tr></center>');
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
            success:function(data){
                if(data.status!='sukses'){
                    alert('gagal menghapus data');
                }else{
                    viewTB();
                }
            }
        });
    }
//end of del process ---
    
//reset form ---
    function kosongkan(){
        $('#idformTB').val('');
        $('#kriteriaTB').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---