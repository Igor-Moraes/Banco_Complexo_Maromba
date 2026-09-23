# Auditoria – Entrega 02 | Banco Complexo Maromba

## Resultado geral

O repositório já possui uma parte relevante da Entrega 02: README, scripts separados por schema, duas views no schema `site`, duas views no schema `admin`, quatro CHECKs e FKs com regras `ON DELETE`/`ON UPDATE`.

Entretanto, foram encontrados **dois erros técnicos importantes no schema `contabil`** e **um erro na view de pagamentos do site**, além de itens documentais que ainda precisam ser conferidos antes da entrega.

## 1. Reorganização

### Já existe
- `scripts/admin.sql`
- `scripts/site.sql`
- `scripts/contabil.sql`
- `docs`
- `README.md`

### Ajuste realizado na versão revisada
Foi criada uma ordem explícita de execução:
- `00_create_database.sql`
- `01_admin_tables.sql`
- `02_admin_checks.sql`
- `03_admin_views.sql`
- `04_admin_relations.sql`
- `05_admin_data.sql`
- `contabil/01_contabil.sql`
- `contabil/02_contabil_view.sql`
- `site/01_site_views.sql`

O script original de tabelas não deve conter `CREATE DATABASE` se o README já orienta o usuário a criar o banco antes de executar as tabelas. O `CREATE DATABASE` foi separado.

## 2. Views

### Site – atendido
1. `site.vw_treinos_cadastrados`
2. `site.vw_pagamentos_cliente`

### Admin – atendido
1. `admin.vw_lista_clientes`
2. `admin.vw_lista_funcionarios`

### Contábil
Existe `contabil.plano_lancamentos`, mas o script original tinha uma inconsistência que impedia sua execução correta.

## 3. CHECKs

Já existem quatro CHECKs:
- `admin.pagamento.valor > 0`
- `admin.pagamento.status IN ('pago','pendente','atrasado')`
- `admin.cliente.genero IN ('Masculino','Feminino','Outros')`
- `admin.cliente.modalidade IN ('Musculação','Yoga','Crossfit')`

Isso atende ao mínimo de 2 ou 3 exemplos pedido pelo professor.

## 4. Foreign Keys

O arquivo `complexo_relation.sql` já usa `ON DELETE` e `ON UPDATE`.

Há uso de:
- `RESTRICT` para preservar referências e histórico;
- `CASCADE` em relacionamentos dependentes, como itens de venda e pagamentos de matrícula.

As justificativas existentes devem ser lidas com cuidado: algumas estão semanticamente imprecisas. Na versão revisada, o README explica o critério de escolha.

## 5. Erros técnicos encontrados

### Erro 1 – contabil.lancamentos
O script original tinha:

`CONSTRAINT pk_lancamentos PRIMARY KEY(id)`

mas a coluna criada é `id_lancamento`.

**Correção:** `PRIMARY KEY (id_lancamento)`.

### Erro 2 – contabil.plano_lancamentos
A view original selecionava `l.valor`, mas a tabela `contabil.lancamentos` não possuía a coluna `valor`.

**Correção:** foi adicionada `valor NUMERIC(10,2) NOT NULL` à tabela de lançamentos.

### Erro 3 – site.vw_pagamentos_cliente
A tabela foi criada com a coluna `"id_formaP"` entre aspas. No PostgreSQL, isso preserva maiúsculas e minúsculas.

A view original usava `pg.id_forma`.

**Correção:** `pg."id_formaP"`.

## 6. Artigo

Foi criado `docs/artigo_entrega_02.docx` com:
- título provisório;
- introdução;
- metodologia da migração MySQL → PostgreSQL;
- metodologia da separação em schemas;
- descrição das views;
- constraints;
- pontos que o grupo deve validar.

## 7. Item que ainda depende do grupo

O professor exige os modelos lógicos relacionais de **cada esquema** usando brModelo. O ZIP possui dois arquivos `.brM3`, mas, por serem arquivos nativos do brModelo, a conferência visual de quais schemas eles representam deve ser feita no próprio brModelo.

## 8. Checklist antes de enviar

- [ ] Executar o banco do zero em PostgreSQL.
- [ ] Confirmar que todos os scripts executam sem erro.
- [ ] Testar as quatro views admin/site.
- [ ] Testar a view contábil.
- [ ] Conferir os modelos no brModelo.
- [ ] Conferir se o texto do artigo corresponde ao que o grupo realmente fez.
- [ ] Completar a justificativa específica da migração para PostgreSQL, se o grupo tiver uma justificativa definida.
- [ ] Fazer commit da versão final no GitHub.
