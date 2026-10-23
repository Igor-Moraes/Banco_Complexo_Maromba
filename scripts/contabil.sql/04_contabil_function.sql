
DECLARE
	v_natureza_debito contabil.plano_contas.natureza_conta%TYPE;
	v_natureza_credito contabil.plano_contas.natureza_conta%TYPE;
BEGIN

	-- Valida que se o valor for menor ou igual a zero, não tem que atualizar o saldo.
	IF NEW.valor IS NULL OR NEW.valor <= 0 THEN
		RETURN NEW;
	END IF;
	

	-- Conta de débito
	IF NEW.conta_debito_id IS NOT NULL THEN
		SELECT natureza_conta
			INTO v_natureza_debito
			FROM contabil.plano_contas
			WHERE id_plano_contas = NEW.conta_debito_id;

		IF v_natureza_debito IS NOT NULL THEN
		UPDATE contabil.saldo_contas
			SET saldo = saldo + CASE v_natureza_debito::text
			WHEN 'DEVEDORA' THEN NEW.valor	
			WHEN 'CREDORA' THEN -NEW.valor
		END,
		data_atualizacao = now()
		WHERE conta_id = NEW.conta_debito_id;
		END IF ;
	END IF;

	-- Conta de crédito
	IF NEW.conta_credito_id IS NOT NULL THEN
		SELECT natureza_conta
			INTO v_natureza_credito
			FROM contabil.plano_contas
			WHERE id_plano_contas = NEW.conta_credito_id;

			IF v_natureza_credito IS NOT NULL THEN
				UPDATE contabil.saldo_contas
					SET saldo = saldo + CASE v_natureza_credito::text
					WHEN 'CREDORA' THEN NEW.valor
					WHEN 'DEVEDORA' Then -NEW.valor
				END,
				data_atualizacao = now()
			WHERE conta_id = NEW.conta_credito_id;
		END IF;
	END IF;

	RETURN NEW;
 	
END;
