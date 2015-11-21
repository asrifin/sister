
CREATE DEFINER = `root`@`localhost` FUNCTION `getAnggaranKuota`(`idAnggaranTahunan` int)
 RETURNS decimal(14,0)
BEGIN
	DECLARE anggaranKuota DECIMAL; 
		SELECT 
			SUM(a.hargasatuan * na.jml)INTO anggaranKuota
		FROM 
			keu_nominalanggaran  na
			JOIN keu_anggarantahunan a on a.replid = na.anggarantahunan
		WHERE 
			na.anggarantahunan = idAnggaranTahunan;
	RETURN anggaranKuota;
END;

CREATE DEFINER = `root`@`localhost` FUNCTION `getAnggaranPerItem`(`idanggarantahunan` int)
 RETURNS decimal(14,0)
BEGIN
	DECLARE detilanggaranTotal DECIMAL;
	SELECT
		sum((
			SELECT (na.jml * hargasatuan) 
			FROM keu_anggarantahunan 
			WHERE replid=na.anggarantahunan
		)) INTO detilanggaranTotal
	FROM
		keu_nominalanggaran na
	WHERE
		na.anggarantahunan = idanggarantahunan;
	RETURN detilanggaranTotal;
END;

CREATE DEFINER = `root`@`localhost` FUNCTION `getAnggaranPerKategori`(`idkategorianggaran` int,`idtahunajaran` int)
 RETURNS decimal(14,0)
BEGIN
	DECLARE nom DECIMAL(14);
	SELECT 
		sum((getAnggaranPerItem(ath.replid))) INTO nom
	FROM keu_detilanggaran da 
		left JOIN keu_anggarantahunan ath on ath.detilanggaran = da.replid
	WHERE
		ath.tahunajaran = idtahunajaran and 
		da.kategorianggaran = idkategorianggaran;
	RETURN nom;
END;

CREATE DEFINER = `root`@`localhost` FUNCTION `getBiayaAfterDiskonReg`(`idsiswabiaya` INT)
 RETURNS decimal(14,0)
    READS SQL DATA
BEGIN
		declare biayaAfterDR DECIMAL default getBiayaAwal(idsiswabiaya);
		declare vDiskon FLOAT;
		declare rowHabis1 INT DEFAULT 0;  
		declare cursor1 cursor for
			SELECT
				dd.nilai
			FROM
				psb_siswadiskon sd
				JOIN psb_detaildiskon dd on dd.replid = sd.detaildiskon
			WHERE
				sd.siswabiaya = idsiswabiaya;
		declare continue handler for not found set rowHabis1 = 1;
		open cursor1;
		LOOP1: loop
			fetch cursor1
			into  vDiskon;
			if rowHabis1 then close cursor1; leave LOOP1;
			end if;
			
			SET biayaAfterDR=biayaAfterDR-(biayaAfterDR*vDiskon/100);
		END loop LOOP1;
		return biayaAfterDR;
END;

CREATE DEFINER = `root`@`localhost` FUNCTION `getBiayaAwal`(`idsiswabiaya` INT)
 RETURNS decimal(11,0)
BEGIN
	DECLARE hasil int;
		SELECT
			db.nominal INTO hasil
		FROM  psb_siswabiaya sb 
			JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
		WHERE 
			sb.replid = idsiswabiaya;
	RETURN hasil;
END;

CREATE DEFINER=`root`@`localhost` FUNCTION `getBiayaNett`(`idsiswabiaya` int) RETURNS decimal(14,0)
BEGIN
	DECLARE ret decimal default getBiayaAfterDiskonReg(idsiswabiaya);
		declare r decimal;
        select ifnull(diskonkhusus,0)  into r 
        from psb_siswabiaya 
        where replid=idsiswabiaya;
	set ret=ret-r;
    RETURN ret;
END;
CREATE DEFINER = `root`@`localhost` FUNCTION `getBiayaTerbayar`(`idsiswabiaya` INT)
 RETURNS decimal(10,0)
    READS SQL DATA
BEGIN
	declare ret decimal default getBiayaNett(idsiswabiaya);
	declare r decimal;
	SELECT IFNULL(sum(nominal),0) INTO r  from keu_penerimaansiswa where siswabiaya = idsiswabiaya;
	set ret=ret-r;
	RETURN r;
END;

CREATE DEFINER = `root`@`localhost` FUNCTION `getDiskonKhusus`(`idsiswa` int,`idbiaya` int)
 RETURNS int(11)
BEGIN
	DECLARE hasil int;
		SELECT
			sb.diskonkhusus INTO hasil
		FROM  psb_siswabiaya sb 
			JOIN psb_detailbiaya db on db.replid = sb.detailbiaya
		WHERE
			db.biaya = idbiaya and 
			sb.siswa = idsiswa;
	RETURN hasil;
END;

CREATE DEFINER = `root`@`localhost` FUNCTION `getKuotaAnggaran2`(`idDetilAnggaran` int,`idTahunAjaran` int)
 RETURNS decimal(14,0)
BEGIN
	DECLARE kuotaAnggaran DECIMAL; 
	SELECT (
			SELECT sum(ath.hargasatuan * na.jml) 
			FROM keu_nominalanggaran na 
			WHERE na.anggarantahunan= ath.replid
		)into kuotaAnggaran
	FROM
		keu_anggarantahunan ath 
		JOIN keu_detilanggaran da on da.replid = ath.detilanggaran
	WHERE
		ath.tahunajaran = idTahunAjaran and
		ath.detilanggaran = idDetilAnggaran;	
	RETURN kuotaAnggaran ;
END;

CREATE DEFINER = `root`@`localhost` FUNCTION `getOperatorDetRekening`(`idDetilRekening` int,`jenisRekening` char)
 RETURNS char(1)
BEGIN
	DECLARE operator char(1);
	SELECT 
		t.operator INTO operator
	FROM(
		SELECT
			(kr.jenistambah)jenis,
			if(kr.jenis="","+","+") as operator,
			dr.replid iddetilrekening
		FROM
			keu_detilrekening dr 
			JOIN keu_kategorirekening kr on kr.replid = dr.kategorirekening
		UNION
		SELECT
			(kr.jeniskurang)jenis,
			if(kr.jenis="","-","-") as operator,
			dr.replid iddetilrekening
		FROM
			keu_detilrekening dr 
			JOIN keu_kategorirekening kr on kr.replid = dr.kategorirekening
	)t
	WHERE	
		t.iddetilrekening= idDetilRekening AND
		t.jenis=jenisRekening;
	RETURN operator;
END;

CREATE DEFINER = `root`@`localhost` FUNCTION `getSaldoRekening`(`idDetilRekening` int,`idTahunAjaran` int)
 RETURNS decimal(14,0)
BEGIN
	DECLARE saldoRekening DECIMAL; 
		SELECT sr.nominal into saldoRekening
		FROM keu_saldorekening sr
		WHERE 
			sr.detilrekening = idDetilRekening and 
			sr.tahunajaran = idTahunAjaran;
	RETURN saldoRekening ;
END;

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

CREATE DEFINER=`root`@`localhost` FUNCTION `getStatusBayar`(`idsiswabiaya` INT) RETURNS varchar(25) CHARSET latin1
BEGIN
	DECLARE s varchar(25);
    declare terbayar  decimal default getBiayaTerbayar(idsiswabiaya);
    declare tagihan decimal default getBiayaNett(idsiswabiaya);
	
    IF terbayar = tagihan THEN SET s = 'lunas';
	ELSEIF terbayar =0 THEN SET s = 'belum';
	ELSE SET s = 'kurang';
	END IF;

	RETURN s;
END;

CREATE DEFINER = `root`@`localhost` FUNCTION `getTahunAjaran`(`tgl` date)
 RETURNS int(11)
BEGIN
	DECLARE idTahunAjaran INT;
	SELECT tahunajaran into idTahunAjaran
	FROM aka_semester 
	WHERE tgl BETWEEN tglMulai and tglSelesai;
	RETURN idTahunAjaran;
END;

