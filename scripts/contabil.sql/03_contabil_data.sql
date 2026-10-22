-- Dados da tabela plano de contas.
INSERT INTO contabil.plano_contas (codigo, nome_conta, tipo_conta, natureza_conta) VALUES
('1.1.01', 'Caixa',                          'ATIVO',              'DEVEDORA'),
('1.1.02', 'Bancos - Conta Movimento',       'ATIVO',              'DEVEDORA'),
('1.1.03', 'Clientes a Receber',             'ATIVO',              'DEVEDORA'),
('1.1.04', 'Estoque de Mercadorias',         'ATIVO',              'DEVEDORA'),
('1.2.01', 'Móveis e Utensílios',            'ATIVO',              'DEVEDORA'),
('1.2.02', 'Veículos',                       'ATIVO',              'DEVEDORA'),
('2.1.01', 'Fornecedores a Pagar',           'PASSIVO',            'CREDORA'),
('2.1.02', 'Salários a Pagar',               'PASSIVO',            'CREDORA'),
('2.1.03', 'Impostos a Recolher',            'PASSIVO',            'CREDORA'),
('2.2.01', 'Empréstimos Bancários (LP)',     'PASSIVO',            'CREDORA'),
('3.1.01', 'Capital Social',                 'PATRIMONIO_LIQUIDO', 'CREDORA'),
('3.1.02', 'Lucros/Prejuízos Acumulados',    'PATRIMONIO_LIQUIDO', 'CREDORA'),
('4.1.01', 'Receita de Vendas',              'RECEITA',            'CREDORA'),
('4.1.02', 'Receita de Serviços',            'RECEITA',            'CREDORA'),
('5.1.01', 'Custo das Mercadorias Vendidas', 'DESPESA',            'DEVEDORA'),
('5.1.02', 'Despesas com Salários',          'DESPESA',            'DEVEDORA'),
('5.1.03', 'Despesas com Aluguel',           'DESPESA',            'DEVEDORA'),
('5.1.04', 'Despesas com Energia Elétrica',  'DESPESA',            'DEVEDORA'),
('5.1.05', 'Despesas com Água',              'DESPESA',            'DEVEDORA'),
('5.1.06', 'Despesas com Telefone/Internet', 'DESPESA',            'DEVEDORA'),
('5.1.07', 'Despesas Bancárias/Tarifas',     'DESPESA',            'DEVEDORA'),
('5.1.08', 'Despesas com Combustível',       'DESPESA',            'DEVEDORA'),
('5.1.09', 'Despesas Diversas',              'DESPESA',            'DEVEDORA');


-- Dados da tabela de lançamentos.

INSERT INTO contabil.lancamentos (data_lancamento, historico, conta_debito_id, conta_credito_id, valor)
VALUES
('2026-03-01', 'Aporte de capital dos sócios',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '3.1.01'),
    50000.00),

('2026-03-02', 'Compra de mercadorias para revenda, a prazo',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '2.1.01'),
    18000.00),

('2026-03-03', 'Pagamento de aluguel do mês',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.03'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.01'),
    3200.00),

('2026-03-03', 'Venda de mercadorias à vista',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.01'),
    4500.00),

('2026-03-03', 'Baixa do custo da mercadoria vendid_plano_contasa',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    2700.00),

('2026-03-04', 'Venda de mercadorias a prazo',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.03'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.01'),
    6200.00),

('2026-03-04', 'Baixa do CMV da venda a prazo',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    3720.00),

('2026-03-05', 'Compra de mercadorias à vista',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    9000.00),

('2026-03-05', 'Pagamento de conta de energia elétrica',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.04'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    850.00),

('2026-03-06', 'Recebimento de cliente (venda dia 04)',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.03'),
    6200.00),

('2026-03-07', 'Pagamento a fornecedor',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '2.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    9000.00),

('2026-03-08', 'Venda de mercadorias à vista',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.01'),
    5100.00),

('2026-03-08', 'Baixa do CMV',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    3060.00),

('2026-03-09', 'Pagamento de salários',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.02'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    7500.00),

('2026-03-09', 'Retenção de INSS/FGTS sobre a folha',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.02'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '2.1.03'),
    1650.00),

('2026-03-10', 'Pagamento de telefone e internet',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.06'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    320.00),

('2026-03-10', 'Compra de mercadorias a prazo',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '2.1.01'),
    14500.00),

('2026-03-11', 'Venda de mercadorias a prazo',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.03'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.01'),
    8300.00),

('2026-03-11', 'Baixa do CMV',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    4980.00),

('2026-03-12', 'Pagamento de tarifas bancárias',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.07'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    95.00),

('2026-03-12', 'Combustível para entregas',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.08'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.01'),
    410.00),

('2026-03-13', 'Recebimento de cliente',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.03'),
    8300.00),

('2026-03-14', 'Venda de mercadorias à vista',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.01'),
    3900.00),

('2026-03-14', 'Baixa do CMV',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    2340.00),

('2026-03-15', 'Pagamento de água',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.05'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    210.00),

('2026-03-15', 'Empréstimo bancário recebid_plano_contaso',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '2.2.01'),
    20000.00),

('2026-03-16', 'Compra de veículo para entregas, à vista',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.2.02'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    22000.00),

('2026-03-16', 'Compra de mercadorias a prazo',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '2.1.01'),
    11200.00),

('2026-03-17', 'Venda de mercadorias a prazo',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.03'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.01'),
    7400.00),

('2026-03-17', 'Baixa do CMV',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    4440.00),

('2026-03-18', 'Pagamento a fornecedores',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '2.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    14500.00),

('2026-03-18', 'Prestação de serviço de instalação',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.02'),
    1800.00),

('2026-03-19', 'Venda de mercadorias à vista',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.01'),
    4700.00),

('2026-03-19', 'Baixa do CMV',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    2820.00),

('2026-03-20', 'Pagamento de parcela do empréstimo',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '2.2.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    2000.00),

('2026-03-20', 'Material de escritório',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.09'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.01'),
    180.00),

('2026-03-21', 'Recebimento de cliente',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.03'),
    7400.00),

('2026-03-21', 'Venda de mercadorias a prazo',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.03'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.01'),
    5600.00),

('2026-03-21', 'Baixa do CMV',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    3360.00),

('2026-03-22', 'Compra de mercadorias à vista',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.01'),
    6000.00),

('2026-03-23', 'Pagamento de tarifas bancárias',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.07'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    88.00),

('2026-03-24', 'Venda de mercadorias à vista',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.01'),
    3300.00),

('2026-03-24', 'Baixa do CMV',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    1980.00),

('2026-03-25', 'Pagamento de impostos (Simples Nacional)',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '2.1.03'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    2450.00),

('2026-03-25', 'Venda de mercadorias à vista',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.01'),
    3300.00),

('2026-03-25', 'Baixa do CMV',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    1980.00),

('2026-03-26', 'Adiantamento de aluguel',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.03'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    600.00), 

('2026-03-27', 'Compra de mercadorias a prazo',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '2.1.01'),
    9800.00),

('2026-03-28', 'Venda de mercadorias a prazo',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.03'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '4.1.01'),
    6100.00),

('2026-03-28', 'Baixa do CMV',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.01'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.04'),
    3660.00),

('2026-03-29', 'Pagamento de salários',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.02'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    7500.00),

('2026-03-30', 'Recebimento de cliente',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.02'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.03'),
    5600.00),

('2026-03-31', 'Despesas diversas do mês',
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '5.1.09'),
    (SELECT id_plano_contas FROM contabil.plano_contas WHERE codigo = '1.1.01'),
    150.00);
