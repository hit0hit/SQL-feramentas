# SQL-feramentas
A documentação abaixo fornece uma explicação detalhada sobre uma série de comandos e funções SQL/PLSQL, oferecendo uma visão geral de como eles podem ser aplicados em diferentes situações.

### Formatação de Datas
```sql
-- Formatação de data para string
TO_CHAR(VA.DATA_ATUALIZACAO, 'MM/DD/YYYY HH24:MI:SS')

-- Obtendo o comprimento da hora
LENGTH(HOUR)
```

### Cláusulas SQL
```sql
-- Ordenação de resultados
ORDER BY column1, column2 ASC|DESC;

-- Exclusão condicional de registros
WHERE NOT ID = 2 OR ID != 2

-- Limitando o número de resultados
ORDER BY NOME DESC LIMIT 4
FETCH FIRST 4 ROWS ONLY
```

### Filtragem e Seleção
```sql
-- Selecionando registros que terminam com 0, 1 ou 2
RIGHT (CPF,1) IN (0,1,2)

-- Excluindo registros com IDs 1 e 2
ID NOT IN (1,2)

-- Filtrando por intervalo de valores
WHERE total BETWEEN 100 AND 1000
WHERE total NOT BETWEEN 100 AND 1000
WHERE Data BETWEEN '1/1/2022' AND '5/1/2022'
WHERE (MONTH(DATA)>= 4 OR MONTH(DATA) <= 9)

-- Filtrando por valores específicos
VALOR IN (2,3)
VALOR NOT IN (2,3)
VALOR IN (SELECT VALOR FROM TABELA)

-- Filtrando por padrões de string
WHERE NOME LIKE 'HENR%'
WHERE NOME LIKE '%QUE'
WHERE NOME LIKE '%NRI%'
```

### Funções Agregadas
```sql
-- Somando valores
SUM(VALOR) AS TOTAL

-- Calculando raiz quadrada
SQRT(VALOR)

-- Encontrando o menor valor
MIN(VALOR)

-- Encontrando o maior valor
MAX(VALOR) AS MAIOR_VALOR

-- Calculando a média
AVG(VALOR) AS MEDIA
```

### Cláusulas HAVING e GROUP BY
```sql
-- Filtrando por condições após o GROUP BY
HAVING COUNT(VALOR) > 100
HAVING SUM(VALOR) BETWEEN 100 AND 1000
RIGHT (CPF,1) = 1
```

### Manipulação de Datas
```sql
-- Calculando a diferença de anos entre duas datas
TIMESTAMPDIFF(YEAR, DATA_NACIMENTO, NOW()) AS IDADE

-- Extraindo parte de uma data
DATEPART(MONTH, DATA) AS MES
```

### Operações de Strings
```sql
-- Concatenando strings
CONCAT(NOME,' ', ID) OU NOME||' '||ID

-- Convertendo para maiúsculas ou minúsculas
UPPER(NOME)
LOWER(NOME)

-- Obtendo o comprimento de uma string
LEN(NOME)

-- Substring
SUBSTRING(NOME, 1, 4)

-- Substituindo caracteres em uma string
REPLACE(CPF,'.','-')
```

### Funções de Arredondamento
```sql
-- Arredondando valores
ROUND(VALOR, 2)
```

### Controle de Fluxo
```sql
-- Tratando valores nulos
IFNULL(NOME, 'SEM NOME')

-- Expressão condicional
IF(VALOR > 100, VALOR * 0.5, VALOR * 0.1)
```

### Expressões CASE
```sql
CASE
    WHEN NOME IS NULL THEN NOW()
    WHEN NOME < NOW THEN NOW()
    ELSE NOME
END 'NOME';

CASE
    WHEN (DATEDIFF(NOW(), DATA_NACIMENTO)/365) THEN 'MAIOR'
    ELSE 'MENOR'
END 'SITUACAO'
```

### Subquery
```sql
-- Subquery no contexto de uma inserção
INSERT INTO CLIENTE (ID, NOME) VALUES ((SELECT MAX(C.ID)+1 AS ID_NOVO FROM CLIENTE C), 'HENRIQUE')
```

### Validação de Expressões
```sql
-- Validação de expressões
:P3_SE_COLABORADOR != 1 OR (:P3_SE_COLABORADOR = 1 AND :P3_FILIAL IS NOT NULL)
```

### Bloco PL/SQL
```sql
-- Bloco PL/SQL
DECLARE
    v_id_usuario NUMBER;
BEGIN
    -- Seu código PL/SQL aqui
END;
```

Esses exemplos cobrem uma ampla gama de operações SQL e PL/SQL. Lembre-se de adaptar esses comandos às necessidades específicas do seu banco de dados e lógica de aplicação.
