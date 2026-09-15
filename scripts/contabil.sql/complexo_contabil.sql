CREATE SCHEMA contabil;

CREATE TYPE contabil.tipo_conta_enum as ENUM('ATIVO','PASSIVO','PATROMONIO_LIQUIDO','RECEITA','DESPESA');
CREATE TYPE contabil.natureza_conta_enum as ENUM('DEVEDORA','CREDORA');

CREATE TABLE contabil.plano_contas(
	id serial,
	codigo varchar(40) not null,
	nome_conta varchar(255) not null,
	tipo_conta contabil.tipo_conta_enum not null,
	natureza_conta contabil.natureza_conta_enum not null DEFAULT 'DEVEDORA',
	CONSTRAINT pk_plano_contas PRIMARY KEY(id)
);

CREATE TABLE contabil.lancamentos(

	id serial,
	data_lancamento date not null,
	historico varchar(255),
	conta_debito_id integer,
	conta_credito_id integer,
	CONSTRAINT pk_lancamentos PRIMARY KEY(id),
	CONSTRAINT fk_conta_debito FOREIGN KEY(conta_debito_id) REFERENCES contabil.plano_contas(id),
	CONSTRAINT fk_conta_credito FOREIGN KEY(conta_credito_id) REFERENCES contabil.plano_contas(id)
);