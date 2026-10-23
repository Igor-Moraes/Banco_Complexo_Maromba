-- Consulta, com o uso de JOIN, que exiba o código, o nome, a natureza e o saldo de cada conta,
-- ordenada pelo código. 

SELECT pc.codigo,
       pc.nome_conta,
       pc.natureza_conta,
       s.saldo
FROM contabil.plano_contas pc
JOIN contabil.saldo_contas s ON s.conta_id = pc.id_plano_contas
ORDER BY pc.codigo;