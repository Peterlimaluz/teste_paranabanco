*** Settings ***
Library    Browser
Library    FakerLibrary
Library    DateTime
Library    JSONLibrary

*** Variables ***
${HEADLESS}           ${true}
${jsonPlaceholder}       https://jsonplaceholder.typicode.com/users/
${json}    [{"id": 1, "name": "Leanne Graham", "username": "Bret", "email": "Sincere@april.biz"}]
${schema}    [{"type": "object", "properties": {"id": {"type": "integer"}, "name": {"type": "string"}, "username": {"type": "string"}, "email": {"type": "string"}}}]

*** Keywords ***
Validate JSON By Schema
    [Documentation]    Realiza a verificação do SCHEMA
    [Arguments]    ${json}    ${schema}
    ${result} =    Run Keyword And Ignore Error    Validate JSON By Schema    ${json}    ${schema}
    Run Keyword If    "${result}" == "FAIL"    Fail    JSON does not match schema

Ir para o site jsonplaceholder
    [Documentation]    Criei o processo para chamar a variável que contém o endereço do site e acessar a partir de uma nova página
    New Page    url=${jsonPlaceholder}

Criar usuario HTTP POST
    [Documentation]    Cria cadastro utilizando HTTP POST
    ${resposta}    Http    ${jsonPlaceholder}
    ...                    method=POST
    ...                    body={"name": "Peterson Lima", "username": "PeterLima", "email": "peterson@hotmail.com"}
    ...                    headers={"Content-type": "application/json; charset=UTF-8"}

    Should Be Equal As Integers    ${resposta["status"]}    201
    Validate JSON By Schema    ${json}    ${schema}

Atualizar cadastro HTTP PUT
    [Documentation]    Atualiza o cadastro usando HTTP PUT
    ${resposta}    Http    ${jsonPlaceholder}/1
    ...                    method=PUT
    ...                    body={"id": 1, "name": "Leanne Graham", "username": "Bret", "email": "Sincere@april.biz"}

    Should Be Equal As Integers    ${resposta["status"]}    200
    Validate JSON By Schema    ${json}    ${schema}

Buscar cadastro HTTP GET
    [Documentation]    Realiza a busca utilizando o HTTP GET
    ${resposta}    Http    ${jsonPlaceholder}
    ...                    method=GET
    ...                    headers={"Content-type": "application/json; charset=UTF-8"}

    Should Be Equal As Integers    ${resposta["status"]}    200
    Validate JSON By Schema    ${json}    ${schema[0]}

Remover cadastro método HTTP DELETE
    [Documentation]    DELETA usuario utilizando o HTTP DELETE
    ${resposta}    Http    ${jsonPlaceholder}/2
    ...                    method=DELETE
    ...                    body={"id": 2}
    ...                    headers={"Content-type": "application/json; charset=UTF-8"}

    Should Be Equal As Integers    ${resposta["status"]}    200