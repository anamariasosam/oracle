create or replace PROCEDURE manejarInventario
 IS
 CURSOR
 NMCANTPROD IS SELECT CDPRODUCTO, NMCANTIDAD FROM salvarez_prueba.TSIM_PROD_X_EMPRESA WHERE CDEMPRESA='25';
 V_CDPRODUCTO SALVAREZ_PRUEBA.TSIM_PRODUCTOS.CDPRODUCTO%TYPE;
 V_NMCANTIDAD SALVAREZ_PRUEBA.TSIM_PROD_X_EMPRESA.NMCANTIDAD%TYPE;
BEGIN

 OPEN NMCANTPROD;
    LOOP
        FETCH NMCANTPROD INTO V_CDPRODUCTO,V_NMCANTIDAD;
        EXIT WHEN NMCANTPROD%NOTFOUND;

        IF(V_NMCANTIDAD<=3) THEN
            comprarConMinPrecio(V_CDPRODUCTO);
        END IF;

    END LOOP;
    CLOSE NMCANTPROD;
END manejarInventario;
