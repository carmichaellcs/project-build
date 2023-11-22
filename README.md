## Pré Requisitos
* Docker
* Docker-Compose

### Importante saber

Para evitar a criação de arquivos em um grupo:usuario diferente das pessoas do time, precisamos validar que nosso usuário da maquina, seja pessoal ou empresarial, esteja com o grupo e usuario de `uid` 1000.

Basicamente essa configuração se estende ao Linux, acredito que também no MAC e já no Win precisamos validar :)

Na linha de comando, digite:
> $ id

Precisamos obter uma saída como:

```shell
uid=1000(yourUser) gid=1000(yourUser) grupos=1000(yourUser)
```
___

Caso seu usuário não esteja correto, utilize os comandos abaixo para realizar a alteração.

> $ sudo usermod -u 1000 your_name_user

> $ sudo groupmod -u 1000 your_name_user

_*Reiniciar a maquina para que as alterações sejam feitas._

### Ambiente de Desenvolvimento Pessoal

Instalando `poetry` para gerenciamento de ambiente e projeto em sua Maquina Local.
> curl -sSL https://install.python-poetry.org | python3 -

### Ambiente de Desenvolvimento

Para subir o BackEnd, use o comando:
> docker-compose up acqua-saesa-api

Para matar o processo:
> docker-compose kill && docker-compose down

### Acessar a documentação do projeto

Para subir o servidor da Doc, use o comando:
> docker-compose up acqua-saesa-doc

Para matar o processo:
> docker-compose kill && docker-compose down

### URLs local

Para BackEnd:
> http://0.0.0.0:3030/

Para o Swagger:
> http://0.0.0.0:3030/docs

Para a Documentação:
> http://0.0.0.0:3131/

### Como gerar os arquivos requirements.txt

Para cada ambiente (Produtivo, desenvolvimento e documentação) é importante gerar o arquivo `requirements.txt`, esse arquivo serve para deixar nosso ambiente **Docker** o mais atualizado possível e manter todas as bases de código dos desenvolvedores o mais igual possível, assim evitando conflitos ou erros inesperados.

Para isso, use os comandos ...

Documentação:
> poetry export --without-hashes -f requirements.txt --output requirements_doc.txt --only doc

Desenvolvimento/Testes:
> poetry export --without-hashes -f requirements.txt --output requirements_dev.txt --with dev

Produtivo:
> poetry export --without-hashes -f requirements.txt --output requirements.txt