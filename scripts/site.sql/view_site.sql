-- Esse SQL cria as views de treinos e pagamentos no schema site

-- Treinos_cadastrados tem como funcionalidade facilitar a consulta dos treinos dos clientes,
-- que estão divididas em tabelas diferentes.
CREATE VIEW site.treinos_cadastrados AS
SELECT txe.id_treino_exercicio,
       c.nome AS nome_cliente,
       f.nome AS nome_funcionario,
       t.data_inicio,
       t.horario_inicio,
	   t.horario_fim,
       t.nome_treino,
       e.nome AS nome_exercicio,
       e.grupo_muscular,
       txe.series,
       txe.repeticoes,
       txe.carga
FROM admin.treinos_exercicios txe
INNER JOIN admin.treinos  t ON t.id_treino = txe.id_treino
INNER JOIN admin.exercicios e ON e.id_exercicio = txe.id_exercicio
INNER JOIN admin.cliente c ON t.id_cliente = c.id_cliente
INNER JOIN admin.funcionario f ON t.id_funcionario = f.id_funcionario;

-- Pagamenos_cliente tem como funcionalidade facilitar a implementação de tela de pagamentos no site,
-- trazendo dados importantes para efeturar o pagamento de um produto ou plano.
CREATE VIEW site.pagamentos_cliente AS
SELECT pg.id_pagamento,
       c.id_cliente,
       c.nome AS nome_cliente,
       c.cpf,
       fp.tipo AS forma_pagamento,
       pg.valor,
       pg.data_pagamento,
       pg.status
FROM admin.pagamento pg
LEFT JOIN admin.matricula m ON m.id_matricula = pg.id_matricula
LEFT JOIN admin.venda v ON v.id_venda = pg.id_venda
INNER JOIN admin.cliente c ON c.id_cliente = COALESCE(m.id_cliente, v.id_cliente)
INNER JOIN admin.forma_pagamento fp ON fp."id_formaP" = pg.id_forma;
