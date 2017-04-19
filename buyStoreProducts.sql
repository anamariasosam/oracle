create or replace PROCEDURE SP_buyStoreProducts( v_quantity IN NUMBER, v_store_id IN VARCHAR2, dserror out varchar2)
IS

CURSOR products IS SELECT cdproducto, psventa FROM salvarez_prueba.TSIM_PROD_X_EMPRESA where cdempresa = v_store_id;

v_product SALVAREZ_PRUEBA.TSIM_PRODUCTOS.CDPRODUCTO%TYPE;
v_price SALVAREZ_PRUEBA.TSIM_PROD_X_EMPRESA.PSVENTA%TYPE;

v_DSERROR varchar2(200);
v_NMCANTIDAD_DEBITAR salvarez_prueba.TSIM_PROD_X_EMPRESA.NMCANTIDAD%TYPE;
v_PSVALOR_UNITARIO_VENTA salvarez_prueba.TSIM_PROD_X_EMPRESA.PSVENTA%TYPE;

BEGIN
  OPEN products;
    LOOP
    FETCH products INTO v_product, v_price;
    EXIT WHEN products%NOTFOUND;
      SP_COMPRAR_PROD_RES
      (
      v_store_id,
      v_product,
      v_quantity,
      v_DSERROR,
      v_NMCANTIDAD_DEBITAR,
      v_PSVALOR_UNITARIO_VENTA
      );
      v_price := v_price - (v_price * 0.2);
      dbms_output.put_line(v_price); 
      -- SALVAREZ_PRUEBA.SP_CAMBIO_VALOR_PROD(v_product, v_price, v_dserror);
    END LOOP;
  CLOSE products;
  dserror:= 'ok';
END SP_buyStoreProducts;
