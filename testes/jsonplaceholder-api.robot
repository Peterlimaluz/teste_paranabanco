*** Settings ***
Resource    ../resources/jsonplaceholder-api.resource    

*** Test Cases ***
Criar Cadastro metodo POST incluindo validação pelo Status - 201 - 
    [Tags]    POST
    Dado que abri o navegador
    E acessei o site jsonplaceholder
    Então criarei um usuario via HTTP POST
    Close Browser

Atualizar Cadastro metodo PUT incluindo validação pelo Status - 200 - 
    [Tags]    PUT
    Dado que abri o navegador
    E acessei o site jsonplaceholder
    Então atualizarei um cadastro via HTTP PUT
    Close Browser

Buscar Cadastro metodo GET incluindo validação pelo Status - 200 - 
    [Tags]    GET
    Dado que abri o navegador
    E acessei o site jsonplaceholder
    Então Buscarrei um cadastro via HTTP GET
    Close Browser

Deletar Cadastro metodo DELETE incluindo validação pelo Status - 200 - 
    [Tags]    DELETE
    Dado que abri o navegador
    E acessei o site jsonplaceholder
    Então removerei um cadastro via HTTP DELETE
    Close Browser