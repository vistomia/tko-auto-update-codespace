## Motivo

Não precisar ficar atualizando o tko manualmente, sempre mostrar a versão do tko e executar `tko play poo` quando abrir um codespace.

O código é rodado sempre que o aluno se conecta ou cria um **codespace** nos repositorios de prova.

Se eu tivesse feito para rodar no mesmo **terminal**. Ele não rodaria novamente se a página fosse recarregada. Só se o terminal fosse apagado e a página atualizada. Como muitas pessoas iriam esquecer de apagar. Eu criei duas linhas de código no `./devcontainer/devcontainer.json` que vão abrir dois terminais simultaneamente. Além disso, um script que atualiza o tko, mostra a versão, dá mensagem de boas vindas ao aluno e abre o tko e se o repositorio do tko não tiver sido inicializado ele roda o `tko init --remote`, configura para `ts` e abre.

## Explicação

As duas linhas que serão sempre executadas quando o codespace for conectado.
```sh
"tk0": "sleep 1 && set +x && ps aux | grep '[b]ash' | grep -v $$ | awk '{print $2}' | xargs kill -9 && clear && bash .devcontainer/attach.sh",
"tko": "set +x && ps aux | grep '[b]ash' | grep -v $$ | awk '{print $2}' | xargs kill -9; clear && bash .devcontainer/attach.sh"
```

tko:

- Fecha todos os terminais se não houver terminais gera um erro.
- Continua mesmo se tiver dado erro.
- Limpa a tela
- Roda o attach.sh

tk0: 

- espera um segundo.
- Fecha todos os terminais se não houver terminais gera um erro.
- Continua somente se não tiver dado erro.
- Limpa a tela
- Roda o attach.sh

Ambos os códigos rodam em paralelo. Como um flip-flop.

**Teste todos os terminais fechados:**
- tk0 dá erro e não continua
- tko roda.

**teste tko aberto e tk0 fechado:**
- tko não roda. (pois o codespace não reinicia o terminal toda vez que a pessoa entra)
- tk0 consegue fechar o tko e roda.

**Teste tko fechado e tk0 aberto:**
- tk0 não roda.
- tko fecha o tk0 e roda.

**Teste um terminal aberto e os dois fechados:**
- tko é mais rapido porcausa que o tk0 precisa espera 1s para iniciar. Fecha todos os terminais e roda.
- tk0 é fechado.

## Explicação do código do attach.sh

```
atualiza o tko e limpa a tela
imprime mensagens
imprime a versão do tko
imprime "[pressione a tecla Enter para continuar]" e espera o usuario apertar Enter.
Se o diretorio poo existir
	tko play poo
Se não
	echo s | tko init --remote poo
  limpa a tela
	tko play poo
```

## Implementar

Para implementar precisa adicionar no objeto do `.devcontainer/devcontainer.json`:
```json
  "postAttachCommand": {
        "tko": "set +x && ps aux | grep '[b]ash' | grep -v $$ | awk '{print $2}' | xargs kill -9; clear && bash .devcontainer/attach.sh",
        "tk0": "sleep 1 && set +x && ps aux | grep '[b]ash' | grep -v $$ | awk '{print $2}' | xargs kill -9 && clear && bash .devcontainer/attach.sh"
  }
```

Adicionar o arquivo `attach.sh` na pasta `./.devcontainer`

[attach.sh](./.devcontainer/attach.sh)

Colocar `welcome.txt` na pasta `./.devcontainer`

[welcome.txt](./.devcontainer/welcome.txt)
