CREATE TRIGGER trg_atualiza_saldo
AFTER INSERT ON contabil.lancamentos
FOR EACH ROW
EXECUTE FUNCTION contabil.fn_atualiza_saldo();