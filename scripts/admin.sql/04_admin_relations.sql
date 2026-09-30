  --
  -- Constraints for table acesso
  --
  ALTER TABLE admin.acesso
    ADD CONSTRAINT fk_acesso_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE CASCADE ON UPDATE CASCADE; -- Para que o acesso do cliente seja deletado ou atualizado automaticamente. 
  
  
  --
  -- Constraints for table avaliacao
  --
  ALTER TABLE admin.avaliacao
    ADD CONSTRAINT fk_avaliacao_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE CASCADE ON UPDATE CASCADE; -- Para que a avaliação do cliente seja deletada ou atualizada automnaticamente.
  
  --
  -- Constraints for table cliente
  --
  ALTER TABLE admin.cliente
    ADD CONSTRAINT fk_cliente_endereco FOREIGN KEY (id_endereco) REFERENCES admin.endereco (id_endereco) ON DELETE SET NULL ON UPDATE CASCADE; -- Para que o registro cliente possa permanecer mesmo sem o endereço. E que seja atualizado caso haver alterações.
  
  --
  -- Constraints for table credenciais
  --
  ALTER TABLE admin.credenciais
    ADD CONSTRAINT fk_credenciais_funcionario FOREIGN KEY (id_funcionario) REFERENCES admin.funcionario (id_funcionario) ON DELETE CASCADE ON UPDATE CASCADE, -- Para que as credenciais do funcionário sejam deletadas e atualizadas automaticamente. 
    ADD CONSTRAINT fk_credencial_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE CASCADE ON UPDATE CASCADE; --Para que as credenciais do cliente sejam deletadas e atualizadas automaticamente. 
  
  --
  -- Constraints for table fornecedor
  --
  ALTER TABLE admin.fornecedor
    ADD CONSTRAINT fk_fornecedor_endereco FOREIGN KEY (id_endereco) REFERENCES admin.endereco (id_endereco) ON DELETE SET NULL ON UPDATE CASCADE; -- Para manter o registro de fonercedor mesmo sem endereço, e em caso de alteração, atualizar automaticamente. 
  
  --
  -- Constraints for table equipamentos
  --
  ALTER TABLE admin.equipamentos
    ADD CONSTRAINT fk_equipamento_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES admin.fornecedor (id_fornecedor) ON DELETE RESTRICT ON UPDATE CASCADE; -- Para impossibilitar haver um equipamentto sem fornecedor, e atualizar automaticamente. 
  
  --
  -- Constraints for table funcionario
  --
  ALTER TABLE admin.funcionario
    ADD CONSTRAINT fk_endereco_id FOREIGN KEY (id_endereco) REFERENCES admin.endereco (id_endereco) ON DELETE SET NULL ON UPDATE CASCADE, -- Para manter o registro funcionario mesmo sem endereço, e para atualizar automaticamente.
    ADD CONSTRAINT fk_funcionario_especialidade FOREIGN KEY (id_especialidade) REFERENCES admin.especialidade (id_especialidade) ON DELETE RESTRICT ON UPDATE CASCADE; -- Para permitir a funcionalidade da tabela, e para atualizar automaticamnete.
  
  --
  -- Constraints for table funcionario_servicos
  --
  ALTER TABLE admin.funcionario_servicos
    ADD CONSTRAINT fk_funcionario_id FOREIGN KEY (id_funcionario) REFERENCES admin.funcionario (id_funcionario) ON DELETE CASCADE ON UPDATE CASCADE, -- cascade para deletar o registro caso o funcionario seja deletado, pois perde a funcionalidade. E para atualizar automaticamente. 
    ADD CONSTRAINT fk_servicos_id FOREIGN KEY (id_servicos) REFERENCES admin.servicos (id_servicos) ON DELETE RESTRICT ON UPDATE CASCADE; -- Para permitir a funcionalidade da tabela, e para atualizar automaticamente.
    
  --
  -- Constraints for table plano_servicos
  --
  ALTER TABLE admin.plano_servicos
    ADD CONSTRAINT fk_plano_servicos_p FOREIGN KEY (id_plano) REFERENCES admin.plano (id_plano) ON DELETE CASCADE ON UPDATE CASCADE, -- Para que delete o registro juntamente ao id_plano, pois perde a funcionalidade. Para atualizar automaticamente.
    ADD CONSTRAINT fk_plano_servicos_s FOREIGN KEY (id_servicos) REFERENCES admin.servicos (id_servicos) ON DELETE CASCADE ON UPDATE CASCADE; --  Para que delete o registro juntamente ao id_servicos, pois perde a funcionalidade. Para atualizar automaticamente.
  
  --
  -- Constraints for table matricula
  --
  ALTER TABLE admin.matricula
    ADD CONSTRAINT fk_matricula_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE CASCADE ON UPDATE CASCADE,   -- cascade para deletar a matricula caso o cliente seja deletado
    ADD CONSTRAINT fk_matricula_plano FOREIGN KEY (id_plano) REFERENCES admin.plano (id_plano) ON DELETE RESTRICT ON UPDATE CASCADE;         --nao delete o plano caso a matricula seja deletada
  
  --
  -- Constraints for table produto
  --
  ALTER TABLE admin.produto
    ADD CONSTRAINT fk_estoque_id FOREIGN KEY (id_estoque) REFERENCES admin.estoque (id_estoque) ON DELETE RESTRICT ON UPDATE CASCADE;    --O estoque não deve ser excluído enquanto houver produtos associados, mas atualiza caso o estoque seja atualizado

--
-- Constraints for table movimentacao_estoque
--
ALTER TABLE admin.movimentacao_estoque
  ADD CONSTRAINT fk_produto_id_me FOREIGN KEY (id_produto) REFERENCES admin.produto (id_produto) ON DELETE RESTRICT ON UPDATE CASCADE;   --O produto não deve ser excluído enquanto houver movimentações para preservar o histórico.

--
-- Constraints for table venda
--
ALTER TABLE admin.venda
  ADD CONSTRAINT fk_venda_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE RESTRICT ON UPDATE CASCADE;  --nao deleta o cliente caso a venda seja deletada, mas atualiza o cliente

--
-- Constraints for table itens_venda
--
ALTER TABLE admin.itens_venda
  ADD CONSTRAINT fk_itemv_produto FOREIGN KEY (id_produto) REFERENCES admin.produto (id_produto) ON DELETE RESTRICT ON UPDATE CASCADE,   --Um produto que aparece em uma venda não deve ser excluído para preservar o histórico da venda.
  ADD CONSTRAINT fk_itemv_venda FOREIGN KEY (id_venda) REFERENCES admin.venda (id_venda) ON DELETE CASCADE ON UPDATE CASCADE;    --os itens pertencem à venda e devem ser removidos junto com ela.

--
-- Constraints for table pagamento
--
ALTER TABLE admin.pagamento
  ADD CONSTRAINT fk_pagamento_forma FOREIGN KEY ("id_formaP") REFERENCES admin.forma_pagamento ("id_formaP") ON DELETE RESTRICT ON UPDATE CASCADE,    --se a forma de pagamento for deletada, não deleta o pagamento, mas atualiza caso a forma de pagamento seja atualizada
  ADD CONSTRAINT fk_pagamento_matricula FOREIGN KEY (id_matricula) REFERENCES admin.matricula (id_matricula) ON DELETE CASCADE ON UPDATE CASCADE,    --se a matricula for deletada, deleta o pagamento. (Quando uma matrícula for excluída, todos os pagamentos ligados a ela também devem ser excluídos, porque não faz sentido manter pagamentos de uma matrícula que não existe).
  ADD CONSTRAINT fk_pagamento_venda FOREIGN KEY (id_venda) REFERENCES admin.venda (id_venda) ON DELETE RESTRICT ON UPDATE CASCADE;    --Um pagamento não pode ser excluído enquanto existir uma venda associado a ele.

--
-- Constraints for table faturamento_mensal
--
ALTER TABLE admin.faturamento_mensal
  ADD CONSTRAINT fk_faturamento_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE RESTRICT ON UPDATE CASCADE,    --
  ADD CONSTRAINT fk_faturamento_pagamento FOREIGN KEY (id_pagamento) REFERENCES admin.pagamento (id_pagamento) ON DELETE RESTRICT ON UPDATE CASCADE;    --

--
-- Constraints for table treinos
--
ALTER TABLE admin.treinos
  ADD CONSTRAINT fk_treinos_cliente FOREIGN KEY (id_cliente) REFERENCES admin.cliente (id_cliente) ON DELETE RESTRICT ON UPDATE CASCADE,    --
  ADD CONSTRAINT fk_treinos_funcionarios FOREIGN KEY (id_funcionario) REFERENCES admin.funcionario (id_funcionario) ON DELETE RESTRICT ON UPDATE CASCADE;   --

--
-- Constraints for table treinos_exercicios
--
ALTER TABLE admin.treinos_exercicios
  ADD CONSTRAINT fk_treinos_exercicios_e FOREIGN KEY (id_exercicio) REFERENCES admin.exercicios (id_exercicio) ON DELETE RESTRICT ON UPDATE CASCADE,    --
  ADD CONSTRAINT fk_treinos_exercicios_t FOREIGN KEY (id_treino) REFERENCES admin.treinos (id_treino) ON DELETE RESTRICT ON UPDATE CASCADE;   --

;
