*** Settings ***

Documentation    Arquivo supostamente principal do projeto robot

Library     Browser
Library     libs/Account.py

#biblioteca para o robot utilizar JSON - pip install robotframework-jsonlibrary
Library    JSONLibrary

Resource    pages/Home.resource
Resource    pages/Welcome.resource
Resource    pages/components/PopupMessage.resource

*** Keywords ***
Start new session
    New Browser    browser=chromium    headless=False
    New Page    link

#pegar os dados do arquivo JSON 
Get JSON Fixtures
    #${scenario} serve para escolher qual o conjunto de dado será utilizado
    [Arguments]    ${file_name}    ${scenario}
    
    #EXECDIR trás o diretório base
    ${data}    Load Json From File    ${EXECDIR}/resources/fixtures/${file_name}.json    encoding=utf-8
    
    #retorna o conjunto de dados passado em cenário que no caso é o "create"
    [Return]    ${data}[${scenario}]