CREATE DATABASE complexo_maromba;
CREATE SCHEMA admin;
CREATE SCHEMA site;

CREATE TABLE admin.acesso (
  "id_acesso" serial primary key NOT NULL,
  "id_cliente" integer NOT NULL,
  "data_hora" date NOT NULL,
  "tipo_movimento" integer NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.avaliacao (
  "id_avaliacao" serial primary key NOT NULL,
  "id_cliente" integer NOT NULL,
  "data_avaliacao" date NOT NULL,
  "peso" numeric(5,2) NOT NULL,
  "altura" numeric(4,2) NOT NULL,
  "percentual_gordura" numeric(5,2) NOT NULL,
  "observacoes" text NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.cliente (
  "id_cliente" serial primary key NOT NULL,
  "nome" character varying(255) NOT NULL,
  "cpf" character varying(14)  UNIQUE NOT NULL,
  "data_nascimento" date NOT NULL,
  "telefone" character varying(20) DEFAULT NULL,
  "email" character varying(255) UNIQUE NOT NULL,
  "genero" character varying(20) NOT NULL,
  "modalidade" character varying(100) DEFAULT NULL,
  "id_endereco" integer NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.credenciais (
  "id_credencial" serial primary key NOT NULL,
  "id_cliente" integer DEFAULT NULL,
  "email" character varying(100)  UNIQUE NOT NULL,
  "senha" character varying(100) NOT NULL,
  "id_funcionario" integer DEFAULT NULL,
  "template_biometrico" character varying(10) DEFAULT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.endereco (
  "id_endereco" serial primary key NOT NULL,
  "rua" character varying(255) NOT NULL,
  "bairro" character varying(60) NOT NULL,
  "cep" character varying(9) NOT NULL,
  "cidade" character varying(60) NOT NULL,
  "estado" character varying(50) NOT NULL,
  "numero_casa" integer NOT NULL,
  "complemento" character varying(50) DEFAULT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.equipamentos (
  "id_equipamento" serial primary key NOT NULL,
  "nome" character varying(255) NOT NULL,
  "tipo" character varying(255) NOT NULL,
  "status" character varying(255) NOT NULL,
  "data_aquisicao" date NOT NULL,
  "id_fornecedor" integer NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.especialidade (
  "id_especialidade" serial primary key NOT NULL,
  "tipo" character varying(50) NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.estoque (
  "id_estoque" serial primary key NOT NULL,
  "id_produto" integer NOT NULL,
  "quantidade_atual" integer NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.exercicios (
  "id_exercicio" serial primary key NOT NULL,
  "nome" character varying(100) NOT NULL,
  "grupo_muscular" character varying(80) NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.faturamento_mensal (
  "id_faturamento" serial primary key NOT NULL,
  "mes_referencia" character varying(7) NOT NULL,
  "valor_total" numeric(10,2) NOT NULL,
  "data_registro" date NOT NULL,
  "id_cliente" integer NOT NULL,
  "id_pagamento" integer NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.forma_pagamento (
  "id_formaP" serial primary key NOT NULL,
  "tipo" character varying(10) NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.fornecedor (
  "id_fornecedor" integer NOT NULL,
  "nome" character varying(255) NOT NULL,
  "cnpj" character varying(20) UNIQUE NOT NULL,
  "telefone" character varying(20) NOT NULL,
  "email" character varying(255) NOT NULL,
  "id_endereco" integer NOT NULL,
  "produtos_fornecidos" integer NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.funcionario_servicos (
  "id_servicos"integer NOT NULL,
  "id_funcionario" integer NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.funcionario (
  "id_funcionario" serial primary key NOT NULL,
  "nome" character varying(255) NOT NULL,
  "cpf" character varying(15) UNIQUE NOT NULL,
  "telefone" character varying(20) NOT NULL,
  "data_nascimento" date NOT NULL,
  "genero" character varying(20) NOT NULL,
  "email" character varying(255)  UNIQUE NOT NULL,
  "id_endereco" integer NOT NULL,
  "id_especialidade" integer DEFAULT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.itens_venda (
  "id_item" serial primary key NOT NULL,
  "id_venda" integer NOT NULL,
  "id_produto" integer NOT NULL,
  "quantidade" integer NOT NULL,
  "preco_total" numeric(10,2) NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.matricula (
  "id_matricula" serial primary key NOT NULL,
  "id_cliente" integer NOT NULL,
  "id_plano" integer NOT NULL,
  "data_inicio" date NOT NULL,
  "data_fim" date NOT NULL,
  "status" character varying(60) NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.movimentacao_estoque (
  "id_movimentacao" serial primary key NOT NULL,
  "id_produto" integer NOT NULL,
  "quantidade" integer NOT NULL,
  "data_hora" date NOT NULL,
  "tipo_movimento" character varying(15) NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.pagamento (
  "id_pagamento" serial primary key NOT NULL,
  "id_venda" integer DEFAULT NULL,
  "id_matricula" integer DEFAULT NULL,
  "id_forma" integer NOT NULL,
  "valor" numeric(10,2) NOT NULL,
  "data_pagamento" date NOT NULL,
  "status" character varying(15) NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.plano (
  "id_plano" serial primary key NOT NULL,
  "nome" character varying(100) NOT NULL,
  "valor" integer NOT NULL,
  "duracao" date NOT NULL,
  "descricao" character varying(255) NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.plano_serviços (
  "id_servicos" integer NOT NULL,
  "id_plano" integer NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.produto (
  "id_produto" serial primary key NOT NULL,
  "nome" character varying(255) NOT NULL,
  "preco" integer NOT NULL,
  "descricao" character varying(100) NOT NULL,
  "modelo" character varying(255) NOT NULL,
  "cor" integer DEFAULT NULL,
  "gramatura" integer DEFAULT NULL,
  "id_estoque" integer NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.servicos (
  "id_servicos" serial primary key NOT NULL,
  "nome" character varying(50) NOT NULL,
  "descricao" character varying(255) NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.treinos (
  "id_treino" serial primary key NOT NULL,
  "id_cliente" integer NOT NULL,
  "id_funcionario" integer NOT NULL,
  "data_inicio" date NOT NULL,
  "nome_treino" character varying(50) DEFAULT NULL,
  "horario_inicio" time NOT NULL,
  "horario_fim" time NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.treinos_exercicios (
  "id_treino_exercicio" serial primary key NOT NULL,
  "id_treino" integer NOT NULL,
  "id_exercicio" integer NOT NULL,
  "series" integer NOT NULL,
  "repeticoes" integer NOT NULL,
  "carga" integer NOT NULL
);

-- ---------------------------------------------------------

CREATE TABLE admin.venda (
  "id_venda" serial primary key NOT NULL,
  "id_cliente" integer NOT NULL,
  "data" date NOT NULL,
  "valor_total" numeric(10,2) NOT NULL
);