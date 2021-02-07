CREATE DEFINER = CURRENT_USER TRIGGER `galeriaArte`.`exclusion_especializacion_obra` BEFORE INSERT ON `OBRA` FOR EACH ROW
BEGIN
  IF NEW.Tipo <> "Escultura" AND NEW.Tipo <> "Pintura" AND NEW.Tipo <> "Fotografia" THEN
	  SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'El tipo de obra solo puede ser Escultura, Pintura o Fotografia';
   END IF;
END

