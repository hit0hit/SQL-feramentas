
SELECT
    USER_NAME,
    ID
FROM
    APEX_APPL_ACL_USERS
WHERE
    ROLE_NAMES = 'VENDEDOR'
AND
    USER_NAME NOT IN (
        SELECT U2.USER_NAME
        FROM APEX_APPL_ACL_USERS U2
        INNER JOIN J7_CLIENTE_AGENDAMENTO A2 ON A2.ID_VENDEDOR = U2.ID
        WHERE 
            (
                (SYSDATE - A2.DATA_INICIO) * 24 * 60 >= -30
            )
            AND
            (
                (SYSDATE - A2.DATA_INICIO) * 24 * 60 <= 0
            )
            AND
            ATIVO = 1
    )
ORDER BY
    USER_NAME ASC;



