INSERT INTO admin.endereco (id_endereco, rua, bairro, cep, cidade, estado, numero_casa, complemento) VALUES
(1, 'Rua Paulo Mendes de Rezende', 'Jardim Estrela II', '37037042', 'Varginha', 'MG', 127, NULL),
(2, 'Rua Ostende Ribeiro ', 'Bela Vista', '36770170', 'Cataguases', 'MG', 155, NULL),
(3, 'Rua Marcio bittencourt ', 'Bela Vista', '36770170', 'Cataguases', 'MG', 67, NULL),
(4, 'Rua Marllon Abacaxi barato', 'Jardim Estrela II', '37037042', 'Varginha', 'MG', 1001, NULL),
(5, 'Rua Funcionário do Mês', 'barao da pisadinha', '37037057', 'Cataguases', 'MG', 6767, NULL),
(6, 'Rua Indigenas Modernos', 'Pedro Alvares Cabral', '37043057', 'Cataguases', 'MG', 10, NULL),
(7, 'Rua Pardaleiros', 'Misto quente', '37043067', 'Cataguases', 'MG', 7, NULL),
(19, 'Parque Gonçalves Lêdo', 'Farol', '57051-340', 'Maceió', 'AL', 3123, 'casa'),
(20, 'Quadra EQ 416/516 Bloco B', 'Santa Maria', '72546-332', 'Brasília', 'DF', 2, 'Apartamento'),
(22, 'Rua J', 'Conjunto Habitacional Cidade de Deus', '78734-264', 'Rondonópolis', 'MT', 3132, 'casa'),
(23, 'Rua Betânia', 'Nova Esperança', '69915-240', 'Rio Branco', 'AC', 9, 'casa'),
(24, 'Rua Alvaro Franca', 'Sol Nascente', '36774406', 'Cataguases', 'MG', 351, 'casa'),
(25, 'Rua Alvaro Franca', 'Sol Nascente', '36774406', 'Cataguases', 'MG', 690, 'casa'),
(26, 'Parque Gonçalves ', 'Farol', '57051-340', 'Maceió', 'AL', 1020, 'apartamento'),
(30, 'Rua Antônio Rodrigues Gomes', 'Ibraim Mendonça', '36771-120', 'Cataguases', 'MG', 3512, 'casa'),
(31, 'Rua Alvaro Franca', 'Sol Nascente', '36774406', '36770000', 'MG', 351, 'casa');

INSERT INTO admin.especialidade (id_especialidade, tipo) VALUES
(1, 'Musculação'),
(2, 'Yoga'),
(3, 'Crossfit'),
(4, 'Nutrição'),
(5, 'Desenvolvimento Web');



INSERT INTO admin.cliente (id_cliente, nome, cpf, data_nascimento, telefone, email, genero, modalidade, id_endereco) VALUES
(1, 'Márcio Magalhães', '51075186641', '1970-10-12', '5521976118034', 'prof.marcio.silva@doctum.edu.br', 'Masculino', 'fazer yoga', 1),
(2, 'Tiago Bittencourt', '23467389653', '1945-10-12', '3284823533', 'prof.tiago@gmail.com', 'Masculino', 'musculação', 3),
(5, 'Pai do Marllon', '10867389653', '2000-11-07', '3282824533', 'AbacaxiSalgado@gmail.com', 'Masculino', 'Pilates', 4),
(6, 'Ronaldo Nazário', '123.321.321-30', '2002-02-02', '55+ (32) 99973-8012', 'ronaldofenomeno@gmail.com', 'masculino', 'musculacao', 19),
(7, 'Vergil ', '399.422.780-10', '1981-12-02', '55+ (32) 99942-3214', 'vergilyamato@gmail.com', 'masculino', 'crossfit', 20),
(9, 'Leon S. Kennedy', '313.402.780-10', '1999-03-04', '55+ (32) 99923-8057', 'leonardopolicial@gmail.com', 'masculino', 'yoga', 22),
(10, 'Harry Kane da Silva', '999.402.780-11', '1989-09-06', '55+ (32) 99973-9129', 'kanefuracao@gmail.com', 'masculino', 'nutricionista', 23),
(15, 'Matheus da Silva', '399.422.780-31', '2000-02-10', '+5532999703031', 'matheus@gmail.com', 'masculino', 'musculacao', 30),
(16, 'IGOR CARVALHO DE MORAES', '123.321.321-32', '2026-06-02', '32999702829', 'igorcdemoraes@gmail.com', 'Masculino', 'Musculação', 31);



INSERT INTO admin.funcionario (id_funcionario, nome, cpf, telefone, data_nascimento, genero, email, id_endereco, id_especialidade) VALUES
(1, 'Rodrigo Pereira Silva', '94919631049', '553298848108', '2007-04-18', 'Masculino', 'rodrigopsilva@gmail.com', 2, 5),
(4, 'Igor Moraes', '94947631049', '553299702829', '2007-02-27', 'Masculino', 'Igordaerika@gmail.com', 5, 5),
(5, 'Marllon Marques', '10947631049', '5528999336984', '2005-01-01', 'Masculino', 'Marllonabacaxifilho@gmail.com', 4, 5),
(6, 'Leandro Evangelista', '10941231049', '553299575377', '2007-02-18', 'Masculino', 'ProtestoEvangelista@gmail.com', 6, 5),
(7, 'Ana Julia de Paiva', '10941231067', '553284685019', '2007-09-10', 'Masculino', 'CasadaDoLol@gmail.com', 7, 5),
(8, 'William Bonner', '313.312.431-32', '55+ (32)99912-4312', '1999-02-20', 'Masculino', 'willianpersonal@gmail.com', 25, 1),
(9, 'Yuri Zen', '313.794.431-32', '55+ (32)99943-4112', '1980-02-20', 'Masculino', 'yuricalmozen@gmail.com', 5, 2),
(10, 'Julio Borges', '313.794.898-32', '55+ (32)99943-9730', '1990-02-20', 'Masculino', 'juliomonstro@gmail.com', 26, 3),
(11, 'Clarice Fontes', '631.794.898-32', '55+ (32)99913-9730', '2002-02-20', 'Feminino', 'claricedasfontes@gmail.com', 20, 4);


INSERT INTO admin.credenciais (id_credencial, id_cliente, email, senha, id_funcionario, template_biometrico) VALUES
(1, 1, 'prof.marcio.silva@doctum.edu.br', 'php123', NULL, NULL),
(2, NULL, 'rodrigopsilva@gmail.com', 'admin1234', 1, NULL),
(3, 2, 'prof.tiago@gmail.com', 'redes123', NULL, NULL),
(4, 5, 'AbacaxiSalgado@gmail.com', 'abacaxi123', NULL, NULL),
(5, NULL, 'Igordaerika@gmail.com', 'admin1234', 4, NULL),
(6, NULL, 'Marllonabacaxifilho@gmail.com', 'admin1234', 5, NULL),
(7, NULL, 'ProtestoEvangelista@gmail.com\r\n', 'admin1234', 6, NULL),
(8, NULL, 'CasadaDoLol@gmail.com', 'admin1234', 7, NULL),
(9, 6, 'ronaldofenomeno@gmail.com', '$2y$10$ysnoXSgpPlQeNT5ZGlB6E./wQrwMfoT4cVSw8EvQPRDQe60dDcIHi', NULL, NULL),
(10, 7, 'vergilyamato@gmail.com', '$2y$10$fjxB2E1qzyeTtwHLebX4ieG6jPtQTzNXPUJCHkbXh7JA4NVJid972', NULL, NULL),
(12, 9, 'leonardopolicial@gmail.com', '$2y$10$jL4II2RifDhWywd5z6QhyulGzN2J1oDSYbb7BmtrVxqTGf9.Mebqa', NULL, NULL),
(13, 10, 'kanefuracao@gmail.com', '$2y$10$mDfhE/UWeKk5HxmDGPVZf.9gPhFJRirVlx9wE4vXHiPeFv882FEGW', NULL, NULL),
(14, NULL, 'willianpersonal@gmail.com\r\n', 'admin1234', 8, NULL),
(15, NULL, 'yuricalmozen@gmail.com\r\n', 'admin1234', 9, NULL),
(16, NULL, 'juliomonstro@gmail.com\r\n', 'admin1234', 10, NULL),
(17, NULL, 'claricedasfontes@gmail.com\r\n', 'admin1234', 11, NULL),
(21, 15, 'matheus@gmail.com', 'matheus123', NULL, NULL);


INSERT INTO admin.treinos (id_treino, id_cliente, id_funcionario, data_inicio, nome_treino, horario_inicio, horario_fim) VALUES
(1, 6, 8, '2026-06-10', 'Treino A - Peito e Tríceps', '18:30:00', '19:30:00'),
(2, 1, 9, '2026-06-10', 'Yoga Flexibilidade', '17:30:00', '18:30:00'),
(5, 7, 10, '2026-06-10', 'CrossFit Iniciante', '13:00:00', '14:00:00'),
(7, 9, 9, '2026-06-10', 'Yoga Básico Iniciante', '08:00:00', '09:00:00'),
(8, 1, 9, '2026-06-12', 'Yoga Básico Iniciante', '17:30:00', '18:30:00');



INSERT INTO admin.exercicios (id_exercicio, nome, grupo_muscular) VALUES
(1, 'Supino Reto', ''),
(2, 'Cachorro Olhando para Baixo (Adho Mukha Svanasana)', 'Costas e Pernas'),
(5, 'Agachamento Livre', ''),
(7, 'Postura da Montanha (Tadasana)', ''),
(9, 'Puxada Frontal', '');

INSERT INTO admin.treinos_exercicios (id_treino_exercicio, id_treino, id_exercicio, series, repeticoes, carga) VALUES
(1, 1, 1, 5, 12, 29),
(2, 2, 2, 4, 1, 0),
(4, 5, 5, 3, 15, 30),
(6, 7, 7, 2, 10, 0),
(7, 8, 7, 3, 10, 0);