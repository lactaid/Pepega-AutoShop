/*1*/
SELECT c.idCliente, c.Nombre, c.Apellido1, c.Apellido2, COUNT(t.idTrabajo) AS Frecuencia
FROM  pepega_autoshop.cliente c
JOIN  pepega_autoshop.vehiculo v ON c.idCliente = v.idCliente
JOIN  pepega_autoshop.diagnostico d ON v.Placa = d.Placa
JOIN  pepega_autoshop.trabajo t ON d.idDiagnostico = t.idDiagnostico
WHERE d.Fecha BETWEEN '2023-01-01' AND '2023-07-31'
GROUP BY c.idCliente
ORDER BY Frecuencia DESC
LIMIT 1;

/*2*/
SELECT p.idPromo, p.FechaInicio, p.FechaFin, p.Descuento, p.Descripcion
FROM pepega_autoshop.promociones p
INNER JOIN pepega_autoshop.trabajoindividual ti ON p.idPromo = ti.idPromo
INNER JOIN pepega_autoshop.trabajo t ON ti.idTrabajo = t.idTrabajo
INNER JOIN pepega_autoshop.empleado e ON t.idEmpleadoS = e.Matricula
INNER JOIN pepega_autoshop.departamento d ON e.idDepartamento = d.idDepartamento
WHERE d.idDepartamento = 11
AND p.FechaInicio BETWEEN '2023-01-01' AND '2023-12-31';

/*3*/
SELECT NombreProducto, Inventario FROM 
pepega_autoshop.refacciones;

/*4*/
SELECT d.idDiagnostico, v.Total
FROM pepega_autoshop.diagnostico d
JOIN pepega_autoshop.trabajo t ON d.idDiagnostico = t.idDiagnostico
JOIN pepega_autoshop.trabajoindividual ti ON t.idTrabajo = ti.idTrabajo
JOIN pepega_autoshop.venta v ON ti.idVenta = v.idVenta;

/*5*/
SELECT d.NombreDepartamento, COUNT(t.idTrabajo) AS NumeroAtenciones
FROM pepega_autoshop.departamento d
LEFT JOIN pepega_autoshop.empleado e ON d.idDepartamento = e.idDepartamento
LEFT JOIN pepega_autoshop.trabajo t ON e.Matricula = t.idEmpleadoS
LEFT JOIN pepega_autoshop.trabajoindividual ti ON t.idTrabajo = ti.idTrabajo
WHERE ti.Fecha BETWEEN '2023-01-01' AND '2023-07-31'
GROUP BY d.NombreDepartamento;

/*6*/
SELECT SUM(Costo) AS 'Ganancias Mecanico'
FROM pepega_autoshop.trabajoindividual
WHERE idEmpleadoR IN (SELECT Matricula FROM pepega_autoshop.empleado WHERE idDepartamento = 11) AND idTrabajo IN (
SELECT idTrabajo 
FROM pepega_autoshop.trabajoindividual
WHERE Fecha 
BETWEEN '2023-01-01' AND '2023-01-08') ;

/*7*/
SELECT idEmpleadoR AS idEmpleado, SUM(CAST(Costo AS DECIMAL)) AS ganancia
FROM pepega_autoshop.trabajoindividual
JOIN pepega_autoshop.trabajo ON trabajoindividual.idTrabajo = trabajo.idTrabajo
WHERE pepega_autoshop.trabajoindividual.Fecha BETWEEN '2023-01-01' AND '2023-07-31'
GROUP BY idEmpleadoR
ORDER BY ganancia DESC
LIMIT 1;

/*8*/
SELECT s.Matricula AS 'Matricula Supervisor', s.Nombre AS 'Nombre Supervisor', e.Matricula AS 'Matricula Empleado', e.Nombre AS 'Nombre Empleado'
FROM pepega_autoshop.empleado AS s
JOIN pepega_autoshop.departamento AS d ON s.Matricula = d.idSupervisor
JOIN pepega_autoshop.empleado AS e ON d.idDepartamento = e.idDepartamento
WHERE d.idDepartamento = 11;

/*9*/
SELECT c.Nombre, c.Apellido1, c.Apellido2, v.Placa, v.Marca, v.Modelo
FROM  pepega_autoshop.cliente c
JOIN  pepega_autoshop.vehiculo v ON c.idCliente = v.idCliente;

/*10*/
SELECT e.idDepartamento, SUM(vi.Cantidad) AS Reparaciones, ti.idTrabajo
FROM pepega_autoshop.trabajoindividual AS ti
JOIN pepega_autoshop.trabajo AS t ON ti.idTrabajo = t.idTrabajo
JOIN pepega_autoshop.empleado AS e ON t.idEmpleadoS = e.Matricula
JOIN pepega_autoshop.ventaindividual AS vi ON ti.idVenta = vi.idVenta
WHERE e.idDepartamento = 11
GROUP BY ti.idTrabajo
ORDER BY Reparaciones DESC;

/*11*/
SELECT d.NombreDepartamento, SUM(vi.Cantidad) as 'Consumo de refacciones'
FROM pepega_autoshop.trabajoindividual ti
JOIN pepega_autoshop.trabajo t ON ti.idTrabajo = t.idTrabajo
JOIN pepega_autoshop.empleado e ON ti.idEmpleadoR = e.Matricula
JOIN pepega_autoshop.departamento d ON e.idDepartamento = d.idDepartamento
JOIN pepega_autoshop.ventaindividual vi ON ti.idVenta = vi.idVenta
WHERE ti.Fecha BETWEEN '2023-01-01' AND '2023-07-01'
GROUP BY d.idDepartamento, d.NombreDepartamento
ORDER BY SUM(vi.Cantidad) DESC
limit 1;

/*12*/
SELECT *
FROM pepega_autoshop.promociones
WHERE FechaInicio between '2023-01-01' AND '2023-07-01';

/*13*/
SELECT g.idTrabajoIndividual, g.idGarantia, ti.Costo
FROM pepega_autoshop.garantia g
JOIN pepega_autoshop.trabajoindividual ti ON g.idTrabajoIndividual = ti.idTrabajoIndividual
WHERE g.FechaInicio BETWEEN '2023-01-01' AND '2023-01-08';

/*14*/
WITH NReparaciones AS (
SELECT idDepartamento, COUNT(idTrabajoIndividual) as Reparaciones
FROM pepega_autoshop.trabajoindividual, pepega_autoshop.empleado
WHERE trabajoindividual.idEmpleadoR = empleado.Matricula
AND Fecha BETWEEN '2023-01-01' AND '2023-01-20'
GROUP BY idDepartamento)
SELECT * FROM NReparaciones
WHERE Reparaciones = (SELECT MAX(Reparaciones) FROM NReparaciones)
;

/*15*/
WITH NReparaciones AS (
SELECT idDepartamento, COUNT(idTrabajoIndividual) as Reparaciones
FROM pepega_autoshop.trabajoindividual, pepega_autoshop.empleado
WHERE trabajoindividual.idEmpleadoR = empleado.Matricula
AND Fecha BETWEEN '2023-01-01' AND '2023-01-20'
GROUP BY idDepartamento)
SELECT * FROM NReparaciones
WHERE Reparaciones = (SELECT MIN(Reparaciones) FROM NReparaciones)
;

/*16 */
WITH ConsumoRefacciones AS (
SELECT venta.idVenta, SUM(Cantidad) as Consumo
FROM pepega_autoshop.venta, pepega_autoshop.ventaindividual
WHERE venta.idVenta = ventaindividual.idVenta
GROUP BY venta.idVenta)

SELECT idDepartamento, SUM(Consumo) as Consumo
FROM pepega_autoshop.trabajoindividual, pepega_autoshop.empleado, ConsumoRefacciones
WHERE trabajoindividual.idEmpleadoR = empleado.Matricula 
AND trabajoindividual.idVenta = ConsumoRefacciones.idVenta
GROUP BY idDepartamento;

/*17*/
SELECT ROUND(SUM(Ganancia), 2) as Ganancias FROM
((SELECT SUM(Precio) AS Ganancia 
FROM pepega_autoshop.ventaindividual, pepega_autoshop.venta
WHERE ventaindividual.idVenta = venta.idVenta
AND Fecha BETWEEN '2023-01-01' AND '2023-01-20')
UNION
(SELECT SUM(Costo) AS Ganancia 
FROM pepega_autoshop.trabajoindividual
WHERE Fecha BETWEEN '2023-01-01' AND '2023-01-20')
UNION
(SELECT SUM(Costo) AS Ganancia 
FROM pepega_autoshop.diagnostico
WHERE Fecha BETWEEN '2023-01-01' AND '2023-01-20')) AS SUBCONSULTA;

/*18*/
SELECT Matricula, Nombre, idDepartamento FROM pepega_autoshop.empleado
ORDER BY empleado.idDepartamento ASC;

/*19*/
SELECT Marca, Modelo, Año, Color
FROM pepega_autoshop.vehiculo
WHERE fechaRegistro BETWEEN '2022-12-01' AND '2022-12-10';

/*20*/
SELECT DISTINCT idCliente FROM pepega_autoshop.diagnostico, pepega_autoshop.vehiculo
WHERE diagnostico.placa = vehiculo.Placa AND
idDiagnostico NOT IN (SELECT idDiagnostico FROM pepega_autoshop.trabajo)
AND Fecha BETWEEN '2023-01-20' AND '2023-01-30';

/*21*/
WITH ClienteGasto AS (
SELECT vehiculo.idCliente, SUM(trabajoindividual.Costo) as Gasto
FROM pepega_autoshop.trabajo, pepega_autoshop.diagnostico, pepega_autoshop.vehiculo, pepega_autoshop.trabajoindividual
WHERE trabajo.idTrabajo = trabajoindividual.idTrabajo AND trabajo.idDiagnostico = diagnostico.idDiagnostico
AND diagnostico.Placa = vehiculo.Placa
GROUP BY idCliente)
SELECT idCliente, Gasto FROM ClienteGasto
WHERE Gasto = (SELECT MAX(Gasto) FROM ClienteGasto AS SubConsulta);

/*22*/
WITH VehiculoGasto AS (
SELECT diagnostico.Placa, SUM(trabajoindividual.Costo ) as Gasto
FROM pepega_autoshop.trabajo, pepega_autoshop.diagnostico, pepega_autoshop.trabajoindividual
WHERE trabajo.idDiagnostico = diagnostico.idDiagnostico 
AND trabajo.idTrabajo = trabajoindividual.idTrabajo
AND trabajoindividual.Fecha BETWEEN '2023-01-01' AND '2023-01-30'
GROUP BY diagnostico.Placa)
SELECT Placa, Gasto FROM VehiculoGasto
WHERE Gasto = (SELECT MAX(Gasto) FROM VehiculoGasto AS SubConsulta);

/*23*/
SELECT idProducto, ROUND(SUM(Precio),2) as Total FROM pepega_autoshop.ventaindividual
GROUP BY idProducto
HAVING Total = (SELECT MAX(Total) 
FROM (SELECT idProducto, ROUND(SUM(Precio), 2) as Total FROM pepega_autoshop.ventaindividual
GROUP BY idProducto) as subconsulta );

/*24 CHECK*/
WITH DepartamentoGasto AS (
SELECT empleado.idDepartamento, SUM(trabajoindividual.Costo) as Gasto
FROM pepega_autoshop.trabajoindividual, pepega_autoshop.garantia, pepega_autoshop.empleado
WHERE garantia.Aplicada = '1' AND trabajoindividual.idTrabajoIndividual = garantia.idTrabajoIndividual
AND empleado.Matricula = trabajoindividual.idEmpleadoR
GROUP BY empleado.idDepartamento)
SELECT * FROM DepartamentoGasto
WHERE Gasto = (SELECT MAX(Gasto) FROM DepartamentoGasto);

/*25*/
SELECT vehiculo.idCliente FROM pepega_autoshop.diagnostico, pepega_autoshop.vehiculo
WHERE diagnostico.Placa = vehiculo.Placa
AND Fecha IN (SELECT MIN(Fecha) FROM pepega_autoshop.diagnostico
WHERE Fecha BETWEEN '2023-01-10' AND '2023-12-30');
    
/*26*/
WITH PromosCantidades AS (
(SELECT trabajoindividual.idPromo, COUNT(idTrabajoIndividual) as Cantidad 
FROM pepega_autoshop.trabajoindividual
WHERE idPromo IS NOT NULL
AND Fecha BETWEEN '2023-01-01' AND '2023-12-30'
GROUP BY idPromo)
UNION
(SELECT ventaindividual.idPromo, COUNT(venta.idVenta) as Cantidad FROM pepega_autoshop.ventaindividual, pepega_autoshop.venta
WHERE ventaindividual.idPromo IS NOT NULL AND ventaindividual.idVenta = venta.idVenta
AND Fecha BETWEEN '2023-01-01' AND '2023-12-30'
GROUP BY ventaindividual.idPromo))

SELECT * FROM
PromosCantidades as Subconsulta1
HAVING Cantidad = (SELECT MAX(Cantidad)
FROM PromosCantidades AS Subconsulta2);

/*27*/
SELECT idPromo FROM pepega_autoshop.promociones
WHERE FechaFin BETWEEN '2023-01-01' AND '2023-06-01';

/*28*/
WITH GarantiasAplicadas AS (
SELECT idEmpleadoR, COUNT(idGarantia) as CantidadG
FROM pepega_autoshop.trabajoindividual, pepega_autoshop.garantia
WHERE trabajoindividual.idTrabajoIndividual = garantia.idTrabajoIndividual AND garantia.Aplicada = '1'
GROUP BY idEmpleadoR)

SELECT idEmpleadoR, CantidadG FROM GarantiasAplicadas
WHERE CantidadG = (SELECT MAX(CantidadG)
FROM GarantiasAplicadas AS Subconsulta);

/*29*/
WITH VehiculoGanancia AS (
SELECT Placa, COUNT(idTrabajoIndividual) as Servicios
FROM pepega_autoshop.trabajoindividual, pepega_autoshop.trabajo, pepega_autoshop.diagnostico
WHERE trabajoindividual.idTrabajo = trabajo.idTrabajo AND trabajo.idDiagnostico = diagnostico.idDiagnostico
AND trabajoindividual.Fecha BETWEEN '2023-01-01' AND '2023-01-20'
GROUP BY Placa)

SELECT cliente.Nombre, vehiculo.Placa, Servicios FROM VehiculoGanancia, pepega_autoshop.vehiculo, pepega_autoshop.cliente
WHERE VehiculoGanancia.Placa = vehiculo.Placa AND vehiculo.idCliente = cliente.idCliente
AND Servicios = (SELECT MAX(Servicios)
FROM VehiculoGanancia AS Subconsulta);

/*30*/
SELECT trabajo.idTrabajo, SUM(trabajoindividual.Costo) as Ganancias
FROM pepega_autoshop.trabajo, pepega_autoshop.trabajoindividual, pepega_autoshop.diagnostico
WHERE trabajo.idTrabajo = trabajoindividual.idTrabajo AND trabajo.idDiagnostico = diagnostico.idDiagnostico
AND diagnostico.Fecha BETWEEN '2023-01-01' AND '2023-01-20'
GROUP BY trabajo.idTrabajo
ORDER BY Ganancias
LIMIT 5;




