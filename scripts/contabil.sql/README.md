# Schema contabil

- `01_contabil.sql`: cria o schema, tipos, plano de contas e lançamentos.
- `02_contabil_view.sql`: cria a view `contabil.plano_lancamentos`.
- `03_contabil_function.sql` : cria uma função para a trigger.
- `04_contabil_trigger.sql`: cria a trigger , usando a função criada anteriormente.
- `05_contabil_data.sql` : carga de dados do schema `contabil` , dados de teste, etc.. 
- `06_contabil_select.sql` : consultas do schema, com base nas atividades.