## Cadê esse CEP?

Sistema que busca um cep exibe o endereço correspondente.

## Tecnologias

Para essa poc, está sendo utilizado uma linguagem chamda [Mint](https://www.mint-lang.com/) que utiliza a programação funcional para resolver aplicações SPA.

## Iniciando o projeto

Por se tratar de uma linguagem de programação, é necessário que estaja configurado na máquina. Segue o [guia de instalação](https://www.mint-lang.com/install) para todos os SO.

**Para linux**

```bash
  wget --no-verbose -O mint https://mint-lang.s3-eu-west-1.amazonaws.com/mint-latest-linux
  chmod +x ./mint
  sudo mv ./mint /usr/local/bin/mint
```
### Iniciar a aplicação

```bash
  mint build  ---> Instalar as dependencias do projeto
  mint start  ---> Iniciar a aplicalção na porta 3000
```

### Com docker

Não é preciso instalar a linguagem, somente possuir o `docker` e o `docker-compose`

```
  docker-compose up
```