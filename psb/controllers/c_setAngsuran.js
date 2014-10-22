var dir='models/m_setAngsuran.php';
var contentFR='';

// main function ---
    $(document).ready(function(){
        contentFR += '<form onsubmit="simpan();return false;" id="angsuranFR">' 
                        +'<label>Jumlah Angsuran</label>'
                        +'<input  id="idformH" type="hidden">' 
                        +'<div class="input-control text">'
                            +'<input required type="text" name="angsuran" id="angsuran">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<label>Keterangan</label>'
                        +'<div class="input-control text">'
                            +'<input type="text" name="keteranganTB" id="keteranganTB">'
                            +'<button class="btn-clear"></button>'
                        +'</div>'
                        +'<div class="form-actions">' 
                            +'<button class="button primary">simpan</button>&nbsp;'
                            +'<button class="button" type="button" onclick="$.Dialog.close()">Batal</button> '
                        +'</div>'
                    +'</form>';

        //load table
        viewTB();

        // search
        $('#angsuranS').on('keyup',viewTB);
        $('#keteranganS').on('keyup',viewTB);

        //add form
        $("#tambahBC").on('click', function(){
            viewFR('');
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
        $('#tbody').html('<img src="img/loading82.gif"> ');
        var aksi ='aksi=tampil';
        var cari = '&angsuranS='+$('#angsuranS').val()
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
            overlay: false,
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
                            $('#angsuran').val(data.cicilan);
                            $('#keteranganTB').val(data.keterangan);
                        }
                    });
                }$.Dialog.title(titlex+"Angsuran");
                $.Dialog.content(contentFR);
            }
        });
    }
// end of add form ---

//paging ---
    function pagination(page,aksix,menux){
        $('#isi').html('<img src="../img/loader.gif"> ').fadeIn();
        var datax = 'starting='+page+'&aksi='+aksix+'&menu='+menux;
        var cari = '&angsuran='+$('#angsuran').val();

        $.ajax({
            url:dir,
            type:"GET",
            data: datax+cari,
            success:function(data){
                $("#loadtabel").fadeOut();
                $('#isi').hide().html(data).fadeIn(1000);
            }
        });
    }   
//end of paging ---
    
//del process ---
    function del(id){
        if(confirm('Apakah ingin menghapus data?'))
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
        $('#angsuran').val('');
        $('#keteranganTB').val('');
    }
//end of reset form ---