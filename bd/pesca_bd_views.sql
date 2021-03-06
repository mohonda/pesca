CREATE OR REPLACE VIEW "V_Usuario" ("TU_ID", "TU_Nome", "TU_Sexo", "TU_CPF", "TU_RG", "TU_Telefone", "TU_Email", "TU_UsuarioDeletado", "TP_ID", "TE_ID", "TP_Perfil", "TL_Login", "TL_UltimoAcesso", "TE_Logradouro", "TE_Numero", "TE_Bairro", "TE_Cidade", "TE_Estado", "TE_CEP", "TE_Complemento") AS
SELECT 
  "T_Usuario"."TU_ID", 
  "T_Usuario"."TU_Nome", 
  "T_Usuario"."TU_Sexo", 
  "T_Usuario"."TU_CPF", 
  "T_Usuario"."TU_RG", 
  "T_Usuario"."TU_Telefone", 
  "T_Usuario"."TU_Email", 
  "T_Usuario"."TU_UsuarioDeletado", 
  "T_Usuario"."TP_ID", 
  "T_Usuario"."TE_ID", 
  "T_Perfil"."TP_Perfil", 
  "T_Login"."TL_Login", 
  "T_Login"."TL_UltimoAcesso", 
  "T_Endereco"."TE_Logradouro", 
  "T_Endereco"."TE_Numero", 
  "T_Endereco"."TE_Bairro", 
  "T_Endereco"."TE_Cidade", 
  "T_Endereco"."TE_Estado", 
  "T_Endereco"."TE_CEP", 
  "T_Endereco"."TE_Complemento"
FROM 
  public."T_Usuario", 
  public."T_Perfil", 
  public."T_Login", 
  public."T_Endereco"
WHERE 
  "T_Usuario"."TE_ID" = "T_Endereco"."TE_ID" AND
  "T_Usuario"."TP_ID" = "T_Perfil"."TP_ID" AND
  "T_Usuario"."TL_ID" = "T_Login"."TL_ID"
ORDER BY
  "T_Usuario"."TU_ID" ASC;
  
  
CREATE OR REPLACE VIEW "V_Colonia" ("TC_ID", "TC_Nome", "TE_ID", "TE_Logradouro", "TE_Numero", "TE_Bairro", "TE_Cidade", "TE_Estado", "TE_CEP", "TE_Complemento") AS
SELECT 
  "T_Colonia"."TC_ID", 
  "T_Colonia"."TC_Nome", 
  "T_Colonia"."TE_ID", 
  "T_Endereco"."TE_Logradouro", 
  "T_Endereco"."TE_Numero", 
  "T_Endereco"."TE_Bairro", 
  "T_Endereco"."TE_Cidade", 
  "T_Endereco"."TE_Estado", 
  "T_Endereco"."TE_CEP", 
  "T_Endereco"."TE_Complemento"
FROM 
  public."T_Endereco", 
  public."T_Colonia"
WHERE 
  "T_Colonia"."TE_ID" = "T_Endereco"."TE_ID"
ORDER BY
  "T_Colonia"."TC_ID" ASC;
