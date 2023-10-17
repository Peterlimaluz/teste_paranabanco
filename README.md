# Teste desafio Paraná Banco
Este repositório contém os testes referentes ao desafio Paraná Banco utilizando as bibliotecas Browser, Faker, Json Library e DataTime. Os testes são executados em um navegador WEB, e também fazem solicitações HTTP a uma API.

## Pré-requisitos
- Python instalado na sua máquina
- Bibliotecas do Robot Framework instaladas (use `pip install robotframework` para instalá-las)

- Browser instalado na sua máquina
- Bibliotecas do Browser instaladas(use `pip install robotframework-browser` para instalá-la)

- JSONLibrary instalado na sua máquina
- Bibliotecas do Browser instaladas(use `pip install -U robotframework-jsonlibrary` para instalá-la)

- Faker instalado na sua máquina
- Bibliotecas do Browser instaladas(use `pip install robotframework-fakery` para instalá-la)

### Certifique-se de ter todas as dependências necessárias instaladas. Você pode executar o seguinte comando para verificar as bibliotecas instaladas:
-`pip list`

## Contribuições
Contribuições são bem-vindas! Sinta-se à vontade para abrir problemas e solicitações de pull.

## Executando os Testes
Você pode executar os testes do Robot Framework usando o seguinte comando:
- robot jsonplaceholder-api.robot
- robot the-internet-front.robot

## Estrutura do Projeto
jsonplaceholder-api.robot: Este arquivo contém os casos de teste referente ao HTTP e suas chamadas
jsonplaceholder-api.resource: Contém as configurações para os testes relacionados a API com os seguintes métodos (POST,PUT,GET,DELETE), validação do status e schema
the-internet-front.robot: Este arquivo contém os testes relacionados ao front, clicks de botões.
the-internet-front.resource: Contém a configuração para o teste WEB acessando o site the-internet e executando as ações nos botões.
README.md: Informando as configurações, bibliotecas e processos.

Casos de Teste
## FRONT
a- Sua automação deve efetuar um clique em todos os 3 botões apresentados em tela.

b- Sua automação deve clicar em todos os botões edit e delete da grid apresentada.

## API
- Criar Cadastro metodo POST incluindo validação pelo Status - 201 - 

- Atualizar Cadastro metodo PUT incluindo validação pelo Status - 200 - 

- Buscar Cadastro metodo GET incluindo validação pelo Status - 200 - 

- Deletar Cadastro metodo DELETE incluindo validação pelo Status - 200 - 

## Autor
Peterson de Lima Luz

## Considerações Finais
Pasta Evidencies irá armazenar os testes e também imagem passo a passo do teste.
