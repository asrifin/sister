
SELECT
	tanggal1 tgl_pinjam,
    tanggal2 kembali,
    tanggal3 dikembalikan,
    pk.judul,
    a.nis nis,
    a.nama siswa,
    hk.nip,
    hk.nama pegawai,
    pm.nid,
    pm.nama member,
    if(pj.status = 1,"Dipinjam", "Dikembalikan") status
FROM pus_peminjaman pj
LEFT JOIN aka_siswa a ON a.replid = pj.mtipe
LEFT JOIN aka_guru ag ON ag.replid = pj.mtipe 
LEFT JOIN hrd_karyawan hk ON hk.id = ag.pegawai
LEFT JOIN pus_member pm ON pm.replid = pj.mtipe 
LEFT JOIN pus_buku pb ON pb.replid = pj.buku
LEFT JOIN pus_katalog pk ON pk.replid = pb.katalog