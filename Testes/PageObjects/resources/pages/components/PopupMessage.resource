#É um componente que aparece em todas as páginas 

*** Settings ***

Documentation    Ações e elementos do componente Popup

Library    Browser

*** Keywords ***
Popup should be
    [Arguments]    ${expected_text}
    
    ${element}    Set Variable    id=popup

    Wait For Elements State    ${element}    visible    5
    Get Text    ${element}    equal    ${expected_text}
   
