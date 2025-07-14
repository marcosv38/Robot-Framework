#Executar usando robot -d ./logs Testes/Base.robot


*** Settings ***
Documentation    Uma forma de colocar informações sobre os testes
Library    Browser

Resource    resources/base.resource

#importação apenas de exemplo
Resource    ../PageObjects/resources/base.resource

#forma de implementar o after e before "Ganchos de Teste"
Test Setup           Start new session
Test Teardown        Take Screenshot



*** Variables ***
${ADMIN_EMAIL}    3232333
#possibilidade de criar um conjunto de dados (objeto) para ser enviado para dentro de uma keywords ou utilizar dentro do próprio cenário
${account2}        Create Dictionary
    ...    name=${EMPTY}
    ...    email=gtass@gmail.com
    ...    cpf=312312312
    #váriável de ambiente EMPTY manda um valor vazio


*** Test Cases ***
Dado que o usuário acessa certa pagina da web
    #Executar usando Tags: robot -d ./logs -i Acesso Testes/Base.robot
    #Executar usando Tags em todos os arquivos de uma pasta: robot -d ./logs -i Acesso Testes/
    [Tags]    Acesso

    ${account}    Get Fake Account
    
    #Utilizando Keywords dentro de cenários
    Submit signup    ${account}

    
    
    #criação de variável
    ${elemento}    Set Variable    css=.email
    Fill Text    ${elemento}    txt

    #abrir um navegador: sem essa linha o teste é feito sem abrir o navegador (execução assistida)
    New Browser    browser=chromium    headless=False
    New Page    link
    Get Text    css=#titulo    equal    insira o texto aqui
    Get Text    css=.titulo    equal    insira o texto aqui
    Get Text    id=titulo    equal    insira o texto aqui
    #inserir texto
    Fill Text    selector    txt
    #Inserindo o valor de name setado no arquivo account.py
    Fill Text    selector    ${account}[name]

    Click    xpath=//button[text()="Cadastrar"]
    #Combinação de localizadores apenas no playwrite:
    Click    css=button >> text=Cadastrar
    #fazendo localizadores de acordo com o pai
    Click    css=form .notice
    Click    css=#signup .notice

    #timer
    Sleep    time_


    #Esperar para que certo elemento esteja visivel até o tempo acabar
    Wait For Elements State    selector    visible    time_
    #Esperar para que certo elemento não esteja visivel até o tempo acabar
    Wait For Elements State    selector    detached    time_


    #instruções multilinha ao invés de usar tabulação teclar "Enter"
    Get Text
    ...    selector
    ...    equal
    ...    texto aqui
 
     Get Text    selector
    ...    equal
    ...    texto aqui
    #Screenshoot da tela toda
    Take Screenshot
    #Screenshot de um elemento específico o argumento é selector mesmo
    Take Screenshot    selector=.popup
    
    #Pegar o código html da página no momento que for chamado
    ${temp}    Get Page Source
    #faz o log do código para pegar o código inteiro é só abrir o log.html e ver
    Log    ${temp}


#utilização de template
Tentativa de pré Cadastro
    [Template]    Attempt signup
    ${EMPTY}    marcos@gmail.com    878789848    Texto de mensagem de erro
    Marcos    ${EMPTY}    878789848    Texto de mensagem de erro
    Marcos    marcos@gmail.com    ${EMPTY}    Texto de mensagem de erro
    #é possível colocar infinitas variações

#vai procurar um elemento em q o id possui a palavra titulo
    Get Text    css=div[id*=titulo]   equal    insira o texto aqui






*** Keywords ***
Submit signup
    [Arguments]    ${account}
    
    New Browser    browser=chromium    headless=False
    New Page    link
    Get Text    css=#titulo    equal    insira o texto aqui
    Get Text    css=.titulo    equal    insira o texto aqui
    Get Text    id=titulo    equal    insira o texto aqui
    #inserir texto
    Fill Text    selector    txt
    #Inserindo o valor de name setado no arquivo account.py
    Fill Text    selector    ${account}[name]

    Click    xpath=//button[text()="Cadastrar"]




#Test Template
Attempt signup
    [Arguments]    ${name}    ${email}    ${cpf}    ${output_message}

    ${account2}        Create Dictionary
    ...    name=${name}
    ...    email=${email}
    ...    cpf=${cpf}

    Fill Text    selector    ${account2}[name]
    Fill Text    selector    ${account2}[email]
    Fill Text    selector    ${account2}[cpf]
    Get Text    id=titulo    equal    ${output_message}

