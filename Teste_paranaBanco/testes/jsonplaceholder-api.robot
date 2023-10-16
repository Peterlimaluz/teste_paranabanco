*** Settings ***
Resource    ../resources/the-internet-front.resource
Resource    ../resources/jsonplaceholder-api.resource    

*** Test Cases ***
Criar Cadastro metodo POST incluindo validação pelo Status - 201 - 
    [Tags]    POST
    #abrir navegador peguei do resource the internet, para aproveitar o método
    Abrir o navegador
    #método para abrir o endereço da api
    Ir para o site jsonplaceholder
    #método HTTP que está sendo utilizado
    Criar usuario HTTP POST
    Close Browser

Atualizar Cadastro metodo PUT incluindo validação pelo Status - 200 - 
    [Tags]    PUT
    #abrir navegador peguei do resource the internet, para aproveitar o método
    Abrir o navegador
    #método para abrir o endereço da api
    Ir para o site jsonplaceholder
    #método HTTP que está sendo utilizado
    Atualizar cadastro HTTP PUT
    Close Browser

Buscar Cadastro metodo GET incluindo validação pelo Status - 200 - 
    [Tags]    GET
    #abrir navegador peguei do resource the internet, para aproveitar o método
    Abrir o navegador
    #método para abrir o endereço da api
    Ir para o site jsonplaceholder
    #método HTTP que está sendo utilizado
    Buscar cadastro HTTP GET
    Close Browser

Deletar Cadastro metodo DELETE incluindo validação pelo Status - 200 - 
    [Tags]    DELETE
    #abrir navegador peguei do resource the internet, para aproveitar o método
    Abrir o navegador
    #método para abrir o endereço da api
    Ir para o site jsonplaceholder
    #método HTTP que está sendo utilizado
    Remover cadastro método HTTP DELETE
    Close Browser