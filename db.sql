CREATE TABLE `smartparking`.`clients` 
( 
    `ID_client` INT NOT NULL AUTO_INCREMENT , 
    `ID_parking` INT NULL , 
    `ID_spot` INT NULL , 
    `Name` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL , 
    `Surname` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL , 
    `Nick` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL , 
    `Password` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL , 
    `Email` TEXT CHARACTER SET utf8 COLLATE utf8_polish_ci NOT NULL , 
    `Phone` INT(9) NOT NULL , PRIMARY KEY (`ID_client`)
) 
ENGINE = InnoDB 
CHARSET=utf8 COLLATE utf8_polish_ci;