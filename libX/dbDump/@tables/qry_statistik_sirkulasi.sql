                        SELECT 
       							k.replid as replid,
								k.judul AS judul,
								l.nama AS klasifikasi, 
								r.nama AS penerbit, 
								p.nama2 AS pengarang,
                                (SELECT count(*) FROM pus_peminjaman 
                                WHERE status=0) AS status
						FROM pus_buku b
						LEFT JOIN pus_katalog k on k.replid=b.katalog
						LEFT JOIN pus_tingkatbuku t on t.replid=b.tingkatbuku
						LEFT JOIN pus_klasifikasi l on l.replid=k.klasifikasi
						LEFT JOIN pus_pengarang p on p.replid=k.pengarang
						LEFT JOIN pus_penerbit r on r.replid=k.penerbit
						LEFT JOIN pus_jenisbuku u on u.replid=k.jenisbuku
					