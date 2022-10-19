SELECT * FROM Customer where apellido like'M%';
SELECT * FROM Customer where DAY(fecha_nac) = DAY(CURDATE()) AND MONTH(fecha_nac) = MONTH(CURDATE());
 
SELECT COUNT(o.id) as "Ventas",SUM(i.precio) as "Monto total", o.fecha as "Fecha" FROM orders as o
INNER JOIN Item as i ON o.id_item = i.id
WHERE MONTH(o.fecha) = 1 AND YEAR(o.fecha) = 2020
GROUP BY o.fecha;
 
SELECT MONTH(o.fecha), c.nombre, c.apellido, SUM(i.precio) from customer c
INNER JOIN Item as i on i.idCustomer = c.id
INNER JOIN Orders as o on o.id_customer = c.id
INNER JOIN Category as categ on c.id = i.idCategory
WHERE YEAR(o.fecha) = 2019 AND categ.nombre = "Celulares"
GROUP BY c.id, MONTH(o.fecha)
ORDER BY SUM(i.precio)
LIMIT 5;
 
 
DELIMITER //
DROP PROCEDURE IF EXISTS insertprecio;
CREATE PROCEDURE insertprecio()
BEGIN
  DECLARE id_item INT;
  DECLARE precio_item FLOAT;
  DECLARE eof BOOLEAN DEFAULT FALSE;
  DECLARE pointer CURSOR FOR SELECT id, precio FROM item;
  DECLARE CONTINUE handler FOR NOT FOUND SET eof = TRUE;
 
  OPEN pointer;
  FETCH pointer INTO id_item, precio_item;
  WHILE eof = FALSE DO
  INSERT INTO precio_item VALUES('', id_item, curdate(), precio_item);
    FETCH pointer INTO id_item, precio_item;
  END WHILE;
  CLOSE pointer;
END//
delimiter ;
call insertprecio;
select * from precio_item;
