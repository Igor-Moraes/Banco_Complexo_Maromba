-- Um check para não permitir inserir valor 0 ou números negativos.
ALTER TABLE admin.pagamento
ADD CONSTRAINT chk_valor_positivo 
CHECK (valor > 0);

-- Check para permitir a inserção de apenas dados requisitados na tabela de pagamentos, para evitar inconsistência.
ALTER TABLE admin.pagamento
ADD CONSTRAINT chk_status_valido 
CHECK (status  IN ('pago', 'pendente', 'atrasado'));

-- Check para permitir a inserção de apenas dados requisitados na coluna de gereno, para evitar inconsistência.
ALTER TABLE admin.cliente 
ADD CONSTRAINT chk_genero_valido 
CHECK (genero IN ('Masculino', 'Feminino', 'Outros'));

-- Check para permitir a inserção de apenas dados requisitados na coluna de modalidade, para evitar inconsistência.
ALTER TABLE admin.cliente 
ADD CONSTRAINT chk_modalidade_valido 
CHECK (modalidade IN ('Musculação', 'Yoga', 'Crossfit'));