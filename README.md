# Banco de Dados – Complexo Maromba

Este repositório tem como objetivo apresentar a estrutura do banco de dados do projeto **Complexo Maromba**.

O banco foi desenvolvido em **PostgreSQL**, após uma migração da versão anterior em **MySQL**. Os scripts foram separados por etapas para facilitar a organização, manutenção e execução do projeto.

## Tecnologias utilizadas

* PostgreSQL
* pgAdmin 4
* SQL

## Como configurar o banco de dados

Siga a ordem abaixo para criar o banco corretamente:

1. Crie um banco de dados chamado **`complexo_maromba`**.
2. Execute o arquivo **`complexo_tables.sql`** para criar os schemas **`admin`** e **`site`**, juntamente com suas tabelas.
3. Execute o arquivo **`complexo_relation.sql`** para criar os relacionamentos entre as tabelas por meio das chaves estrangeiras.
4. Execute o arquivo **`complexo_contabil.sql`** para criar o schema **`contabil`** e suas respectivas tabelas.
5. Execute o arquivo **`complexo_dados.sql`** para inserir os dados utilizados anteriormente no site **Complexo Maromba**.

## Estrutura dos arquivos

| Arquivo                 | Função                                              |
| ----------------------- | --------------------------------------------------- |
| `complexo_tables.sql`   | Criação dos schemas `admin` e `site` e suas tabelas |
| `complexo_relation.sql` | Criação das chaves estrangeiras                     |
| `complexo_contabil.sql` | Criação do schema `contabil`                        |
| `complexo_dados.sql`    | Inserção dos dados iniciais                         |

## Equipe de Desenvolvedores

* Igor Carvalho de Moraes
* Marllon Marques de Oliveira
* Leandro Evangelista Fernandes
* Rodrigo Pereira Silva
* Ana Júlia de Paiva Valentim
