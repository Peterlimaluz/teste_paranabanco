*** Settings ***
Resource    ../resources/the-internet-front.resource


*** Test Cases ***
a- Sua automação deve efetuar um clique em todos os 3 botões apresentados em tela.
    [Tags]    Acessar Site e Clicar nos 3 botões
    Abrir o navegador
    Ir para o site The Internet Front
    Clicar em todos os botões 
    Close Browser

b- Sua automação deve clicar em todos os botões edit e delete da grid apresentada.
    [Tags]    Acessar Site e clicar em todos os botões Delete e Edit
    Abrir o navegador
    Ir para o site The Internet Front
    Clicar em todos os edit e delete
    Close Browser

