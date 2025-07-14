*** Settings ***

Documentation    Ações e elementos da pagina Wellcome

Library    Browser

*** Keywords ***
Validate signup
    Wait For Elements State    selector    visible    time_
