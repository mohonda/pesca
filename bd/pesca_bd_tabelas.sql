-- Cria o banco de dados
--CREATE DATABASE "DB_Pesca" TEMPLATE template1 ENCODING "UTF8";

-- -----------------------------------------------------
-- Table "T_Login"
-- -----------------------------------------------------
CREATE  TABLE "T_Login" (
  "TL_ID" SERIAL ,
  "TL_Login" VARCHAR(12) NOT NULL ,
  "TL_HashSenha" CHAR(40) NOT NULL ,
  "TL_UltimoAcesso" TIMESTAMP NULL ,
  PRIMARY KEY ("TL_ID") ,
  UNIQUE ("TL_Login") )
;


-- -----------------------------------------------------
-- Table "T_Perfil"
-- -----------------------------------------------------
CREATE  TABLE "T_Perfil" (
  "TP_ID" SERIAL,
  "TP_Perfil" VARCHAR(14) NOT NULL ,
  PRIMARY KEY ("TP_ID") )
;


-- -----------------------------------------------------
-- Table "T_Endereco"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Endereco" (
  "TE_ID" SERIAL,
  "TE_Logradouro" VARCHAR(30) NOT NULL ,
  "TE_Numero" VARCHAR(6) NOT NULL ,
  "TE_Bairro" VARCHAR(30) NOT NULL ,
  "TE_Cidade" VARCHAR(30) NOT NULL ,
  "TE_Estado" CHAR(2) NOT NULL ,
  "TE_CEP" CHAR(8) NOT NULL ,
  "TE_Complemento" VARCHAR(45) NULL ,
  PRIMARY KEY ("TE_ID") )
;


-- -----------------------------------------------------
-- Table "T_Usuario"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_Usuario" (
  "TU_ID" SERIAL ,
  "TU_Nome" VARCHAR(45) NOT NULL ,
  "TU_Sexo" VARCHAR(1) NOT NULL ,
  "TU_CPF" VARCHAR(14) NOT NULL ,
  "TU_RG" VARCHAR(11) NOT NULL ,
  "TU_Email" VARCHAR(30) NOT NULL ,
  "TU_Telefone" VARCHAR(12) NOT NULL ,
  "TU_UsuarioDeletado" BOOLEAN NOT NULL DEFAULT FALSE ,
  "TL_ID" INT NOT NULL ,
  "TP_ID" INT NOT NULL ,
  "TE_ID" INT NOT NULL ,
  PRIMARY KEY ("TU_ID") ,
  UNIQUE ("TU_CPF") ,
  UNIQUE ("TU_Email") ,
  CONSTRAINT "fk_T_Usuario_T_Login1"
    FOREIGN KEY ("TL_ID" )
    REFERENCES "T_Login" ("TL_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Usuario_T_Perfil1"
    FOREIGN KEY ("TP_ID" )
    REFERENCES "T_Perfil" ("TP_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT "fk_T_Usuario_T_Endereco1"
    FOREIGN KEY ("TE_ID" )
    REFERENCES "T_Endereco" ("TE_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;


-- -----------------------------------------------------
-- Table "T_AlteracaoSenha"
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS "T_AlteracaoSenha" (
  "TAS_Token" CHAR(40) NOT NULL ,
  "TAS_dataSolicitacao" TIMESTAMP NOT NULL ,
  "TAS_dataAlteracao" TIMESTAMP NULL ,
  "TU_ID" INT NOT NULL ,
  PRIMARY KEY ("TAS_Token") ,
  CONSTRAINT "fk_T_AlteracaoSenha_T_Usuario1"
    FOREIGN KEY ("TU_ID" )
    REFERENCES "T_Usuario" ("TU_ID" )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
;

