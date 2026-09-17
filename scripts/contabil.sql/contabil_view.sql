CREATE VIEW contabil.plano_lancamentos AS
SELECT 
l.data_lancamento ,
l.historico ,
pc.nome_conta AS conta_credito,
pcd.nome_conta AS conta_debito,
l.valor 
FROM contabil.lancamentos AS l
INNER JOIN contabil.plano_contas AS pc
ON l.conta_credito_id  =  pc.id_plano_contas
INNER JOIN contabil.plano_contas AS pcd
ON l.conta_debito_id = pcd.id_plano_contas;