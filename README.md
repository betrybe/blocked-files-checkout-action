# Trybe Blocked Files Checkout Action

Github Action que restaura uma lista de arquivos da branch principal do repositório do projeto. Estes arquivos não podem ser alterados pelo estudante e são definidos no arquivo `trybe.yml` com a chave `ignore_files`.

Para chamar esta action é necessário adicionar um *step* no arquivo `.github/workflows/main.yml` do repositório do projeto.

Para verificar a última versão estável desta *action* [acesse aqui](https://github.com/betrybe/blocked-files-checkout-action/releases).

Exemplo:
```yaml
jobs:
  evaluator_job:
    runs-on: ubuntu-18.04
    name: Evaluator job
    steps:
      - uses: actions/checkout@v2
      - name: 'Checkout protected files'
        uses: betrybe/blocked-files-checkout-action@v1
        with:
          restore_branch: 'main'
      - name: Jest evaluator step
        id: test
        uses: betrybe/jest-evaluator-action@v5
      - name: Store evaluation step
        uses: betrybe/store-evaluation-action@v2
```

### Inputs

#### `restore_branch` **(obrigaório)**

**Branch** do repositório do projeto para qual os arquivos serão restaurados. O valor **default** é `main`.

### Ignore files

Para definir quais arquivos devem ser restaurados para desfazer as alteracões do estudante é necessário adicionar o diretório ou o caminho do arquivo no `trybe.yml` conforme exemplo abaixo:

```yaml
ignore_files:
  - test-dir
  - .editorconfig
  - .eslintrc
  - api/config/main.json
```
