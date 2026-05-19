
PROGRAM DimensionalRiftPatternScanner
    DECLARE n AS INTEGER
    DECLARE total_stars AS INTEGER
    DECLARE cont AS CHAR
    DECLARE i AS INTEGER
    DECLARE j AS INTEGER

    DO
        OUTPUT "=== Dimensional Rift " +
            "Pattern Scanner ==="
        OUTPUT "Input ukuran pattern: "
        INPUT n
        
        IF n > 0 THEN
            total_stars = n * (n + 1) / 2
        ELSE
            total_stars = 0
        END IF
        
        OUTPUT "Total jumlah bintang: " +
            total_stars
        
        IF total_stars > 30 THEN
            OUTPUT "Jenis monster yang " +
                "terdeteksi: VECNA"
        ELSE IF total_stars > 10 THEN
            OUTPUT "Jenis monster yang " +
                "terdeteksi: MIND FLAYER"
        ELSE
            OUTPUT "Jenis monster yang " +
                "terdeteksi: DEMOGORGON"
        END IF
        
        OUTPUT "Pola segitiga bintang:"
        IF n > 0 THEN
            FOR i = 1 TO n DO
                FOR j = 1 TO i DO
                    OUTPUT "* "
                END FOR
                OUTPUT newline
            END FOR
        END IF
        
        OUTPUT "Coba lagi (y/n)? "
        INPUT cont
        
    WHILE cont == 'y' OR cont == 'Y'

