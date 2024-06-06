# Clínica Espaço Autoestima - Sistema de agendamento

🚧 Em construção 🚧

Aplicação desenvolvida especificamente para uma clínica de estética chamada "Espaço Autoestima" que visa o cadastro e agendamento de clientes com suas respectivas sessões, horário e os(as) profissionais que irão tratá-los. Assim como, cadastro de produtos que serão utilizados nas sessões, controle de estoque, entre outros. Esse projeto se refere à disciplina de "Software Product: Analysis and Specification" do 4° semestre do curso de Análise e Desenvolvimento de Sistemas da Faculdade Impacta.

## Integrantes
- Anderson Tengan Amador;
- David Castanheira de Souza;
- Letícia Nunes de Lima;
- Lucas Stefaneli

## Ferramentas 
A linguagem back-end responsável pelas regras de negócio e lógica da aplicação em questão é o **[Python](https://docs.python.org/pt-br/3/tutorial/)**:
* O framework web utilizado é **[Flask]([https://docs.djangoproject.com/en/5.0/](https://flask.palletsprojects.com/en/3.0.x/))** que permite que a construção de aplicações Web de maneira simples e objetiva com a capacidade de escalar para aplicações complexas;
* Neste projeto, utilizamos esse framework para criar páginas web dinâmicas através de rotas, pois facilita a criação de endpoints e a integração com bancos de dados, tornando o desenvolvimento do backend eficiente e organizado.

O SGBD utilizado nesse projeto é o MySQL, que por sua vez, está sendo executado em um container Docker, por meio de uma imagem na versão 5.7. Abaixo, segue os comandos para instalação do Flask, da biblioteca de conexão com o banco e a construção do container Docker:

Abra o CMD ou o prompt de comando do Windows ou até mesmo no próprio Visual Studio Code e execute o comando abaixo:
```
$ pip install Flask
```
Após isso, uma mensagem de sucesso aparecerá no terminal Windows e o próximo comando pode ser executado para instalação da biblioteca Python para conexão com o banco MySQL:
```
$ pip install mysql-connector-python
```
## Configuração do banco e conexão com a aplicação
Com as instalações feitas, a configuração do banco de dados já pode ser feita em seu arquivo .py, através de variáveis de ambiente definindo o nome de usuário, senha, nome do banco e o host (endereço IPV4 do container Docker quando for criado):

```
config = {
    'user': 'nome-usuario', 
    'password': 'senha', 
    'host': '172.xx.x.x', 
    'database': 'nome-banco',
}
```
Obs: A escolha da biblioteca para conexão com o banco é única e exclusivamente do(s) desenvolvedor(es). Neste caso, foi-se utilizada a 'mysql-connector-python'.

## Criação do container Docker
Neste projeto, os desenvolvedores utilizaram o Docker no sistema operacional Windows para a criação e orquestração dos containers. Para isso, foi-se necessária a instalação do [Windows Subsystem Linux]([https://learn.microsoft.com/pt-br/windows/wsl/install]) para que tudo funcionasse da melhor maneira possível. Segue os comandos para a criação do container Docker e da imagem do MySQL:

O comando abaixo permite baixar imagens prontas do Docker Hub: 
```
docker pull mysql:5.7
```
Após isso, crie o container e defina seu nome, senha do usuário 'root', a porta em que o container vai rodar e a imagem que será utilizada. Lembre-se que a senha definida aqui, deve ser adicionada como variável de ambiente no arquivo .py
```
docker run --name nome-container -e MYSQL_ROOT_PASSWORD=senha -p 3306:3306 -d mysql:5.7
```
Agora, execute o seguinte comando para listar os containers ativos:
```
docker ps
```
Para verificar o ID do container Docker, execute:
```
docker network inspect bridge
```
Verifique o host do endereço IPV4 (iniciado por 172) e subsitua na chave 'host' do dicionário de configuração do arquivo .py:
```
'host': '172.xx.x.x'
```
O passo seguinte permite executar comandos dentro do próprio container para a criação de tabelas, usuários e etc.
```
docker exec -it id-container /bin/bash
```
Uma linha será gerada pelo terminal. Execute o comando a seguir para acessar o banco:
```
mysql -uroot -p
```
Com acesso ao banco, você pode criar o database que armazenará as tabelas criadas posteriormente. Lembre-se que o nome do banco definido aqui, deve ser adicionado como variável de ambiente no arquivo .py:
```
create schema nome-banco;
```
```
use nome-banco;
```
Agora, crie uma tabela de exemplo para verificar se o banco está funcionando nos conformes:
```
CREATE TABLE usuarios (usuario_id BIGINT NOT NULL AUTO_INCREMENT PRIMARY KEY, nome VARCHAR(45) NOT NULL, senha VARCHAR(45) NOT NULL);
```
Verifique se a tabela foi criada com os devidos atributos:
```
DESCRIBE usuarios;
```
## Criação do Dockerfile 
O Dockerfile permite a construção de uma imagem própria da aplicação, sem a necessidade e o dever de executá-la localmente. Para criá-lo, basta executar o seguinte comando:
```
docker image build -t nome-imagem .
```
Obs: É muito importante se atentar e não esquecer do ponto final 

Após isso, execute:
```
docker run -p 5000:5000 -d nome-imagem
```

### Criação do Docker Compose 
Para executar o Docker Compose, é necessário que os containers sejam parados. Liste todos para recuperar o ID e então:
```
docker stop id-container-1 (aplicação)
docker stop id-container-2 (banco de dados)
```
Agora sim, o compose pode ser executado:
```
docker compose up -d
```
Obs: Será necessário recriar o próprio banco e tabelas e é importante que antes desse comando ser rodado, a tag definida no arquivo .yml seja alterada nas configuração do banco, mais especificamente na chave "host" ao invés do ID do container Docker

Em caso de uma eventual mudança ou restabelecimento:
```
docker compose stop
docker compose down 
```
