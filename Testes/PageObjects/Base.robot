#Executar usando robot -d ./logs Testes/Base.robot


*** Settings ***
Documentation    Uma forma de colocar informações sobre os testes

Resource    resources/base.resource




*** Test Cases ***
Dado que o usuário acessa certa pagina da web
    
    ${account}    Get Fake Account
    Start new session
    #Utilizando Keywords dentro de cenários
    Submit signup    ${account}
    Validate signup
    
     #usando os dados do JSON file

    ${data}    Get JSON Fixtures    dadosJSON    create

    Get Text    selector    equal    ${data}[account][email]

