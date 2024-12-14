Motivo: Não precisar ficar atualizando o tko manualmente, não precisar ficar checando a versão do aluno para ver se está desatualizada.

O código é rodado sempre que o aluno se conecta no codespace seja entrando pelo github ou atualizando a página.

Se eu tivesse feito tudo para rodar no mesmo **terminal**. Ele não rodaria novamente só se o terminal fosse apagado e a página atualizada. Como muitas pessoas iriam esquecer de fechar e 

Para isso eu criei duas linhas de código que vão rodar simultaneamente e um script que atualiza o tko, mostra a versão, dá mensagem de boas vindas ao aluno e abre o tko e se o repositorio do tko não tiver sido inicializado ele roda o `tko init --remote` e configura para `ts` e abre.

tko: 

Fecha todos os terminais se não houver terminais gera um erro.
Continua mesmo se tiver dado erro.
Limpa a tela
Roda o attach.sh

tk0: 

espera um segundo.
Fecha todos os terminais se não houver terminais gera um erro.
Continua somente se não tiver dado erro.
Limpa a tela
Roda o attach.sh

Ambos os códigos rodam em paralelo. Como um flip-flop.

**Teste todos os terminais fechados:**
tk0 dá erro e não continua
tko roda.

**teste tko aberto e tk0 fechado:**
tko não roda. (pois o codespace não reinicia o terminal toda vez que a pessoa entra)
tk0 consegue fechar o tko e roda.

**Teste tko fechado e tk0 aberto:**
tk0 não roda.
tko dá erro e continua.

**Teste um terminal aberto e os dois fechados:**
tko é mais rapido porcausa que o tk0 espera 1s para iniciar. E fecha todos os terminais
tk0 é fechado.

## Explicação do código do attach.sh

atualiza o tko e limpa a tela
imprime mensagens
imprime a versão do tko
imprime "[pressione a tecla Enter para continuar]" e espera o usuario apertar Enter.
Se o diretorio poo existir
	tko play poo
Se não
	echo s | tko init --remote poo
	echo ts | tko play poo