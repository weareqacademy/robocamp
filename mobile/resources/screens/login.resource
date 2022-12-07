*** Settings ***
Documentation        Arquivo que representa a tela de login

Library    AppiumLibrary

*** Variables ***
${API_URL}        http://192.168.68.116:3333

*** Keywords ***
Login With Student Id
    [Arguments]        ${student_id}

    Input Text        xpath=//android.widget.EditText[@text="Informe o endereço ip da api"]    ${API_URL}
    Input Text        xpath=//android.widget.EditText[@text="Informe seu código de acesso"]    ${student_id}
    
    Click Text        Entrar