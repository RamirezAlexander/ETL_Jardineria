-- Verificar nulos
SELECT * FROM cliente
WHERE nombre_cliente IS NULL OR ciudad IS NULL;

-- Verificar duplicados
SELECT nombre_cliente, COUNT(*)
FROM cliente
GROUP BY nombre_cliente
HAVING COUNT(*) > 1;

-- Validar consistencia
SELECT COUNT(*) FROM cliente;
SELECT COUNT(*) FROM Jardineria_Staging.dbo.Clientes_Limpios;
