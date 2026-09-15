CREATE VIEW admin.lista_clientes AS 
SELECT 
id_cliente,
id_endereco,
nome,
cpf,
data_nascimento,
telefone,
email,
modalidade
FROM admin.cliente;

CREATE VIEW admin.lista_funcionarios AS
SELECT 
id_funcionario,
nome,
telefone,
email,
id_endereco,
id_especialidade
FROM admin.funcionario;