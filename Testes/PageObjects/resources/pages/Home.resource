*** Settings ***

Documentation    Ações e elementos da pagina home

Library    Browser

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
    

   