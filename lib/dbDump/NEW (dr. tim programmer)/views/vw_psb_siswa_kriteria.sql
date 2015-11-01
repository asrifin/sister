CREATE 
ALGORITHM=UNDEFINED 
DEFINER=`root`@`localhost` 
SQL SECURITY DEFINER 
VIEW `vw_psb_siswa_kriteria`AS 
SELECT
	`siswa`.`replid` AS `idsiswa`,
	`siswa`.`nis` AS `nis`,
	`siswa`.`nisn` AS `nisn`,
	`siswa`.`nopendaftaran` AS `nopendaftaran`,
	`siswa`.`namasiswa` AS `namasiswa`,
	`siswa`.`status` AS `status`,
	`tingkat`.`replid` AS `idtingkat`,
	`tingkat`.`tingkat` AS `tingkat`,
	`subtingkat`.`replid` AS `idsubtingkat`,
	`subtingkat`.`subtingkat` AS `subtingkat`,
	`detailgelombang`.`replid` AS `iddetailgelombang`
FROM
	(
		(
			(
				(
					(
						(
							(
								(
									(
										(
											`psb_siswa` `siswa`
											JOIN `psb_siswabiaya` `siswabiaya` ON (
												(
													`siswabiaya`.`siswa` = `siswa`.`replid`
												)
											)
										)
										JOIN `psb_detailbiaya` `detailbiaya` ON (
											(
												`detailbiaya`.`replid` = `siswabiaya`.`detailbiaya`
											)
										)
									)
									JOIN `psb_biaya` `biaya` ON (
										(
											`biaya`.`replid` = `detailbiaya`.`biaya`
										)
									)
								)
								JOIN `aka_subtingkat` `subtingkat` ON (
									(
										`subtingkat`.`replid` = `detailbiaya`.`subtingkat`
									)
								)
							)
							JOIN `aka_tingkat` `tingkat` ON (
								(
									`tingkat`.`replid` = `subtingkat`.`tingkat`
								)
							)
						)
						JOIN `psb_detailgelombang` `detailgelombang` ON (
							(
								`detailgelombang`.`replid` = `detailbiaya`.`detailgelombang`
							)
						)
					)
					JOIN `psb_gelombang` `gelombang` ON (
						(
							`gelombang`.`replid` = `detailgelombang`.`gelombang`
						)
					)
				)
				JOIN `aka_tahunajaran` `tahunajaran` ON (
					(
						`tahunajaran`.`replid` = `detailgelombang`.`tahunajaran`
					)
				)
			)
			JOIN `psb_golongan` `golongan` ON (
				(
					`golongan`.`replid` = `detailbiaya`.`golongan`
				)
			)
		)
		JOIN `departemen` ON (
			(
				`departemen`.`replid` = `detailgelombang`.`departemen`
			)
		)
	)
GROUP BY
	`siswa`.`replid` ;

