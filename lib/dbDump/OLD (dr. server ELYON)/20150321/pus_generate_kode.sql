
SELECT
	tb1.lokasi,
	LPAD(tb2.idbuku,5,0)idbuku,
	YEAR(CURDATE())tahun,
	tb3.kode
FROM (
	SELECT
		l.kode lokasi
	FROM
		pus_lokasi l 
	WHERE	
		l.replid = 3
	)tb1,(
		SELECT (MAX(urut) + 1) AS idbuku FROM pus_buku
	)tb2,(
		SELECT kode
		from pus_tingkatbuku 
		where replid = 1
	)tb3