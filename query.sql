-- Código de la empresa que me vende el producto más barato
SELECT CDEMPRESA
FROM salvarez_prueba.TSIM_PROD_X_EMPRESA
WHERE psventa =
  (SELECT min(`psventa`) FROM salvarez_prueba.TSIM_PROD_X_EMPRESA)
AND CDPRODUCTO = '01'
LIMIT 1

SELECT persona_id
FROM productos
WHERE psventa = (SELECT min(`psventa`) FROM productos)
AND NAME = 'Aceituna'
AND nmcantidad >= 3
ORDER BY nmcantidad DESC
LIMIT 1;
