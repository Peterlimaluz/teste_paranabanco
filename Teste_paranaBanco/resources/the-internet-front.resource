*** Settings ***
Library    Browser
Library    FakerLibrary
Library    DateTime

*** Variables ***
${BROWSER}            chromium
${HEADLESS}           ${true}
${THE_INTERNET}       https://the-internet.herokuapp.com/challenging_dom
@{classes_button}     xpath=/html/body/div[2]/div/div/div/div/div[1]/a[1]    xpath=/html/body/div[2]/div/div/div/div/div[1]/a[2]    xpath=/html/body/div[2]/div/div/div/div/div[1]/a[3]  
@{linhas}    1    2    3    4    5    6    7    8    9    10

*** Keywords ***
Abrir o navegador
    New Browser    browser=${BROWSER}
    ...            headless=${HEADLESS}
    
    ${TRACE_NAME}    FakerLibrary.Uuid 4
    ${NOW}         Get Current Date  result_format=%d-%m-%Y_%H%M%S
    New Context    viewport={'width': 1200, 'height': 800}
    ...            tracing=${OUTPUT_DIR}/evidencies/traces/${NOW}/${TRACE_NAME}.zip
    # ...            recordVideo={'dir':'${OUTPUT_DIR}/evidencies/videos/${NOW}'}

Ir para o site The Internet Front
    [Documentation]     Criei o processo para chamar a variavel que contém o endereço do site e acessar a partir de uma nova página
    New Page    url=${THE_INTERNET} 
    #    Aqui estou garantindo que a página que eu estou é a correta através do title da página.
    ${title}    Get Title  ==  The Internet

Clicar em todos os botões
    [Documentation]    Looping para clicar em todos os botões <a class="button">
    FOR    ${button}    IN    @{classes_button}
        Click    ${button}
    END

Clicar em todos os edit e delete
    # Aqui estou apenas garantindo que estou verificando os itens da tabela
    Click    xpath=/html/body/div[2]/div/div/div/div/div[2]/table

    # Este looping realiza o processo de clicar em todos os links de editar e delete
    FOR    ${linha}    IN    @{linhas} 
        # Aqui criei um looping para passar pelas linhas e clicar no editar
        Click    xpath=/html/body/div[2]/div/div/div/div/div[2]/table/tbody/tr[${linha}]/td[7]/a[1]
        # Aqui criei um looping para passar pelas linhas e clicar no delete
        Click    xpath=/html/body/div[2]/div/div/div/div/div[2]/table/tbody/tr[${linha}]/td[7]/a[2]
    END
