--Esta consulta irá excluir todos os registros, exceto o registro com o menor valor "id" para cada valor único na coluna "DENOMINACAO" que tenha mais de uma ocorrência (ou seja, registros duplicados). 
--Certifique-se de fazer um backup dos dados ou testar em um ambiente de desenvolvimento antes de executar em produção, pois a exclusão de dados é uma operação irreversível.

DELETE FROM GDT_AREA
WHERE ID_AREA NOT IN (
    SELECT MIN(ID_AREA)
    FROM GDT_AREA
    GROUP BY NOME_AREA
    HAVING COUNT(NOME_AREA) > 1
);
