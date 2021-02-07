CREATE DEFINER = CURRENT_USER TRIGGER `galeriaArte`.`check_tipos_obra` BEFORE INSERT ON `OBRA` FOR EACH ROW
BEGIN
	IF NEW.Tipo = "Escultura" AND (NEW.Superficie IS NOT NULL OR NEW.TipoPintura IS NOT NULL 
			OR NEW.Papel IS NOT NULL OR NEW.Metodo IS NOT NULL OR NEW.TipoCamara IS NOT NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Una escultura no puede tener ninguna de las siguientes propiedades: superficie, pintura, papel y/o metodo';
    END IF;
    
	IF NEW.Tipo = "Pintura" AND (NEW.Material IS NOT NULL OR NEW.TipoCamara IS NOT NULL 
			OR NEW.Papel IS NOT NULL OR NEW.Metodo IS NOT NULL OR NEW.Herramienta IS NOT NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Una pintura no puede tenerninguna de las siguientes propiedades: material, camara, papel, metodo y/o herramienta';
    END IF;
    
	IF NEW.Tipo = "Fotografia" AND (NEW.Material IS NOT NULL OR NEW.Dimensiones IS NOT NULL 
			OR NEW.Superficie IS NOT NULL OR NEW.TipoPintura IS NOT NULL OR NEW.Herramienta IS NOT NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Una fotografía no puede tener ninguna de las siguientes propiedades: material, dimensiones, pintura, herramienta y/o superficie';
    END IF;
END

CREATE DEFINER = CURRENT_USER TRIGGER `galeriaArte`.`check_tipos_obraUpdate` BEFORE UPDATE ON `OBRA` FOR EACH ROW
BEGIN
	IF OLD.Tipo = "Escultura" AND (NEW.Superficie IS NOT NULL OR NEW.TipoPintura IS NOT NULL 
			OR NEW.Papel IS NOT NULL OR NEW.Metodo IS NOT NULL OR NEW.TipoCamara IS NOT NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Una escultura no puede tener ninguna de las siguientes propiedades: superficie, pintura, papel y/o metodo';
    END IF;
    
	IF OLD.Tipo = "Pintura" AND (NEW.Material IS NOT NULL OR NEW.TipoCamara IS NOT NULL 
			OR NEW.Papel IS NOT NULL OR NEW.Metodo IS NOT NULL OR NEW.Herramienta IS NOT NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Una pintura no puede tenerninguna de las siguientes propiedades: material, camara, papel, metodo y/o herramienta';
    END IF;
    
	IF OLD.Tipo = "Fotografia" AND (NEW.Material IS NOT NULL OR NEW.Dimensiones IS NOT NULL 
			OR NEW.Superficie IS NOT NULL OR NEW.TipoPintura IS NOT NULL OR NEW.Herramienta IS NOT NULL) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Una fotografía no puede tener ninguna de las siguientes propiedades: material, dimensiones, pintura, herramienta y/o superficie';
    END IF;
END