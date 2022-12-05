*** Settings ***
Documentation            Suite de testes de pedido de ajuda

Resource    ../resources/base.resource

# Test Setup       Start App
# Test Teardown    Finish App


*** Test Cases ***
Deve poder solicitar ajuda

    ${admin}     Get Fixture    admin
    ${papito}    Get Fixture    papito

    Reset Student       ${papito}[student][email]

    ${token}            Get Service Token     ${admin}
    ${student_id}       POST New Student      ${token}       ${papito}[student]
    POST New Enroll     ${token}        ${student_id}



