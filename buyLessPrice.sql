create or replace PROCEDURE buyLessPrice(v_cdproducto IN NUMBER)
IS
V_CDEMPRESA SALVAREZ_PRUEBA.TSIM_PROD_X_EMPRESA.CDEMPRESA%TYPE :='00001';

v_buy_quantity SALVAREZ_PRUEBA.TSIM_PROD_X_EMPRESA.NMCANTIDAD%TYPE := 3;
V_DSERROR VARCHAR2(2);
V_PSVENTA SALVAREZ_PRUEBA.TSIM_PROD_X_EMPRESA.CDEMPRESA%TYPE:= 15;
BEGIN

SELECT CDEMPRESA
FROM salvarez_prueba.TSIM_PROD_X_EMPRESA
WHERE psventa =
  (
  SELECT min(psventa)
  FROM salvarez_prueba.TSIM_PROD_X_EMPRESA
  WHERE CDPRODUCTO = '01'
  AND nmcantidad > v_buy_quantity
  )
AND CDPRODUCTO = '01';

SALVAREZ_PRUEBA.SP_COMPRAR_PROD(V_CDEMPRESA, V_CDPRODUCTO,v_buy_quantity,V_DSERROR);
SALVAREZ_PRUEBA.SP_CAMBIO_VALOR_PROD(V_CDPRODUCTO,V_PSVENTA,V_DSERROR);
END buyLessPrice;
