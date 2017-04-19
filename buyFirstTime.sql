create or replace PROCEDURE SP_BuyFirstTime(dserror out varchar2, v_quantity IN NUMBER, v_price IN NUMBER)
IS

CURSOR productos IS SELECT CDPRODUCTO FROM SALVAREZ_PRUEBA.TSIM_PRODUCTOS;
v_dserror VARCHAR2(2);
v_product SALVAREZ_PRUEBA.TSIM_PRODUCTOS.CDPRODUCTO%TYPE;

BEGIN
  OPEN productos;
    LOOP
    FETCH productos INTO v_product;
    EXIT WHEN productos%NOTFOUND;
      SALVAREZ_PRUEBA.SP_COMPRAR_PROD('00001', v_product, v_quantity ,v_dserror);

      DBMS_OUTPUT.PUT_LINE(v_dserror);

      SALVAREZ_PRUEBA.SP_CAMBIO_VALOR_PROD(v_product, v_price, v_dserror);
      DBMS_OUTPUT.PUT_LINE(v_dserror);
    END LOOP;
  CLOSE productos;
  dserror:= 'ok';
END SP_BuyFirstTime;
