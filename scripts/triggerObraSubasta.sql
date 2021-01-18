CREATE DEFINER = CURRENT_USER TRIGGER `galeriaArte`.`exclusividad_obra_ofrece` BEFORE INSERT ON `OFRECE` FOR EACH ROW
BEGIN
  DECLARE id INT;
  SELECT idOBRA INTO @id FROM OFRECE WHERE idObra = NEW.idOBRA limit 1;
  IF (@id = NEW.idObra) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Condición de exclusividad entre OFRECE y MUESTRA respecto OBRA';
   END IF;
END
