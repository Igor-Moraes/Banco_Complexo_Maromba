--
-- Constraints for table acesso
--
ALTER TABLE admin.acesso
  ADD CONSTRAINT fk_acesso_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table avaliacao
--
ALTER TABLE admin.avaliacao
  ADD CONSTRAINT fk_avaliacao_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table cliente
--
ALTER TABLE admin.cliente
  ADD CONSTRAINT fk_cliente_endereco FOREIGN KEY (id_endereco) REFERENCES admin.endereco (id_endereco) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table credenciais
--
ALTER TABLE admin.credenciais
  ADD CONSTRAINT fk_credenciais_funcionario FOREIGN KEY (id_funcionario) REFERENCES admin.funcionario (id_funcionario) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT fk_credencial_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table fornecedor
--
ALTER TABLE admin.fornecedor
  ADD CONSTRAINT fk_fornecedor_endereco FOREIGN KEY (id_endereco) REFERENCES admin.endereco (id_endereco) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table equipamentos
--
ALTER TABLE admin.equipamentos
  ADD CONSTRAINT fk_equipamento_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES admin.fornecedor (id_fornecedor) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table funcionario
--
ALTER TABLE admin.funcionario
  ADD CONSTRAINT fk_endereco_id FOREIGN KEY (id_endereco) REFERENCES admin.endereco (id_endereco) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT fk_funcionario_especialidade FOREIGN KEY (id_especialidade) REFERENCES admin.especialidade (id_especialidade) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table funcionario_servicos
--
ALTER TABLE admin.funcionario_servicos
  ADD CONSTRAINT fk_funcionario_id FOREIGN KEY (id_funcionario) REFERENCES admin.funcionario (id_funcionario) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT fk_servicos_id FOREIGN KEY (id_servicos) REFERENCES admin.servicos (id_servicos) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table plano_servicos
--
ALTER TABLE admin.plano_servicos
  ADD CONSTRAINT fk_plano_servicos_p FOREIGN KEY (id_plano) REFERENCES admin.plano (id_plano) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT fk_plano_servicos_s FOREIGN KEY (id_servicos) REFERENCES admin.servicos (id_servicos) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table matricula
--
ALTER TABLE admin.matricula
  ADD CONSTRAINT fk_matricula_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT fk_matricula_plano FOREIGN KEY (id_plano) REFERENCES admin.plano (id_plano) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table produto
--
ALTER TABLE admin.produto
  ADD CONSTRAINT fk_estoque_id FOREIGN KEY (id_estoque) REFERENCES admin.estoque (id_estoque) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table movimentacao_estoque
--
ALTER TABLE admin.movimentacao_estoque
  ADD CONSTRAINT fk_produto_id_me FOREIGN KEY (id_produto) REFERENCES admin.produto (id_produto) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table venda
--
ALTER TABLE admin.venda
  ADD CONSTRAINT fk_venda_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table itens_venda
--
ALTER TABLE admin.itens_venda
  ADD CONSTRAINT fk_itemv_produto FOREIGN KEY (id_produto) REFERENCES admin.produto (id_produto) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT fk_itemv_venda FOREIGN KEY (id_venda) REFERENCES admin.venda (id_venda) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table pagamento
--
ALTER TABLE admin.pagamento
  ADD CONSTRAINT fk_pagamento_forma FOREIGN KEY (id_forma) REFERENCES admin.forma_pagamento ("id_formaP") ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT fk_pagamento_matricula FOREIGN KEY (id_matricula) REFERENCES admin.matricula (id_matricula) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT fk_pagamento_venda FOREIGN KEY (id_venda) REFERENCES admin.venda (id_venda) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table faturamento_mensal
--
ALTER TABLE admin.faturamento_mensal
  ADD CONSTRAINT fk_faturamento_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT fk_faturamento_pagamento FOREIGN KEY (id_pagamento) REFERENCES admin.pagamento (id_pagamento) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table treinos
--
ALTER TABLE admin.treinos
  ADD CONSTRAINT fk_treinos_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT fk_treinos_funcionarios FOREIGN KEY (id_funcionario) REFERENCES admin.funcionario (id_funcionario) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table treinos_exercicios
--
ALTER TABLE admin.treinos_exercicios
  ADD CONSTRAINT fk_treinos_exercicios_e FOREIGN KEY (id_exercicio) REFERENCES admin.exercicios (id_exercicio) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT fk_treinos_exercicios_t FOREIGN KEY (id_treino) REFERENCES admin.treinos (id_treino) ON DELETE RESTRICT ON UPDATE RESTRICT;

;