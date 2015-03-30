
SELECT
	tanggal1 tgl_pinjam,
    tanggal2 tgl_pengembalian,
    if(mtipe=1,"siswa"(if(mtipe=2,"guru","member_luar")))
FROM pus_peminjaman pj
LEFT JOIN aka_siswa as ON as.replid = pj.mtipe
 