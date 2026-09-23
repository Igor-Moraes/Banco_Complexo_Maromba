# Banco de Dados – Complexo Maromba

Repositório do banco de dados do projeto **Complexo Maromba**, desenvolvido em **PostgreSQL** após a migração da versão anterior em MySQL.

## Tecnologias
- PostgreSQL
- pgAdmin 4
- SQL

## Estrutura

```text
docs/
├── admin_logico.brM3
└── complexo_bancoadmindados_logico.brM3

scripts/
├── admin.sql/
│   ├── 00_create_database.sql
│   ├── 01_admin_tables.sql
│   ├── 02_admin_checks.sql
│   ├── 03_admin_views.sql
│   ├── 04_admin_relations.sql
│   ├── 05_admin_data.sql
│   └── arquivos originais da Entrega 01
├── site.sql/
│   ├── 01_site_views.sql
│   └── README.md
└── contabil.sql/
    ├── 01_contabil.sql
    ├── 02_contabil_view.sql
    └── README.md
```

## Ordem de execução

### 1. Criar o banco
Conectado a um banco administrativo, execute:

```sql
CREATE DATABASE complexo_maromba;
```

Depois, conecte-se ao banco `complexo_maromba`.

### 2. Schema admin
Execute nesta ordem:

1. `scripts/admin.sql/01_admin_tables.sql`
2. `scripts/admin.sql/04_admin_relations.sql`
3. `scripts/admin.sql/02_admin_checks.sql`
4. `scripts/admin.sql/03_admin_views.sql`
5. `scripts/admin.sql/05_admin_data.sql`

### 3. Schema contabil
Execute:

1. `scripts/contabil.sql/01_contabil.sql`
2. `scripts/contabil.sql/02_contabil_view.sql`

### 4. Schema site
Execute:

1. `scripts/site.sql/01_site_views.sql`

As views do schema `site` consultam tabelas do schema `admin`, por isso o `admin` precisa existir antes.

## Views

### Schema site

**`site.vw_treinos_cadastrados`**  
Uso: aplicação web. Reúne cliente, funcionário, treino e exercícios em uma única consulta para facilitar a exibição dos treinos.

**`site.vw_pagamentos_cliente`**  
Uso: aplicação web. Reúne cliente, forma de pagamento, valor, data e status para facilitar a tela de pagamentos.

### Schema admin

**`admin.vw_lista_clientes`**  
Uso: gestores/administradores. Simplifica a consulta dos principais dados cadastrais dos clientes.

**`admin.vw_lista_funcionarios`**  
Uso: gestores/administradores. Simplifica a consulta dos principais dados dos funcionários.

### Schema contabil

**`contabil.plano_lancamentos`**  
Uso: área contábil/gestão. Reúne lançamento, histórico, contas de débito e crédito e valor em uma consulta.

## Constraints

O projeto possui `CHECK` para:
- impedir valor de pagamento menor ou igual a zero;
- limitar o status de pagamento a `pago`, `pendente` ou `atrasado`;
- limitar gênero do cliente aos valores definidos pelo projeto;
- limitar modalidade do cliente aos valores definidos pelo projeto.

As chaves estrangeiras do schema `admin` possuem regras explícitas de `ON DELETE` e `ON UPDATE`. Em geral, `RESTRICT` preserva registros históricos e impede a remoção de registros-pai ainda referenciados; `CASCADE` é usado quando o registro-filho depende diretamente do pai, como itens de venda e pagamentos ligados à matrícula.

## Observação sobre o schema contabil

Na versão recebida havia dois problemas que impediam a execução coerente da view contábil: a chave primária de `lancamentos` referenciava uma coluna inexistente (`id`) e a view utilizava `l.valor`, embora a tabela não tivesse essa coluna. A versão revisada corrige esses pontos adicionando `valor` e usando `id_lancamento` como chave primária.

## Equipe
- Igor Carvalho de Moraes
- Marllon Marques de Oliveira
- Leandro Evangelista Fernandes
- Rodrigo Pereira Silva
- Ana Júlia de Paiva Valentim
