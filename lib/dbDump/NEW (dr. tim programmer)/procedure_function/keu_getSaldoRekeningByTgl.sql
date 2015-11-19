CREATE DEFINER = `root`@`localhost` FUNCTION `getSaldoRekeningByTgl`(`idDetilRekening` int,`tgl1` date,`tgl2` date)
 RETURNS decimal(14,0)
BEGIN
	DECLARE saldoRekening decimal(14);
	SELECT 
		sum(concat(t.operator,t.nominal)) INTO saldoRekening
	from (
		SELECT
			dr.replid,
			CONCAT(dr.kode," - ",dr.nama)detilrekening,
			j.nominal nominal,
			t.tanggal,
			j.jenisrekening,
			dr.kategorirekening,
			getOperatorDetRekening(j.detilrekening,j.jenisrekening)operator
		FROM
			keu_jurnal j 
			JOIN keu_transaksi t on t.replid = j.transaksi
			JOIN keu_detilrekening dr on dr.replid = j.detilrekening
		WHERE 
			t.tanggal BETWEEN tgl1 
			AND tgl2
		ORDER BY 
			j.detilrekening asc,
			j.jenisrekening asc
	)t
	WHERE t.replid = idDetilRekening ;
	RETURN saldoRekening;
END;

