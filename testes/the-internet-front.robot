*** Settings ***
Resource    ../resources/the-internet-front.resource


*** Test Cases ***
a-Sua automação deve efetuar um clique em todos os 3 botões apresentados em tela
    [Tags]    Acessar Site e Clicar nos 3 botões
    Dado que abri o navegador
    E acessei o site The Internet Front
    Então clico em todos os botões
    Close Browser

b-Sua automação deve clicar em todos os botões edit e delete da grid apresentada
    [Tags]    Acessar Site e clicar em todos os botões Delete e Edit
    Dado que abri o navegador
    E acessei o site The Internet Front
    Então Clico em todos os edit e delete
    Close Browser

