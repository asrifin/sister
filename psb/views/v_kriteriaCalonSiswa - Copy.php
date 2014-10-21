    <title>DataTables example - Object data source</title>
    <link rel="stylesheet" type="text/css" href="../../media/css/jquery.dataTables.css">
    <style type="text/css" class="init">

    </style>
    <script type="text/javascript" language="javascript" class="init">
        $(document).ready(function() {
            $('#example').dataTable( {
                "processing": true,
                "serverSide": true,
                "ajax": {
                    "type":"POST",
                    "url":"models/m_kriteriaCalonSiswa.php"
                },
                "columns": [
                    { "data": "kriteria" },
                    { "data": "keterangan" }
                ]
            } );
        } );
    </script>
</head>

<body class="dt-example">
    <div class="container">
        <section>
            <table id="example" class="display" cellspacing="0" width="100%">
                <thead>
                    <tr>
                        <th>kriteria</th>
                        <th>keterangan</th>
                    </tr>
                </thead>

                <tfoot>
                    <tr>
                        <th>kriteria</th>
                        <th>keterangan</th>
                    </tr>
                </tfoot>
            </table>
        </section>
    </div>

    <section>
        <div class="footer">
        </div>
    </section>
</body>