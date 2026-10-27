-- 7- Consulta, com o uso de JOIN, que exiba o código, o nome, a natureza e o saldo de cada conta,
-- ordenada pelo código. 

SELECT pc.codigo,
       pc.nome_conta,
       pc.natureza_conta,
       s.saldo
FROM contabil.plano_contas pc
JOIN contabil.saldo_contas s ON s.conta_id = pc.id_plano_contas
ORDER BY pc.codigo;


/*

  8-Crie uma consulta que exiba a soma dos saldos agrupada por natureza da conta. Os dois totais devem
  ser iguais. Explique, em um comentário, por que isso acontece.
  
    Por que os dois totais são iguais?

  Todo lançamento mexe em duas contas pelo mesmo valor: uma é debitada
  e a outra é creditada. O que uma conta "ganha", a outra "ganha" também,
  na mesma quantidade, de modo que um lado nunca cresce mais que o outro.

  Exemplo: aporte de 30.000
    - Bancos (devedora) +30.000
    - Capital Social (credora) +30.000

  Como começamos com tudo zerado e cada lançamento mantém os dois lados
  equilibrados, a soma das contas devedoras será sempre igual à soma
  das contas credoras. Isso é o método das partidas dobradas.
*/
SELECT pc.natureza_conta,
       SUM(s.saldo) AS total_saldos
FROM contabil.plano_contas pc
JOIN contabil.saldo_contas s ON s.conta_id = pc.id_plano_contas
GROUP BY pc.natureza_conta
ORDER BY pc.natureza_conta;


/*


  9- Responda, em um comentário: o que acontece com os saldos se um lançamento for excluído ou
  alterado? O que seria necessário para que o saldo continuasse correto?

  Os saldos ficam errados. O trigger só funciona quando um lançamento
  é inserido, então ele não percebe quando alguém apaga ou altera
  um lançamento. O saldo continua com o valor antigo.

  Exemplo: se apagarmos o lançamento de 5.000 da venda, o Caixa
  continua com 5.000 mesmo sem a venda existir.

  O que seria necessário para o saldo continuar correto:

    - Criar triggers também para DELETE e UPDATE.
    - No DELETE: desfazer o que o lançamento fez (o que foi somado
      é subtraído, e o que foi subtraído é somado).
    - No UPDATE: desfazer o lançamento antigo e aplicar o novo.

*/