CREATE SCHEMA IF NOT EXISTS `ProjetoPsi` DEFAULT CHARACTER SET utf8 ;
USE `ProjetoPsi` ;

CREATE TABLE IF NOT EXISTS `ProjetoPsi`.`Psicologo` (
  `CRP` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Horario` DATE NOT NULL,
  PRIMARY KEY (`CRP`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ProjetoPsi`.`Aluno` (
  `Matricula` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `cpf` INT NOT NULL,
  `Psicologo_CRP` INT NOT NULL,
  PRIMARY KEY (`Matricula`, `Psicologo_CRP`),

  CONSTRAINT `fk_Aluno_Psicologo1`
    FOREIGN KEY (`Psicologo_CRP`)
    REFERENCES `ProjetoPsi`.`Psicologo` (`CRP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ProjetoPsi`.`Workshop` (
  `idWorkshop` INT NOT NULL,
  `Tema` VARCHAR(45) NOT NULL,
  `Dia` DATE NOT NULL,
  `Hora` TIME NOT NULL,
  PRIMARY KEY (`idWorkshop`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ProjetoPsi`.`Workshop_has_Psicologo` (
  `Workshop_idWorkshop` INT NOT NULL,
  `Psicologo_CRP` INT NOT NULL,
  PRIMARY KEY (`Workshop_idWorkshop`, `Psicologo_CRP`),
 
  CONSTRAINT `fk_Workshop_has_Psicologo_Workshop1`
    FOREIGN KEY (`Workshop_idWorkshop`)
    REFERENCES `ProjetoPsi`.`Workshop` (`idWorkshop`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Workshop_has_Psicologo_Psicologo1`
    FOREIGN KEY (`Psicologo_CRP`)
    REFERENCES `ProjetoPsi`.`Psicologo` (`CRP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `ProjetoPsi`.`Agendamento` (
  `idAgendamento` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  `dia` DATE NOT NULL,
  `hora` TIME NOT NULL,
  `Psicologo_CRP` INT NOT NULL,
  PRIMARY KEY (`idAgendamento`, `Psicologo_CRP`),
  
  CONSTRAINT `fk_Agendamento_Psicologo1`
    FOREIGN KEY (`Psicologo_CRP`)
    REFERENCES `ProjetoPsi`.`Psicologo` (`CRP`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into Psicologo(CRP,Nome,Horario) values (9876,"Ludimila","2023-10-09");
insert into Psicologo(CRP,Nome,Horario) values (6543,"Hellen","2023-10-09");
insert into Psicologo(CRP,Nome,Horario) values (3210,"Julia","2023-10-09");

insert into Aluno(Matricula,Nome,cpf,Psicologo_CRP) values
	(1800,"Mariana",98822929,9876),
    (1709,"João Paulo",88222233,6543),
    (234, 'Caio',99888829,3210);

insert into Workshop() values
(default, 'Workshop 01',"2023-11-09","14:20:00"),
(default, 'Workshop 02',"2023-12-09","15:00:00"),
(default, 'Workshop 03',"2023-10-09","08:30:00"),
(default, 'Workshop 04',"2023-11-23","07:00:00"),
(default, 'Workshop 05',"2023-10-29","18:00:00");

insert into Psicologo_has_Workshop() values
(1,2),
(2,2),
(3,1),
(4,3),
(5,2);

select * from aluno;
select * from Psicologo;

