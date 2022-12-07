*** Settings ***
Documentation        Componente que representa o rodapé

Library    AppiumLibrary

*** Variables ***
${ho_button}        xpath=//android.widget.TextView[@text="Pedir ajuda"]

*** Keywords ***
Go To Help Order

    Wait Until Element Is Visible   ${ho_button}     timeout=5
    Click Element                   ${ho_button}
