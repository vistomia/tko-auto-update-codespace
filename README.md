## Explicação

As duas linhas que serão sempre executadas quando o codespace for conectado.
```sh
"tk0": "sleep 1 && set +x && ps aux | grep '[b]ash' | grep -v $$ | awk '{print $2}' | xargs kill -9 && clear && bash .devcontainer/attach.sh",
"tko": "set +x && ps aux | grep '[b]ash' | grep -v $$ | awk '{print $2}' | xargs kill -9 && clear && bash .devcontainer/attach.sh"
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

Na linha 11 você pode definir um repositório padrão. Mas, se não definir, o script prossegue verificando outros repositórios disponíveis (poo, fup ou ed). Caso nenhum desses diretórios existam, o usuário será solicitado a escolher manualmente.

Colocar `welcome.txt` na pasta `./.devcontainer`

[welcome.txt](./.devcontainer/welcome.txt)
