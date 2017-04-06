-- Código de la empresa que me vende el producto más barato
SELECT CDEMPRESA
FROM salvarez_prueba.TSIM_PROD_X_EMPRESA
WHERE psventa =
  (SELECT min(`psventa`) FROM salvarez_prueba.TSIM_PROD_X_EMPRESA)
AND CDPRODUCTO = '01'
LIMIT 1
