*** Settings ***
Documentation            Suite de testes de pedido de ajuda

Resource    ../resources/base.resource

Test Setup       Start App
Test Teardown    Finish App

*** Test Cases ***
Deve poder solicitar ajuda

    ${admin}     Get Fixture    admin
    ${papito}    Get Fixture    papito

    Reset Student       ${papito}[student][email]

    ${token}            Get Service Token     ${admin}
    ${student_id}       POST New Student      ${token}       ${papito}[student]
    POST New Enroll     ${token}              ${student_id}

    Login With Student Id        ${student_id}
    Confirm Popup
    Go To Help Order
    Submit Help Order            ${papito}[help]
    Wait Until Page Contains     Recebemos a sua dúvida. Agora é só aguardar até 24 horas para receber o nosso feedback.




