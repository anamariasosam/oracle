-- Código de la empresa que me vende el producto más barato
SELECT CDEMPRESA
FROM salvarez_prueba.TSIM_PROD_X_EMPRESA
WHERE psventa =
  (
  SELECT min(psventa)
  FROM salvarez_prueba.TSIM_PROD_X_EMPRESA
  AND CDPRODUCTO = '01'
  WHERE nmcantidad > 3
  )
AND CDPRODUCTO = '01'
AND ROWNUM = 1;


declare
v_DSERROR varchar2(200);
v_NMCANTIDAD_DEBITAR salvarez_prueba.TSIM_PROD_X_EMPRESA.NMCANTIDAD%TYPE;
v_PSVALOR_UNITARIO_VENTA salvarez_prueba.TSIM_PROD_X_EMPRESA.PSVENTA%TYPE;
BEGIN
  SP_COMPRAR_PROD_RES
  (
  21,
  01,
  2,
  v_DSERROR,
  v_NMCANTIDAD_DEBITAR,
  v_PSVALOR_UNITARIO_VENTA
  );
END;
/
