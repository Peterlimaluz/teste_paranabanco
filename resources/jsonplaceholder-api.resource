*** Settings ***
Library    Browser
Library    FakerLibrary
Library    DateTime
Library    JSONLibrary

*** Variables ***
${BROWSER}            chromium
${HEADLESS}           ${true}
${url_jsonPlaceholder}    https://jsonplaceholder.typicode.com/users/
${schema}             path/../schema/schema.json

*** Keywords ***
Dado que abri o navegador
    [Documentation]    Inicia o navegador para os testes e as propriedades que eu irei iniciar
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}    
    # Utilizo um GUID aleatorio para não repetir o registro dos testes
    ${TRACE_NAME}    FakerLibrary.Uuid 4
    # Uso a data atual para inserir nos nomes dos arquivos gerados (Tracks e videos)
    ${NOW}         Get Current Date  result_format=%d-%m-%Y_%H%M%S
    # Informo o tamanho da tela do navegador
    New Context    viewport={'width': 1200, 'height': 800}
    # Armazena os testes em formato de imagem
    ...            tracing=${OUTPUT_DIR}/evidencies/traces/api/${NOW}/${TRACE_NAME}.zip
    # Armazena os testes em formato de video
    # ...            recordVideo={'dir':'C:/Users/Peter/OneDrive/Documentos/Projetos/Teste_paranaBanco/evidencies/videos/api/${NOW}'}

E acessei o site jsonplaceholder
    [Documentation]    Criei o processo para chamar a variável que contém o endereço do site e acessar a partir de uma nova página
    New Page    url=${url_jsonPlaceholder}

Então criarei um usuario via HTTP POST
    [Documentation]    Cria cadastro utilizando HTTP POST 
    ${resposta}    Http    ${url_jsonPlaceholder}
    ...                    method=POST
    ...                    body={"name": "Peterson Lima", "username": "PeterLima", "email": "peterson@hotmail.com"}
    ...                    headers={"Content-type": "application/json; charset=UTF-8"}
    # válido o status do retorno, a reposta do status com o que eu já consultei no retorno que é status 201
    Should Be Equal As Integers    ${resposta["status"]}    201
    # válido o schema com o retorno dos dados, schema está separado por arquivo
    Validate Json By Schema File    ${resposta}    ${schema}

Então atualizarei um cadastro via HTTP PUT
    [Documentation]    Atualiza o cadastro usando HTTP PUT
    ${resposta}    Http    ${url_jsonPlaceholder}/1
    ...                    method=PUT
    ...                    body={"id": 1, "name": "Leanne Graham", "username": "Bret", "email": "Sincere@april.biz"}
    # válido o status do retorno, a reposta do status com o que eu já consultei no retorno que é status 201     
    Should Be Equal As Integers    ${resposta["status"]}    200
    # válido o schema com o retorno dos dados, schema está separado por arquivo
    Validate Json By Schema File    ${resposta}    ${schema}


Então Buscarrei um cadastro via HTTP GET
    [Documentation]    Realiza a busca utilizando o HTTP GET
    ${resposta}    Http    ${url_jsonPlaceholder}
    ...                    method=GET
    ...                    headers={"Content-type": "application/json; charset=UTF-8"}
    # válido o status do retorno, a reposta do status com o que eu já consultei no retorno que é status 200
    Should Be Equal As Integers    ${resposta["status"]}    200
    # válido o schema com o retorno dos dados, schema está separado por arquivo
    Validate Json By Schema File    ${resposta}    ${schema}


Então removerei um cadastro via HTTP DELETE
    [Documentation]    DELETA usuario utilizando o HTTP DELETE
    ${resposta}    Http    ${url_jsonPlaceholder}/2
    ...                    method=DELETE
    ...                    body={"id": 2}
    ...                    headers={"Content-type": "application/json; charset=UTF-8"}
    # válido o status do retorno, a reposta do status com o que eu já consultei no retorno que é status 200
    Should Be Equal As Integers    ${resposta["status"]}    200